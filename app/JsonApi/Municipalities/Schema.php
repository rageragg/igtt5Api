<?php

namespace App\JsonApi\Municipalities;

use Neomerx\JsonApi\Schema\SchemaProvider;

class Schema extends SchemaProvider
{

    /**
     * @var string
     */
    protected $resourceType = 'municipalities';

    /**
     * @param \App\Models\Municipality $resource
     *      the domain record being serialized.
     * @return string
     */
    public function getId($resource)
    {
        return (string) $resource->getRouteKey();
    }

    /**
     * @param \App\Models\Municipality $resource
     *      the domain record being serialized.
     * @return array
     */
    public function getAttributes($municipality)
    {
        return [
            'municipalityCo' => $municipality->municipality_co,
            'description' => $municipality->description,
            'slug' => $municipality->slug,
            'uuid' => $municipality->uuid,
            'provinceId' => $municipality->province_id,
            'userId' => $municipality->user_id,
            'createdAt' => $municipality->created_at,
            'updatedAt' => $municipality->updated_at,
        ];
    }

    public function getRelationships($municipality, $isPrimary, array $includeRelationships)
    {
        return [
            'user' => [
                self::SHOW_RELATED => false,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($municipality) {
                    return $municipality->user;
                }
            ],
            'province' => [
                self::SHOW_RELATED => true,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($municipality) {
                    return $municipality->province;
                }
            ]
        ];
    }

}
