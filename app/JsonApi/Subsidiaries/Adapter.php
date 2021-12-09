<?php

namespace App\JsonApi\Subsidiaries;

use CloudCreativity\LaravelJsonApi\Eloquent\AbstractAdapter;
use CloudCreativity\LaravelJsonApi\Pagination\StandardStrategy;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

class Adapter extends AbstractAdapter
{

    protected $fillable = [
        'subsidiary_co',
        'customer_id',
        'shop_id',
        'user_id',
        'slug',
        'uuid'
    ];

    /**
     * Mapping of JSON API attribute field names to model keys.
     *
     * @var array
     */
    protected $attributes = [
        'subsidiaryCo' => 'subsidiary_co',
        'customerId' => 'customer_id',
        'shopId' => 'shop_id',
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
        parent::__construct(new \App\Models\Subsidiary(), $paging);
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
    protected function fillAttributes($subsidiary, Collection $attributes)
    {
        $subsidiary->fill(
            $attributes->only($this->fillable)->toArray()
        );

        $subsidiary->user_id = auth()->id();
        $subsidiary->slug = strtolower($subsidiary->slug);
    }

    // esto permite hacer la relacion entre entidades
    public function user()
    {
        return $this->belongsTo();
    }

    // esto permite hacer la relacion entre entidades
    public function cusstomer()
    {
        return $this->belongsTo();
    }

    // esto permite hacer la relacion entre entidades
    public function shop()
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
