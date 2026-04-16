@extends('layouts.app')

@section('content')
<style>
    .referral-shell {
        max-width: 1050px;
    }
    .referral-title {
        font-weight: 700;
        letter-spacing: 0.2px;
    }
    .referral-subtitle {
        color: #6b7280;
        font-size: 0.92rem;
    }
    .ref-section {
        border: 1px solid #e5e7eb;
        border-radius: 14px;
        padding: 1rem;
        background: #fbfdff;
    }
    .ref-section-title {
        font-size: 0.9rem;
        font-weight: 700;
        color: #2563eb;
        text-transform: uppercase;
        letter-spacing: 0.4px;
        margin-bottom: 0.85rem;
    }
    .ref-label {
        font-weight: 600;
        color: #374151;
        margin-bottom: 0.35rem;
    }
    .ref-input, .ref-textarea {
        border-radius: 10px;
    }
</style>

<div class="container py-4">
    <div class="referral-shell mx-auto">
        <div class="d-flex flex-wrap justify-content-between align-items-start gap-3 mb-4">
            <div>
                <h3 class="mb-1 referral-title">Hospital Referral Form</h3>
                <p class="mb-0 referral-subtitle">Complete the details below, then download a PDF copy for referral.</p>
            </div>
            <a href="{{ route('nurse.dashboard') }}" class="btn btn-outline-secondary">Back to Dashboard</a>
        </div>
    </div>

    <div class="card shadow-sm border-0 referral-shell mx-auto">
        <div class="card-body p-4 p-md-5">
            <form action="{{ route('nurse.referral.download') }}" method="POST" class="row g-4">
                @csrf

                <div class="col-12">
                    <div class="ref-section">
                        <div class="ref-section-title">Referral Details</div>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label ref-label">Referred to (Hospital)</label>
                                <input type="text" name="hospital_name" class="form-control ref-input" value="{{ old('hospital_name') }}">
                            </div>
                            <div class="col-md-3">
                                <label class="form-label ref-label">Hospital No.</label>
                                <input type="text" name="hospital_no" class="form-control ref-input" value="{{ old('hospital_no') }}">
                            </div>
                            <div class="col-md-3">
                                <label class="form-label ref-label">ID Card No.</label>
                                <input type="text" name="id_card_no" class="form-control ref-input" value="{{ old('id_card_no') }}">
                            </div>
                            <div class="col-md-8">
                                <label class="form-label ref-label">Referred for</label>
                                <input type="text" name="referred_for" class="form-control ref-input" value="{{ old('referred_for') }}">
                            </div>
                            <div class="col-md-4">
                                <label class="form-label ref-label">Department</label>
                                <input type="text" name="department" class="form-control ref-input" value="{{ old('department') }}">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="ref-section">
                        <div class="ref-section-title">Patient Information</div>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label ref-label">Patient Name <span class="text-danger">*</span></label>
                                <input type="text" name="patient_name" class="form-control ref-input" value="{{ old('patient_name') }}" required>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label ref-label">Age</label>
                                <input type="text" name="patient_age" class="form-control ref-input" value="{{ old('patient_age') }}">
                            </div>
                            <div class="col-md-3">
                                <label class="form-label ref-label">Patient Contact No.</label>
                                <input type="text" name="patient_contact" class="form-control ref-input" value="{{ old('patient_contact') }}">
                            </div>
                            <div class="col-12">
                                <label class="form-label ref-label">Patient Address</label>
                                <input type="text" name="patient_address" class="form-control ref-input" value="{{ old('patient_address') }}">
                            </div>
                            <div class="col-md-8">
                                <label class="form-label ref-label">Nearest Relative (Name and Address)</label>
                                <input type="text" name="relative_name_address" class="form-control ref-input" value="{{ old('relative_name_address') }}">
                            </div>
                            <div class="col-md-4">
                                <label class="form-label ref-label">Relative Contact No.</label>
                                <input type="text" name="relative_contact" class="form-control ref-input" value="{{ old('relative_contact') }}">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="ref-section">
                        <div class="ref-section-title">Clinical Notes</div>
                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label ref-label">Relevant Clinical History</label>
                                <textarea name="clinical_history" rows="4" class="form-control ref-textarea">{{ old('clinical_history') }}</textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label ref-label">Treatment / Observations</label>
                                <textarea name="treatment_observations" rows="4" class="form-control ref-textarea">{{ old('treatment_observations') }}</textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="ref-section">
                        <div class="ref-section-title">Sign-Off</div>
                        <div class="row g-3">
                            <div class="col-md-4">
                                <label class="form-label ref-label">Date</label>
                                <input type="date" name="referral_date" class="form-control ref-input" value="{{ old('referral_date', now()->toDateString()) }}">
                            </div>
                            <div class="col-md-4">
                                <label class="form-label ref-label">Signature over printed name</label>
                                <input type="text" name="signature_name" class="form-control ref-input" value="{{ old('signature_name', auth()->user()->name) }}">
                            </div>
                            <div class="col-md-4">
                                <label class="form-label ref-label">Name and Address (Printed)</label>
                                <input type="text" name="signature_address" class="form-control ref-input" value="{{ old('signature_address') }}">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 d-flex justify-content-end gap-2">
                    <a href="{{ route('nurse.dashboard') }}" class="btn btn-light border">Cancel</a>
                    <button type="submit" class="btn btn-primary px-4">
                        Download PDF
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
