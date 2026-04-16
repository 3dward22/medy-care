<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('student_phone')->nullable()->after('role');
            $table->string('guardian_name')->nullable()->after('student_phone');
            $table->string('guardian_phone')->nullable()->after('guardian_name');
        });

        if (!Schema::hasTable('guardian_sms_logs')) {
            return;
        }

        $latestLogs = DB::table('guardian_sms_logs')
            ->select('student_id', 'guardian_name', 'guardian_phone', 'created_at')
            ->whereNotNull('student_id')
            ->orderByDesc('created_at')
            ->get();

        $processedStudentIds = [];
        foreach ($latestLogs as $log) {
            if (in_array($log->student_id, $processedStudentIds, true)) {
                continue;
            }

            DB::table('users')
                ->where('id', $log->student_id)
                ->where(function ($query) {
                    $query->whereNull('guardian_name')
                        ->orWhereNull('guardian_phone');
                })
                ->update([
                    'guardian_name' => $log->guardian_name,
                    'guardian_phone' => $log->guardian_phone,
                ]);

            $processedStudentIds[] = $log->student_id;
        }
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn(['student_phone', 'guardian_name', 'guardian_phone']);
        });
    }
};
