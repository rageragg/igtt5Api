<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Str;

class Municipality extends Model
{
    use HasFactory;

    protected $table = "municipalities";

    protected $guarded = [
        'id'
    ];

    protected $fillable = [
        'municipality_co',
        'description',
        'province_id',
        'slug',
        'uuid',
        'user_id'
    ];

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function province()
    {
        return $this->belongsTo(Province::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function cities()
    {
        return $this->hasMany(City::class);
    }

    public function scopeDescription(Builder $query, $value)
    {
        $query->where( 'description', 'LIKE', "%{$value}%" );
    }

    public function scopeProvinceId(Builder $query, $value)
    {
        $query->where( 'province_id', $value );
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
