<?php

namespace App\JsonApi\Provinces;

use CloudCreativity\LaravelJsonApi\Eloquent\AbstractAdapter;
use CloudCreativity\LaravelJsonApi\Pagination\StandardStrategy;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

class Adapter extends AbstractAdapter
{

    /**
     * Mapping of JSON API attribute field names to model keys.
     *
     * @var array
     */
    protected $fillable = [
        'province_co',
        'description',
        'region_id',
        'slug',
        'uuid',
        'user_id'
    ];

    protected $attributes = [
        'provinceCo' => 'province_co',
        'description' => 'description',
        'regionId' =>'region_id',
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
        parent::__construct(new \App\Models\Province(), $paging);
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
    protected function fillAttributes($province, Collection $attributes)
    {
        $province->fill(
            $attributes->only($this->fillable)->toArray()
        );

        $province->user_id = auth()->id();
        $province->slug = strtolower($province->slug);
    }

    // esto permite hacer la relacion entre entidades
    public function user()
    {
        return $this->belongsTo();
    }

    public function region()
    {
        return $this->belongsTo();
    }

}
