<?php

namespace App\Http\Controllers\V4;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Configuration;

class ConfigurationController extends Controller
{
    //
    public function show( Configuration $config) {

        return response()->json([
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
                    'selft' => route('api.v4.configuration.settings.show', $config )
                ]

            ]
        ]);

    }

}
