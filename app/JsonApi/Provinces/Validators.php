<?php

namespace App\JsonApi\Provinces;

use App\Rules\Slug;
use CloudCreativity\LaravelJsonApi\Validation\AbstractValidators;
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
        'region',
        'user'
    ];

    /**
     * The sort field names a client is allowed send.
     *
     * @var string[]|null
     *      the allowed fields, an empty array for none allowed, or null to allow all fields.
     */
    protected $allowedSortParameters = [
        'id', 'provinceCo', 'description', 'userId', 'regionId', 'slug'
    ];

    /**
     * The filters a client is allowed send.
     *
     * @var string[]|null
     *      the allowed filters, an empty array for none allowed, or null to allow all.
     */
    protected $allowedFilteringParameters = [ 'description', 'userId', 'slug', 'regionId' ];

    /**
     * Get resource validation rules.
     *
     * @param mixed|null $record
     *      the record being updated, or null if creating a resource.
     * @param array $data
     *      the data being validated
     * @return array
     */
    protected function rules($province, array $data): array
    {
        return [
            'description' => ['required'],
            'slug' => [
                'required',
                Rule::unique('provinces')->ignore($province),
                'alpha_dash',
                new Slug
            ],
            'province_co' => [
                'required',
                Rule::unique('provinces')->ignore($province)
            ],
            'region_id' => [
                'required',
                'exists:regions,id'
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
