@extends('layouts.app')

@section('content')

    @php
        $weeklyMax = max(1, (int) ($weeklyIllnessCounts->max('total') ?? 0));
        $monthlyMax = max(1, (int) ($monthlyIllnessCounts->max('total') ?? 0));
    @endphp



    <div class="max-w-7xl mx-auto px-6 py-8">

        <!-- 🏥 Header -->
        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between mb-10">
            <div>
                <h1 class="text-3xl font-bold text-gray-800">Admin Dashboard</h1>
                <p class="text-gray-600 mt-1">Monitor appointments and user verification</p>
            </div>
            <div class="mt-4 sm:mt-0">
                <a href="{{ route('admin.appointments.all') }}" 
                   class="inline-flex items-center px-4 py-2 bg-blue-600 text-white text-sm rounded-lg hover:bg-blue-700 transition">
                    <span class="mr-2">📅</span> Manage Appointments
                </a>
                <a href="{{ route('admin.users.verify') }}"
   class="inline-flex items-center px-4 py-2  bg-blue-600 text-white text-sm rounded-lg hover:bg-blue-700 transition ml-2">
    ✅ Verify Users
</a>

            </div>
        </div>

        <!-- 📊 Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
            <div class="bg-white rounded-xl shadow-md p-6 border-l-4 border-blue-500">
                <div class="flex items-center justify-between">
                    <div>
                        <h2 class="text-sm text-gray-500 font-semibold uppercase">Total Appointments</h2>
                        <p class="text-3xl font-bold text-blue-600 mt-2">{{ $appointmentsCount ?? 0 }}</p>
                        <p class="text-xs text-gray-500 mt-1">All scheduled consultations</p>
                    </div>
                    <div class="bg-blue-100 p-3 rounded-full">
                        <span class="text-blue-600 text-2xl">📋</span>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-md p-6 border-l-4 border-green-500">
                <div class="flex items-center justify-between">
                    <div>
                        <h2 class="text-sm text-gray-500 font-semibold uppercase">Registered Users</h2>
                        <p class="text-3xl font-bold text-green-600 mt-2">{{ \App\Models\User::count() }}</p>
                        <p class="text-xs text-gray-500 mt-1">All active accounts</p>
                    </div>
                    <div class="bg-green-100 p-3 rounded-full">
                        <span class="text-green-600 text-2xl">👥</span>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-md p-6 border-l-4 border-teal-500">
                <div class="flex items-center justify-between">
                    <div>
                        <h2 class="text-sm text-gray-500 font-semibold uppercase">System Status</h2>
                        <p class="text-3xl font-bold text-teal-600 mt-2">✅</p>
                        <p class="text-xs text-gray-500 mt-1">Running smoothly</p>
                    </div>
                    <div class="bg-teal-100 p-3 rounded-full">
                        <span class="text-teal-600 text-2xl">⚙️</span>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="bg-white rounded-xl shadow-md border-l-4 border-teal-500 mb-10 hover:-translate-y-1 hover:shadow-lg transition-all duration-200">
    <div class="px-6 py-4 border-b border-gray-100 flex items-center justify-between">
        <h3 class="text-lg font-semibold text-gray-800 flex items-center gap-2">
            📄 Monthly Report
        </h3>
        <span class="text-xs text-gray-500">Export monthly illness visits and student details</span>
    </div>

    <form method="GET" action="{{ route('reports.monthly') }}" class="px-6 py-4 flex flex-col sm:flex-row gap-3 items-stretch sm:items-center">
        <input
            type="month"
            name="month"
            class="form-control w-full sm:w-auto"
            value="{{ now()->format('Y-m') }}"
        >

        <button
            type="submit"
            class="inline-flex items-center justify-center px-4 py-2 bg-teal-600 text-black text-sm rounded-lg hover:bg-teal-700 transition"
        >
            ⬇️ Monthly Illness Visits
        </button>
    </form>
