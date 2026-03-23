<?php

namespace App\Http\Controllers;

use App\Models\Appointment;
use Illuminate\Http\Request;

class NurseController extends Controller
{
    public function todayAppointmentsPartial()
    {
        $todayAppointments = Appointment::with('student')
            ->whereDate('requested_datetime', now()->toDateString())
            ->whereIn('status', ['pending', 'approved', 'in_session'])
            ->latest()
            ->get();

        return view('nurse.partials.today-appointments', compact('todayAppointments'));
    }

    public function appointmentRequestsPartial()
    {
        $pendingAppointments = Appointment::with('student')
            ->where('status', 'pending')
            ->latest()
            ->get();

        $pendingAppointmentsCount = $pendingAppointments->count();

        return view('nurse.partials.appointment-requests', compact('pendingAppointments', 'pendingAppointmentsCount'));
    }
}