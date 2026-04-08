<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Monthly Appointments Report - {{ $month }}</title>
    <style>
        body {
            font-family: DejaVu Sans, sans-serif;
            color: #222;
            line-height: 1.5;
            padding: 24px;
        }
        .header {
            margin-bottom: 24px;
            border-bottom: 2px solid #333;
            padding-bottom: 12px;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
        }
        .meta {
            margin-top: 8px;
            color: #555;
            font-size: 13px;
        }
        .summary {
            margin-bottom: 20px;
            padding: 12px;
            background: #f0f8ff;
            border: 1px solid #b0d4ff;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .status-pending { color: #d97706; }
        .status-approved { color: #059669; }
        .status-completed { color: #2563eb; }
        .status-declined { color: #dc2626; }
        .no-data {
            text-align: center;
            padding: 40px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Monthly Appointments Report</h1>
        <div class="meta">Month: {{ \Carbon\Carbon::createFromFormat('Y-m', $month)->format('F Y') }} | Generated: {{ now()->format('F d, Y h:i A') }}</div>
    </div>

    <div class="summary">
        <strong>Total Appointments:</strong> {{ $appointments->count() }}<br>
        <strong>Pending:</strong> {{ $appointments->where('status', 'pending')->count() }} |
        <strong>Approved:</strong> {{ $appointments->where('status', 'approved')->count() }} |
        <strong>Completed:</strong> {{ $appointments->where('status', 'completed')->count() }} |
        <strong>Declined:</strong> {{ $appointments->where('status', 'declined')->count() }}
    </div>

    @if($appointments->count() > 0)
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student</th>
                    <th>Requested Date</th>
                    <th>Status</th>
                    <th>Reason</th>
                    <th>Findings</th>
                </tr>
            </thead>
            <tbody>
                @foreach($appointments as $appointment)
                    <tr>
                        <td>{{ $appointment->id }}</td>
                        <td>{{ $appointment->student->name ?? 'N/A' }}</td>
                        <td>{{ $appointment->requested_datetime?->format('M d, Y h:i A') ?? 'N/A' }}</td>
                        <td class="status-{{ $appointment->status }}">
                            {{ ucfirst($appointment->status) }}
                        </td>
                        <td>{{ $appointment->reason ?? 'N/A' }}</td>
                        <td>{{ $appointment->findings ?? 'N/A' }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @else
        <div class="no-data">
            No appointments found for {{ \Carbon\Carbon::createFromFormat('Y-m', $month)->format('F Y') }}
        </div>
    @endif
</body>
</html>