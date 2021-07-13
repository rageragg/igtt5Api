<?php

namespace Tests\Feature\Config;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;
use Laravel\Sanctum\Sanctum;

class ConfigurationListTest extends TestCase
{
    /**
     * @test
     */
    public function can_list_configurations()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $url = route( 'api.v4.configurations.index' );

        $this->jsonApi()->get($url)
            ->assertSee('Transporte El Milagro');
    }
}
