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
    Schema::table('emergency_records', function (Blueprint $table) {
        $table->foreignId('student_id')->constrained('users')->cascadeOnDelete();
        $table->foreignId('reported_by')->nullable()->constrained('users')->nullOnDelete();

        $table->dateTime('reported_at')->nullable();

        $table->string('temperature')->nullable();
        $table->string('blood_pressure')->nullable();
        $table->string('heart_rate')->nullable();

        $table->text('symptoms')->nullable();
        $table->text('diagnosis')->nullable();
        $table->text('treatment')->nullable();
        $table->text('additional_notes')->nullable();

        $table->boolean('guardian_notified')->default(false);
        $table->dateTime('guardian_notified_at')->nullable();
    });
}


    /**
     * Reverse the migrations.
     */
    public function down()
{
    Schema::table('emergency_records', function (Blueprint $table) {
        $table->dropColumn([
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
        ]);
    });
}

};
