<!-- 📩 Send SMS Modal -->
<div class="modal fade" id="sendSmsModal" tabindex="-1" aria-labelledby="sendSmsModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content border-0 shadow-lg rounded-4">
      <div class="modal-header bg-primary text-white rounded-top-4 py-3 px-4">
        <h5 class="modal-title fw-semibold" id="sendSmsModalLabel">📱 Send SMS to Guardian</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>

      <form action="{{ route('appointments.notifyGuardian.manual') }}" method="POST" class="needs-validation" novalidate>

        @csrf
        <div class="modal-body px-4 py-3">
          <p class="text-muted small mb-3">
            Fill out the details below to send an SMS notification to a guardian.
          </p>

          <div class="mb-3">
            <label for="sms_student_search" class="form-label fw-semibold text-secondary">Search Student</label>
            <input
              type="text"
              id="sms_student_search"
              class="form-control form-control-lg rounded-3 shadow-sm"
              list="sms_student_options"
              placeholder="Type student name..."
              autocomplete="off">
            <datalist id="sms_student_options">
              @foreach($students as $student)
                <option
                  value="{{ $student->name }}"
                  data-guardian-name="{{ $student->guardian_name ?? $student->name }}"
                  data-guardian-phone="{{ $student->guardian_phone ?? '' }}">
                </option>
              @endforeach
            </datalist>
            <small class="text-muted">Selecting a student auto-fills guardian details.</small>
          </div>

          <div class="mb-3">
            <label for="guardian_name" class="form-label fw-semibold text-secondary">Guardian Name</label>
            <input type="text" name="guardian_name" id="guardian_name" class="form-control form-control-lg rounded-3 shadow-sm" placeholder="e.g. Maria Santos" required>
            <div class="invalid-feedback">Please enter the guardian’s name.</div>
          </div>

          <div class="mb-3">
            <label for="guardian_phone" class="form-label fw-semibold text-secondary">Guardian Phone</label>
            <input type="text" name="guardian_phone" id="guardian_phone" class="form-control form-control-lg rounded-3 shadow-sm" placeholder="e.g. 09123456789" required>
            <div class="invalid-feedback">Please enter a valid phone number.</div>
          </div>

          <div class="mb-3">
            <label for="message" class="form-label fw-semibold text-secondary">Message</label>
            <textarea name="message" id="message" rows="3" class="form-control form-control-lg rounded-3 shadow-sm" placeholder="Enter SMS message..." required></textarea>
            <div class="invalid-feedback">Please write a message before sending.</div>
          </div>
        </div>

        <div class="modal-footer bg-light rounded-bottom-4 px-4 py-3">
          <button type="button" class="btn btn-outline-secondary rounded-pill px-4" data-bs-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-success rounded-pill px-4 shadow-sm">Send & View Log</button>
        </div>
      </form>
    </div>
  </div>
</div>

@php
  $smsStudents = $students->map(function ($student) {
      return [
          'name' => $student->name,
          'guardian_name' => $student->guardian_name ?? '',
          'guardian_phone' => $student->guardian_phone ?? '',
      ];
  })->values();
@endphp

<script>
(() => {
  'use strict'
  const studentGuardianData = @json($smsStudents)

  const forms = document.querySelectorAll('.needs-validation')
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
      form.classList.add('was-validated')
    }, false)
  })

  const studentSearchInput = document.getElementById('sms_student_search')
  const guardianNameInput = document.getElementById('guardian_name')
  const guardianPhoneInput = document.getElementById('guardian_phone')

  if (studentSearchInput && guardianNameInput && guardianPhoneInput) {
    const fillGuardianFields = (selectedStudent) => {
      guardianNameInput.value = selectedStudent.guardian_name || ''
      guardianPhoneInput.value = selectedStudent.guardian_phone || ''
    }

    studentSearchInput.addEventListener('input', () => {
      const query = studentSearchInput.value.trim().toLowerCase()
      if (query === '') return

      // Exact match first
      const exactMatch = studentGuardianData.find(
        student => student.name.toLowerCase() === query
      )
      if (exactMatch) {
        fillGuardianFields(exactMatch)
        return
      }

      // Then partial match (first student containing query)
      const partialMatch = studentGuardianData.find(
        student => student.name.toLowerCase().includes(query)
      )
      if (partialMatch) {
        fillGuardianFields(partialMatch)
      }
    })

    studentSearchInput.addEventListener('blur', () => {
      const query = studentSearchInput.value.trim().toLowerCase()
      if (query === '') return

      const bestMatch = studentGuardianData.find(
        student => student.name.toLowerCase().includes(query)
      )

      if (bestMatch) {
        studentSearchInput.value = bestMatch.name
        fillGuardianFields(bestMatch)
      }
    })
  }
})()
</script>
