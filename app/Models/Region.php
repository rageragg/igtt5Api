<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Str;

class Region extends Model
{
    use HasFactory;

    protected $table = "regions";

    protected $guarded = [
        'id'
    ];

    protected $fillable = [
        'region_co',
        'description',
        'country_id',
        'slug',
        'uuid',
        'user_id'
    ];

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function country()
    {
        return $this->belongsTo(Country::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function provinces()
    {
        return $this->hasMany(Province::class);
    }

    public function scopeDescription(Builder $query, $value)
    {
        $query->where( 'description', 'LIKE', "%{$value}%" );
    }

    public function scopeCountryId(Builder $query, $value)
    {
        $query->where( 'country_id', $value );
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
