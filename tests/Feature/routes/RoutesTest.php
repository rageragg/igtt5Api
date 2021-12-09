<?php

namespace Tests\Feature\Routes;

use App\Models\Route;
use App\Models\User;
use Laravel\Sanctum\Sanctum;
use Tests\TestCase;

class RoutesTest extends TestCase
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

        /** @test */
        public function can_update_route_by_user()
        {
            //
            $user = User::find(1);
            Sanctum::actingAs($user);

            $route = new Route();
            $route->country_co = '11-12';
            $route->description = 'BARQUISIMETO - CARORA';
            $route->slug = 'bqto-carora';
            $route->from_city_id = '11';
            $route->to_city_id = '12';
            $route->k_level_co = 'A';
            $route->distance_km = '102.37';
            $route->estimate_time_hrs = '2.16';
            $route->user_id = '1';

            $data = [
                'type' => 'countries',
                'id'   => $route->getRouteKey(),
                'attributes' => $route
            ];

            $url = route( 'api.v4.routes.update', $route );
            $this->jsonApi()
                ->withData( $data )
                ->patch($url)
                ->assertStatus(200);

        }
}
