<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Notifications\UserNotification;

class UserVerificationController extends Controller
{
    public function index()
    {
        $pendingUsers = User::where('is_verified', false)
            ->whereIn('role', ['nurse', 'student'])
            ->get();

        return view('admin.users.verify', compact('pendingUsers'));
    }

   public function approve(User $user)
{
    // force update (bypasses mass-assignment issues)
    $user->is_verified = 1;
    $user->save();

    // 🔔 notify user
    $user->notify(new UserNotification(
        "✅ Your account has been verified. You may now access MedCare."
    ));

    return redirect()
        ->route('admin.users.verify')
        ->with('success', 'User verified successfully.');
}


    public function reject(User $user)
    {
        $user->delete();

        return back()->with('success', 'User rejected and removed.');
    }
}
