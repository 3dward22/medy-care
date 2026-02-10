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
                      <tr class="hover:bg-gray-50 transition">


                            <!-- Type -->
                            <td class="px-4 py-3">
    @if($record['type'] === 'Emergency')
        <span class="badge bg-danger px-3 py-2 rounded-pill">
            🚨 Emergency
        </span>
    @else
        <span class="badge bg-primary px-3 py-2 rounded-pill">
            Appointment
        </span>
    @endif
</td>



                            <!-- Date -->
                            <td class="px-4 py-3 text-gray-600">
                                {{ \Carbon\Carbon::parse($record['date'])->format('M d, Y h:i A') }}
                            </td>

                            <td class="px-4 py-3 text-gray-700">
    @if($record['type'] === 'emergency')
        {{ $record['complaint'] ?? '—' }}
    @else
        {{ $record['complaint'] ?? '—' }}
    @endif
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




@endsection
