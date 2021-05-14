<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\V4\ConfigurationController;
use App\Http\Controllers\V4\CountryController;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
// configurations
Route::get( '/cfg/settings/{config}', [ConfigurationController::class, 'show'])->name('api.v4.cfg.settings.show');
// countries index
Route::get( '/gd/countries/', [CountryController::class, 'index'])->name('api.v4.dg.countries.index');
// show country
Route::get( '/gd/countries/{country}', [CountryController::class, 'show'])->name('api.v4.gd.countries.show');


