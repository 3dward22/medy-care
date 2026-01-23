<?php

namespace App\Http\Controllers;

use App\Models\Appointment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;
use App\Services\GuardianSmsService;
use App\Models\GuardianSmsLog;
use Illuminate\Support\Facades\Http;
use App\Models\AppointmentCompletion;
use Illuminate\Support\Facades\Gate;
use App\Notifications\UserNotification;
use App\Events\NewNotification as BroadcastEvent;


class AppointmentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    /* ---------------------------------------------------
    | 🩺 Nurse: View all appointments
    --------------------------------------------------- */
    public function indexForNurse()
    {
        $appointments = Appointment::with('student')
            ->orderBy('requested_datetime', 'desc')
            ->paginate(10);

        return view('nurse.appointments.index', compact('appointments'));
    }

    /* ---------------------------------------------------
    | 👩‍🎓 Student: View own appointments
    --------------------------------------------------- */
    public function index()
    {
        $appointments = Appointment::where('student_id', Auth::id())
            ->orderBy('requested_datetime', 'desc')
            ->paginate(10);

        return view('students.appointments.index', compact('appointments'));
    }

    /* ---------------------------------------------------
    | 📋 Show details of a specific appointment
    --------------------------------------------------- */
    public function show(Appointment $appointment)
    {
        if ($appointment->student_id !== Auth::id()) {
            abort(403, 'Unauthorized');
        }

        return view('appointments.show', compact('appointment'));
    }

    /* ---------------------------------------------------
    | 📅 Student: Request new appointment
    --------------------------------------------------- */
    public function store(Request $request)
{
    $request->validate([
        'reason' => 'required|string|max:500',
        'preferred_time' => 'nullable|string|max:100',
    ]);

    $appointment = Appointment::create([
        'student_id' => Auth::id(),
        'user_id' => Auth::id(),
        'requested_datetime' => now(), // 🔥 request time only
        'reason' => $request->reason,
        'preferred_time' => $request->preferred_time,
        'status' => 'pending',
    ]);

    // 🔔 Notify all nurses
    $nurses = \App\Models\User::where('role', 'nurse')->get();

    foreach ($nurses as $nurse) {
        $this->notify(
            $nurse->id,
            '📅 New appointment request from ' . Auth::user()->name
        );
    }

    return response()->json([
        'success' => true,
        'appointment' => $appointment
    ]);
}

    /* ---------------------------------------------------
    | 🧭 Nurse/Admin: Manage appointments (approve, decline, etc.)
    --------------------------------------------------- */
    public function update(Request $request, Appointment $appointment)
    {
        try {
            if (!in_array(Auth::user()->role, ['nurse', 'admin'])) {
                abort(403, 'Unauthorized action.');
            }

            $request->validate([
                'approved_datetime' => 'nullable|date|after:now',
                'status' => 'required|in:approved,declined,in_session',
                'admin_note' => 'nullable|string|max:500',
                'findings' => 'nullable|string|max:1000',
            ]);

            $appointment->update([
    'approved_datetime' => $request->approved_datetime ?? now(),
    'status' => $request->status,
    'approved_by' => Auth::id(),
    'admin_note' => $request->admin_note,
    'findings' => $request->findings,
]);


            $student = $appointment->student;

            if (!$student) {
                if ($request->ajax() || $request->expectsJson()) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Student record not found for this appointment.'
                    ], 404);
                }
                return back()->with('error', 'Student record not found for this appointment.');
            }

            // 🧠 Notify student
           $studentMessage = match ($request->status) {
    'approved' => "Your appointment has been approved for " .
        ($appointment->approved_datetime
            ? Carbon::parse($appointment->approved_datetime)->format('M d, Y h:i A')
            : 'the scheduled date') . ".",

    'declined' => "Your appointment request was declined by the nurse.",

    'in_session' => "Your appointment is now in session. Please proceed to the clinic.",

    default => "Your appointment status was updated.",
};


            $this->notify($student->id, "📢 {$studentMessage}");
            $appointment->update(['student_sms_sent' => true]);

            // 👨‍👩‍👧 Notify guardian via SMS
            if (!empty($student->guardian_phone)) {
                $guardianMessage = match ($request->status) {
    'approved' =>
        "Good day! This is MedCare. {$student->name}'s appointment has been approved.",

    'declined' =>
        "Hello! This is MedCare. {$student->name}'s appointment request was declined.",

    'in_session' =>
        "MedCare update: {$student->name} is currently being attended at the clinic.",

    default =>
        "MedCare update: {$student->name}'s appointment status has changed.",
};


                $this->sendGuardianSms($appointment, $student, $guardianMessage);
            }

            if ($request->wantsJson() || $request->ajax() || $request->header('Accept') === 'application/json') {
                return response()->json(['success' => true]);
            }

            return redirect()->back()->with('success', 'Appointment updated and all notifications sent successfully.');

        } catch (\Exception $e) {
            Log::error('Appointment update failed: ' . $e->getMessage());

            if ($request->ajax() || $request->expectsJson()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Server error: ' . $e->getMessage(),
                ], 500);
            }

            return back()->with('error', 'An unexpected error occurred while updating the appointment.');
        }
    }

    /* ---------------------------------------------------
    | ✅ Mark as completed
    --------------------------------------------------- */
    public function complete(Request $request, Appointment $appointment)
    {
        if (!in_array(Auth::user()->role, ['nurse', 'admin'])) {
            abort(403, 'Unauthorized action.');
        }

        $request->validate([
            'completed_datetime' => 'required|date',
            'temperature' => 'nullable|string|max:50',
            'blood_pressure' => 'nullable|string|max:50',
            'heart_rate' => 'nullable|string|max:50',
            'findings' => 'nullable|string|max:1000',
            'additional_notes' => 'nullable|string|max:1000',
        ]);

        AppointmentCompletion::create([
            'appointment_id' => $appointment->id,
            'completed_datetime' => $request->completed_datetime,
            'temperature' => $request->temperature,
            'blood_pressure' => $request->blood_pressure,
            'heart_rate' => $request->heart_rate,
            'findings' => $request->findings,
            'additional_notes' => $request->additional_notes,
        ]);

        $appointment->update([
            'status' => 'completed',
            'approved_by' => Auth::id(),
        ]);

        $student = $appointment->student;
        if ($student) {
            $this->notify($student->id, "📢 Your check-up has been completed. Thank you for visiting the clinic.");
        }

        return response()->json([
            'success' => true,
            'message' => 'Appointment marked as completed.'
        ]);
    }

    /* ---------------------------------------------------
    | 🚨 Emergency record (nurse/admin)
    --------------------------------------------------- */
    public function storeEmergency(Request $request)
    {
        if (!Gate::allows('is-nurse-or-admin')) {
            abort(403, 'Unauthorized access.');
        }

        $request->validate([
            'student_id' => 'required|exists:users,id',
            'reason' => 'nullable|string|max:500',
            'completed_datetime' => 'required|date',
            'temperature' => 'nullable|string|max:50',
            'blood_pressure' => 'nullable|string|max:50',
            'heart_rate' => 'nullable|string|max:50',
            'additional_notes' => 'nullable|string|max:1000',
            'findings' => 'nullable|string|max:1000',
        ]);

        $appointment = Appointment::create([
            'student_id' => $request->student_id,
            'user_id' => $request->student_id,
            'requested_datetime' => now(),
            'approved_datetime' => now(),
            'completed_datetime' => $request->completed_datetime,
            'status' => 'completed',
            'admin_note' => $request->reason ?? 'Emergency / Walk-in case',
            'approved_by' => Auth::id(),
            'temperature' => $request->temperature,
            'blood_pressure' => $request->blood_pressure,
            'heart_rate' => $request->heart_rate,
            'additional_notes' => $request->additional_notes,
            'findings' => $request->findings,
        ]);

        AppointmentCompletion::create([
            'appointment_id' => $appointment->id,
            'completed_datetime' => $request->completed_datetime,
            'temperature' => $request->temperature,
            'blood_pressure' => $request->blood_pressure,
            'heart_rate' => $request->heart_rate,
            'findings' => $request->findings,
            'additional_notes' => $request->additional_notes,
        ]);

        $recipient = \App\Models\User::where('role', 'admin')->first()
            ?? \App\Models\User::where('role', 'nurse')->first();

        if ($recipient) {
            $this->notify($recipient->id, '🚨 Emergency reported by ' . Auth::user()->name);
        } else {
            Log::warning('No admin or nurse found to receive emergency notification.');
        }

        return response()->json([
            'success' => true,
            'message' => 'Emergency appointment recorded and marked as completed.'
        ]);
    }

    /* ---------------------------------------------------
    | ❌ Student: Cancel appointment
    --------------------------------------------------- */
    public function destroy(Appointment $appointment)
    {
        if ($appointment->student_id !== Auth::id()) {
            abort(403, 'Unauthorized');
        }

        $appointment->update(['status' => 'cancelled']);

        $recipient = \App\Models\User::where('role', 'admin')->first()
            ?? \App\Models\User::where('role', 'nurse')->first();

        if ($recipient) {
            $this->notify($recipient->id, "❌ Appointment #{$appointment->id} was cancelled by " . Auth::user()->name);
        } else {
            Log::warning('No admin or nurse found to receive cancellation notification.');
        }

        return back()->with('success', 'Your appointment has been cancelled.');
    }

    /* ---------------------------------------------------
    | 📊 Admin: Dashboard overview
    --------------------------------------------------- */
    public function allAppointments()
    {
        $allAppointments = Appointment::orderBy('requested_datetime', 'desc')->get();
        $today = Carbon::today();
        $todayAppointments = Appointment::whereDate('approved_datetime', $today)
->whereIn('status', ['approved', 'in_session'])
            ->orderBy('requested_datetime', 'desc')->get();

        $startOfWeek = Carbon::now()->startOfWeek();
        $endOfWeek = Carbon::now()->endOfWeek();
        $weekAppointments = Appointment::whereBetween('approved_datetime', [$startOfWeek, $endOfWeek])
            ->orderBy('requested_datetime', 'desc')->get();

        return view('admin.appointments.all', [
            'allAppointments' => $allAppointments,
            'todayAppointments' => $todayAppointments,
            'weekAppointments' => $weekAppointments,
        ]);
    }

    /* ---------------------------------------------------
    | 🔁 Real-time JSON for Nurse Dashboard
    --------------------------------------------------- */
    public function todayAppointmentsJson()
    {
        $today = Carbon::today();

$todayAppointments = Appointment::with('user')
    ->whereDate('approved_datetime', $today)
    ->whereIn('status', ['approved', 'in_session'])
    ->orderBy('requested_datetime', 'desc')
    ->get();

        return response()->json([
            'count' => $todayAppointments->count(),
            'appointments' => $todayAppointments,
        ]);
    }

    /* ---------------------------------------------------
    | 💬 Notify Guardian (Manual Button)
    --------------------------------------------------- */
    public function notifyGuardian(Request $request, $appointmentId)
    {
        $appointment = Appointment::findOrFail($appointmentId);
        $student = $appointment->student;

        if (!$student || !$student->guardian_phone) {
            return back()->with('error', 'Guardian contact not found for this student.');
        }

        $message = "Hello {$student->guardian_name}, this is MedCare. 
        Your child {$student->name} had a check-up today. 
        Diagnosis/Notes: " . ($appointment->findings ?? 'No findings available.');

        $this->sendGuardianSms($appointment, $student, $message);

        if ($request->ajax()) {
            return response()->json(['success' => 'Guardian SMS sent and logged successfully.']);
        }

        return back()->with('success', 'Guardian SMS sent and logged successfully.');
    }

    /* ---------------------------------------------------
    | 🧩 Helper: Log and mark Guardian SMS
    --------------------------------------------------- */
   private function sendGuardianSms($appointment, $student, $message)
{
    try {
        // 🔍 GET PHONE FROM PATIENT RECORD
        // If $student is actually a User, load patient info
        $patient = \App\Models\Patient::where('user_id', $student->id)->first();

        if (!$patient || empty($patient->phone)) {
            Log::warning('Guardian phone not found for student ID ' . $student->id);
            return;
        }

        // 🔧 Normalize phone number to +63 format
        $phone = $patient->phone;

        if (str_starts_with($phone, '09')) {
            $phone = '+63' . substr($phone, 1);
        } elseif (str_starts_with($phone, '639')) {
            $phone = '+' . $phone;
        }

        // 🔔 SEND VIA TWILIO WHATSAPP
        $sms = new GuardianSmsService();
        $sms->send($phone, $message);

        // 📝 LOG IT
        GuardianSmsLog::create([
            'appointment_id'  => $appointment->id,
            'student_id'      => $student->id,
            'guardian_name'   => $student->name,
            'guardian_phone'  => $phone,
            'message'         => $message,
            'sent_by'         => Auth::user()->name,
            'sent_by_id'      => Auth::id(),
            'sent_by_role'    => Auth::user()->role,
            'sent_at'         => now(),
        ]);

        // ✅ MARK AS SENT
        $appointment->update(['guardian_sms_sent' => true]);

    } catch (\Exception $e) {
        Log::error('Guardian WhatsApp send failed: ' . $e->getMessage());
    }
}


