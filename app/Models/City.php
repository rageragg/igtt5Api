<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Str;

class City extends Model
{
    use HasFactory;

    protected $table = "cities";

    protected $guarded = [
        'id'
    ];

    protected $fillable = [
        'city_co',
        'description',
        'municipality_id',
        'postal_co',
        'telephone_co',
        'slug',
        'uuid',
        'user_id'
    ];

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function municipality()
    {
        return $this->belongsTo(Municipality::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function locations()
    {
        return $this->hasMany(Location::class);
    }

    public function scopeDescription(Builder $query, $value)
    {
        $query->where( 'description', 'LIKE', "%{$value}%" );
    }

    public function scopeMunicipalityId(Builder $query, $value)
    {
        $query->where( 'municipality_id', $value );
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
