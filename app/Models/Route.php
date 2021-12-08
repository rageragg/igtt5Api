<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Str;

class Route extends Model
{
    use HasFactory;

    protected $table = "routes";

    protected $guarded = [
        'id'
    ];

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

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function fromCity()
    {
        return $this->belongsTo(City::class, 'from_city_id', 'id');
    }

    public function toCity()
    {
        return $this->belongsTo(City::class, 'to_city_id', 'id' );
    }

    public function user()
    {
        return $this->belongsTo(User::class);
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

    protected static function booted()
    {
        static::creating( function($model) {
            $model->uuid = Str::uuid()->toString();
        });
    }
}
