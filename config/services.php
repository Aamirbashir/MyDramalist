<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Stripe, Mailgun, SparkPost and others. This file provides a sane
    | default location for this type of information, allowing packages
    | to have a conventional place to find your various credentials.
    |
    */

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
    ],

    'ses' => [
        'key' => env('SES_KEY'),
        'secret' => env('SES_SECRET'),
        'region' => env('SES_REGION', 'us-east-1'),
    ],

    'sparkpost' => [
        'secret' => env('SPARKPOST_SECRET'),
    ],

    'stripe' => [
        'model' => App\User::class,
        'key' => env('STRIPE_KEY'),
        'secret' => env('STRIPE_SECRET'),
    ],

    'facebook' => [
    'client_id' => '240218213140848',
    'client_secret' => '8b4394689d80f659c3828eff87f4804b',
    'redirect' => 'http://localhost:8080/MydramaList/public/auth/facebook/callback',
],
 'google' => [
    'client_id' => '625680217165-jrh9ncnf9fh486erlmcfkh86to61nrjl.apps.googleusercontent.com',
    'client_secret' => 'r2zHr-4KPd1mTNaV9IOhmoSE',
    'redirect' => 'http://localhost:8080/MydramaList/public/auth/google/callback',
],

];
