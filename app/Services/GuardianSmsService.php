<?php

namespace App\Services;

use Twilio\Rest\Client;

class GuardianSmsService
{
    protected $client;

    public function __construct()
    {
        $this->client = new Client(
            config('services.twilio.sid'),
            config('services.twilio.token')
        );
    }

    public function send($phone, $message)
    {
        return $this->client->messages->create(
            'whatsapp:' . $phone,   // TO
            [
                'from' => 'whatsapp:+14155238886', // Twilio WhatsApp Sandbox
                'body' => $message,
            ]
        );
    }
}
