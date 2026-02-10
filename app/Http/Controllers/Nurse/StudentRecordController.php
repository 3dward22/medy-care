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
    public function index(Request $request)
{
    $q = $request->input('q');

    $students = User::where('role', 'student')
        ->when($q, function ($query) use ($q) {
            $query->where(function ($sub) use ($q) {
                $sub->where('name', 'like', "%{$q}%")
                    ->orWhere('email', 'like', "%{$q}%")
                    ->orWhere('id', 'like', "%{$q}%"); // use id instead
            });
        })
        ->orderBy('name')
        ->paginate(10)
        ->withQueryString();

    return view('nurse.students.index', compact('students'));
}

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
                'type' => 'Appointment', 
                'date' => $a->created_at,
                'title' => 'Clinic Visit',
                'complaint' => $a->complaint,
                'findings' => $a->findings,
                'diagnosis' => $a->diagnosis,
                'treatment' => $a->notes,
            ];
        });

    // 🚑 Emergency records
    $emergencies = EmergencyRecord::where('student_id', $student->id)
        ->get()
        ->map(function ($e) {
            return [
                'type' => 'Emergency',
                'date' => $e->created_at, // or your incident date
                'title' => 'Emergency Case',
                'complaint' => $e->complaint ?? $e->symptoms ?? '—',
                'findings' => $e->findings ?? '—',
                'diagnosis' => $e->diagnosis ?? '—',
                'treatment' => $e->additional_notes ?? $e->notes ?? '—',
            ];
        });

    // 🔁 Merge & sort (IMPORTANT: use collect())
    $records = collect($appointments)
        ->merge($emergencies)
        ->sortByDesc('date')
        ->values();

    return view('nurse.students.records', compact('student', 'records'));
}



}
