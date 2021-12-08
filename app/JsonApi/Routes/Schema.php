<?php

namespace App\JsonApi\Routes;

use Neomerx\JsonApi\Schema\SchemaProvider;

class Schema extends SchemaProvider
{

    /**
     * @var string
     */
    protected $resourceType = 'routes';

    /**
     * @param \App\Models\Route $resource
     *      the domain record being serialized.
     * @return string
     */
    public function getId($resource)
    {
        return (string) $resource->getRouteKey();
    }

    /**
     * @param \App\Models\Route $resource
     *      the domain record being serialized.
     * @return array
     */
    public function getAttributes($route)
    {
        return [
            'routeCo' => $route->route_co,
            'description' => $route->description,
            'fromCityId' => $route->from_city_id,
            'toCityId' => $route->to_city_id,
            'kLevelCo' => $route->k_level_co,
            'distanceKm' => $route->distance_km,
            'slug' => $route->slug,
            'uuid' => $route->uuid,
            'userId' => $route->user_id,
            'createdAt' => $route->created_at,
            'updatedAt' => $route->updated_at,
        ];
    }

    public function getRelationships($route, $isPrimary, array $includeRelationships)
    {
        return [
            'user' => [
                self::SHOW_RELATED => false,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($route) {
                    return $route->user;
                }
            ],
            'fromCity' => [
                self::SHOW_RELATED => true,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($route) {
                    return $route->municipality;
                }
            ],
            'toCity' => [
                self::SHOW_RELATED => true,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($route) {
                    return $route->toCity;
                }
            ]
        ];
    }
}
