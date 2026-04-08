@extends('layouts.app')

@section('content')
<main class="pt-20 bg-gradient-to-br from-sky-50 via-white to-teal-50 min-h-screen">
    <div class="max-w-6xl mx-auto px-6 py-8">
<!-- 🧭 Header -->
<!-- 🧭 Header -->
<div class="text-center mb-10">
    <h1 class="text-4xl font-bold text-gray-800 mb-2 flex items-center justify-center">
        <span class="mr-2">🎓</span> Student Dashboard
    </h1>
    <p class="text-gray-600 text-base">
        Welcome back, 
        <span class="font-semibold text-blue-700">
            {{ auth()->user()->name }}
        </span>!
    </p>
    <div class="h-1 w-32 bg-gradient-to-r from-blue-500 to-teal-400 mx-auto mt-4 rounded-full"></div>
</div>

<div id="studentAppointmentsWrapper">
    @include('students.partials.appointments')
</div>

        
    </div>
</main>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const wrapper = document.getElementById('studentAppointmentsWrapper');
    const refreshInterval = 5000;

    setInterval(async () => {
        if (!wrapper) {
            return;
        }

        // Skip auto-refresh while any appointment modal is open,
        // so the student can keep viewing details without the markup being replaced.
        if (document.querySelector('.modal.show')) {
            return;
        }

        try {
            const res = await fetch("{{ route('student.appointments.partial') }}");
            const html = await res.text();
            wrapper.innerHTML = html;
        } catch (e) {
            console.error('Student auto-refresh failed', e);
        }
    }, refreshInterval);
});
</script>
@endsection
