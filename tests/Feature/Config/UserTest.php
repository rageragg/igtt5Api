<?php

namespace Tests\Feature\Config;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;
use Laravel\Sanctum\Sanctum;

class UserTest extends TestCase
{
    /**
     * @test
     */
    public function can_list_users()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $url = route( 'api.v4.users.index' );

        $this->jsonApi()->get($url)
            ->assertSee('Ronald Guerra');
    }

    /**
     * @test
     */
    public function can_read_single_user()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $url  = route( 'api.v4.users.read', $user );

        $this->jsonApi()
            ->get($url)
            ->assertSee($user->name);
    }
}

