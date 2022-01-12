<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateShopsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shops', function (Blueprint $table) {
            $table->id();
            $table->string('shop_co', 7)->unique();
            $table->string('description', 80);
            $table->unsignedBigInteger('location_id');
            $table->string('address', 250);
            $table->double('nu_gps_lat', 8, 4);
            $table->double('nu_gps_lon', 8, 4);
            $table->string('telephone_co', 50);
            $table->string('fax_co', 50);
            $table->string('email', 60);

            $table->string('name_contact', 60);
            $table->string('telephone_contact', 60);
            $table->string('email_contact', 60);

            $table->string('slug', 60)->unique();
            $table->uuid('uuid')->unique();
            $table->unsignedBigInteger('user_id');
            $table->timestamps();

            $table->foreign('location_id')->references('id')->on('locations');
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
        Schema::dropIfExists('shops');
    }
}
