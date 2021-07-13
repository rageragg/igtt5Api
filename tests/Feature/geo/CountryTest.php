<?php

namespace Tests\Feature\Geo;

use App\Models\Country;
use App\Models\User;
use Laravel\Sanctum\Sanctum;
use Tests\TestCase;

class CountryTest extends TestCase
{

    /** @test */
    public function can_list_countries()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $url = route( 'api.v4.countries.index' );

        $this->jsonApi()->get($url)
            ->assertSee('ARGENTINA');
    }

    /** @test */
    public function can_description_require_countries()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        //
        $url = route( 'api.v4.countries.create' );
        $country = new Country();
        $country->country_co = '999';
        $country->description = '';
        $country->path_image = '999.png';
        $country->telephone_co = '999';
        $country->slug = '999';

        $data = [
            'type' => 'countries',
            'attributes' => $country
        ];

        $this->jsonApi()
            ->withData( $data )
            ->post($url)
            ->assertStatus(422);

    }

    /** @test */
    public function can_slug_require_countries()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);
        //
        $url = route( 'api.v4.countries.create' );
        $country = new Country();
        $country->country_co = '999';
        $country->description = '999';
        $country->path_image = '999.png';
        $country->telephone_co = '999';
        $country->slug = '';

        $data = [
            'type' => 'countries',
            'attributes' => $country
        ];

        $this->jsonApi()
            ->withData( $data )
            ->post($url)
            ->assertStatus(422);

    }

    /** @test */
    public function can_code_unique_countries()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $url = route( 'api.v4.countries.create' );
        $country = new Country();
        $country->country_co = 'VEN';
        $country->description = '999';
        $country->path_image = '999.png';
        $country->telephone_co = '999';
        $country->slug = '999';

        $this->jsonApi()
            ->withData(
                 [
                    'type' => 'countries',
                    'attributes' => $country
                ]
            )
            ->post($url)
            ->assertStatus(422);
    }

    /** @test */
    public function can_create_countries_by_user()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $url = route( 'api.v4.countries.create' );
        $country = new Country();
        $country->country_co = '999';
        $country->description = '9999999';
        $country->path_image = '999.png';
        $country->telephone_co = '999';
        $country->slug = '999';

        $data = [
            'type' => 'countries',
            'attributes' => $country
        ];

        $this->jsonApi()
            ->withData( $data )
            ->post($url)
            ->assertCreated();

    }

    /** @test */
    public function cannot_duplicate_countries_by_user()
    {
            //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $url = route( 'api.v4.countries.create' );
        $country = new Country();
        $country->country_co = 'VEN';
        $country->description = '9999999';
        $country->path_image = '999.png';
        $country->telephone_co = '999';
        $country->slug = 'ven';

        $data = [
            'type' => 'countries',
            'attributes' => $country
        ];

        $this->jsonApi()
             ->withData( $data )
        ->post($url)
        ->assertStatus(422);;

    }

    /** @test */
    public function cannot_duplicate_slug_by_user()
    {
            //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $url = route( 'api.v4.countries.create' );
        $country = new Country();
        $country->country_co = '999';
        $country->description = '9999999';
        $country->path_image = '999.png';
        $country->telephone_co = '999';
        $country->slug = 'ven';

        $data = [
            'type' => 'countries',
            'attributes' => $country
        ];

        $this->jsonApi()
            ->withData( $data )
            ->post($url)
            ->assertStatus(422);

    }

    /** @test */
    public function can_update_countries_by_user()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $country = new Country();
        $country->country_co = 'USA';
        $country->description = 'UNITED STATE OF AMERICA';
        $country->path_image = 'usa.png';
        $country->telephone_co = '1';
        $country->slug = 'USA';

        $data = [
            'type' => 'countries',
            'id'   => $country->getRouteKey(),
            'attributes' => $country
        ];

        $url = route( 'api.v4.countries.update', $country );
        $this->jsonApi()
            ->withData( $data )
            ->patch($url)
            ->assertStatus(200);

    }

    /** @test */
    public function can_delete_countries_by_user()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $country = new Country();
        $country->country_co = '999';
        $country->description = '9999999';
        $country->path_image = '999.png';
        $country->telephone_co = '999';
        $country->slug = '999';

        $url = route( 'api.v4.countries.delete', $country );
        $this->jsonApi()
            ->delete($url)
            ->assertStatus(204);

    }

    /** @test */
    public function can_read_countries_by_user()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $url = route( 'api.v4.countries.read', 'ven' );
        $this->jsonApi()
            ->get($url)
            ->assertStatus(200);

    }

    /** @test */
    public function unaunthentited_create_countries_by_user()
    {
        //

        $country = new Country();
        $country->country_co = '999';
        $country->description = '9999999';
        $country->path_image = '999.png';
        $country->telephone_co = '999';
        $country->slug = '999';

        $data = [
            'type' => 'countries',
            'attributes' => $country
        ];

        $url = route( 'api.v4.countries.create' );
        $this->jsonApi()
            ->withData( $data )
            ->post($url)
            ->assertStatus(401);

    }


}
