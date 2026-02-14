<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
{
    Schema::table('appointments', function (Blueprint $table) {
        // Drop FK only if it exists (MySQL 8+)
        try {
            $table->dropForeign('appointments_user_id_foreign');
        } catch (\Throwable $e) {
            // Ignore if FK name is different or already dropped
        }

        // Drop column only if it exists
        if (Schema::hasColumn('appointments', 'user_id')) {
            $table->dropColumn('user_id');
        }
    });
}



    public function down(): void
    {
        Schema::table('appointments', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id')->after('id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }
};
