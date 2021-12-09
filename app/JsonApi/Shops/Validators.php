<?php

namespace App\JsonApi\Shops;

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
        'location'
    ];

    /**
     * The sort field names a client is allowed send.
     *
     * @var string[]|null
     *      the allowed fields, an empty array for none allowed, or null to allow all fields.
     */
    protected $allowedSortParameters = [ 'description', 'userId', 'slug', 'locationId' ];

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
    protected function rules($shop, array $data): array
    {
        return [
            'description' => ['required'],
            'slug' => [
                'required',
                Rule::unique('shops')->ignore($shop),
                'alpha_dash',
                new Slug
            ],
            'shop_co' => [
                'required',
                Rule::unique('shops')->ignore($shop)
            ],
            'location_id' => [
                'required',
                'exists:locations,id'
            ],
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
