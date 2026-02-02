<?php

namespace App\Http\Controllers;

use App\Events\NewNotification;
use App\Models\EmergencyRecord;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Carbon;

class EmergencyRecordController extends Controller
{
    public function index(Request $request)
    {
        // Filters: all | today | week
        $filter = $request->get('filter', 'all');

        $query = EmergencyRecord::with(['student', 'nurse'])->latest();

        if ($filter === 'today') {
            $query->whereDate('reported_at', Carbon::today());
        } elseif ($filter === 'week') {
            $query->whereBetween('reported_at', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()]);
        }

        $records = $query->paginate(10)->withQueryString();

        return view('nurse.emergency.index', compact('records', 'filter'));
    }

    public function create()
    {
        // Students to select (searchable select UX will be on the view)
        $students = User::where('role', 'student')
            ->orderBy('name')
            ->select('id', 'name')
            ->get();

        return view('nurse.emergency.create', compact('students'));
    }

   public function store(Request $request)
{
     $request->validate([
        'student_id' => 'required|exists:users,id',
        'reason'     => 'nullable|string',
    ]);

    EmergencyRecord::create([
        'student_id'        => $request->student_id,
        'reported_by'       => Auth::id(),
        'reported_at'       => now(),
        'additional_notes'  => $request->reason,
        'guardian_notified' => false,
    ]);

    return back()->with('success', 'Emergency record saved successfully.');
}


    public function show(EmergencyRecord $emergency)
    {
        $emergency->load(['student', 'nurse']);
        return view('nurse.emergency.show', compact('emergency'));
    }
}
