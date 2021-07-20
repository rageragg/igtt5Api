<?php

namespace App\JsonApi\Customers;

use Neomerx\JsonApi\Schema\SchemaProvider;

class Schema extends SchemaProvider
{

    /**
     * @var string
     */
    protected $resourceType = 'customers';

    /**
     * @param \App\Models\Customer $resource
     *      the domain record being serialized.
     * @return string
     */
    public function getId($resource)
    {
        return (string) $resource->getRouteKey();
    }

    /**
     * @param \App\Models\Customer $resource
     *      the domain record being serialized.
     * @return array
     */
    public function getAttributes($customer)
    {
        return [
            'customerCo' => $customer->customer_co,
            'description' => $customer->description,
            'address' => $customer->address,
            'telephoneCo' => $customer->telephone_co,
            'faxCo' => $customer->fax_co,
            'email' => $customer->email,
            'fiscalDocumentCo' => $customer->fiscal_document_co,
            'kTypeCustomer' => $customer->k_type_customer,
            'kCategryCo' => $customer->k_categry_co,
            'kSector' => $customer->k_sector,
            'nameContact' => $customer->name_contact,
            'telephoneContact' => $customer->telephone_contact,
            'emailContact' => $customer->email_contact,
            'slug' => $customer->slug,
            'uuid' => $customer->uuid,
            'locationId' => $customer->location_id,
            'userId' => $customer->user_id,
            'createdAt' => $customer->created_at,
            'updatedAt' => $customer->updated_at,
        ];
    }

    public function getRelationships($customer, $isPrimary, array $includeRelationships)
    {
        return [
            'user' => [
                self::SHOW_RELATED => false,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($customer) {
                    return $customer->user;
                }
            ],
            'location' => [
                self::SHOW_RELATED => true,
                self::SHOW_SELF => true,
                self::SHOW_DATA => true,
                self::DATA => function() use ($customer) {
                    return $customer->location;
                }
            ]
        ];
    }
}
