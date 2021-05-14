<?php

namespace App\Http\Controllers\V4;

use App\Http\Controllers\Controller;
use App\Http\Resources\CountryCollection;
use App\Http\Resources\CountryResource;
use Illuminate\Http\Request;

use App\Models\Country;

class CountryController extends Controller
{
    //
    public function index() {
        // country sorted
        $countryList = Country::applySorts()->jsonPaginate();

        // retorna un objecto json -> resource
        return CountryCollection::make($countryList);
    }

    //
    public function show( Country $country) {

        return CountryResource::make($country);

    }
}
