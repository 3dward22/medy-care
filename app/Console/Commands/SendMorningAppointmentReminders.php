<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Appointment;
use Carbon\Carbon;
use App\Notifications\UserNotification;
use App\Events\NewNotification;

class SendMorningAppointmentReminders extends Command
{
    protected $signature = 'appointments:morning-reminder';
    protected $description = 'Send 7:00 AM reminders for today’s approved appointments';

    public function handle()
    {
        $today = Carbon::today();

        $appointments = Appointment::with('student')
            ->whereDate('approved_datetime', $today)
            ->where('status', 'approved')
            ->where('morning_notified', false)
            ->get();

        foreach ($appointments as $appointment) {

            if (!$appointment->student) continue;

            $time = Carbon::parse($appointment->approved_datetime)->format('h:i A');

            $message = "⏰ Reminder: You have a clinic appointment today at {$time}.";

            // 🔔 Save notification
            $appointment->student->notify(
                new UserNotification($message)
            );

            // 📡 Realtime bell
            event(new NewNotification(
                $appointment->student->id,
                $message
            ));

            // ✅ prevent duplicate
            $appointment->update([
                'morning_notified' => true
            ]);
        }

        $this->info('✅ Morning appointment reminders sent.');
    }
}
