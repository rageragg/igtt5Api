<?php

namespace App\JsonApi\Configurations;

use CloudCreativity\LaravelJsonApi\Eloquent\AbstractAdapter;
use CloudCreativity\LaravelJsonApi\Pagination\StandardStrategy;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

class Adapter extends AbstractAdapter
{

    /**
     * Mapping of JSON API attribute field names to model keys.
     *
     * @var array
     */
    protected $attributes = [
        'localCurrencyCo' => 'local_currency_co',
        'foreign_currency_co' => 'foreign_currency_co',
        'last_foreign_currency_quote_value' => 'last_foreign_currency_quote_value',
        'last_foreign_currency_quote_date' => 'last_foreign_currency_quote_date',
        'country_co' => 'country_co',
        'company_description' => 'company_description',
        'company_address' => 'company_address',
        'company_telephone_co' => 'company_telephone_co',
        'company_email' => 'company_email',
        'company_fiscal_document_co' => 'company_fiscal_document_co',
        'days_per_year' => 'days_per_year',
        'weeks_per_year' => 'weeks_per_year',
        'months_per_year' => 'months_per_year',
        'days_per_month' => 'days_per_month',
        'days_per_week' => 'days_per_week',
        'hours_per_day' => 'hours_per_day',
    ];

    /**
     * Mapping of JSON API filter names to model scopes.
     *
     * @var array
     */
    protected $filterScopes = [];

    /**
     * Adapter constructor.
     *
     * @param StandardStrategy $paging
     */
    public function __construct(StandardStrategy $paging)
    {
        parent::__construct(new \App\Models\Configuration(), $paging);
    }

    /**
     * @param Builder $query
     * @param Collection $filters
     * @return void
     */
    protected function filter($query, Collection $filters)
    {
        $this->filterWithScopes($query, $filters);
    }

}