</div>

        <div class="grid grid-cols-1 xl:grid-cols-2 gap-6 mb-10">
            <div class="bg-white rounded-xl shadow-md border border-gray-100">
                <div class="px-6 py-4 border-b border-gray-100 flex items-center justify-between">
                    <div>
                        <h3 class="text-lg font-semibold text-gray-800">Weekly Illness Visits</h3>
                        <p class="text-xs text-gray-500">Most common reasons for clinic visits this week</p>
                    </div>
                    <span class="text-xs font-medium text-blue-600 bg-blue-50 px-3 py-1 rounded-full">This Week</span>
                </div>

                <div class="px-6 py-5">
                    @if($weeklyIllnessCounts->isNotEmpty())
                        <div class="overflow-x-auto">
                            <div class="min-w-[560px]">
                                <div class="h-72 border-l border-b border-gray-200 px-4 py-3 bg-gradient-to-t from-gray-50 to-white">
                                    <div class="h-full flex items-end gap-4">
                                        @foreach($weeklyIllnessCounts as $illness)
                                            <div class="flex-1 min-w-[72px] h-full flex flex-col justify-end items-center">
                                                <div class="text-xs font-semibold text-gray-500 mb-2">{{ $illness->total }}</div>
                                                <div
                                                    class="rounded-t-lg shadow-sm"
                                                    style="width: 56px; height: {{ max(24, round(($illness->total / $weeklyMax) * 180)) }}px; background: linear-gradient(to top, #2563eb, #22d3ee);"
                                                    title="{{ $illness->sickness }}: {{ $illness->total }} visits"
                                                ></div>
                                                <div class="mt-3 text-center">
                                                    <div class="text-xs font-medium text-gray-700 leading-tight break-words">{{ $illness->sickness }}</div>
                                                    <div class="text-[11px] text-gray-400">{{ $illness->total }} visit{{ $illness->total > 1 ? 's' : '' }}</div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                    @else
                        <p class="text-sm text-gray-500">No completed appointments with illness data yet for this week.</p>
                    @endif
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-md border border-gray-100">
                <div class="px-6 py-4 border-b border-gray-100 flex items-center justify-between">
                    <div>
                        <h3 class="text-lg font-semibold text-gray-800">Monthly Illness Visits</h3>
                        <p class="text-xs text-gray-500">Most common reasons for clinic visits this month</p>
                    </div>
                    <span class="text-xs font-medium text-teal-600 bg-teal-50 px-3 py-1 rounded-full">This Month</span>
                </div>

                <div class="px-6 py-5">
                    @if($monthlyIllnessCounts->isNotEmpty())
                        <div class="overflow-x-auto">
                            <div class="min-w-[560px]">
                                <div class="h-72 border-l border-b border-gray-200 px-4 py-3 bg-gradient-to-t from-gray-50 to-white">
                                    <div class="h-full flex items-end gap-4">
                                        @foreach($monthlyIllnessCounts as $illness)
                                            <div class="flex-1 min-w-[72px] h-full flex flex-col justify-end items-center">
                                                <div class="text-xs font-semibold text-gray-500 mb-2">{{ $illness->total }}</div>
                                                <div
                                                    class="rounded-t-lg shadow-sm"
                                                    style="width: 56px; height: {{ max(24, round(($illness->total / $monthlyMax) * 180)) }}px; background: linear-gradient(to top, #0f766e, #34d399);"
                                                    title="{{ $illness->sickness }}: {{ $illness->total }} visits"
                                                ></div>
                                                <div class="mt-3 text-center">
                                                    <div class="text-xs font-medium text-gray-700 leading-tight break-words">{{ $illness->sickness }}</div>
                                                    <div class="text-[11px] text-gray-400">{{ $illness->total }} visit{{ $illness->total > 1 ? 's' : '' }}</div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                    @else
                        <p class="text-sm text-gray-500">No completed appointments with illness data yet for this month.</p>
                    @endif
                </div>
            </div>
        </div>


        <div class="bg-white rounded-xl shadow-md border border-gray-100 mb-10">
    <div class="px-6 py-4 border-b border-gray-100 flex items-center justify-between">
        <h3 class="text-lg font-semibold text-gray-800 flex items-center gap-2">
            📅 Recent Appointments
        </h3>
        <a href="{{ route('admin.appointments.all') }}" class="text-sm text-blue-600 hover:underline">
            View all →
        </a>
    </div>

    <div class="divide-y">
        @forelse($latestAppointments as $appointment)
            <div class="flex items-center justify-between px-6 py-3 hover:bg-gray-50 transition">
                <div>
                    <p class="font-medium text-gray-800">
                        {{ $appointment->student->name ?? $appointment->user->name }}
                    </p>
                    <p class="text-xs text-gray-500">
                        {{ \Carbon\Carbon::parse($appointment->requested_datetime)->format('M d, Y h:i A') }}
                    </p>
                </div>

                <span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-semibold
                    {{ $appointment->status === 'approved' ? 'bg-green-100 text-green-700' :
                       ($appointment->status === 'pending' ? 'bg-yellow-100 text-yellow-700' :
                       ($appointment->status === 'declined' ? 'bg-red-100 text-red-700' : 'bg-gray-100 text-gray-700')) }}">
                    {{ ucfirst($appointment->status) }}
                </span>
            </div>
        @empty
            <div class="px-6 py-4 text-sm text-gray-500">
                No appointments yet.
            </div>
        @endforelse
    </div>
