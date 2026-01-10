@extends('layouts.app')

@section('content')
<style>
    /* 🌈 MedCare Theme Enhancements */
    body {
        background: linear-gradient(to bottom right, #f9fbfc, #eef6f8);
    }

    .dashboard-header {
        background: linear-gradient(135deg, #4fc3f7, #007bff);
        color: white;
        padding: 2rem 2.5rem;
        border-radius: 20px;
        box-shadow: 0 4px 12px rgba(0, 123, 255, 0.2);
    }

    .dashboard-header h1 {
        font-weight: 700;
        font-size: 1.8rem;
    }

    .card-medcare {
        transition: all 0.25s ease-in-out;
        border: none;
        border-radius: 20px;
        background: white;
    }

    .card-medcare:hover {
        transform: translateY(-4px);
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
    }

    .table thead {
        background-color: #f1f6fb;
    }

    .btn-pill {
        border-radius: 50px;
        font-weight: 500;
    }

    .summary-card h2 {
        font-weight: 700;
        font-size: 2rem;
    }

    .summary-card {
        background: linear-gradient(135deg, #e3f2fd, #e1f5fe);
        border: none;
        border-radius: 20px;
    }

    .summary-card.text-success {
        background: linear-gradient(135deg, #e8f5e9, #d0f0d7);
    }

    .summary-card.text-info {
        background: linear-gradient(135deg, #e1f5fe, #b3e5fc);
    }

    .summary-card.text-primary {
        background: linear-gradient(135deg, #ede7f6, #d1c4e9);
    }

    .modal-content {
        border-radius: 20px;
        overflow: hidden;
    }
</style>

<div class="container py-4">

    {{-- 🩺 Header --}}
    <div class="dashboard-header mb-5">
        <div class="d-flex justify-content-between align-items-center flex-wrap">
            <div>
                <h1>👩‍⚕️ Nurse Dashboard</h1>
                <p class="mb-0">Welcome back, <strong>{{ auth()->user()->name }}</strong>!  
                    You’re logged in as <strong>{{ ucfirst(auth()->user()->role) }}</strong>.
                </p>
            </div>
            <div class="text-end">

            @can('is-nurse-or-admin')
            <button class="btn btn-danger btn-pill shadow-sm mt-2" data-bs-toggle="modal" data-bs-target="#emergencyModal">
                🚨 Emergency / Walk-in
            </button>
            @endcan
                <button class="btn btn-light btn-pill shadow-sm" data-bs-toggle="modal" data-bs-target="#sendSmsModal">
                    📩 Send SMS to Guardian
                </button>
            </div>
            
        </div>
    </div>

    {{-- 📊 Summary Cards --}}
<div class="row g-4 mb-4 text-center">
    <div class="col-md-6">
        <div class="card summary-card text-success shadow-sm p-4">
            <h6>Today's Appointments</h6>
            <h2 id="todayAppointmentsCount">{{ $todayAppointments->count() }}</h2>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card summary-card text-info shadow-sm p-4">
            <h6>Upcoming Appointments</h6>
            <h2>{{ $upcomingAppointments->count() }}</h2>
        </div>
    </div>
</div>

{{-- 📅 Today's Appointments --}}
<div class="card card-medcare shadow-sm mb-4">
    <div class="card-body">
        <h4 class="fw-semibold mb-3">📋 Today's Appointments</h4>
        <div id="todayAppointmentsTableWrapper">
            @if ($todayAppointments->count() > 0)
                <div class="table-responsive">
                    <table class="table align-middle table-hover mb-0">
    <thead>
        <tr>
            <th>Patient Name</th>
            <th>Time</th>
            <th>Status / Action</th>
        </tr>
    </thead>

    <tbody>
    @foreach ($todayAppointments as $appointment)
        <tr>
            <td class="fw-medium">
                {{ $appointment->user->name ?? 'Unknown' }}
            </td>

            <td>
                {{ \Carbon\Carbon::parse($appointment->requested_datetime)->format('h:i A') }}
            </td>

           <td>
    <span class="badge rounded-pill px-3 py-2 
        @if($appointment->status === 'pending') bg-warning text-dark
        @elseif($appointment->status === 'in_session') bg-primary
        @elseif($appointment->status === 'completed') bg-success
        @elseif($appointment->status === 'declined') bg-danger
        @else bg-secondary
        @endif">
        {{ ucfirst(str_replace('_',' ', $appointment->status)) }}
    </span>

    {{-- ▶ START --}}
    @if($appointment->status === 'pending')
        <form method="POST"
              action="{{ route('nurse.appointments.start', $appointment->id) }}"
              class="d-inline start-session-form">
            @csrf
            <button class="btn btn-primary btn-sm ms-2">
                ▶ Start
            </button>
        </form>

        <form method="POST"
              action="{{ route('nurse.appointments.decline', $appointment->id) }}"
              class="d-inline ms-1">
            @csrf
            @method('PATCH')
            <button class="btn btn-outline-danger btn-sm">
                ❌ Decline
            </button>
        </form>
    @endif

    {{-- ✅ COMPLETE --}}
    @if($appointment->status === 'in_session')
        <button
            class="btn btn-success btn-sm ms-2"
            data-bs-toggle="modal"
            data-bs-target="#completeAppointmentModal"
            data-action="{{ route('nurse.appointments.complete', $appointment->id) }}">
            Complete
        </button>
    @endif
</td>

        </tr>
    @endforeach
    </tbody>
</table>

                </div>
            @else
                <div class="text-center py-4 text-muted">No appointments scheduled for today.</div>
            @endif
        </div>
    </div>
</div>

{{-- 🗓️ Upcoming Appointments — List View with Centered Status --}}
<div class="card summary-card text-info shadow-sm mb-4 border-0">
    <div class="card-body p-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="fw-semibold mb-0">🗓️ Appointments</h4>
            <span class="badge bg-info text-white px-3 py-2 rounded-pill">
                Total: {{ $upcomingAppointments->count() }}
            </span>
        </div>

        @if ($upcomingAppointments->count() > 0)
            <ul class="list-group list-group-flush">
                @foreach ($upcomingAppointments->sortByDesc('requested_datetime')->take(5) as $appointment)
                    <li class="list-group-item d-flex justify-content-between align-items-center py-3 border-0 border-bottom">
                        
                        <!-- Patient Info -->
                        <div class="d-flex align-items-center gap-3 flex-grow-1">
                            <div class="bg-info bg-opacity-10 p-3 rounded-circle">
                                🧍
                            </div>
                            <div>
                                <h6 class="fw-semibold mb-1">{{ $appointment->user->name ?? 'Unknown' }}</h6>
                                <p class="text-muted mb-0" style="font-size: 0.9rem;">
                                    {{ \Carbon\Carbon::parse($appointment->requested_datetime)->format('M d, Y h:i A') }}
                                </p>
                            </div>
                        </div>

                        <!-- Centered Status -->
                        <div class="text-center flex-shrink-0" style="width: 140px;">
                            <span class="badge rounded-pill px-3 py-2
                                @if($appointment->status === 'pending') bg-warning text-dark
                                @elseif($appointment->status === 'approved') bg-success
                                @elseif($appointment->status === 'rescheduled') bg-info
                                @elseif($appointment->status === 'declined') bg-danger
                                @else bg-secondary
                                @endif">
                                {{ ucfirst($appointment->status) }}
                            </span>
                        </div>

                        <!-- Manage Button -->
                        <<div class="text-end flex-shrink-0" style="width: 140px;">
    @if($appointment->status === 'completed')
        <span class="badge bg-success px-3 py-2 rounded-pill">
            ✔ Completed
        </span>
    @elseif($appointment->status === 'declined')
        <span class="badge bg-danger px-3 py-2 rounded-pill">
            ✖ Declined
        </span>
    @elseif($appointment->status === 'in_session')
        <span class="badge bg-primary px-3 py-2 rounded-pill">
            🔵 In Session
        </span>
    @else
        <span class="badge bg-warning text-dark px-3 py-2 rounded-pill">
            ⏳ Pending
        </span>
    @endif
</div>


                    </li>
                @endforeach
            </ul>

            {{-- View All Button --}}
            <div class="text-end mt-3">
                <a href="{{ route('nurse.appointments.index') }}" class="btn btn-outline-info btn-pill px-4">
                    View All Appointments →
                </a>
            </div>
        @else
            <div class="text-center py-4 text-muted">No upcoming appointments.</div>
        @endif
    </div>
</div>



{{-- ⚡ Quick Links (without Guardian SMS Log) --}}
<h4 class="fw-semibold mb-3">⚡ Quick Access</h4>
<div class="row g-3 mb-4">
    

    <div class="col-md-6">
        <div class="card card-medcare text-center p-4">
            <h5 class="fw-semibold mb-2">📖 Student Records</h5>
            <p class="text-muted small mb-3">Access medical profiles and history.</p>
            <a href="{{ route('nurse.students.index') }}" class="btn btn-info btn-pill w-100">Open</a>
        </div>
    </div>
</div>
<!-- 🩺 Manage Appointment Modal -->
<div class="modal fade" id="manageAppointmentModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <form method="POST" id="manageAppointmentForm" class="w-100">
      @csrf
      @method('PUT')
      <div class="modal-content shadow-2xl border-0 rounded-3">

        <!-- Header -->
        <div class="modal-header bg-gradient-to-r from-teal-500 to-blue-600 text-white">
          <h5 class="modal-title fw-semibold flex items-center gap-2">
            🩺 Manage Appointment
          </h5>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
        </div>

        <!-- Body -->
        <div class="modal-body p-4">
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

            <!-- Approved Date -->
            <div class="mb-3">
              <label class="form-label fw-semibold">Approved Date & Time</label>
              <input type="datetime-local" name="approved_datetime" id="approved_datetime"
                     class="form-control rounded-lg shadow-sm">
            </div>

            <!-- Status -->
            <div class="mb-3">
              <label class="form-label fw-semibold">Status</label>
              <select name="status" id="status"
                      class="form-select rounded-lg shadow-sm"
                      required>
                <option value="approved">Approve</option>
                <option value="rescheduled">Reschedule</option>
                <option value="declined">Decline</option>
                
              </select>
            </div>
          </div>

          <!-- Nurse Note -->
          <div class="mb-3">
            <label class="form-label fw-semibold">Diagnosis / Complaint</label>
            <textarea name="admin_note" id="admin_note"
                      class="form-control rounded-lg shadow-sm"
                      rows="2" placeholder="Reason for visit or initial diagnosis..."></textarea>
          </div>

          <!-- Findings -->
          <div class="mb-3">
            <label class="form-label fw-semibold">🩺 Findings & Treatment</label>
            <textarea name="findings" id="findings"
                      class="form-control rounded-lg shadow-sm"
                      rows="3"
                      placeholder="e.g. Mild fever, advised hydration, meds given..."></textarea>
          </div>
        </div>

        <!-- Footer -->
        <div class="modal-footer bg-gray-50 flex justify-end gap-2">
          <button type="submit" id="saveBtn"
                  class="btn btn-success shadow-sm px-4">
            💾 Save
          </button>
          <button type="button" class="btn btn-outline-secondary"
                  data-bs-dismiss="modal">
            Close
          </button>
        </div>

      </div>
    </form>
  </div>
</div>

<div class="modal fade" id="completeAppointmentModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <form method="POST" id="completeAppointmentForm">
      @csrf
      
      <div class="modal-content shadow-2xl border-0 rounded-3">

        <div class="modal-header bg-gradient-to-r from-blue-600 to-teal-500 text-white">
          <h5 class="modal-title fw-semibold">
            ✅ Complete Appointment
          </h5>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
        </div>

        <div class="modal-body p-4">
          <div class="row g-3">

            <div class="col-md-6">
              <label class="form-label fw-semibold">Completion Date & Time</label>
              <input type="datetime-local" name="completed_datetime" class="form-control" required>
            </div>

            <div class="col-md-6">
              <label class="form-label fw-semibold">Temperature (°C)</label>
              <input type="text" name="temperature" class="form-control" placeholder="e.g. 37.5">
            </div>

            <div class="col-md-6">
              <label class="form-label fw-semibold">Blood Pressure (mmHg)</label>
              <input type="text" name="blood_pressure" class="form-control" placeholder="e.g. 120/80">
            </div>

            <div class="col-md-6">
              <label class="form-label fw-semibold">Heart Rate (bpm)</label>
              <input type="text" name="heart_rate" class="form-control" placeholder="e.g. 72">
            </div>

            <div class="col-12">
              <label class="form-label fw-semibold">Findings & Treatment</label>
              <textarea name="additional_notes" class="form-control" rows="3"
                placeholder="e.g. Mild fever, provided medicine and rest advised..."></textarea>
            </div>

          </div>
        </div>

        <div class="modal-footer bg-gray-50">
          <button type="submit" class="btn btn-success px-4">💾 Mark as Completed</button>
        </div>

      </div>
    </form>
  </div>
</div>

    {{-- 📩 SMS Modal --}}
    @include('nurse.partials.send-sms-modal')
    <div class="modal fade" id="emergencyModal">
  <div class="modal-dialog">
    <form method="POST" id="emergencyForm" action="{{ route('nurse.appointments.emergency') }}">
      @csrf
      <div class="modal-content">
        <div class="modal-header bg-danger text-white">
          <h5 class="modal-title">🚨 Emergency Appointment</h5>
          <button class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <label>Student</label>
          <select name="student_id" class="form-select">@foreach($students as $student) 
            <option value="{{ $student->id }}">{{ $student->name }}</option>@endforeach
          </select>
          <label class="mt-3">Reason (optional)</label>
          <textarea name="reason" class="form-control" placeholder="e.g. difficulty breathing..."></textarea>
        </div>
        <div class="modal-footer">
          <button class="btn btn-danger">Save Emergency</button>
        </div>
      </div>
    </form>
  </div>
</div>

</div>

{{-- 💡 JS: Auto-refresh Today’s Table --}}
<script>
document.addEventListener('DOMContentLoaded', function () {
    const manageModal = document.getElementById('manageAppointmentModal');
    const form        = document.getElementById('manageAppointmentForm');
    const saveBtn     = document.getElementById('saveBtn');

    manageModal.addEventListener('show.bs.modal', (event) => {
        const button = event.relatedTarget;

        // ✅ Ensure we're hitting the correct update route
        form.action = button.getAttribute('data-action');
        console.log('Updating via:', form.action);

        // Prefill date/time (default = now + 5min)
        const approved = button.getAttribute('data-approved_datetime');
        document.getElementById('approved_datetime').value =
            approved ? approved.replace(' ', 'T')
                     : new Date(Date.now() + 5 * 60 * 1000).toISOString().slice(0, 16);

        // ✅ Status: only allow the options your validator accepts
        const allowed = ['approved','rescheduled','declined','completed'];
        const current = button.getAttribute('data-status');
        document.getElementById('status').value = allowed.includes(current) ? current : 'approved';

        document.getElementById('admin_note').value = button.getAttribute('data-note') ?? '';
        document.getElementById('findings').value   = button.getAttribute('data-findings') ?? '';
    });
    
    // ✅ AJAX with solid error surfacing
    form.addEventListener('submit', async function (e) {
        e.preventDefault();
        saveBtn.disabled = true;
        saveBtn.innerHTML = '⏳ Saving...';

        const url = form.action;
        const formData = new FormData(form);

        try {
            const res = await fetch(url, {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                    'X-HTTP-Method-Override': 'PUT',
                    'Accept': 'application/json'
                },
                body: formData
            });

            // Try to parse JSON; if not JSON, get raw text for debugging
            const text = await res.text();
            let data;
            try { data = JSON.parse(text); } catch { data = null; }

            if (!res.ok || (data && data.success === false)) {
                // Try to surface validation errors (422) or server messages
                let msg = 'Something went wrong. Please try again.';
                if (data?.message) msg = data.message;
                if (data?.errors) {
                    // Flatten validation messages
                    msg = Object.values(data.errors).flat().join('\n');
                } else if (!data) {
                    // Not JSON? show first 200 chars of response
                    msg = text?.slice(0, 200) || msg;
                }
                throw new Error(msg);
            }

            toastr.success('Appointment updated successfully!', 'Success');

            const modal = bootstrap.Modal.getInstance(manageModal);
            modal.hide();

            setTimeout(() => window.location.reload(), 1000);
        } catch (err) {
            console.error(err);
            toastr.error(err.message || 'Something went wrong. Please try again.', 'Error');
        } finally {
            saveBtn.disabled = false;
            saveBtn.innerHTML = '💾 Save';
        }
    });
    // START SESSION via AJAX
document.querySelectorAll('.start-session-form').forEach(form => {
    form.addEventListener('submit', async e => {
        e.preventDefault();

        try {
            const res = await fetch(form.action, {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                    'Accept': 'application/json'
                }
            });

            const data = await res.json();
            if (!data.success) throw new Error(data.message);

            toastr.success('Session started');
            setTimeout(() => location.reload(), 600);
        } catch (err) {
            toastr.error(err.message || 'Failed to start session');
        }
    });
});

    // ✅ COMPLETE MODAL JAVASCRIPT (no extra DOMContentLoaded)
const completeModal = document.getElementById('completeAppointmentModal');
const completeForm  = document.getElementById('completeAppointmentForm');

completeModal.addEventListener('show.bs.modal', (event) => {
    const button = event.relatedTarget;
    completeForm.action = button.getAttribute('data-action');

    // ✅ Pre-fill completion datetime with current time
    const now = new Date().toISOString().slice(0, 16);
    completeForm.querySelector('input[name="completed_datetime"]').value = now;
});

completeForm.addEventListener('submit', async function (e) {
    e.preventDefault();

    const submitBtn = completeForm.querySelector('button[type="submit"]');
    submitBtn.disabled = true;
    submitBtn.innerHTML = '⏳ Saving...';

    try {
        const res = await fetch(completeForm.action, {
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                'Accept': 'application/json'
            },
            body: new FormData(completeForm)
        });

        const data = await res.json();

        if (!data.success) throw new Error(data.message || 'Failed to complete appointment.');

        toastr.success('✅ Appointment marked as completed!');
        bootstrap.Modal.getInstance(completeModal).hide();
        setTimeout(() => window.location.reload(), 1000);
    } catch (error) {
        console.error(error);
        toastr.error(error.message, 'Error');
    } finally {
        submitBtn.disabled = false;
        submitBtn.innerHTML = '💾 Mark as Completed';
    }
});

    // Toastr configuration
    toastr.options = {
        closeButton: true,
        progressBar: true,
        positionClass: 'toast-top-right',
        timeOut: '3000'
    };
});
</script>




@endsection
