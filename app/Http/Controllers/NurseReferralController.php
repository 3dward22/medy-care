<?php

namespace App\Http\Controllers;

use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;

class NurseReferralController extends Controller
{
    public function create()
    {
        return view('nurse.referral.create');
    }

    public function download(Request $request)
    {
        $data = $request->validate([
            'hospital_name' => 'nullable|string|max:255',
            'hospital_no' => 'nullable|string|max:100',
            'id_card_no' => 'nullable|string|max:100',
            'patient_name' => 'required|string|max:255',
            'patient_address' => 'nullable|string|max:255',
            'patient_age' => 'nullable|string|max:30',
            'patient_contact' => 'nullable|string|max:100',
            'relative_name_address' => 'nullable|string|max:255',
            'relative_contact' => 'nullable|string|max:100',
            'referred_for' => 'nullable|string|max:255',
            'department' => 'nullable|string|max:120',
            'clinical_history' => 'nullable|string|max:4000',
            'treatment_observations' => 'nullable|string|max:4000',
            'referral_date' => 'nullable|date',
            'signature_name' => 'nullable|string|max:255',
            'signature_address' => 'nullable|string|max:255',
        ]);

        $pdf = Pdf::loadView('nurse.referral.pdf', [
            'data' => $data,
            'llccLogoPath' => public_path('images/llcc-logo.png'),
        ])->setPaper('a4', 'portrait');

        $fileName = 'referral-' . now()->format('Ymd-His') . '.pdf';

        return $pdf->download($fileName);
    }
}
