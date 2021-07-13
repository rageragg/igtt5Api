<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class RegionPolicy
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

    public function update(User $user, $region )
    {
       //
       return $user->rol === 'ADMINISTRATOR';
    }

    public function delete(User $user, $region )
    {
       //
       return $user->rol === 'ADMINISTRATOR';
    }
}
