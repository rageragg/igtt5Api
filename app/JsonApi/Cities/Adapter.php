<?php

namespace App\JsonApi\Cities;

use CloudCreativity\LaravelJsonApi\Eloquent\AbstractAdapter;
use CloudCreativity\LaravelJsonApi\Pagination\StandardStrategy;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

class Adapter extends AbstractAdapter
{

    protected $fillable = [
        'city_co',
        'description',
        'municipality_id',
        'postal_co',
        'telephone_co',
        'slug',
        'uuid',
        'user_id'
    ];

    /**
     * Mapping of JSON API attribute field names to model keys.
     *
     * @var array
     */
    protected $attributes = [
        'cityCo' => 'city_co',
        'description' => 'description',
        'municipalityId' => 'municipality_id',
        'postalCo' => 'postal_co',
        'telephoneCo' => 'telephone_co',
        'slug' => 'slug',
        'uuid' => 'uuid',
        'userId' => 'user_id'
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
        parent::__construct(new \App\Models\City(), $paging);
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

    // completar los campos
    protected function fillAttributes($city, Collection $attributes)
    {
        $city->fill(
            $attributes->only($this->fillable)->toArray()
        );

        $city->user_id = auth()->id();
        $city->slug = strtolower($city->slug);
    }

    // esto permite hacer la relacion entre entidades
    public function user()
    {
        return $this->belongsTo();
    }

    public function municipality()
    {
        return $this->belongsTo();
    }

    public function locations()
    {
        return $this->hasMany();
    }

}
