<?php

namespace App\JsonApi\Regions;

use Neomerx\JsonApi\Schema\SchemaProvider;

class Schema extends SchemaProvider
{

    /**
     * @var string
     */
    protected $resourceType = 'regions';

    /**
     * @param \App\Models\Region $resource
     *      the domain record being serialized.
     * @return string
     */
    public function getId($resource)
    {
        return (string) $resource->getRouteKey();
    }

    /**
     * @param \App\Models\Region $resource
     *      the domain record being serialized.
     * @return array
     */
    public function getAttributes($resource)
    {
        return [
            'regionCo' => $resource->region_co,
            'description' => $resource->description,
            'countryId' => $resource->country_id,
            'slug' => $resource->slug,
            'uuid' => $resource->uuid,
            'createdAt' => $resource->created_at,
            'updatedAt' => $resource->updated_at,
            'userId' => $resource->user_id
        ];
    }

    public function getRelationships($region, $isPrimary, array $includeRelationships)
    {
        return [
            'user' => [
                self::SHOW_RELATED => false,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($region) {
                    return $region->user;
                }
            ],
            'country' => [
                self::SHOW_RELATED => true,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($region) {
                    return $region->country;
                }
            ]
        ];
    }
}
