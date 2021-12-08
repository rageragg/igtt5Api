<?php

namespace Tests\Feature\Routes;

use App\Models\Route;
use App\Models\User;
use Laravel\Sanctum\Sanctum;
use Tests\TestCase;

class ListRoutesTest extends TestCase
{
    /**
     * @test
     */
    public function can_list_routes()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $url = route( 'api.v4.routes.index' );

        $this->jsonApi()->get($url)
            ->assertSee('BARQUISIMETO - CARORA');
    }
}
