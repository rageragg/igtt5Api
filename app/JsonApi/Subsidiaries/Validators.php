<?php

namespace App\JsonApi\Subsidiaries;

use CloudCreativity\LaravelJsonApi\Validation\AbstractValidators;
use App\Rules\Slug;
use Illuminate\Validation\Rule;

class Validators extends AbstractValidators
{

    /**
     * The include paths a client is allowed to request.
     *
     * @var string[]|null
     *      the allowed paths, an empty array for none allowed, or null to allow all paths.
     */
    protected $allowedIncludePaths = [
        'user',
        'customer',
        'shop'
    ];

    /**
     * The sort field names a client is allowed send.
     *
     * @var string[]|null
     *      the allowed fields, an empty array for none allowed, or null to allow all fields.
     */
    protected $allowedSortParameters = [ 'description', 'userId', 'slug', 'customerId', 'shopId'  ];

    /**
     * The filters a client is allowed send.
     *
     * @var string[]|null
     *      the allowed filters, an empty array for none allowed, or null to allow all.
     */
    protected $allowedFilteringParameters = [];

    /**
     * Get resource validation rules.
     *
     * @param mixed|null $record
     *      the record being updated, or null if creating a resource.
     * @param array $data
     *      the data being validated
     * @return array
     */
    protected function rules($subsidiary, array $data): array
    {
        return [
            'slug' => [
                'required',
                Rule::unique('subsidiaries')->ignore($subsidiary),
                'alpha_dash',
                new Slug
            ],
            'subsidiary_co' => [
                'required',
                Rule::unique('subsidiaries')->ignore($subsidiary)
            ],
            'customer_id' => [
                'required',
                'exists:customers,id'
            ],
            'shop_id' => [
                'required',
                'exists:shops,id'
            ]
        ];
    }

    /**
     * Get query parameter validation rules.
     *
     * @return array
     */
    protected function queryRules(): array
    {
        return [
            //
        ];
    }

}
