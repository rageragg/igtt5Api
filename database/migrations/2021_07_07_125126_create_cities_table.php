<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cities', function (Blueprint $table) {

            $table->id();
            $table->string('city_co', 10)->unique();
            $table->string('description', 80);
            $table->string('slug', 60)->unique();
            $table->uuid('uuid')->unique();
            $table->string('postal_co', 10);
            $table->string('telephone_co', 4);
            $table->unsignedBigInteger('municipality_id');
            $table->unsignedBigInteger('user_id');
            $table->timestamps();

            $table->foreign('municipality_id')->references('id')->on('municipalities');
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
        Schema::dropIfExists('cities');
    }
}