</div>



       <!-- 👥 User Management -->
<div class="bg-white rounded-xl shadow-md overflow-hidden border border-gray-200 mt-10">

            <div class="bg-gradient-to-r from-blue-50 to-teal-50 px-6 py-4 border-b border-gray-200">
                <h2 class="text-lg font-semibold text-gray-800 flex items-center">
                    <span class="mr-2">👤</span> User Management
                </h2>
            </div>

            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200 text-sm">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left font-semibold text-gray-600 uppercase">Name</th>
                            <th class="px-6 py-3 text-left font-semibold text-gray-600 uppercase">Email</th>
                            <th class="px-6 py-3 text-left font-semibold text-gray-600 uppercase">Role</th>
                            <th class="px-6 py-3 text-left font-semibold text-gray-600 uppercase">Status</th>

                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
    @foreach(App\Models\User::all() as $user)
        @php
            $roleColors = [
                'admin' => 'bg-red-100 text-red-800',
                'nurse' => 'bg-green-100 text-green-800',
                'student' => 'bg-blue-100 text-blue-800',
                'default' => 'bg-gray-100 text-gray-700',
            ];
            $color = $roleColors[$user->role] ?? $roleColors['default'];
        @endphp

        <tr class="hover:bg-gray-50">
            <!-- NAME -->
            <td class="px-6 py-4 font-medium text-gray-900">
                {{ $user->name }}
            </td>

            <!-- EMAIL -->
            <td class="px-6 py-4 text-gray-600">
                {{ $user->email }}
            </td>

            <!-- ROLE -->
            <td class="px-6 py-4">
                <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold {{ $color }}">
                    @if($user->role === 'admin') 🔑 Admin
                    @elseif($user->role === 'nurse') 👩‍⚕️ Nurse
                    @elseif($user->role === 'student') 🎓 Student
                    @else 👤 {{ ucfirst($user->role) }}
                    @endif
                </span>
            </td>

            <!-- STATUS -->
            <td class="px-6 py-4">
                @if($user->is_verified)
                    <span class="px-3 py-1 text-xs rounded-full bg-green-100 text-green-700">
                        ✔ Verified
                    </span>
                @else
                    <span class="px-3 py-1 text-xs rounded-full bg-yellow-100 text-yellow-700">
                        ⏳ Pending
                    </span>
                @endif
            </td>
        </tr>
    @endforeach
</tbody>
</table>
                <!-- 🔗 Link to verification panel -->
<div class="text-right mt-4">
    <a href="{{ route('admin.users.verify') }}"
       class="text-sm text-blue-600 hover:underline">
        → Go to User Verification Panel
    </a>
</div>
            </div>
        </div>
            <a href="{{ route('guardian.sms.index') }}" 
                class="group bg-white p-6 rounded-xl shadow-md border border-gray-200 hover:border-blue-300 hover:-translate-y-1 transition-all duration-300 flex flex-col">
                <div class="flex items-center mb-4">
                    <div class="bg-blue-100 p-3 rounded-lg group-hover:bg-blue-200 transition-colors">
                        <span class="text-blue-600 text-2xl">📲</span>
                    </div>
                        <h3 class="text-lg font-semibold text-gray-800 ml-3">Guardian SMS Logs</h3>
                </div>
                    <p class="text-gray-600 text-sm mt-auto">View all messages sent to student guardians</p>
            </a>                        
        <!-- 🩺 Footer -->
        <div class="text-center mt-10">
            <p class="text-sm text-gray-500">MedCare System © {{ date('Y') }} | Admin Portal</p>
        </div>
    </div>




@endsection
