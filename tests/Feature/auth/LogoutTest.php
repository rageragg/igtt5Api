<?php

namespace Tests\Feature\auth;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Laravel\Sanctum\PersonalAccessToken;
use Tests\TestCase;

class LogoutTest extends TestCase
{
    /**
     * @test
     */
    public function can_logout_user()
    {
        //
        $user = User::find(1);
        $url = route('api.v4.logout');

        $this->withHeader('Authorization', 'Bearer ' . $user->api_token )
            ->postJson($url)
            ->assertStatus(204);

        $this->assertNull( PersonalAccessToken::findToken($user->api_token));
    }
}
