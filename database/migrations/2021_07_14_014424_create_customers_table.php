<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id();
            $table->string('customer_co', 7)->unique();
            $table->string('description', 80);
            $table->enum('k_type_customer', ['F', 'M', 'D']);
            $table->unsignedBigInteger('location_id');
            $table->string('address', 250);
            $table->string('telephone_co', 50);
            $table->string('fax_co', 50);
            $table->string('email', 60);
            $table->string('fiscal_document_co', 60);
            $table->enum('k_categry_co', ['A', 'B', 'C']);
            $table->string('k_sector', 60);
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
        Schema::dropIfExists('customers');
    }
}
