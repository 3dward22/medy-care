<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Monthly Illness Visits Report - {{ $month }}</title>
    <style>
        body {
            font-family: DejaVu Sans, sans-serif;
            color: #222;
            line-height: 1.45;
            padding: 24px;
            font-size: 12px;
        }
        h1, h2, p {
            margin: 0;
        }
        .header {
            margin-bottom: 18px;
            border-bottom: 2px solid #0f766e;
            padding-bottom: 10px;
        }
        .header h1 {
            font-size: 24px;
            color: #0f766e;
        }
        .meta {
            margin-top: 6px;
            color: #555;
            font-size: 12px;
        }
        .summary-box {
            margin-top: 18px;
            margin-bottom: 18px;
            padding: 12px;
            background: #f0fdfa;
            border: 1px solid #99f6e4;
        }
        .section-title {
            margin-top: 18px;
            margin-bottom: 10px;
            font-size: 15px;
            color: #0f172a;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #d9d9d9;
            padding: 7px;
            text-align: left;
            vertical-align: top;
        }
        th {
            background: #f8fafc;
            font-weight: bold;
        }
        .compact td, .compact th {
            padding: 6px;
        }
        .muted {
            color: #666;
        }
        .visit-card {
            margin-bottom: 14px;
            border: 1px solid #dbeafe;
            padding: 10px;
            page-break-inside: avoid;
        }
        .visit-title {
            font-weight: bold;
            color: #1d4ed8;
            margin-bottom: 6px;
        }
        .grid {
            width: 100%;
            border-collapse: collapse;
        }
        .grid td {
            width: 50%;
            border: 1px solid #e5e7eb;
            padding: 6px;
        }
        .empty {
            text-align: center;
            padding: 24px;
            color: #777;
            border: 1px dashed #ccc;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Monthly Illness Visits Report</h1>
        <div class="meta">
            Month: {{ \Carbon\Carbon::createFromFormat('Y-m', $month)->format('F Y') }} |
            Generated: {{ now()->format('F d, Y h:i A') }}
        </div>
    </div>

    <div class="summary-box">
        <strong>Total Appointments:</strong> {{ $appointments->count() }}<br>
        <strong>Completed Visits With Illness Data:</strong> {{ $appointments->filter(fn ($appointment) => filled($appointment->completion?->sickness))->count() }}<br>
        <strong>Most Common Illness:</strong>
        {{ $illnessCounts->first()->sickness ?? 'No illness data' }}
        @if($illnessCounts->first())
            ({{ $illnessCounts->first()->total }} visits)
        @endif
    </div>

    <h2 class="section-title">Monthly Illness Totals</h2>
    @if($illnessCounts->count() > 0)
        <table class="compact">
            <thead>
                <tr>
                    <th>Illness</th>
                    <th>Total Visits</th>
                </tr>
            </thead>
            <tbody>
                @foreach($illnessCounts as $illness)
                    <tr>
                        <td>{{ $illness->sickness }}</td>
                        <td>{{ $illness->total }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @else
        <div class="empty">No illness data found for this month.</div>
    @endif

    <h2 class="section-title">Per-Student Visit Details</h2>
    @if($appointments->count() > 0)
        @foreach($appointments as $appointment)
            <div class="visit-card">
                <div class="visit-title">
                    {{ $appointment->student->name ?? 'Unknown Student' }}
                    <span class="muted">| Appointment #{{ $appointment->id }}</span>
                </div>

                <table class="grid">
                    <tr>
                        <td><strong>Requested Date</strong><br>{{ $appointment->requested_datetime?->format('M d, Y h:i A') ?? 'N/A' }}</td>
                        <td><strong>Status</strong><br>{{ ucfirst(str_replace('_', ' ', $appointment->status)) }}</td>
                    </tr>
                    <tr>
                        <td><strong>Requested Reason</strong><br>{{ $appointment->reason ?? 'N/A' }}</td>
                        <td><strong>Preferred Time</strong><br>{{ $appointment->preferred_time ?? 'N/A' }}</td>
                    </tr>
                    <tr>
                        <td><strong>Illness / Sickness</strong><br>{{ $appointment->completion?->sickness ?? 'N/A' }}</td>
                        <td><strong>Completion Date</strong><br>{{ $appointment->completion?->completed_datetime ? \Carbon\Carbon::parse($appointment->completion->completed_datetime)->format('M d, Y h:i A') : 'N/A' }}</td>
                    </tr>
                    <tr>
                        <td><strong>Temperature</strong><br>{{ $appointment->completion?->temperature ?? $appointment->temperature ?? 'N/A' }}</td>
                        <td><strong>Blood Pressure</strong><br>{{ $appointment->completion?->blood_pressure ?? $appointment->blood_pressure ?? 'N/A' }}</td>
                    </tr>
                    <tr>
                        <td><strong>Heart Rate</strong><br>{{ $appointment->completion?->heart_rate ?? $appointment->heart_rate ?? 'N/A' }}</td>
                        <td><strong>Admin Note</strong><br>{{ $appointment->admin_note ?? 'N/A' }}</td>
                    </tr>
                    <tr>
                        <td colspan="2"><strong>Findings</strong><br>{{ $appointment->completion?->findings ?? $appointment->findings ?? 'N/A' }}</td>
                    </tr>
                    <tr>
                        <td colspan="2"><strong>Additional Notes / Treatment</strong><br>{{ $appointment->completion?->additional_notes ?? $appointment->additional_notes ?? 'N/A' }}</td>
                    </tr>
                </table>
            </div>
        @endforeach
    @else
        <div class="empty">No appointment records found for {{ \Carbon\Carbon::createFromFormat('Y-m', $month)->format('F Y') }}.</div>
    @endif
</body>
</html>
