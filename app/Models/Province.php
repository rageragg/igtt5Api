<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Str;

class Province extends Model
{
    use HasFactory;

    protected $table = "provinces";

    protected $guarded = [
        'id'
    ];

    protected $fillable = [
        'province_co',
        'description',
        'region_id',
        'slug',
        'uuid',
        'user_id'
    ];

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function region()
    {
        return $this->belongsTo(Region::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function municipalities()
    {
        return $this->hasMany(Municipality::class);
    }

    public function scopeDescription(Builder $query, $value)
    {
        $query->where( 'description', 'LIKE', "%{$value}%" );
    }

    public function scopeRegionId(Builder $query, $value)
    {
        $query->where( 'region_id', $value );
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
