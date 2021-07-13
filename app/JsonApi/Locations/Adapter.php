<?php

namespace App\JsonApi\Locations;

use CloudCreativity\LaravelJsonApi\Eloquent\AbstractAdapter;
use CloudCreativity\LaravelJsonApi\Pagination\StandardStrategy;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

class Adapter extends AbstractAdapter
{

    protected $fillable = [
        'location_co',
        'description',
        'city_id',
        'postal_co',
        'nu_gps_lat',
        'nu_gps_lon',
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
        'locationCo' => 'location_co',
        'description' => 'description',
        'cityId' => 'city_id',
        'postalCo' => 'postal_co',
        'nuGpsLat' => 'nu_gps_lat',
        'nuGpsLon' => 'nu_gps_lon',
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
        parent::__construct(new \App\Models\Location(), $paging);
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
    protected function fillAttributes($location, Collection $attributes)
    {
        $location->fill(
            $attributes->only($this->fillable)->toArray()
        );

        $location->user_id = auth()->id();
        $location->slug = strtolower($location->slug);
    }

    // esto permite hacer la relacion entre entidades
    public function user()
    {
        return $this->belongsTo();
    }

    public function city()
    {
        return $this->belongsTo();
    }

}
