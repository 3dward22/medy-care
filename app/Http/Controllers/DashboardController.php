<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Appointment;
use App\Models\Patient;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;


class DashboardController extends Controller
{
    private function illnessBreakdown(Carbon $start, Carbon $end)
    {
        return DB::table('appointment_completions')
            ->select('sickness', DB::raw('COUNT(*) as total'))
            ->whereNotNull('sickness')
            ->whereBetween('completed_datetime', [$start, $end])
            ->groupBy('sickness')
            ->orderByDesc('total')
            ->orderBy('sickness')
            ->get();
    }

    public function index()
    {
        if (!Auth::check()) {
            return redirect()->route('login');
        }
        
        $user = Auth::user();

        // 🔑 Check role and show correct dashboard
        switch ($user->role) {
    case 'admin':

    $patientsCount = Patient::count();
    $appointmentsCount = Appointment::count();

    // 🗓️ Latest 8 appointments (ALL)
    $latestAppointments = Appointment::with('student') // or with('user')
        ->latest('requested_datetime')
        ->take(8)
        ->get();

    // 👥 Users for the table
    $users = User::latest()->take(10)->get(); // or paginate
    $now = Carbon::now();
    $weeklyIllnessCounts = $this->illnessBreakdown($now->copy()->startOfWeek(), $now->copy()->endOfWeek());
    $monthlyIllnessCounts = $this->illnessBreakdown($now->copy()->startOfMonth(), $now->copy()->endOfMonth());

    return view('dashboard', [
        'patientsCount'       => $patientsCount,
        'appointmentsCount'  => $appointmentsCount,
        'latestAppointments' => $latestAppointments,
        'users'               => $users,
        'weeklyIllnessCounts' => $weeklyIllnessCounts,
        'monthlyIllnessCounts' => $monthlyIllnessCounts,
    ]);




            case 'nurse':
                $pendingAppointmentsCount = Appointment::where('status', 'pending')->count();
                $todayAppointments = Appointment::with('student')
                     ->whereDate('requested_datetime', Carbon::today())
                     ->orderBy('requested_datetime', 'asc')
                     ->get();

                 $upcomingAppointments = Appointment::with('student')
                    ->where('requested_datetime', '>=', Carbon::today())
                    ->orderBy('requested_datetime', 'asc')
                    ->get();

                $students = User::where('role', 'student')->get();

                return view('nurse.dashboard', [
    'todayAppointments' => $todayAppointments,
    'upcomingAppointments' => $upcomingAppointments,
    'students' => $students,
    'pendingAppointmentsCount' => $pendingAppointmentsCount
]);




            case 'student':
                $appointments = Appointment::where('student_id', $user->id)
                    ->with('completion')
                    ->get();

                return view('students.dashboard', [
                    'appointments' => $appointments
                ]);

            default:
                abort(403, 'Unauthorized');
        }
    }
    public function studentAppointmentsPartial()
{
    $appointments = \App\Models\Appointment::where('student_id', Auth::id())
        ->with('completion')
        ->latest()
        ->get();

    return view('students.partials.appointments', compact('appointments'));
}
}
