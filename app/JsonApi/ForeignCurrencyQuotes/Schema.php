<?php

namespace App\JsonApi\ForeignCurrencyQuotes;

use Neomerx\JsonApi\Schema\SchemaProvider;

class Schema extends SchemaProvider
{

    /**
     * @var string
     */
    protected $resourceType = 'foreignCurrencyQuotes';

    /**
     * @param \App\Models\ForeignCurrencyQuote $resource
     *      the domain record being serialized.
     * @return string
     */
    public function getId($resource)
    {
        return (string) $resource->getRouteKey();
    }

    /**
     * @param \App\Models\ForeignCurrencyQuote $resource
     *      the domain record being serialized.
     * @return array
     */
    public function getAttributes($resource)
    {
        return [
            'quoteDate' => $resource->quote_date,
            'quoteValue' => $resource->quote_value,
            'createdAt' => $resource->created_at,
            'updatedAt' => $resource->updated_at,
        ];
    }
}
