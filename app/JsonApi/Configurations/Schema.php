<?php

namespace App\JsonApi\Configurations;

use Neomerx\JsonApi\Schema\SchemaProvider;

class Schema extends SchemaProvider
{

    /**
     * @var string
     */
    protected $resourceType = 'configurations';

    /**
     * @param \App\Models\Configuration $resource
     *      the domain record being serialized.
     * @return string
     */
    public function getId($resource)
    {
        return (string) $resource->getRouteKey();
    }

    /**
     * @param \App\Models\Configuration $resource
     *      the domain record being serialized.
     * @return array
     */
    public function getAttributes($resource)
    {
        return [
            'localCurrencyCo' => $resource->local_currency_co,
            'foreignCurrencyCo' => $resource->foreign_currency_co,
            'lastForeignCurrencyQuoteValue' => $resource->last_foreign_currency_quote_value,
            'lastForeignCurrencyQuoteDate' => $resource->last_foreign_currency_quote_date,
            'countryCo' => $resource->country_co,
            'company_description' => $resource->company_description,
            'company_address' => $resource->company_address,
            'company_telephone_co' => $resource->company_telephone_co,
            'company_email' => $resource->company_email,
            'company_fiscal_document_co' => $resource->company_fiscal_document_co,
            'days_per_year' => $resource->days_per_year,
            'weeks_per_year' => $resource->weeks_per_year,
            'months_per_year' => $resource->months_per_year,
            'days_per_month' => $resource->days_per_month,
            'days_per_week' => $resource->days_per_week,
            'hours_per_day' => $resource->hours_per_day,
            'createdAt' => $resource->created_at,
            'updatedAt' => $resource->updated_at,
        ];
    }
}
