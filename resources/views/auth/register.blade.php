<x-guest-layout>
<div
    x-data="{
        role: '{{ old('role') }}',
        showModal: {{ $errors->has('access_code') ? 'true' : 'false' }}
    }"
    class="min-h-screen flex items-center justify-center bg-gray-100">

<div class="bg-white p-10 rounded-xl w-full max-w-md shadow">

<h2 class="text-2xl font-bold text-center mb-6">Create Account</h2>

<form method="POST" action="{{ route('register') }}">
@csrf

<!-- NAME -->
<input name="name" value="{{ old('name') }}" class="w-full border p-2 rounded mb-1" placeholder="Full Name">
@error('name') <p class="text-red-500 text-sm">{{ $message }}</p> @enderror

<!-- EMAIL -->
<input name="email" value="{{ old('email') }}" class="w-full border p-2 rounded mt-3 mb-1" placeholder="Email">
@error('email') <p class="text-red-500 text-sm">{{ $message }}</p> @enderror

<!-- PASSWORD -->
<input type="password" name="password" class="w-full border p-2 rounded mt-3 mb-1" placeholder="Password">
@error('password') <p class="text-red-500 text-sm">{{ $message }}</p> @enderror

<!-- CONFIRM -->
<input type="password" name="password_confirmation" class="w-full border p-2 rounded mt-3 mb-1" placeholder="Confirm Password">
@error('password_confirmation') <p class="text-red-500 text-sm">{{ $message }}</p> @enderror

<!-- ROLE -->
<select name="role" x-model="role" class="w-full border p-2 rounded mt-4">
    <option value="">Select role</option>
    <option value="admin">Admin</option>
    <option value="nurse">Nurse</option>
    <option value="student">Student</option>
</select>
@error('role') <p class="text-red-500 text-sm">{{ $message }}</p> @enderror

<!-- STUDENT -->
<div x-show="role === 'student'" class="mt-4 space-y-2">
    <input name="student_phone" class="w-full border p-2 rounded" placeholder="Student phone">
    @error('student_phone') <p class="text-red-500 text-sm">{{ $message }}</p> @enderror

    <input name="guardian_name" class="w-full border p-2 rounded" placeholder="Guardian name">
    @error('guardian_name') <p class="text-red-500 text-sm">{{ $message }}</p> @enderror

    <input name="guardian_phone" class="w-full border p-2 rounded" placeholder="Guardian phone">
    @error('guardian_phone') <p class="text-red-500 text-sm">{{ $message }}</p> @enderror
</div>

<!-- ACCESS BUTTON -->
<div x-show="role === 'admin' || role === 'nurse'" class="mt-4">
    <button type="button"
        @click="showModal = true"
        class="w-full bg-red-600 text-white py-2 rounded">
        Enter Access Code
    </button>
</div>

<button class="w-full bg-blue-600 text-white py-3 rounded mt-6">
Create Account
</button>

<!-- MODAL -->
<div x-show="showModal" x-cloak
     class="fixed inset-0 bg-black/50 flex items-center justify-center">

<div class="bg-white p-6 rounded w-80">

<h3 class="font-bold mb-3 text-center">Access Code</h3>

<input type="password" name="access_code"
       class="w-full border p-2 rounded"
       placeholder="Enter access code">

@error('access_code')
<p class="text-red-500 text-sm mt-2">{{ $message }}</p>
@enderror

<button type="button"
    @click="showModal = false"
    class="w-full mt-4 bg-blue-600 text-white py-2 rounded">
Confirm
</button>

</div>
</div>

</form>
</div>
</div>
</x-guest-layout>
