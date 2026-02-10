<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Appointment;
use Carbon\Carbon;
use Barryvdh\DomPDF\Facade\Pdf;

class ReportController extends Controller
{
    public function generateMonthlyReport(Request $request)
{
    $month = $request->input('month', now()->format('Y-m'));

    $start = Carbon::createFromFormat('Y-m', $month)->startOfMonth();
    $end   = Carbon::createFromFormat('Y-m', $month)->endOfMonth();

    $appointments = Appointment::with('student')
        ->whereBetween('requested_datetime', [$start, $end])
        ->orderBy('requested_datetime')
        ->get();

    $pdf = Pdf::loadView('reports.monthly-appointments', compact('appointments', 'month'));

    return $pdf->download("appointments-{$month}.pdf");
}
}
