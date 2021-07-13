<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class UserPolicy
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

    public function create(User $currentUser, $request )
    {
       //
       return $currentUser->rol === 'ADMINISTRATOR';
    }

    public function update(User $currentUser, $user )
    {
       //
       return $currentUser->rol === 'ADMINISTRATOR';
    }

    public function delete(User $currentUser, $user )
    {
       //
       return $currentUser->rol === 'ADMINISTRATOR';
    }

}
