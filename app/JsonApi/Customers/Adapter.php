<?php

namespace App\JsonApi\Customers;

use CloudCreativity\LaravelJsonApi\Eloquent\AbstractAdapter;
use CloudCreativity\LaravelJsonApi\Pagination\StandardStrategy;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

class Adapter extends AbstractAdapter
{

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

    /**
     * Mapping of JSON API attribute field names to model keys.
     *
     * @var array
     */
    protected $attributes = [
        'customerCo' => 'customer_co',
        'description' => 'description',
        'address' => 'address',
        'telephoneCo' => 'telephone_co',
        'faxCo' => 'fax_co',
        'email' => 'email',
        'fiscalDocumentCo' => 'fiscal_document_co',
        'kTypeCustomer' => 'k_type_customer',
        'kCategryCo' => 'k_categry_co',
        'kSector' => 'k_sector',
        'nameContact' => 'name_contact',
        'telephoneContact' => 'telephone_contact',
        'emailContact' => 'email_contact',
        'slug' => 'slug',
        'uuid' => 'uuid',
        'locationId' => 'location_id',
        'userId' => 'user_id'
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
        parent::__construct(new \App\Models\Customer(), $paging);
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

    protected function fillAttributes($customer, Collection $attributes)
    {
        $customer->fill(
            $attributes->only($this->fillable)->toArray()
        );

        $customer->user_id = auth()->id();
        $customer->slug = strtolower($customer->slug);
    }

    // esto permite hacer la relacion entre entidades
    public function user()
    {
        return $this->belongsTo();
    }

    public function location()
    {
        return $this->belongsTo();
    }

}
