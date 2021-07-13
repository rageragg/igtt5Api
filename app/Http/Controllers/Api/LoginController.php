<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;

use CloudCreativity\LaravelJsonApi\Document\Error\Error;
use CloudCreativity\LaravelJsonApi\Exceptions\JsonApiException;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class LoginController extends Controller
{
    //
    public function login( Request $request)
    {
        $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
            'device_id' => ['required']
        ]);

        $user = User::where('email', $request->email )->first();

        if( ! Hash::check($request->password, optional($user)->password) ) {

            $error = Error::fromArray([
                'title' => 'User no login!',
                'detal' => 'User: email or password no match!',
                'status' => '401',
            ]);

            throw JsonApiException::make($error);
        }

        $user->tokens()->delete();
        $plainTextToken = $user->createToken($request->device_id)->plainTextToken;
        $user->api_token = $plainTextToken;
        $user->address_ip = $request->ip();
        $user->save();

        return response()->json([
            'id' => $user->id,
            'email' => $user->email,
            'name' => $user->name,
            'plain-text-token' => $plainTextToken
        ]);
    }
    //
    public function logout(Request $request)
    {
        $user = $request->user();
        $user->currentAccessToken()->delete();

        $user->api_token = '';
        $user->save();

        return response()->noContent();

    }

}
