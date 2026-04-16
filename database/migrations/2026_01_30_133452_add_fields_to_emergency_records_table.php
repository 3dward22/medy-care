<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
   public function up()
{
    if (!Schema::hasColumn('emergency_records', 'student_id')) {
        Schema::table('emergency_records', function (Blueprint $table) {
            $table->foreignId('student_id')->constrained('users')->cascadeOnDelete();
        });
    }

    if (!Schema::hasColumn('emergency_records', 'reported_by')) {
        Schema::table('emergency_records', function (Blueprint $table) {
            $table->foreignId('reported_by')->nullable()->constrained('users')->nullOnDelete();
        });
    }

    if (!Schema::hasColumn('emergency_records', 'reported_at')) {
        Schema::table('emergency_records', function (Blueprint $table) {
            $table->dateTime('reported_at')->nullable();
        });
    }

    if (!Schema::hasColumn('emergency_records', 'temperature')) {
        Schema::table('emergency_records', function (Blueprint $table) {
            $table->string('temperature')->nullable();
        });
    }

    if (!Schema::hasColumn('emergency_records', 'blood_pressure')) {
        Schema::table('emergency_records', function (Blueprint $table) {
            $table->string('blood_pressure')->nullable();
        });
    }

    if (!Schema::hasColumn('emergency_records', 'heart_rate')) {
        Schema::table('emergency_records', function (Blueprint $table) {
            $table->string('heart_rate')->nullable();
        });
    }

    if (!Schema::hasColumn('emergency_records', 'symptoms')) {
        Schema::table('emergency_records', function (Blueprint $table) {
            $table->text('symptoms')->nullable();
        });
    }

    if (!Schema::hasColumn('emergency_records', 'diagnosis')) {
        Schema::table('emergency_records', function (Blueprint $table) {
            $table->text('diagnosis')->nullable();
        });
    }

    if (!Schema::hasColumn('emergency_records', 'treatment')) {
        Schema::table('emergency_records', function (Blueprint $table) {
            $table->text('treatment')->nullable();
        });
    }

    if (!Schema::hasColumn('emergency_records', 'additional_notes')) {
        Schema::table('emergency_records', function (Blueprint $table) {
            $table->text('additional_notes')->nullable();
        });
    }

    if (!Schema::hasColumn('emergency_records', 'guardian_notified')) {
        Schema::table('emergency_records', function (Blueprint $table) {
            $table->boolean('guardian_notified')->default(false);
        });
    }

    if (!Schema::hasColumn('emergency_records', 'guardian_notified_at')) {
        Schema::table('emergency_records', function (Blueprint $table) {
            $table->dateTime('guardian_notified_at')->nullable();
        });
    }
}


    /**
     * Reverse the migrations.
     */
    public function down()
{
    $columns = [
        'student_id',
        'reported_by',
        'reported_at',
        'temperature',
        'blood_pressure',
        'heart_rate',
        'symptoms',
        'diagnosis',
        'treatment',
        'additional_notes',
        'guardian_notified',
        'guardian_notified_at',
    ];

    $existing = array_values(array_filter($columns, fn ($column) => Schema::hasColumn('emergency_records', $column)));

    if (!empty($existing)) {
        Schema::table('emergency_records', function (Blueprint $table) use ($existing) {
            $table->dropColumn($existing);
        });
    }
}

};
