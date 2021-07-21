<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRoutesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('routes', function (Blueprint $table) {
            $table->id();
            $table->string('route_co', 7)->unique();
            $table->string('description', 80);
            $table->string('slug', 60)->unique();
            $table->string('uuid', 60)->unique();
            $table->unsignedBigInteger('from_city_id');
            $table->unsignedBigInteger('to_city_id');
            $table->enum('k_level_co', ['A', 'B', 'C']);
            $table->double('distance_km', 8, 2);
            $table->double('estimated_time_hrs', 8, 2);

            $table->unsignedBigInteger('user_id');
            $table->timestamps();

            $table->foreign('from_city_id')->references('id')->on('cities');
            $table->foreign('to_city_id')->references('id')->on('cities');
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
        Schema::dropIfExists('routes');
    }
}
