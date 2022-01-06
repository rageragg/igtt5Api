<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;

use CloudCreativity\LaravelJsonApi\Document\Error\Error;
use CloudCreativity\LaravelJsonApi\Exceptions\JsonApiException;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StatisticController extends Controller
{

    public function countUsers( Request $request ) {

        try {
            //
            $user = DB::table('users')
                        ->select( DB::raw('count(*) as user_count') )
                        ->where('valid', '=', 'Y')
                        ->get();

        } catch (\Throwable $th) {
            $error = Error::fromArray([
                'title' => 'Data no found!',
                'detail' => 'Data no found!',
                'status' => '500'
            ]);

            throw JsonApiException::make($error);;
        }

        return response()->json([
            'data' => [
                'type' => 'users',
                'count' => $user[0]->user_count
            ]
        ]);

    }

    public function countUsersByRol( Request $request ) {

        $contents = array();

        try {
            //
            $data = DB::table('users')
                        ->select( DB::raw('count(*) as user_count, rol') )
                        ->where('valid', '=', 'Y')
                        ->groupBy('rol')
                        ->get();

        } catch (\Throwable $th) {
            $error = Error::fromArray([
                'title' => 'Data no found!',
                'detail' => 'Data no found!',
                'status' => '500'
            ]);

            throw JsonApiException::make($error);;
        }

        foreach($data as $item )
        {
            $contents[] = $item;
        }

        return response()->json([
            'data' => [
                'type' => 'users',
                'contents' => $contents
            ]
        ]);

    }

    public function gestionUsersByRol( Request $request, $rol ) {

        $contents = array();
        $tableName = '';

        try {
            //
            if( $rol == 'ADMINISTRATOR') {
                $tableName = 'v_statistics_administrator';
            } elseif( $rol == 'LOGISTIC') {
                $tableName = 'v_statistics_logistic';
            }

            $data = DB::table($tableName)->get();

        } catch (\Throwable $th) {
            $error = Error::fromArray([
                'title' => 'Data no found!',
                'detail' => 'Data no found!',
                'status' => '500'
            ]);

            throw JsonApiException::make($error);;
        }

        foreach($data as $item )
        {
            $contents[] = $item;
        }

        return response()->json([
            'data' => [
                'type' => 'users',
                'contents' => $contents
            ]
        ]);

    }

}
