<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        if (Schema::hasTable('appointments') && Schema::hasColumn('appointments', 'status')) {
            DB::statement("
                ALTER TABLE appointments 
                MODIFY COLUMN status 
                ENUM('pending','approved','rescheduled','declined','completed','cancelled','in_session')
                NOT NULL DEFAULT 'pending'
            ");
        }
    }

    public function down(): void
    {
        if (Schema::hasTable('appointments') && Schema::hasColumn('appointments', 'status')) {
            DB::statement("
                ALTER TABLE appointments 
                MODIFY COLUMN status 
                ENUM('pending','approved','rescheduled','declined','completed','cancelled')
                NOT NULL DEFAULT 'pending'
            ");
        }
    }
};
