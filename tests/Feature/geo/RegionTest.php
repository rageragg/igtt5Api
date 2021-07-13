<?php

namespace Tests\Feature\geo;

use App\Models\Region;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Laravel\Sanctum\Sanctum;
use Tests\TestCase;

class RegionTest extends TestCase
{
    /**
     * @test
     */
    public function cant_list_regions()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $url = route( 'api.v4.regions.index' );

        $this->jsonApi()->get($url)
             ->assertSee('CENTRO');

    }

    /**
     * @test
     */
    public function cant_fecth_single_region()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);
        $region = Region::find(1);

        $url = route( 'api.v4.regions.read', $region );

        $this->jsonApi()->get($url)
             ->assertJson([
                 'data' => [
                     'type' => 'regions',
                     'id' => (string) $region->getRouteKey(),
                     'attributes' => [
                        "slug" => $region->slug,
                        "description" => $region->description,
                     ],
                     'links' => [
                         'self' => route('api.v4.regions.read', $region)
                     ]
                 ]
             ]);

    }

    /**
     * @test
     */
    public function guest_user_cannot_create_regions()
    {

        $region = New Region();
        $region->country_id = 2;
        $region->region_co = '999';
        $region->description = 'NUEVA';
        $region->slug = 'ven-nva';

        $url = route( 'api.v4.regions.create');

        $this->jsonApi()
            ->withData([
                'type' => 'regions',
                'attributes' => $region
            ])
            ->post($url)
            ->assertStatus(401);

    }

    /**
     * @test
     */
    public function authenticate_user_can_create_regions()
    {
        $user = User::find(1);
        Sanctum::actingAs($user);

        $region = New Region();
        $region->country_id = 2;
        $region->region_co = '999';
        $region->description = 'NUEVA';
        $region->slug = 'ven-nva';

        $url = route( 'api.v4.regions.create');

        $this->jsonApi()
            ->withData([
                'type' => 'regions',
                'attributes' => $region
            ])
            ->post($url)
            ->assertCreated();

    }

    /**
     * @test
     */
    public function authenticate_user_can_update_regions()
    {
        $user = User::find(1);
        Sanctum::actingAs($user);

        $region = New Region();
        $region->country_id = 2;
        $region->region_co = '999';
        $region->description = 'NUEVA';
        $region->slug = 'ven-nva';

        $url = route( 'api.v4.regions.update', $region);

        $this->jsonApi()
            ->withData([
                'type' => 'regions',
                "id" => 'ven-nva',
                'attributes' => $region
            ])
            ->patch($url)
            ->assertStatus(200);

    }

    /**
     * @test
     */
    public function authenticate_user_can_delete_regions()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $region = New Region();
        $region->country_id = 2;
        $region->region_co = '999';
        $region->description = 'NUEVA';
        $region->slug = 'ven-nva';

        $url = route( 'api.v4.regions.delete', $region );
        $this->jsonApi()
             ->delete($url)
             ->assertStatus(204);

    }

    /**
     * @test
     */
    public function description_is_required()
    {
        $user = User::find(1);
        Sanctum::actingAs($user);

        $region = New Region();
        $region->country_id = 2;
        $region->region_co = '999';
        $region->description = '';
        $region->slug = 'ven-nav';

        $url = route( 'api.v4.regions.create');

        $this->jsonApi()
            ->withData([
                'type' => 'regions',
                'attributes' => $region
            ])
            ->post($url)
            ->assertStatus(422);

    }

    /**
     * @test
     */
    public function slug_is_required()
    {
        $user = User::find(1);
        Sanctum::actingAs($user);

        $region = New Region();
        $region->country_id = 2;
        $region->region_co = '999';
        $region->description = 'NUEVA';
        $region->slug = '';

        $url = route( 'api.v4.regions.create');

        $this->jsonApi()
            ->withData([
                'type' => 'regions',
                'attributes' => $region
            ])
            ->post($url)
            ->assertStatus(422);

    }

    /**
     * @test
     */
    public function slug_is_unique()
    {
        $user = User::find(1);
        Sanctum::actingAs($user);

        $region = New Region();
        $region->country_id = 2;
        $region->region_co = '999';
        $region->description = 'NUEVA';
        $region->slug = 'ven-ctr';

        $url = route( 'api.v4.regions.create');

        $this->jsonApi()
            ->withData([
                'type' => 'regions',
                'attributes' => $region
            ])
            ->post($url)
            ->assertStatus(422);

    }

    /**
     * @test
     */
    public function countryId_is_required()
    {
        $user = User::find(1);
        Sanctum::actingAs($user);

        $region = New Region();
        $region->region_co = '999';
        $region->description = 'NUEVA';
        $region->slug = 'ven-nva';

        $url = route( 'api.v4.regions.create');

        $this->jsonApi()
            ->withData([
                'type' => 'regions',
                'attributes' => $region
            ])
            ->post($url)
            ->assertStatus(422);

    }

    /**
     * @test
     */
    public function countryId_must_exist()
    {
        $user = User::find(1);
        Sanctum::actingAs($user);

        $region = New Region();
        $region->country_id = 999;
        $region->region_co = '999';
        $region->description = 'NUEVA';
        $region->slug = 'ven-nva';

        $url = route( 'api.v4.regions.create');

        $this->jsonApi()
            ->withData([
                'type' => 'regions',
                'attributes' => $region
            ])
            ->post($url)
            ->assertStatus(422);

    }

    /**
     * @test
     */
    public function guest_user_cannot_update_regions()
    {

        $region = New Region();
        $region->country_id = 2;
        $region->region_co = 'CTR';
        $region->description = 'NUEVA';
        $region->slug = 'ven-ctr';

        $url = route( 'api.v4.regions.update', $region);

        $this->jsonApi()
            ->patch($url)
            ->assertStatus(401);

    }

    /**
     * @test
     */
    public function can_include_country_regions()
    {
        $user = User::find(1);
        Sanctum::actingAs($user);

        $region = Region::find(1);

        $url = route( 'api.v4.regions.read', $region);

        $this->jsonApi()
            ->includePaths('country')
            ->get($url)
            ->assertSee($region->description)
            ->assertJsonFragment([
                'related' => route('api.v4.regions.relationships.country', $region)
            ]);

    }


}
