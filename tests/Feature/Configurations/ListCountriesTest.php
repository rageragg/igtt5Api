<?php

namespace Tests\Feature\Configurations;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

use App\Models\Country;

class ListCountriesTest extends TestCase
{
    /**
     * @test
     */
    public function cant_fetch_single_countries()
    {
        $this->withoutExceptionHandling();

        $country = Country::find(2);
        $route = route('api.v4.configuration.countries.show', $country );
        $response = $this->getJson($route);

        $response->assertJson([
            'data' => [
                'type' => 'countries',
                'id' => (string) $country->getRouteKey(),
                'attributes' => [
                    'country_co' => $country->country_co,
                    'description' => $country->description,
                    'path_image' => $country->path_image,
                    'telephone_co' => $country->telephone_co
                ],
                'links' => [
                    'selft' => route('api.v4.configuration.countries.show', $country )
                ]
            ]
        ]);
    }

    /**
     * @test
     */
    public function cant_fetch_list_countries()
    {
        $this->withoutExceptionHandling();

        $countries = Country::whereIn( 'id', [1, 2, 3] )->get();

        $route = route('api.v4.gd.countries.index');
        $response = $this->getJson($route);

        $response->assertJson( [
            'data' => [
                [
                    'type' => 'countries',
                    'id' => (string) $countries[0]->getRouteKey(),
                    'attributes' => [
                        'country_co' => $countries[0]->country_co,
                        'description' => $countries[0]->description,
                        'path_image' => $countries[0]->path_image,
                        'telephone_co' => $countries[0]->telephone_co
                    ],
                    'links' => [
                        'selft' => route('api.v4.gd.countries.show', $countries[0] )
                    ]
                ],
                [
                    'type' => 'countries',
                    'id' => (string) $countries[1]->getRouteKey(),
                    'attributes' => [
                        'country_co' => $countries[1]->country_co,
                        'description' => $countries[1]->description,
                        'path_image' => $countries[1]->path_image,
                        'telephone_co' => $countries[1]->telephone_co
                    ],
                    'links' => [
                        'selft' => route('api.v4.gd.countries.show', $countries[1] )
                    ]
                ],
                [
                    'type' => 'countries',
                    'id' => (string) $countries[2]->getRouteKey(),
                    'attributes' => [
                        'country_co' => $countries[2]->country_co,
                        'description' => $countries[2]->description,
                        'path_image' => $countries[2]->path_image,
                        'telephone_co' => $countries[2]->telephone_co
                    ],
                    'links' => [
                        'selft' => route('api.v4.gd.countries.show', $countries[2] )
                    ]
                ]
            ]
        ]);
    }
}
