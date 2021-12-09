<?php

namespace App\JsonApi\Subsidiaries;

use Neomerx\JsonApi\Schema\SchemaProvider;

class Schema extends SchemaProvider
{

    /**
     * @var string
     */
    protected $resourceType = 'subsidiaries';

    /**
     * @param \App\Models\Subsidiary $resource
     *      the domain record being serialized.
     * @return string
     */
    public function getId($resource)
    {
        return (string) $resource->getRouteKey();
    }

    /**
     * @param \App\Models\Subsidiary $resource
     *      the domain record being serialized.
     * @return array
     */
    public function getAttributes($subsidiary)
    {
        return [
            'subsidiaryCo' => $subsidiary->subsidiary_co,
            'customerId' => $subsidiary->customer_id,
            'shopId' => $subsidiary->shop_id,
            'slug' => $subsidiary->slug,
            'uuid' => $subsidiary->uuid,
            'userId' => $subsidiary->user_id,
            'createdAt' => $subsidiary->created_at,
            'updatedAt' => $subsidiary->updated_at,
        ];
    }

    public function getRelationships($subsidiary, $isPrimary, array $includeRelationships)
    {
        return [
            'user' => [
                self::SHOW_RELATED => false,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($subsidiary) {
                    return $subsidiary->user;
                }
            ],
            'customer' => [
                self::SHOW_RELATED => true,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($subsidiary) {
                    return $subsidiary->customer;
                }
            ],
            'shop' => [
                self::SHOW_RELATED => true,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($subsidiary) {
                    return $subsidiary->shop;
                }
            ]
        ];
    }

}
