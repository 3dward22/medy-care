@extends('layouts.app')

@section('content')
<main class="pt-20 bg-gradient-to-br from-sky-50 via-white to-teal-50 min-h-screen">
    <div class="max-w-6xl mx-auto px-6 py-8">

        <!-- 🧭 Header -->
        <div class="flex flex-col sm:flex-row items-center justify-between mb-10">
            <div class="text-center sm:text-left">
                <h1 class="text-3xl sm:text-4xl font-bold text-gray-800 mb-2 flex items-center justify-center sm:justify-start">
                    <span class="mr-2">📅</span> My Appointments
                </h1>
                <p class="text-gray-600 text-base">Manage and track your clinic appointments easily below.</p>
            </div>

            <!-- ➕ Button to open modal -->
            <button data-bs-toggle="modal" data-bs-target="#appointmentModal"
                    class="mt-4 sm:mt-0 inline-flex items-center px-6 py-3 bg-gradient-to-r from-blue-600 to-teal-500 text-white font-semibold rounded-xl shadow hover:from-blue-700 hover:to-teal-600 transition-all duration-200">
                <span class="mr-1">➕</span> Request Appointment
            </button>
        </div>

        <!-- 📋 Appointment List -->
        <div class="bg-white shadow-md rounded-2xl border border-gray-200 overflow-hidden">
            <div class="p-5 border-b bg-gradient-to-r from-blue-50 to-teal-50 flex items-center justify-between">
                <h2 class="text-lg font-semibold text-gray-700 flex items-center">
                    <span class="mr-2">🗓️</span> My Appointments
                </h2>
                <span class="text-sm text-gray-500">Total: <span id="appointmentCount">{{ $appointments->count() }}</span></span>
            </div>

            <div class="overflow-x-auto">
                <table class="min-w-full text-sm divide-y divide-gray-200" id="appointmentsTable">
                    <thead class="bg-gray-50 text-gray-600 uppercase text-xs font-semibold">
                        <tr>
                            <th class="px-6 py-3 text-left">Requested At</th>
                            <th class="px-6 py-3 text-left">Status</th>
                            <th class="px-6 py-3 text-left">Approved Date</th>
                            <th class="px-6 py-3 text-left">Nurse Note</th>
                            <th class="px-6 py-3 text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100" id="appointmentBody">
                        @forelse($appointments as $appointment)
                            <tr class="hover:bg-blue-50 transition">
                                <td class="px-6 py-4 text-gray-800 font-medium">
                                    {{ \Carbon\Carbon::parse($appointment->requested_datetime)->format('M d, Y h:i A') }}
                                </td>
                                <td class="px-6 py-4">
    @if($appointment->status === 'pending')
        <span class="inline-flex px-3 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-800">
            ⏳ Waiting for nurse approval
        </span>

    @elseif($appointment->status === 'approved')
        <span class="inline-flex px-3 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">
            ✅ Approved
        </span>

    @elseif($appointment->status === 'in_session')
        <span class="inline-flex px-3 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800">
            🩺 In session
        </span>

    @elseif($appointment->status === 'completed')
        <span class="inline-flex px-3 py-1 text-xs font-semibold rounded-full bg-indigo-100 text-indigo-800">
            ✔ Completed
        </span>

    @elseif($appointment->status === 'declined')
        <span class="inline-flex px-3 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-800">
            ❌ Declined
        </span>

    @elseif($appointment->status === 'cancelled')
        <span class="inline-flex px-3 py-1 text-xs font-semibold rounded-full bg-gray-100 text-gray-700">
            Cancelled
        </span>
    @endif
</td>

                                <td class="px-6 py-4 text-gray-600">
    @if($appointment->approved_datetime)
        {{ \Carbon\Carbon::parse($appointment->approved_datetime)->format('M d, Y h:i A') }}

    @elseif($appointment->status === 'pending')
        <span class="text-gray-400 italic text-sm">
            Awaiting nurse scheduling
        </span>

    @else
        —
    @endif
</td>

                               <td class="px-6 py-4 text-gray-600">
    @if($appointment->status === 'completed')
        {{ $appointment->admin_note ?? '—' }}
    @else
        <span class="text-gray-400 italic text-sm">
            Available after appointment
        </span>
    @endif
</td>

                                <td class="px-6 py-4 text-center">
                                    @if($appointment->status === 'pending')
                                        <form action="{{ route('student.appointments.destroy', $appointment->id) }}"
                                              method="POST"
                                              onsubmit="return confirm('Are you sure you want to cancel this appointment?')"
                                              class="inline-block">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit"
                                                    class="px-3 py-1 bg-red-500 text-white text-xs font-semibold rounded-md hover:bg-red-600 transition">
                                                Cancel
                                            </button>
                                        </form>
                                    @else
                                        <span class="text-gray-400 text-xs italic">No action</span>
                                    @endif
                                </td>
                            </tr>
                        @empty
                            <tr><td colspan="5" class="text-center py-8 text-gray-500">No appointments yet.</td></tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