public function manualGuardianSend(Request $request)
{
    $request->validate([
        'guardian_name'  => 'required|string|max:255',
        'guardian_phone' => 'required|string',
        'message'        => 'required|string|max:500',
    ]);

    try {
        // 🔧 Normalize phone
        $phone = $request->guardian_phone;

        if (str_starts_with($phone, '09')) {
            $phone = '+63' . substr($phone, 1);
        } elseif (str_starts_with($phone, '639')) {
            $phone = '+' . $phone;
        }

        // 🔔 SEND VIA WHATSAPP
        $sms = new \App\Services\GuardianSmsService();
        $sms->send($phone, $request->message);

        // 📝 LOG IT
        \App\Models\GuardianSmsLog::create([
            'guardian_name'  => $request->guardian_name,
            'guardian_phone' => $phone,
            'message'        => $request->message,
            'sent_by'        => Auth::user()->name,
            'sent_by_id'     => Auth::id(),
            'sent_by_role'   => Auth::user()->role,
            'sent_at'        => now(),
        ]);

        return back()->with('success', 'Guardian message sent via WhatsApp successfully.');

    } catch (\Exception $e) {
        \Log::error('Manual WhatsApp send failed: ' . $e->getMessage());
        return back()->with('error', 'Failed to send message: ' . $e->getMessage());
    }
}


