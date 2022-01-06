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
    public function login( Request $request )
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
                'detail' => 'User: email or password no match!',
                'status' => '401',
            ]);

            throw JsonApiException::make($error);
        }

        $user->tokens()->delete();
        $plainTextToken = $user->createToken($request->device_id)->plainTextToken;
        $user->api_token = $plainTextToken;
        $user->address_ip = $request->ip();
        $user->device_id = $request->device_id;

        $myDate = new \DateTime();
        $myDate->modify('+8 hours');
        $user->token_at = $myDate;
        $user->save();

        return response()->json([
            'data' => [
                'id' => $user->id,
                'email' => $user->email,
                'name' => $user->name,
                'rol' => $user->rol,
                'apiToken' => $user->api_token,
                'token_at' => $user->token_at
            ]
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

    public function token(Request $request)
    {
        $validToken = false;
        $seguimiento = '';

        $request->validate([
            'apiToken' => ['required']
        ]);

        try {
            //
            $user = User::where('api_token', $request->apiToken )->first();
            // se verifica la vigencia del token
            $myDate = now();
            if( isset($user->token_at) ) {
                if( $user->token_at > $myDate ) {
                    $validToken = true;
                }
            }

        } catch (\Throwable $th) {
            $error = Error::fromArray([
                'title' => 'User no login!',
                'detail' => 'User token no match!',
                'status' => '401'
            ]);

            throw JsonApiException::make($error);;
        }

        if( is_null( $user ) || $validToken == false ) {

            $error = Error::fromArray([
                'title' => 'User no login!',
                'detail' => 'User token no valid!',
                'status' => '401'
            ]);

            throw JsonApiException::make($error);
        }

        return response()->json([
            'data' => [
                'id' => $user->id,
                'email' => $user->email,
                'name' => $user->name,
                'rol' => $user->rol,
                'apiToken' => $user->api_token,
                'token_at' => $user->token_at
            ]
        ]);

    }

}
