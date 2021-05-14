<?php

namespace App\Mixin;

use Illuminate\Support\Str;

class JsonApiBuilder {

    public function jsonPaginate()
    {
        //
        return function() {
            //
            return $this->paginate(
                $perPage = request( 'page.size'),
                $columns = ['*'],
                $pageName = 'page[number]',
                $page = request('page.number')
            )
            ->appends( request()->except('page.number') );
        };
    }

    public function applySorts()
    {
        //
        return function() {
            // verificamos que la propiedad allowFields este establecida
            if( ! property_exists($this->model, 'allowedSorts') ) {
                abort( 500, 'Please set the public property $allowedSorts inside. ' . get_Class($this->model) );
            }
            // ordenamiento
            $directionSort  = 'asc';
            $sort           = request('sort');
            $sortFields     = Str::of( $sort )->explode(',');
            // se verifica si hay parametros
            if( is_null( $sort ) ) {
                $sortFields =  [ 0 => 'id' ];
            }
            // recorremos el arreglo de consulta
            foreach( $sortFields as $sortField ) {
                //
                $directionSort = 'asc';
                // verificamos la direccion del orden
                if( Str::of( $sortField )->startsWith('-') ) {
                    $directionSort = 'desc';
                    $sortField = Str::of( $sortField )->substr(1);
                }
                // verificamos los parametros que sean validos
                if( !collect( $this->model->allowedSorts )->contains( $sortField ) ) {
                    abort(400, "Invalid Query Parameters, {$sortField} is not allowed." );
                }
                // construimos la consulta
                $this->orderBy($sortField, $directionSort);
            }
            //
            return $this;
        };
    }
}
