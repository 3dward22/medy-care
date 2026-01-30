@extends('layouts.app')

@section('content')
<main class="pt-20 bg-gradient-to-br from-sky-50 via-white to-teal-50 min-h-screen">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">

        <!-- Header -->
        <div class="flex flex-col sm:flex-row items-center justify-between mb-8">
            <div>
                <h1 class="text-3xl font-bold text-gray-800 flex items-center gap-2">
                    📋 Medical Records
                </h1>
                <p class="text-gray-600 text-sm">
                    Patient: <span class="font-semibold">{{ $student->name }}</span>
                </p>
            </div>
        </div>

        @if($records->isEmpty())
            <div class="text-center py-12 text-gray-500">
                No medical records found for this student.
            </div>
        @else
<!-- Filter Buttons -->
<div class="flex flex-wrap gap-2 mb-6">
    <button class="btn btn-sm btn-outline-primary filter-btn active" data-type="all">
        All Records
    </button>

    <button class="btn btn-sm btn-outline-primary filter-btn" data-type="appointment">
        Appointments
    </button>

    <button class="btn btn-sm btn-outline-danger filter-btn" data-type="emergency">
        Emergency
    </button>
</div>
        <!-- Table Container -->
        <div class="bg-white shadow-lg rounded-2xl overflow-hidden border border-gray-100">
            <div class="overflow-x-auto">

                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-gradient-to-r from-blue-50 to-teal-50 text-gray-700 text-sm uppercase">
                        <tr>
                            <th class="px-4 py-3 text-left">Type</th>
                            <th class="px-4 py-3 text-left">Date</th>
                            <th class="px-4 py-3 text-left">Complaint / Symptoms</th>
                            <th class="px-4 py-3 text-left">Findings</th>
                            <th class="px-4 py-3 text-left">Diagnosis</th>
                            <th class="px-4 py-3 text-left">Treatment / Notes</th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach($records as $record)
                        <tr class="hover:bg-gray-50 transition record-row"
    data-type="{{ $record['type'] }}">


                            <!-- Type -->
                            <td class="px-4 py-3">
                                <span class="badge d-flex align-items-center gap-1 px-3 py-1 rounded-pill
                                    {{ $record['type'] === 'emergency'
                                        ? 'bg-danger'
                                        : 'bg-primary' }}">
                                    {{ strtoupper($record['type']) }}
                                </span>
                            </td>

                            <!-- Date -->
                            <td class="px-4 py-3 text-gray-600">
                                {{ \Carbon\Carbon::parse($record['date'])->format('M d, Y h:i A') }}
                            </td>

                            <!-- Complaint -->
                            <td class="px-4 py-3 text-gray-700">
                                {{ $record['complaint'] }}
                            </td>

                            <!-- Findings -->
                            <td class="px-4 py-3 text-gray-600">
                                {{ $record['findings'] ?? '—' }}
                            </td>

                            <!-- Diagnosis -->
                            <td class="px-4 py-3 text-gray-600">
                                {{ $record['diagnosis'] ?? '—' }}
                            </td>

                            <!-- Treatment -->
                            <td class="px-4 py-3 text-gray-600">
                                {{ $record['treatment'] ?? '—' }}
                            </td>

                        </tr>
                        @endforeach
                    </tbody>
                </table>

            </div>
        </div>

        @endif

    </div>
</main>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const buttons = document.querySelectorAll('.filter-btn');
    const rows = document.querySelectorAll('.record-row');

    function applyFilter(type) {
        rows.forEach(row => {
            if (type === 'all' || row.dataset.type === type) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    }

    buttons.forEach(btn => {
        btn.addEventListener('click', () => {
            const type = btn.dataset.type;

            buttons.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            applyFilter(type);
        });
    });

    // ✅ run once on load
    applyFilter('all');
});
</script>

<style>
.filter-btn.active {
    background-color: #0d6efd;
    color: #fff;
    border-color: #0d6efd;
}

.filter-btn.active[data-type="emergency"] {
    background-color: #dc3545;
    border-color: #dc3545;
}
</style>

@endsection
