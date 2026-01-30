<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Appointment;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\StudentRecordController;
class AdminController extends Controller
{
    // Show all users (only admin can access via routes)
    public function index()
    {
        $users = User::all();
        return view('admin.index', compact('users'));
    }




    // Show student records (only nurse can access via routes)
    public function studentRecords()
{
    // Only fetch users with the role 'student'
    $students = User::where('role', 'student')->get();

    return view('nurse.students.index', compact('students'));
}
// Show selected student's medical records
public function showStudentRecords($student)
{
    $student = User::where('id', $student)
        ->where('role', 'student')
        ->firstOrFail();

    $records = Appointment::where('student_id', $student->id)
        ->where('status', 'completed')
        ->latest()
        ->get();

    return view('nurse.students.records', compact('student', 'records'));
}

    // Delete a user
    public function destroy(User $user)
    {

        
        // Ensure user is logged in
        $currentUser = Auth::user();
        if (!$currentUser) {
            return redirect()->route('login')->with('error', 'You must be logged in.');
        }

        // Prevent deleting yourself
        if ($currentUser->id === $user->id) {
            return back()->with('error', 'You cannot delete yourself.');
        }

        $user->delete();
        return back()->with('success', 'User deleted successfully.');
    }
    
}
