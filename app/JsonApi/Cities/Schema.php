<?php

namespace App\JsonApi\Cities;

use Neomerx\JsonApi\Schema\SchemaProvider;

class Schema extends SchemaProvider
{

    /**
     * @var string
     */
    protected $resourceType = 'cities';

    /**
     * @param \App\Models\City $resource
     *      the domain record being serialized.
     * @return string
     */
    public function getId($resource)
    {
        return (string) $resource->getRouteKey();
    }

    /**
     * @param \App\Models\City $resource
     *      the domain record being serialized.
     * @return array
     */
    public function getAttributes($city)
    {
        return [
            'cityCo' => $city->municipality_co,
            'description' => $city->description,
            'postalCo' => $city->postal_co,
            'telephoneCo' => $city->telephone_co,
            'slug' => $city->slug,
            'uuid' => $city->uuid,
            'municipalityId' => $city->municipality_id,
            'userId' => $city->user_id,
            'createdAt' => $city->created_at,
            'updatedAt' => $city->updated_at,
        ];
    }

    public function getRelationships($citie, $isPrimary, array $includeRelationships)
    {
        return [
            'user' => [
                self::SHOW_RELATED => false,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($citie) {
                    return $citie->user;
                }
            ],
            'municipality' => [
                self::SHOW_RELATED => true,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($citie) {
                    return $citie->municipality;
                }
            ],
            'locations' => [
                self::SHOW_RELATED => true,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($citie) {
                    return $citie->fromCity;
                }
            ]
        ];
    }
}
