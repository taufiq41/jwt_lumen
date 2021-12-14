<?php

namespace App\Http\Controllers;

use Laravel\Lumen\Routing\Controller as BaseController;
use Illuminate\Http\Request;

class Controller extends BaseController
{

    public function me(Request $request)
    {
        //$token = $request->header('Authorization');
        $payload = auth()->payload();
        //$token = auth()->tokenById(100); //get token jwt dengan id user 100
        $expires_in = auth()->factory()->getTTL();
        $waktu = date('Y-m-d h:i:s',$payload['exp']); //convert to datetime 
        return response()->json(['expires_in' => $expires_in, 'waktu' => date('Y-m-d h:i:s'), 'payload' => $payload, 'data' => auth()->user()]);
    }

    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL()
        ]);
    }
}
