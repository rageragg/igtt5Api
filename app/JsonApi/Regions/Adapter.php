<?php

namespace App\JsonApi\Regions;

use CloudCreativity\LaravelJsonApi\Eloquent\AbstractAdapter;
use CloudCreativity\LaravelJsonApi\Pagination\StandardStrategy;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

class Adapter extends AbstractAdapter
{

    protected $fillable = [
        'region_co',
        'description',
        'country_id',
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
        'regionCo' => 'region_co',
        'description' => 'description',
        'countryId' =>'country_id',
        'slug' => 'slug',
        'uuid' => 'uuid',
        'userId' => 'user_id',
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
        parent::__construct(new \App\Models\Region(), $paging);
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

    protected function fillAttributes($region, Collection $attributes)
    {
        $region->fill(
            $attributes->only($this->fillable)->toArray()
        );

        $region->user_id = auth()->id();
        $region->slug = strtolower($region->slug);
    }


    // esto permite hacer la relacion entre entidades
    public function user()
    {
        return $this->belongsTo();
    }

    public function country()
    {
        return $this->belongsTo();
    }

}
