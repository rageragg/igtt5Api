<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Str;

class Customer extends Model
{
    use HasFactory;

    protected $table = "customers";

    protected $guarded = [
        'id'
    ];

    protected $fillable = [
        'customer_co',
        'description',
        'address',
        'telephone_co',
        'fax_co',
        'email',
        'fiscal_document_co',
        'k_type_customer',
        'k_categry_co',
        'k_sector',
        'name_contact',
        'telephone_contact',
        'email_contact',
        'slug',
        'uuid',
        'location_id',
        'user_id'
    ];

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function location()
    {
        return $this->belongsTo(Location::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function scopeDescription(Builder $query, $value)
    {
        $query->where( 'description', 'LIKE', "%{$value}%" );
    }

    public function scopeLocationId(Builder $query, $value)
    {
        $query->where( 'location_id', $value );
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
