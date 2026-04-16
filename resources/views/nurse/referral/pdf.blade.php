<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Referral Form</title>
    <style>
        body { font-family: DejaVu Sans, sans-serif; font-size: 12px; color: #111; }
        .header { text-align: center; margin-bottom: 12px; }
        .logo { width: 85px; height: 85px; object-fit: contain; display: block; margin: 0 auto 4px; }
        .llcc-title { font-size: 16px; font-weight: 700; margin: 0; }
        .subtitle { margin: 2px 0; font-size: 12px; }
        .form-title { font-size: 14px; font-weight: 700; margin-top: 8px; }
        .line { border-bottom: 1px solid #222; min-height: 18px; padding: 2px 4px; }
        .row { width: 100%; margin-bottom: 8px; }
        .cell { display: inline-block; vertical-align: top; }
        .w-60 { width: 59%; }
        .w-40 { width: 39%; }
        .w-50 { width: 49%; }
        .w-30 { width: 29%; }
        .w-70 { width: 69%; }
        .label { margin-bottom: 2px; display: block; font-weight: 600; }
        .box { border: 1px solid #222; min-height: 70px; padding: 6px; }
        .signature-space { margin-top: 20px; }
    </style>
</head>
<body>
    <div class="header">
        @if(!empty($llccLogoPath) && file_exists($llccLogoPath) && function_exists('imagecreatefrompng'))
            <img src="{{ $llccLogoPath }}" class="logo" alt="LLCC Logo">
        @endif
        <p class="llcc-title">LAPU-LAPU CITY COLLEGE</p>
        <p class="subtitle">TICKET OF REFERRAL OF A PATIENT TO HOSPITAL</p>
        <p class="subtitle">Department of Health - Part A</p>
        <p class="form-title">To be filled by Medical Practitioner referring a patient to hospital.</p>
    </div>

    <div class="row">
        <div class="cell w-60">
            <span class="label">Referred to (Hospital)</span>
            <div class="line">{{ $data['hospital_name'] ?? '' }}</div>
        </div>
        <div class="cell w-40">
            <span class="label">Hospital No.</span>
            <div class="line">{{ $data['hospital_no'] ?? '' }}</div>
        </div>
    </div>

    <div class="row">
        <div class="cell w-60">
            <span class="label">Name of Patient</span>
            <div class="line">{{ $data['patient_name'] ?? '' }}</div>
        </div>
        <div class="cell w-40">
            <span class="label">Age</span>
            <div class="line">{{ $data['patient_age'] ?? '' }}</div>
        </div>
    </div>

    <div class="row">
        <div class="cell w-60">
            <span class="label">Address of Patient</span>
            <div class="line">{{ $data['patient_address'] ?? '' }}</div>
        </div>
        <div class="cell w-40">
            <span class="label">Tel. No.</span>
            <div class="line">{{ $data['patient_contact'] ?? '' }}</div>
        </div>
    </div>

    <div class="row">
        <div class="cell w-60">
            <span class="label">Nearest Relative (Name and Address)</span>
            <div class="line">{{ $data['relative_name_address'] ?? '' }}</div>
        </div>
        <div class="cell w-40">
            <span class="label">Relative Tel. No.</span>
            <div class="line">{{ $data['relative_contact'] ?? '' }}</div>
        </div>
    </div>

    <div class="row">
        <div class="cell w-70">
            <span class="label">Referred for</span>
            <div class="line">{{ $data['referred_for'] ?? '' }}</div>
        </div>
        <div class="cell w-30">
            <span class="label">Dept.</span>
            <div class="line">{{ $data['department'] ?? '' }}</div>
        </div>
    </div>

    <div class="row">
        <span class="label">Relevant Clinical History</span>
        <div class="box">{{ $data['clinical_history'] ?? '' }}</div>
    </div>

    <div class="row">
        <span class="label">Treatment / Observations</span>
        <div class="box">{{ $data['treatment_observations'] ?? '' }}</div>
    </div>

    <div class="row signature-space">
        <div class="cell w-30">
            <span class="label">Date</span>
            <div class="line">{{ $data['referral_date'] ?? '' }}</div>
        </div>
        <div class="cell w-30">
            <span class="label">Signature</span>
            <div class="line">{{ $data['signature_name'] ?? '' }}</div>
        </div>
        <div class="cell w-40">
            <span class="label">Name and Address (Printed)</span>
            <div class="line">{{ $data['signature_address'] ?? '' }}</div>
        </div>
    </div>
</body>
</html>
