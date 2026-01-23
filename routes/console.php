<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Schedule;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');


// 🕖 7:00 AM appointment reminder
Schedule::command('appointments:morning-reminder')
    ->dailyAt('07:00');

// 🕖 9:00 PM appointment reminder
Schedule::command('appointments:afternoon-reminder')
    ->dailyAt('12:00');