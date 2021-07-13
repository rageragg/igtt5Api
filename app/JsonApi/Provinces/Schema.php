<?php

namespace App\JsonApi\Provinces;

use Neomerx\JsonApi\Schema\SchemaProvider;

class Schema extends SchemaProvider
{

    /**
     * @var string
     */
    protected $resourceType = 'provinces';

    /**
     * @param \App\Models\Province $resource
     *      the domain record being serialized.
     * @return string
     */
    public function getId($resource)
    {
        return (string) $resource->getRouteKey();
    }

    /**
     * @param \App\Models\Province $resource
     *      the domain record being serialized.
     * @return array
     */
    public function getAttributes($province)
    {
        return [
            'provinceCo' => $province->province_co,
            'description' => $province->description,
            'slug' => $province->slug,
            'uuid' => $province->uuid,
            'regionId' =>$province->region_id,
            'userId' => $province->user_id,
            'createdAt' => $province->created_at,
            'updatedAt' => $province->updated_at,
        ];
    }

    public function getRelationships($province, $isPrimary, array $includeRelationships)
    {
        return [
            'user' => [
                self::SHOW_RELATED => false,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($province) {
                    return $province->user;
                }
            ],
            'province' => [
                self::SHOW_RELATED => true,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($province) {
                    return $province->region;
                }
            ]
        ];
    }
}
