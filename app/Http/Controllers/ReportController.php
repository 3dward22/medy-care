<?php

namespace App\Http\Controllers;

use App\Models\Appointment;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReportController extends Controller
{
    public function generateMonthlyReport(Request $request)
    {
        $month = $request->input('month', now()->format('Y-m'));

        $start = Carbon::createFromFormat('Y-m', $month)->startOfMonth();
        $end = Carbon::createFromFormat('Y-m', $month)->endOfMonth();

        $appointments = Appointment::with(['student', 'completion'])
            ->whereBetween('requested_datetime', [$start, $end])
            ->orderBy('requested_datetime')
            ->get();

        $illnessCounts = DB::table('appointment_completions')
            ->select('sickness', DB::raw('COUNT(*) as total'))
            ->whereNotNull('sickness')
            ->whereBetween('completed_datetime', [$start, $end])
            ->groupBy('sickness')
            ->orderByDesc('total')
            ->orderBy('sickness')
            ->get();

        $pdf = Pdf::loadView('reports.monthly-appointments', [
            'appointments' => $appointments,
            'illnessCounts' => $illnessCounts,
            'month' => $month,
        ]);

        return $pdf->download("monthly-illness-visits-{$month}.pdf");
    }
}
