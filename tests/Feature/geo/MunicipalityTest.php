<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;
use Laravel\Sanctum\Sanctum;

class MunicipalityTest extends TestCase
{
    /**
     * @test
     */
    public function can_list_test()
    {
        //
        $user = User::find(1);
        Sanctum::actingAs($user);

        $url = route( 'api.v4.municipalities.index' );

        $this->jsonApi()->get($url)
             ->assertSee('IRIBARREN (Barquisimeto BAR)');
    }
}
