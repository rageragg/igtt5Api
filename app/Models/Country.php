<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Country extends Model
{
    use HasFactory;
    //
    protected $table = "countries";
    public $allowedSorts = [ 'id', 'country_co', 'description' ];
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id',
        'country_co',
        'description',
        'path_image',
        'telephone_co'
    ];
    //
}
