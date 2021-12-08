<?php

namespace App\JsonApi\Routes;

use CloudCreativity\LaravelJsonApi\Eloquent\AbstractAdapter;
use CloudCreativity\LaravelJsonApi\Pagination\StandardStrategy;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;


class Adapter extends AbstractAdapter
{
    protected $fillable = [
        'route_co',
        'description',
        'from_city_id',
        'to_city_id',
        'k_level_co',
        'slug',
        'uuid',
        'user_id',
        'distance_km',
        'estimated_time_hrs'
    ];

    /**
     * Mapping of JSON API attribute field names to model keys.
     *
     * @var array
     */
    protected $attributes = [
        'routeCo' => 'route_co',
        'description' => 'description',
        'fromCityId' => 'from_city_id',
        'toCityId' => 'to_city_id',
        'kLevelCo' => 'k_level_co',
        'slug' => 'slug',
        'uuid' => 'uuid',
        'userId' => 'user_id',
        'distanceKm' => 'distance_km',
        'estimatedTimeHrs' => 'estimated_time_hrs'
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
        parent::__construct(new \App\Models\Route(), $paging);
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
    protected function fillAttributes($route, Collection $attributes)
    {
        $route->fill(
            $attributes->only($this->fillable)->toArray()
        );

        $route->user_id = auth()->id();
        $route->slug = strtolower($route->slug);
    }

    // esto permite hacer la relacion entre entidades
    public function user()
    {
        return $this->belongsTo();
    }

    public function fromCity()
    {
        return $this->belongsTo();
    }

    public function toCity()
    {
        return $this->belongsTo();
    }

    public function scopeDescription(Builder $query, $value)
    {
        $query->where( 'description', 'LIKE', "%{$value}%" );
    }

    public function scopeUserId(Builder $query, $value)
    {
        $query->where( 'user_id', $value );
    }

    public function scopeSlug(Builder $query, $value)
    {
        $query->where( 'slug', $value );
    }

}
