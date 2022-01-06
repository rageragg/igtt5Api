<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\RegisterController;
use App\Http\Controllers\Api\StatisticController;

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

Route::post('api/v4/token', [ LoginController::class, 'token' ])
    ->name('api.v4.token')
    ->middleware('guest:sanctum');

Route::post('api/v4/logout', [ LoginController::class, 'logout' ])
    ->name('api.v4.logout')
    ->middleware('auth:sanctum');

// statistic USERS
Route::get('api/v4/user/count/', [ StatisticController::class, 'countUsers' ])
    ->name('api.v4.user.count')
    ->middleware('auth:sanctum');

Route::get('api/v4/user/count/rol', [ StatisticController::class, 'countUsersByRol' ])
    ->name('api.v4.user.count.rol')
    ->middleware('auth:sanctum');

Route::get('api/v4/user/gestion/{rol}', [ StatisticController::class, 'gestionUsersByRol' ])
    ->name('api.v4.user.gestion.rol')
    ->middleware('auth:sanctum');

//
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
            $api->hasOne('location')->except('replace');
    });

    $api->resource('shops')
        ->relationships( function($api) {
            $api->hasOne('user')->except('replace');
            $api->hasOne('location')->except('replace');
    });

    $api->resource('subsidiaries')
        ->relationships( function($api) {
            $api->hasOne('user')->except('replace');
            $api->hasOne('customer')->except('replace');
            $api->hasOne('shop')->except('replace');
    });

    $api->resource('routes')
        ->relationships( function($api) {
            $api->hasOne('user')->except('replace');
            $api->hasOne('fromCity')->except('replace');
            $api->hasOne('toCity')->except('replace');
    });

});
