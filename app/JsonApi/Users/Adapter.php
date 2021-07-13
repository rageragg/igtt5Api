<?php

namespace App\JsonApi\Users;

use CloudCreativity\LaravelJsonApi\Eloquent\AbstractAdapter;
use CloudCreativity\LaravelJsonApi\Pagination\StandardStrategy;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Hash;

use App\Models\User;

class Adapter extends AbstractAdapter
{

    protected $fillable = [
        'email',
        'name',
        'rol',
        'uuid',
        'valid',
        'api_token',
        'password',
        'email_verified_at'
    ];
    /**
     * Mapping of JSON API attribute field names to model keys.
     *
     * @var array
     */
    protected $attributes = [
        'email' => 'email',
        'name' => 'name',
        'rol' => 'rol',
        'uuid' => 'uuid',
        'valid' => 'valid',
        'apiToken' => 'api_token',
        'password' => 'password',
        'emailVerifiedAt' => 'email_verified_at'
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
        parent::__construct(new User(), $paging);
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

    protected function creating( User $user )
    {
        $user->password =  Hash::make($user->password);
    }

}
