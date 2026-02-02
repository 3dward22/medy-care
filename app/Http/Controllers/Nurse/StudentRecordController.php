<?php

namespace App\Http\Controllers\Nurse;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Appointment;
use Illuminate\Http\Request;
use App\Models\EmergencyRecord;

class StudentRecordController extends Controller
{
    // List all students (for nurse)
    public function index()
    {
        $students = User::where('role', 'student')->get();

        return view('nurse.students.index', compact('students'));
    }

    // Show one student's medical records
   public function show($student)
{
    $student = User::where('id', $student)
        ->where('role', 'student')
        ->firstOrFail();

    // ✅ Completed appointments
    $appointments = Appointment::where('student_id', $student->id)
        ->where('status', 'completed')
        ->get()
        ->map(function ($a) {
            return [
                'type' => 'appointment',
                'date' => $a->created_at,
                'title' => 'Clinic Visit',
                'complaint' => $a->complaint,
                'findings' => $a->findings,
                'diagnosis' => $a->diagnosis,
                'treatment' => $a->notes,
            ];
        });

    // 🚑 Emergency records
    $emergencies = EmergencyRecord::where('student_id', $student->id)->get();




    // 🔁 Merge and sort
    $records = $appointments
    ->merge($emergencies)
    ->sortByDesc('date')
    ->values(); // important for JS


    return view('nurse.students.records', compact('student', 'records'));
}

}