<!-- 📅 Modal -->
<div class="modal fade" id="appointmentModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-2xl shadow-lg border-0">
            <div class="modal-header bg-gradient-to-r from-blue-600 to-teal-500 text-white rounded-t-2xl">
                <h5 class="modal-title font-semibold">📨 Request Appointment</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <form id="appointmentForm" action="{{ route('student.appointments.store') }}" method="POST" class="p-6">
                @csrf
                <div class="mb-4">
    
    <div class="mb-4">
    <label class="block text-sm font-medium text-gray-700 mb-1">
        Reason for Appointment
    </label>
    <textarea
        name="reason"
        required
        rows="3"
        class="w-full border-gray-300 rounded-lg shadow-sm text-sm px-3 py-2 focus:ring-blue-400 focus:border-blue-400"
        placeholder="Describe your concern (e.g. headache, fever, check-up)"
    ></textarea>
</div>

<div class="mb-4">
    <label class="block text-sm font-medium text-gray-700 mb-1">
        Preferred time (optional)
    </label>
    <input
        type="text"
        name="preferred_time"
        class="w-full border-gray-300 rounded-lg shadow-sm text-sm px-3 py-2"
        placeholder="e.g. Morning / Afternoon / After class"
    >
</div>


</div>


                <div class="flex justify-end space-x-2 mt-6">
                    <button type="button" class="px-4 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 transition" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" id="submitAppointment" class="px-6 py-2 bg-gradient-to-r from-blue-600 to-teal-500 text-white font-semibold rounded-lg shadow hover:from-blue-700 hover:to-teal-600 transition-all">
                        Submit
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

{{-- ✅ Toastr --}}
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script>
document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("appointmentForm");
    const modalEl = document.getElementById("appointmentModal");
    const tbody = document.getElementById("appointmentBody");
    const countEl = document.getElementById("appointmentCount");
    const submitBtn = document.getElementById("submitAppointment");

    form.addEventListener("submit", async (e) => {
        e.preventDefault();

        submitBtn.disabled = true;
        submitBtn.innerHTML = "⏳ Submitting...";

        const formData = new FormData(form);

        try {
            const response = await fetch(form.action, {
    method: "POST",
    headers: {
        "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content,
        "Accept": "application/json"
    },
    body: formData
});

// ✅ FIRST: check HTTP status
if (!response.ok) {
    toastr.error("Request failed. Please check your input.", "Error");
    return;
}

// ✅ SECOND: safely parse JSON
let result;
try {
    result = await response.json();
} catch (e) {
    toastr.error("Server returned an unexpected response.", "Error");
    return;
}


            if (result.success) {
                toastr.success("Appointment requested successfully!", "Success");

                // ✅ Close modal
                const modalInstance = bootstrap.Modal.getInstance(modalEl);
                if (modalInstance) modalInstance.hide();

                form.reset();

                // ✅ Add new appointment instantly
                const formatted = new Date().toLocaleString('en-US', {
    month: 'short',
    day: '2-digit',
    year: 'numeric',
    hour: '2-digit',
    minute: '2-digit'
});

                

                const newRow = `
                    <tr class='animate-fadeIn'>
                        <td class='px-6 py-4 text-gray-800 font-medium'>${formatted}</td>
                        <td class='px-6 py-4'>
                            <span class='inline-flex px-3 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-800'>
                            ⏳ Waiting for nurse approval
                        </span>

                        </td>
                        <td class='px-6 py-4 text-gray-600'>—</td>
                        <td class='px-6 py-4 text-gray-600'>—</td>
                        <td class='px-6 py-4 text-center text-xs text-gray-400 italic'>Awaiting response</td>
                    </tr>
                `;

                tbody.insertAdjacentHTML("afterbegin", newRow);
                countEl.textContent = parseInt(countEl.textContent) + 1;
            } else {
                toastr.error(result.message || "Failed to create appointment.", "Error");
            }
        } catch (err) {
            console.error("Error:", err);
            toastr.error("An unexpected error occurred.", "Error");
        } finally {
            submitBtn.disabled = false;
            submitBtn.innerHTML = "Submit";
        }
    });

    toastr.options = {
        closeButton: true,
        progressBar: true,
        positionClass: "toast-top-right",
        timeOut: "3000"
    };
    

});
</script>

<style>
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(-5px); }
  to { opacity: 1; transform: translateY(0); }
}
.animate-fadeIn { animation: fadeIn 0.5s ease-in-out; }
</style>


@endsection
