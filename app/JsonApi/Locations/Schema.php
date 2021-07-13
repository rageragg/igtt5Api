<?php

namespace App\JsonApi\Locations;

use Neomerx\JsonApi\Schema\SchemaProvider;

class Schema extends SchemaProvider
{

    /**
     * @var string
     */
    protected $resourceType = 'locations';

    /**
     * @param \App\Models\Location $resource
     *      the domain record being serialized.
     * @return string
     */
    public function getId($resource)
    {
        return (string) $resource->getRouteKey();
    }

    /**
     * @param \App\Models\Location $resource
     *      the domain record being serialized.
     * @return array
     */
    public function getAttributes($location)
    {
        return [
            'locationCo' => $location->location_co,
            'description' => $location->description,
            'postalCo' => $location->postal_co,
            'nuGpsLat' => $location->nu_gps_lat,
            'nuGpsLon' => $location->nu_gps_lon,
            'uuid' => $location->uuid,
            'cityId' => $location->city_id,
            'userId' => $location->user_id,
            'createdAt' => $location->created_at,
            'updatedAt' => $location->updated_at,
        ];
    }

    public function getRelationships($location, $isPrimary, array $includeRelationships)
    {
        return [
            'user' => [
                self::SHOW_RELATED => false,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($location) {
                    return $location->user;
                }
            ],
            'city' => [
                self::SHOW_RELATED => true,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($location) {
                    return $location->city;
                }
            ]
        ];
    }
}
