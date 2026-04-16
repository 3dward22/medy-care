<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use RuntimeException;

class GuardianSmsService
{
    public function send($phone, $message): array
    {
        $secretKey = (string) config('services.unisms.secret_key');
        $url = (string) config('services.unisms.url', 'https://unismsapi.com/api/sms');

        if ($secretKey === '') {
            throw new RuntimeException('UniSMS is not configured. Please set the UniSMS credentials in the environment.');
        }

        $normalizedPhone = $this->normalizePhone((string) $phone);
        $content = trim((string) $message);

        if ($normalizedPhone === '') {
            throw new RuntimeException('Guardian phone number is invalid for UniSMS.');
        }

        if ($content === '') {
            throw new RuntimeException('SMS content cannot be empty.');
        }

        $response = Http::acceptJson()
            ->asJson()
            ->withBasicAuth($secretKey, '')
            ->post($url, [
                'recipient' => $normalizedPhone,
                'content' => $content,
            ]);

        if ($response->failed()) {
            throw new RuntimeException('UniSMS request failed [' . $response->status() . ']: ' . $response->body());
        }

        return $response->json() ?? ['raw' => $response->body()];
    }

    private function normalizePhone(string $phone): string
    {
        $digits = preg_replace('/\D+/', '', $phone) ?? '';

        if (str_starts_with($digits, '09')) {
            return '+63' . substr($digits, 1);
        }

        if (str_starts_with($digits, '639')) {
            return '+' . $digits;
        }

        if (str_starts_with($digits, '9')) {
            return '+63' . $digits;
        }

        if (str_starts_with($digits, '63')) {
            return '+' . $digits;
        }

        return '';
    }
}
