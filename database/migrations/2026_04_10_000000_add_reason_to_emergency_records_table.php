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
        Schema::table('emergency_records', function (Blueprint $table) {
            $table->string('reason')->nullable()->after('reported_at');
            $table->text('findings')->nullable()->after('diagnosis');
            $table->text('complaint')->nullable()->after('symptoms');
            $table->text('notes')->nullable()->after('treatment');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('emergency_records', function (Blueprint $table) {
            $table->dropColumn(['reason', 'findings', 'complaint', 'notes']);
        });
    }
};
