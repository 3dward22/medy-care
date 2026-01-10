<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use App\Http\Middleware\EnsureUserIsVerified;
use App\Http\Middleware\RoleMiddleware;
use Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful;
use Illuminate\Http\Middleware\HandleCors;

$app = Application::configure(basePath: dirname(__DIR__))

    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        api: __DIR__ . '/../routes/api.php', // make sure API routes are loaded
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
    )
->withMiddleware(function (Middleware $middleware): void {

    // Prepend CORS middleware
    $middleware->prepend(\Illuminate\Http\Middleware\HandleCors::class);

    // Register middleware aliases
    $middleware->alias([
        'verified.user' => \App\Http\Middleware\EnsureUserIsVerified::class,
        'role'          => \App\Http\Middleware\RoleMiddleware::class,
    ]);

    // API middleware group
    $middleware->group('api', [
        \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
        \Illuminate\Routing\Middleware\SubstituteBindings::class,
    ]);
})


    ->withExceptions(function (Exceptions $exceptions): void {
        // Configure exception handling if needed
    });

return $app->create();
