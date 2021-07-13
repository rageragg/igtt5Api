<?php

namespace Tests\Feature\auth;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

use Tests\TestCase;

class RegisterTest extends TestCase
{
    /**
     * @test
     */
    public function can_register_user()
    {
        //
        $user = User::find(1);
        $token = $user->createToken('ADMINISTRATOR')->plainTextToken;
        $user->api_token = $token;
        $user->save();

        $url = route( 'api.v4.users.create');

        $this->jsonApi()
            ->withHeader('Authorization', 'Bearer ' . $user->api_token )
            ->withData([
                'type' => 'users',
                'attributes' => [
                    'name'  => 'Elise Escobar',
                    'email' => 'eliseescobar@gmail.com',
                    'password' => 'elise3014',
                    'password_confirmation' =>'elise3014',
                    'rol' => 'LOGISTICS'
                ]
            ])->post($url)
            ->assertCreated();

    }

    /**
     * @test
     */
    public function can_update_user()
    {
        //
        $user = User::find(1);
        $token = $user->createToken('ADMINISTRATOR')->plainTextToken;
        $user->api_token = $token;
        $user->save();

        $userObject = User::where('email', 'eliseescobar@gmail.com')->first();

        // dd(Carbon::now());

        $data = [
            'type' => 'users',
            'id'   => (string) $userObject->id,
            'attributes' => [
                'name'  => $userObject->name,
                'email' => $userObject->email,
                'password' => $userObject->password,
                'rol' => $userObject->rol,
                'email_verified_at' => date("Y/m/d")
            ]
        ];

        $url = route( 'api.v4.users.update', $userObject );
        $this->jsonApi()
            ->withHeader('Authorization', 'Bearer ' . $user->api_token )
            ->withData( $data )
            ->patch($url)
            ->assertStatus(200);
    }

    /**
     * @test
     */
    public function can_delete_user()
    {
        //
        $user = User::find(1);
        $token = $user->createToken('ADMINISTRATOR')->plainTextToken;
        $user->api_token = $token;
        $user->save();

        $userObject = User::where('email', 'eliseescobar@gmail.com')->first();
        $userObject->tokens()->delete();

        $url = route( 'api.v4.users.delete', $userObject );
        $this->jsonApi()
            ->withHeader('Authorization', 'Bearer ' . $user->api_token )
            ->delete($url)
            ->assertStatus(204);

    }

}
