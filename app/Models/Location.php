<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Str;

class Location extends Model
{
    use HasFactory;

    protected $table = "locations";

    protected $guarded = [
        'id'
    ];

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

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function scopeDescription(Builder $query, $value)
    {
        $query->where( 'description', 'LIKE', "%{$value}%" );
    }

    public function scopeCityId(Builder $query, $value)
    {
        $query->where( 'city_id', $value );
    }

    public function scopeUserId(Builder $query, $value)
    {
        $query->where( 'user_id', $value );
    }

    public function scopeSlug(Builder $query, $value)
    {
        $query->where( 'slug', $value );
    }

    protected static function booted()
    {
        static::creating( function($model) {
            $model->uuid = Str::uuid()->toString();
        });
    }

}
