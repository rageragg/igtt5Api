<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmployeesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employees', function (Blueprint $table) {
            $table->id();
            $table->string('employee_co', 7)->unique();
            $table->string('fullname', 80);
            $table->enum('k_status', ['AVAILABLE', 'VACATIONS', 'SERVING', 'DISCARDED', 'LOCATED']);
            $table->enum('k_level', ['A', 'B', 'C', 'D', 'E', 'F']);

            $table->unsignedBigInteger('partner_id')->nullable();
            $table->unsignedBigInteger('truck_id')->nullable();
            $table->unsignedBigInteger('trailer_id')->nullable();
            $table->unsignedBigInteger('last_freight_id')->nullable();
            $table->unsignedBigInteger('last_freight_secuence_id')->nullable();

            $table->string('address', 250)->nullable();
            $table->string('telephone_co', 50)->nullable();
            $table->string('fax_co', 50)->nullable();
            $table->string('email', 60)->nullable();
            $table->string('fiscal_document_co', 60)->nullable();

            $table->string('slug', 60)->unique();
            $table->uuid('uuid')->unique();
            $table->unsignedBigInteger('user_id');
            $table->timestamps();

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
        Schema::dropIfExists('employees');
    }
}
