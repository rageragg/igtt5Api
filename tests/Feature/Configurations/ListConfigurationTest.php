<?php

namespace Tests\Feature\Configurations;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

use App\Models\Configuration;

class ListConfigurationTest extends TestCase
{
    /**
     * @test
     */
    public function can_fetch_single_config()
    {
        $this->withoutExceptionHandling();

        $config = Configuration::find(1);

        $route = route('api.v4.cfg.settings.show', $config );
        $response = $this->getJson($route);

        $response->assertJson( [
            'data' => [
                'type' => 'configurations',
                'id' => (string) $config->getRouteKey(),
                'attributes' => [
                    'company_description' => $config->company_description,
                    'company_address' => $config->company_address,
                    'company_email' => $config->company_email,
                    'company_telephone_co' => $config->company_telephone_co,
                    'company_fiscal_document_co' => $config->company_fiscal_document_co,
                    'company_logo' => $config->company_logo,
                    'days_per_year' => $config->days_per_year,
                    'weeks_per_year' => $config->weeks_per_year,
                    'months_per_year' => $config->months_per_year,
                    'days_per_month' => $config->days_per_month,
                    'days_per_week' => $config->days_per_week,
                    'hours_per_day' => $config->hours_per_day
                ],
                'links' => [
                    'selft' =>  $route
                ]

            ]
        ]);
    }
}
