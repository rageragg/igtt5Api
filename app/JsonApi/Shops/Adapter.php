<?php

namespace App\JsonApi\Shops;

use CloudCreativity\LaravelJsonApi\Eloquent\AbstractAdapter;
use CloudCreativity\LaravelJsonApi\Pagination\StandardStrategy;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

class Adapter extends AbstractAdapter
{

    protected $fillable = [
        'shop_co',
        'description',
        'location_id',
        'address',
        'num_gps_lat',
        'num_gps_lon',
        'telephone_co',
        'fax_co',
        'email',
        'name_contact',
        'email_contact',
        'telephone_contact',
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
        'shopCo' => 'shop_co',
        'description' => 'description',
        'locationId' =>'location_id',
        'address' => 'address',
        'numGpsLat' => 'num_gps_lat',
        'numGpsLon' => 'num_gps_lon',
        'telephoneCo' => 'telephone_co',
        'faxCo' => 'fax_co',
        'email' => 'email',
        'nameContact' => 'name_contact',
        'emailContact' => 'email_contact',
        'telephoneContact' => 'telephone_contact',
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
        parent::__construct(new \App\Models\Shop(), $paging);
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
    protected function fillAttributes($shop, Collection $attributes)
    {
        $shop->fill(
            $attributes->only($this->fillable)->toArray()
        );

        $shop->user_id = auth()->id();
        $shop->slug = strtolower($shop->slug);
    }

    // esto permite hacer la relacion entre entidades
    public function user()
    {
        return $this->belongsTo();
    }

    // esto permite hacer la relacion entre entidades
    public function location()
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
