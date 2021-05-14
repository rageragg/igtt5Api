<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Configuration extends Model
{
    use HasFactory;

    protected $table = 'configurations';

     /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'local_currency_co',
        'foreign_currency_co',
        'last_foreign_currency_quote_value',
        'last_foreign_currency_quote_date',
        'country_co',
        'company_description',
        'company_address',
        'company_telephone_co',
        'company_email',
        'company_fiscal_document_co',
        'days_per_year',
        'weeks_per_year',
        'months_per_year',
        'days_per_month',
        'days_per_week',
        'hours_per_day',
    ];
}
