<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('appointment_completions', function (Blueprint $table) {
            if (!Schema::hasColumn('appointment_completions', 'sickness')) {
                $table->string('sickness')->nullable()->after('completed_datetime');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('appointment_completions', function (Blueprint $table) {
            if (Schema::hasColumn('appointment_completions', 'sickness')) {
                $table->dropColumn('sickness');
            }
        });
    }
};
