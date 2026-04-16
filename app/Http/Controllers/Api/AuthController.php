<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class AuthController extends Controller
{
    public function register(Request $request)
{
    $validated = $request->validate([
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:8|confirmed',
        'role' => 'required|in:admin,nurse,student',
        'student_phone' => 'nullable|string|max:30',
        'guardian_name' => 'nullable|string|max:255',
        'guardian_phone' => 'nullable|string|max:30',
    ]);

    if (($validated['role'] ?? null) === 'student') {
        $request->validate([
            'student_phone' => 'required|string|max:30',
            'guardian_name' => 'required|string|max:255',
            'guardian_phone' => 'required|string|max:30',
        ]);
    }

    $user = \App\Models\User::create([
        'name' => $validated['name'],
        'email' => $validated['email'],
        'password' => bcrypt($validated['password']),
        'role' => $validated['role'],
        'student_phone' => $validated['student_phone'] ?? null,
        'guardian_name' => $validated['guardian_name'] ?? null,
        'guardian_phone' => $validated['guardian_phone'] ?? null,
    ]);

    // ✅ Generate token just like login
    $token = $user->createToken('auth_token')->plainTextToken;

    return response()->json([
        'user' => $user,
        'token' => $token,
    ], 201);
}


    public function login(Request $request)
    {
        $data = $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if (!Auth::attempt($data)) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        $user = User::where('email', $data['email'])->first();
        $token = $user->createToken('mobile-token')->plainTextToken;

        return response()->json([
            'user' => $user,
            'token' => $token,
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Logged out successfully']);
    }
}
