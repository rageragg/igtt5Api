<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProvincesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('provinces', function (Blueprint $table) {
            $table->id();
            $table->string('province_co', 7)->unique();
            $table->string('slug', 60)->unique();
            $table->string('description', 80);
            $table->uuid('uuid')->unique();
            $table->unsignedBigInteger('region_id');
            $table->unsignedBigInteger('user_id');
            $table->timestamps();

            $table->foreign('region_id')->references('id')->on('regions');
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
        Schema::dropIfExists('provinces');
    }
}
