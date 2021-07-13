<?php

namespace Tests\Feature\login;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Laravel\Sanctum\PersonalAccessToken;
use Tests\TestCase;

class LoginTest extends TestCase
{
    /**
     * @test
     */
    public function can_login_test()
    {
        //
        $url = route('api.v4.login');

        $response = $this->postJson( $url, [
            'email' => 'rageragg2004@gmail.com',
            'password' => 'rageragg',
            'device_id' => 'A001001'
        ]);

        $token = $response->json('plain-text-token');

        $this->assertNotNull( PersonalAccessToken::findToken($token) );

    }

     /**
     * @test
     */
    public function cannot_login_invalid_credentials_test()
    {
        //
        $url = route('api.v4.login');

        $response = $this->postJson( $url, [
            'email' => 'rageragg2004@gmail.com.ve',
            'password' => 'invalido',
            'device_id' => 'A001001'
        ])
        ->assertStatus(401);

    }

     /**
     * @test
     */
    public function cannot_login_twice_test()
    {
        //
        $user = User::find(1);
        $url = route('api.v4.login');

        $this->withHeader('Authorization', 'Bearer ' . $user->api_token )
            ->postJson( $url, [
            'email' => 'rageragg2004@gmail.com',
            'password' => 'invalido',
            'device_id' => 'A001001'
        ])
        ->assertStatus(204);

    }

}
