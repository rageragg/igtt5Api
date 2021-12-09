<?php

namespace App\JsonApi\Shops;

use Neomerx\JsonApi\Schema\SchemaProvider;

class Schema extends SchemaProvider
{

    /**
     * @var string
     */
    protected $resourceType = 'shops';

    /**
     * @param \App\Models\Shop $resource
     *      the domain record being serialized.
     * @return string
     */
    public function getId($resource)
    {
        return (string) $resource->getRouteKey();
    }

    /**
     * @param \App\Models\Shop $resource
     *      the domain record being serialized.
     * @return array
     */
    public function getAttributes($shop)
    {
        return [
            'shopCo' => $shop->shop_co,
            'description' => $shop->description,
            'locationId' => $shop->location_id,
            'address' => $shop->address,
            'numGpsLat' => $shop->num_gps_lat,
            'numGpsLon' => $shop->num_gps_lon,
            'telephoneCo'=> $shop->telephone_co,
            'faxCo' => $shop->fax_co,
            'email'=> $shop->email,
            'nameContact' => $shop->name_contact,
            'emailContact' => $shop->email_contact,
            'telephoneContact' => $shop->telephone_contact,
            'slug' => $shop->slug,
            'uuid' => $shop->uuid,
            'userId' => $shop->user_id,
            'createdAt' => $shop->created_at,
            'updatedAt' => $shop->updated_at,
        ];
    }

    public function getRelationships($shop, $isPrimary, array $includeRelationships)
    {
        return [
            'user' => [
                self::SHOW_RELATED => false,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($shop) {
                    return $shop->user;
                }
            ],
            'location' => [
                self::SHOW_RELATED => true,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($shop) {
                    return $shop->municipality;
                }
            ]
        ];
    }
}