/* ---------------------------------------------------
| 🧠 Helper: Broadcast notification cleanly
--------------------------------------------------- */
private function notify($userId, $message)
{
    $user = \App\Models\User::find($userId);
    if (!$user) return;

    // 1️⃣ Save notification to database
    $user->notify(new UserNotification($message));

    // 2️⃣ Broadcast in real-time
    event(new BroadcastEvent($userId, $message));
}

public function nurseDashboard()
{
    // ⏳ Pending (no date yet)
    $pendingAppointments = Appointment::with('user')
    ->where('status', 'pending')
    ->orderBy('requested_datetime')
    ->paginate(10);


    // 📋 TODAY — auto moves here when date == today
    $todayAppointments = Appointment::with('user')
    ->whereDate('approved_datetime', Carbon::today())
    ->whereIn('status', ['approved', 'in_session'])
    ->paginate(10);

    // 🗓️ UPCOMING — auto moves out when date becomes today
    
$upcomingAppointments = Appointment::with('user')
    ->whereDate('approved_datetime', '>', Carbon::today())
    ->where('status', 'approved')
    ->paginate(10);

    // 👩‍🎓 Needed for emergency & SMS modal
    $students = \App\Models\User::where('role', 'student')
        ->orderBy('name')
        ->get();

    return view('nurse.dashboard', compact(
        'pendingAppointments',
        'todayAppointments',
        'upcomingAppointments',
        'students'
    ));
}

public function startSession(Appointment $appointment)
{
    if (!in_array(Auth::user()->role, ['nurse', 'admin'])) {
        abort(403);
    }

    if ($appointment->status !== 'approved') {
        return response()->json([
            'success' => false,
            'message' => 'Only approved appointments can be started.'
        ], 422);
    }

    $appointment->update([
        'status' => 'in_session'
    ]);

    $this->notify(
        $appointment->student_id,
        '🩺 Your appointment session has started.'
    );

    return response()->json([
        'success' => true
    ]);
}

}