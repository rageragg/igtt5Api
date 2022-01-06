<?php

namespace Tests\Feature\Config;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;
use Laravel\Sanctum\Sanctum;

class UserCountTest extends TestCase
{
    /**
     * @test
     */
    public function can_count_user()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $url = route( 'api.v4.user.count' );

        $this->jsonApi()->get($url)
            ->assertSee('4');
    }
}
