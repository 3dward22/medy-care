<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class RegisteredUserController extends Controller
{
    public function create()
    {
        return view('auth.register');
    }

    public function store(Request $request)
    {
        // ✅ Base validation
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed|min:8',
            'role' => 'required|in:admin,nurse,student',
            'access_code' => 'nullable|string',
        ]);

        // 🔐 ADMIN
        if ($request->role === 'admin') {
            if ($request->access_code !== config('app.admin_secret')) {
                return back()
                    ->withErrors(['access_code' => 'Invalid admin access code'])
                    ->withInput();
            }
        }

        // 🩺 NURSE
        if ($request->role === 'nurse') {
            if ($request->access_code !== config('app.nurse_secret')) {
                return back()
                    ->withErrors(['access_code' => 'Invalid nurse access code'])
                    ->withInput();
            }
        }

        // 🎓 STUDENT
        if ($request->role === 'student') {
            $request->validate([
                'student_phone' => 'required',
                'guardian_name' => 'required',
                'guardian_phone' => 'required',
            ]);
        }

        // ✅ Create user
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => $request->role,
            'student_phone' => $request->student_phone,
            'guardian_name' => $request->guardian_name,
            'guardian_phone' => $request->guardian_phone,
        ]);

        Auth::login($user);

        // ✅ Redirect
        return match ($user->role) {
            'admin' => redirect()->route('dashboard'),
            'nurse' => redirect()->route('nurse.dashboard'),
            'student' => redirect()->route('student.dashboard'),
        };
    }
}
