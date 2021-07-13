<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLocationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('locations', function (Blueprint $table) {

            $table->id();
            $table->string('location_co', 10)->unique();
            $table->string('description', 80);
            $table->string('postal_co', 10);
            $table->string('slug', 60)->unique();
            $table->uuid('uuid')->unique();
            $table->double('nu_gps_lat', 8, 4);
            $table->double('nu_gps_lon', 8, 4);
            $table->unsignedBigInteger('city_id');
            $table->unsignedBigInteger('user_id');
            $table->timestamps();

            $table->foreign('city_id')->references('id')->on('cities');
            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('locations');
    }
}
