<x-guest-layout>
    <div 
        x-data="{
            show: false,
            role: '{{ old('role') }}',
            showModal: {{ $errors->has('access_code') ? 'true' : 'false' }}
        }" 
        x-init="setTimeout(() => show = true, 200)" 
        class="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-50 to-cyan-100 py-12 px-4 sm:px-6 lg:px-8 overflow-hidden"
    >
        <div 
            x-show="show" 
            x-transition:enter="transition ease-out duration-700" 
            x-transition:enter-start="opacity-0 translate-y-10 scale-95" 
            x-transition:enter-end="opacity-100 translate-y-0 scale-100"
            class="max-w-md w-full space-y-8 bg-white/90 backdrop-blur-sm p-10 rounded-2xl shadow-2xl border border-blue-100"
        >
            <!-- Logo -->
            <div class="text-center">
                <div class="mx-auto h-16 w-16 bg-gradient-to-r from-blue-600 to-cyan-500 rounded-full flex items-center justify-center mb-4 shadow-lg animate-bounce-slow">
                    <svg class="h-10 w-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                    </svg>
                </div>
                <h2 class="text-3xl font-bold text-gray-900 mb-1">Create Account</h2>
                <p class="text-sm text-gray-500">Join your trusted healthcare portal</p>
            </div>

            <!-- FORM -->
            <form method="POST" action="{{ route('register') }}" class="mt-6 space-y-5">
                @csrf

                <div>
                    <x-input-label for="name" value="Full Name" class="text-gray-700 font-semibold" />
                    <x-text-input id="name" class="mt-1 block w-full focus:ring-2 focus:ring-blue-400 focus:border-blue-400"
                        type="text" name="name" :value="old('name')" required />
                    <x-input-error :messages="$errors->get('name')" class="mt-2" />
                </div>

                <div>
                    <x-input-label for="email" value="Email Address" class="text-gray-700 font-semibold" />
                    <x-text-input id="email" class="mt-1 block w-full focus:ring-2 focus:ring-blue-400 focus:border-blue-400"
                        type="email" name="email" :value="old('email')" required />
                    <x-input-error :messages="$errors->get('email')" class="mt-2" />
                </div>

                <div>
                    <x-input-label for="password" value="Password" class="text-gray-700 font-semibold" />
                    <x-text-input id="password" class="mt-1 block w-full focus:ring-2 focus:ring-blue-400 focus:border-blue-400"
                        type="password" name="password" required />
                    <x-input-error :messages="$errors->get('password')" class="mt-2" />
                </div>

                <div>
                    <x-input-label for="password_confirmation" value="Confirm Password" class="text-gray-700 font-semibold" />
                    <x-text-input id="password_confirmation" class="mt-1 block w-full focus:ring-2 focus:ring-blue-400 focus:border-blue-400"
                        type="password" name="password_confirmation" required />
                    <x-input-error :messages="$errors->get('password_confirmation')" class="mt-2" />
                </div>

                <div>
                    <x-input-label value="Role" class="text-gray-700 font-semibold" />
                    <select name="role" x-model="role"
                        class="mt-1 block w-full rounded-md border-gray-300 focus:ring-2 focus:ring-blue-400 focus:border-blue-400">
                        <option value="">Select role</option>
                        <option value="admin">Admin</option>
                        <option value="nurse">Nurse</option>
                        <option value="student">Student</option>
                    </select>
                    <x-input-error :messages="$errors->get('role')" class="mt-2" />
                </div>

                <!-- Buttons -->
                <div class="space-y-3 pt-2">
                    <x-primary-button class="w-full transition transform hover:scale-[1.02] shadow-md hover:shadow-lg bg-gradient-to-r from-blue-600 to-cyan-500">
                        CREATE ACCOUNT
                    </x-primary-button>

                    <a href="{{ route('login') }}"
                       class="block w-full text-center py-2 border border-blue-400 text-blue-600 rounded-lg font-semibold hover:bg-blue-50 transition duration-200">
                        Back to Login
                    </a>
                </div>
            </form>

            <!-- Footer -->
            <div class="mt-8 text-center text-xs text-gray-500">
                <p>Protected by HIPAA compliance standards</p>
                <p class="mt-1">© 2025 MedCare Health Systems. All rights reserved.</p>
            </div>
        </div>
    </div>

    <style>
        @keyframes bounce-slow {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-6px); }
        }
        .animate-bounce-slow { animation: bounce-slow 3s infinite ease-in-out; }
    </style>
</x-guest-layout>
