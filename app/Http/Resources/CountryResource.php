<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CountryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        // obejto actual
        $country = $this->resource;

        return [
            'type' => 'countries',
            'id' => (string) $country->getRouteKey(),
            'attributes' => [
                'country_co' => $country->country_co,
                'description' => $country->description,
                'path_image' => $country->path_image,
                'telephone_co' => $country->telephone_co,
                'slug' => $country->slug
            ],
            'links' => [
                'selft' => route('api.v4.countries.read', $country )
            ]
        ];
    }
}
