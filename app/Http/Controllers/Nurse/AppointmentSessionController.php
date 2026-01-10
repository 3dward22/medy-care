<?php

namespace App\Http\Controllers\Nurse;

use App\Http\Controllers\Controller;
use App\Models\Appointment;
use Illuminate\Http\Request;

class AppointmentSessionController extends Controller
{
    public function start(Appointment $appointment)
    {
        $appointment->update([
            'status' => 'in_session',
            'started_at' => now(),
        ]);

        return response()->json(['success' => true]);
    }

    public function decline(Appointment $appointment)
    {
        $appointment->update([
            'status' => 'declined',
        ]);

        return back()->with('success', 'Appointment declined.');
    }

    public function complete(Request $request, Appointment $appointment)
    {
        $appointment->update([
            'status' => 'completed',
            'completed_at' => $request->completed_datetime,
            'findings' => $request->additional_notes,
        ]);

        return response()->json(['success' => true]);
    }
}
