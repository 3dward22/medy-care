<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Appointment;
use App\Models\User;
use App\Notifications\UserNotification;
use App\Events\NewNotification as BroadcastEvent;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AppointmentController extends Controller
{
    public function index()
    {
        $allAppointments = Appointment::with('student')
            ->orderByDesc('requested_datetime')
            ->get();

        $todayAppointments = Appointment::with('student')
            ->whereDate('requested_datetime', Carbon::today())
            ->orderByDesc('requested_datetime')
            ->get();

        $weekAppointments = Appointment::with('student')
            ->whereBetween('requested_datetime', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])
            ->orderByDesc('requested_datetime')
            ->get();

        return view('admin.appointments.all', compact('allAppointments', 'todayAppointments', 'weekAppointments'));
    }

    public function today()
    {
        $appointments = Appointment::whereDate('requested_datetime', Carbon::today())
            ->orderByDesc('requested_datetime')
            ->get();

        return view('admin.appointments.today', compact('appointments'));
    }

    public function week()
    {
        $appointments = Appointment::whereBetween('requested_datetime', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])
            ->orderByDesc('requested_datetime')
            ->get();

        return view('admin.appointments.week', compact('appointments'));
    }
    public function update(Request $request, Appointment $appointment)
{
    $request->validate([
        'status' => 'required',
        'approved_datetime' => 'nullable|date',
        'admin_note' => 'nullable|string',
    ]);

    $appointment->update([
        'status' => $request->status,
        'approved_datetime' => $request->approved_datetime,
        'admin_note' => $request->admin_note,
    ]);

    if ($request->status === 'completed') {
        $this->notifyAdminsAboutCompletion($appointment);
    }

    return redirect()->back()->with('success', 'Appointment updated successfully.');
}

private function notifyAdminsAboutCompletion(Appointment $appointment): void
{
    $actor = Auth::user();
    $studentName = $appointment->student?->name ?? 'Unknown student';
    $message = "Appointment for {$studentName} was marked as completed by {$actor->name}.";

    $admins = User::query()
        ->where('role', 'admin')
        ->where('id', '!=', $actor->id)
        ->get();

    foreach ($admins as $admin) {
        $admin->notify(new UserNotification($message));
        event(new BroadcastEvent($admin->id, $message));
    }
}
}
