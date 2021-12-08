<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\RegisterController;
use CloudCreativity\LaravelJsonApi\Facades\JsonApi;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('api/v4/login', [ LoginController::class, 'login' ])
    ->name('api.v4.login')
    ->middleware('guest:sanctum');

Route::post('api/v4/logout', [ LoginController::class, 'logout' ])
    ->name('api.v4.logout')
    ->middleware('auth:sanctum');

JsonApi::register('v4')
    ->middleware('auth:sanctum')
    ->routes(function( $api, $router ) {

    $api->resource('configurations');
    $api->resource('users');

    $api->resource('countries')
        ->relationships( function($api) {
            $api->hasOne('user')->except('replace');
        });

    $api->resource('regions')
        ->relationships( function($api) {
            $api->hasOne('user')->except('replace');
            $api->hasOne('country')->except('replace');
        });

    $api->resource('provinces')
        ->relationships( function($api) {
            $api->hasOne('user')->except('replace');
            $api->hasOne('region')->except('replace');
        });

    $api->resource('municipalities')
        ->relationships( function($api) {
            $api->hasOne('user')->except('replace');
            $api->hasOne('province')->except('replace');
    });

    $api->resource('cities')
        ->relationships( function($api) {
            $api->hasOne('user')->except('replace');
            $api->hasOne('municipality')->except('replace');
    });

    $api->resource('locations')
        ->relationships( function($api) {
            $api->hasOne('user')->except('replace');
            $api->hasOne('city')->except('replace');
    });

    $api->resource('customers')
        ->relationships( function($api) {
            $api->hasOne('user')->except('replace');
            $api->hasOne('locations')->except('replace');
    });

    $api->resource('routes')
        ->relationships( function($api) {
            $api->hasOne('user')->except('replace');
            $api->hasOne('fromCity')->except('replace');
            $api->hasOne('toCity')->except('replace');
    });

});
