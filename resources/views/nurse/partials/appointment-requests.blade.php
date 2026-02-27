<div class="card summary-card text-warning shadow-sm mb-4 border-0">
    <div class="card-body p-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="fw-semibold mb-0">🟡 Appointment Requests</h4>
            <span class="badge bg-warning text-dark px-3 py-2 rounded-pill">
                Total: {{ $pendingAppointmentsCount }}
            </span>
        </div>

        @if ($pendingAppointments->count() > 0)
            <ul class="list-group list-group-flush">
                @foreach ($pendingAppointments->take(5) as $appointment)
                    <li class="list-group-item d-flex justify-content-between align-items-center py-3 border-0 border-bottom">
                        <div>
                            <strong>{{ $appointment->user->name ?? 'Unknown' }}</strong><br>
                            <small class="text-muted">
                                Requested: {{ \Carbon\Carbon::parse($appointment->requested_datetime)->format('M d, Y h:i A') }}
                            </small>
                        </div>
                        <button class="btn btn-warning btn-sm btn-pill"
                                data-bs-toggle="modal"
                                data-bs-target="#manageAppointmentModal"
                                data-action="{{ route('nurse.appointments.update', $appointment->id) }}"
                                data-status="pending">
                            Review
                        </button>
                    </li>
                @endforeach
            </ul>
        @else
            <div class="text-center py-4 text-muted">No new appointment requests.</div>
        @endif
    </div>
</div>