<?php

namespace App\JsonApi\Countries;

use Neomerx\JsonApi\Schema\SchemaProvider;

class Schema extends SchemaProvider
{

    /**
     * @var string
     */
    protected $resourceType = 'countries';

    /**
     * @param \App\Models\Country $resource
     *      the domain record being serialized.
     * @return string
     */
    public function getId($resource)
    {
        return (string) $resource->getRouteKey();
    }

    /**
     * @param \App\Models\Country $resource
     *      the domain record being serialized.
     * @return array
     */
    public function getAttributes($country)
    {
        return [
            'countryCo' => $country->country_co,
            'description' => $country->description,
            'pathImage' => $country->path_image,
            'telephoneCo' => $country->telephone_co,
            'slug' =>  $country->slug,
            'userId' => $country->user_id,
            'uuid' => $country->uuid,
            'createdAt' => $country->created_at,
            'updatedAt' => $country->updated_at,
        ];
    }

    public function getRelationships($country, $isPrimary, array $includeRelationships)
    {
        return [
            'user' => [
                self::SHOW_RELATED => true,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($country) {
                    return $country->user;
                }
            ]
        ];
    }



}
