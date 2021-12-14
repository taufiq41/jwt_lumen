<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\User;

class AuthController extends Controller{
    
    public function __construct(){
        $this->middleware('auth:api',['except' => ['login','register']]);
    }

    public function register(Request $request){
        
        $this->validate($request,[
            'nama' => 'required',
            'email' => 'required|email|unique:users',
            'no_hp' => 'required|string',
            'alamat' => 'required',
            'password' => 'required'
        ]);

        try{
            
            $register = $request->input();
            $register['token_registrasi'] = app('hash')->make($register['password'].'123'.$register['email']);
            $register['password'] = app('hash')->make($register['password']);
            $register['status'] = 'register';
            
            User::create($register);
            
            return response()->json( [
                'entity' => 'users', 
                'action' => 'create', 
                'result' => 'success',
                'data' => $register
                ], 201);
            
        }catch(\Exception $error){
            return response()->json( [
                'entity' => 'users', 
                'action' => 'create', 
                'result' => 'failed',
                'error' => $error
                ], 409);
        }
    }

    public function login(Request $request){

        $this->validate($request,[
            'email' => 'required|email|string',
            'password' => 'required|string'
        ]);

        $credentials = $request->only(['email', 'password']);

        if (! $token = Auth::claims(['foo' => 'tot'])->setTTL(60)->attempt($credentials)) {			
            return response()->json(['message' => 'Unauthorized'], 401);
        }
        return $this->respondWithToken($token);
    }
}
