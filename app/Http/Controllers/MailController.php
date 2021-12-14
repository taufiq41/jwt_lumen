<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Mail;

class MailController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function mail() {
        
        $data = array('name'=>"AGROPEDIA OFFICIAL");

        Mail::send('mail', $data, function($message) {
            $message->to('gwanteng_x1994@yahoo.co.id', 'MAS')->subject('Registrasi AGROPEDIA BATANG');
            $message->from('triastonotaufiq35@gmail.com','INI');
        });

        echo "Email Sent. Check your inbox.";
    }
}
