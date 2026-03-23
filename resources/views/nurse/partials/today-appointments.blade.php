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
                <td class="fw-medium">{{ $appointment->user->name ?? 'Unknown' }}</td>
                <td>
                    {{ $appointment->approved_datetime
                        ? \Carbon\Carbon::parse($appointment->approved_datetime)->format('h:i A')
                        : '—' }}
                </td>
                <td>
                    <span class="badge rounded-pill px-3 py-2 
                        @if($appointment->status === 'pending') bg-warning text-dark
                        @elseif($appointment->status === 'approved') bg-success
                        @elseif($appointment->status === 'in_session') bg-primary
                        @elseif($appointment->status === 'completed') bg-success
                        @elseif($appointment->status === 'declined') bg-danger
                        @else bg-secondary @endif">
                        {{ ucfirst(str_replace('_',' ', $appointment->status)) }}
                    </span>

                    @if($appointment->status === 'pending')
                        <button class="btn btn-success btn-sm ms-2"
                            data-bs-toggle="modal"
                            data-bs-target="#manageAppointmentModal"
                            data-action="{{ route('nurse.appointments.update', $appointment->id) }}"
                            data-status="pending"
                            data-reason="{{ e($appointment->reason ?? '') }}">
                            ✅ Review
                        </button>
                    @endif

                    @if($appointment->status === 'approved')
                        <form method="POST"
                              action="{{ route('nurse.appointments.start', $appointment->id) }}"
                              class="d-inline start-session-form">
                            @csrf
                            <button class="btn btn-primary btn-sm ms-2">▶ Start</button>
                        </form>
                    @endif

                    @if($appointment->status === 'in_session')
                        <button class="btn btn-success btn-sm ms-2"
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