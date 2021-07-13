<?php

namespace App\JsonApi\Users;

use Neomerx\JsonApi\Schema\SchemaProvider;

class Schema extends SchemaProvider
{

    /**
     * @var string
     */
    protected $resourceType = 'users';

    /**
     * @param \App\Models\User $resource
     *      the domain record being serialized.
     * @return string
     */
    public function getId($resource)
    {
        return (string) $resource->getRouteKey();
    }

    /**
     * @param \App\Models\User $resource
     *      the domain record being serialized.
     * @return array
     */
    public function getAttributes($resource)
    {
        return [
            'name'      => $resource->name,
            'email'     => $resource->email,
            'rol'       => $resource->rol,
            'uuid'      => $resource->uuid,
            'createdAt' => $resource->created_at,
            'updatedAt' => $resource->updated_at,
            'valid'     => $resource->valid,
            'apiToken'  => $resource->api_token,
            'password'  => $resource->password,
            'emailVerifiedAt' => $resource->email_verified_at,
        ];
    }
}
