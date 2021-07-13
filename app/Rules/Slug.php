<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class Slug implements Rule
{
    protected $message;
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        // Verifica si existen subguiones
        if(preg_match('/_/', $value)) {
            $this->message = 'validation.no_underscores';
            return false;
        }
        // verifica si comienza con guiones medio
        if(preg_match('/^-/', $value)) {
            $this->message = 'validation.no_starting_dashes';
            return false;
        }
        // verifica si termina con un guion medio
        if(preg_match('/-$/', $value)) {
            $this->message = 'validation.no_ending_dashes';
            return false;
        }

        return true;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {   // transformamos los mensajes segun el lenguaje usado
        return trans($this->message);
    }
}
