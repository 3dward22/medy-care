<?php

namespace Database\Seeders;

use App\Models\Appointment;
use App\Models\AppointmentCompletion;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Admin account
        $admin = User::firstOrCreate(
            ['email' => 'dwightgacad@gmail.com'],
            [
                'name' => 'Admin User',
                'password' => Hash::make('password'), // login: password
                'role' => 'admin',
            ]
        );

        // Nurse account
        $nurse = User::firstOrCreate(
            ['email' => 'nurse@example.com'],
            [
                'name' => 'Nurse User',
                'password' => Hash::make('password'), // login: password
                'role' => 'nurse',
            ]
        );

        // Student account
        $student = User::firstOrCreate(
            ['email' => 'student@example.com'],
            [
                'name' => 'Student User',
                'password' => Hash::make('password'), // login: password
                'role' => 'student',
            ]
        );

        $this->seedDemoIllnessChartData($student, $nurse);
    }

    private function seedDemoIllnessChartData(User $student, User $nurse): void
    {
        $now = Carbon::now();
        $startOfWeek = $now->copy()->startOfWeek();
        $startOfMonth = $now->copy()->startOfMonth();

        $demoAppointments = [
            ['sickness' => 'Fever', 'reason' => 'High temperature', 'completed_at' => $startOfWeek->copy()->addHours(9)],
            ['sickness' => 'Fever', 'reason' => 'Body pain and fever', 'completed_at' => $startOfWeek->copy()->addDay()->addHours(10)],
            ['sickness' => 'Fever', 'reason' => 'Recurring fever', 'completed_at' => $startOfWeek->copy()->addDay()->addHours(14)],
            ['sickness' => 'Fever', 'reason' => 'Mild fever', 'completed_at' => $startOfWeek->copy()->addDays(2)->addHours(8)],
            ['sickness' => 'Fever', 'reason' => 'Chills and fever', 'completed_at' => $startOfWeek->copy()->addDays(3)->addHours(11)],
            ['sickness' => 'Fever', 'reason' => 'Fever follow-up', 'completed_at' => $startOfWeek->copy()->addDays(4)->addHours(13)],
            ['sickness' => 'Cough', 'reason' => 'Dry cough', 'completed_at' => $startOfWeek->copy()->addHours(15)],
            ['sickness' => 'Cough', 'reason' => 'Persistent cough', 'completed_at' => $startOfWeek->copy()->addDays(2)->addHours(9)],
            ['sickness' => 'Cough', 'reason' => 'Cough and colds', 'completed_at' => $startOfWeek->copy()->addDays(3)->addHours(15)],
            ['sickness' => 'Cough', 'reason' => 'Night cough', 'completed_at' => $startOfWeek->copy()->addDays(5)->addHours(10)],
            ['sickness' => 'Headache', 'reason' => 'Severe headache', 'completed_at' => $startOfWeek->copy()->addDay()->addHours(16)],
            ['sickness' => 'Headache', 'reason' => 'Migraine symptoms', 'completed_at' => $startOfWeek->copy()->addDays(4)->addHours(9)],
            ['sickness' => 'Stomachache', 'reason' => 'Stomach pain', 'completed_at' => $startOfMonth->copy()->addDays(1)->addHours(10)],
            ['sickness' => 'Stomachache', 'reason' => 'Upset stomach', 'completed_at' => $startOfMonth->copy()->addDays(3)->addHours(13)],
            ['sickness' => 'Stomachache', 'reason' => 'Abdominal pain', 'completed_at' => $startOfMonth->copy()->addDays(5)->addHours(11)],
            ['sickness' => 'Dizziness', 'reason' => 'Feeling dizzy', 'completed_at' => $startOfMonth->copy()->addDays(6)->addHours(14)],
        ];

        foreach ($demoAppointments as $index => $demoAppointment) {
            $completedAt = $demoAppointment['completed_at']->copy()->setSecond(0);
            $requestedAt = $completedAt->copy()->subHour();

            $appointment = Appointment::updateOrCreate(
                [
                    'user_id' => $student->id,
                    'student_id' => $student->id,
                    'requested_datetime' => $requestedAt,
                ],
                [
                    'approved_datetime' => $requestedAt->copy()->addMinutes(15),
                    'completed_datetime' => $completedAt,
                    'status' => Appointment::STATUS_COMPLETED,
                    'approved_by' => $nurse->id,
                    'reason' => $demoAppointment['reason'],
                    'preferred_time' => 'Demo seed',
                    'admin_note' => 'Generated chart demo data',
                    'findings' => 'Demo findings for illness chart testing',
                    'additional_notes' => 'Seeded automatically for dashboard graph preview',
                    'temperature' => '37.' . ($index % 5),
                    'blood_pressure' => '120/80',
                    'heart_rate' => (string) (72 + $index),
                ]
            );

            AppointmentCompletion::updateOrCreate(
                ['appointment_id' => $appointment->id],
                [
                    'completed_datetime' => $completedAt,
                    'sickness' => $demoAppointment['sickness'],
                    'temperature' => '37.' . ($index % 5),
                    'blood_pressure' => '120/80',
                    'heart_rate' => (string) (72 + $index),
                    'findings' => 'Demo completion record for ' . $demoAppointment['sickness'],
                    'additional_notes' => 'Used to visualize illness frequency in admin charts',
                ]
            );
        }
    }
}
