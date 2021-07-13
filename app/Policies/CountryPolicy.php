<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class CountryPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function create(User $user, $request )
    {
       //
       return $user->rol === 'ADMINISTRATOR';
    }

    public function update(User $user, $country )
    {
       //
       return $user->rol === 'ADMINISTRATOR';
    }

    public function delete(User $user, $country )
    {
       //
       return $user->rol === 'ADMINISTRATOR';
    }

}
