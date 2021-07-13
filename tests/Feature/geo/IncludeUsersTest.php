<?php

namespace Tests\Feature\geo;

use App\Models\Country;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;
use Laravel\Sanctum\Sanctum;

class IncludeUsersTest extends TestCase
{
    /**
     * @test
     */
    public function can_include_users()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);
        $country = Country::find(1);

        $url = route('api.v4.countries.read', $country).'?include=user';

        $this->jsonApi()
             ->get($url)
             ->assertSee($country->user->name)
             ->assertJsonFragment([
                 'related' => route('api.v4.countries.relationships.user', $country)
             ]);

    }

    /**
     * @test
     */
    public function can_fetch_users()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);
        $country = Country::find(1);

        $url = route('api.v4.countries.relationships.user', $country);

        $this->jsonApi()
             ->get($url)
             ->assertSee($country->user->name);
    }

    /**
     * @test
     */
    public function can_fetch_read_users()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);
        $country = Country::find(1);

        $url = route('api.v4.countries.relationships.user.read', $country);

        $this->jsonApi()
             ->get($url)
             ->assertSee($country->user->id);
    }
}
