<?php

namespace App\JsonApi\Countries;

use CloudCreativity\LaravelJsonApi\Eloquent\AbstractAdapter;
use CloudCreativity\LaravelJsonApi\Pagination\StandardStrategy;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

class Adapter extends AbstractAdapter
{

    protected $fillable = [
        'country_co',
        'description',
        'path_image',
        'telephone_co',
        'slug',
        'uuid'
    ];

    /**
     * Mapping of JSON API attribute field names to model keys.
     *
     * @var array
     */
    protected $attributes = [
        'countryCo' => 'country_co',
        'pathImage' => 'path_image',
        'telephoneCo' => 'telephone_co',
        'descripcion' => 'description',
        'slug' => 'slug',
        'userId' => 'user_id',
        'uuid' => 'uuid'
    ];

    /**
     * Mapping of JSON API filter names to model scopes.
     *
     * @var array
     */
    protected $filterScopes = [];

    /**
     * Adapter constructor.
     *
     * @param StandardStrategy $paging
     */
    public function __construct(StandardStrategy $paging)
    {
        parent::__construct(new \App\Models\Country(), $paging);
    }

    /**
     * @param Builder $query
     * @param Collection $filters
     * @return void
     */
    protected function filter($query, Collection $filters)
    {
        $this->filterWithScopes($query, $filters);
    }

    protected function fillAttributes($country, Collection $attributes)
    {
        $country->fill(
            $attributes->only($this->fillable)->toArray()
        );

        $country->user_id = auth()->id();
        $country->slug = strtolower($country->country_co);
    }

    public function user()
    {
        return $this->belongsTo();
    }

}
