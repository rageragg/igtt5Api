<?php

namespace App\JsonApi\Municipalities;

use CloudCreativity\LaravelJsonApi\Eloquent\AbstractAdapter;
use CloudCreativity\LaravelJsonApi\Pagination\StandardStrategy;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

class Adapter extends AbstractAdapter
{

    protected $fillable = [
        'municipality_co',
        'description',
        'province_id',
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
        'municipalityCo' => 'municipality_co',
        'description' => 'description',
        'provinceId' =>'province_id',
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
        parent::__construct(new \App\Models\Municipality(), $paging);
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
    protected function fillAttributes($municipality, Collection $attributes)
    {
        $municipality->fill(
            $attributes->only($this->fillable)->toArray()
        );

        $municipality->user_id = auth()->id();
        $municipality->slug = strtolower($municipality->slug);
    }

    // esto permite hacer la relacion entre entidades
    public function user()
    {
        return $this->belongsTo();
    }

    public function province()
    {
        return $this->belongsTo();
    }

}
