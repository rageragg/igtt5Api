<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ForeignCurrencyQuote extends Model
{
    use HasFactory;

    protected $table = "foreign_currency_quotes";

    protected $guarded = [
        'id'
    ];

    protected $fillable = [
        'quote_date',
        'quote_value',
        'user_id'
    ];

}
