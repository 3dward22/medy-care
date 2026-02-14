<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Appointment extends Model
{
    

      const STATUS_PENDING   = 'pending';
    const STATUS_APPROVED  = 'approved';
    const STATUS_SESSION   = 'in_session';
    const STATUS_COMPLETED = 'completed';


    use HasFactory;

  

        
    protected $fillable = [
        'student_id',
        'requested_datetime',
        'approved_datetime',
        'status',
        'approved_by',
        'admin_note',
        'reason',        
        'preferred_time',
    ];

    protected $casts = [
        'requested_datetime' => 'datetime',
        'approved_datetime' => 'datetime',
    ];

    public function student()
    {
        return $this->belongsTo(User::class, 'student_id');
    }

    public function approvedBy()
    {
        return $this->belongsTo(User::class, 'approved_by');
    }


}
