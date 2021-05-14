<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateConfigurationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('configurations', function (Blueprint $table) {
            $table->id();
            $table->string('local_currency_co', 3)->nullable();
            $table->string('foreign_currency_co', 3)->nullable();
            $table->double('last_foreign_currency_quote_value', 9, 3)->default(0);
            $table->date('last_foreign_currency_quote_date');
            $table->string('country_co', 6)->nullable();
            $table->string('company_description', 80);
            $table->string('company_address', 250);
            $table->string('company_telephone_co', 50);
            $table->string('company_email', 50);
            $table->string('company_fiscal_document_co', 50);
            $table->string('company_logo', 250);
            $table->integer('days_per_year')->default(360);
            $table->integer('weeks_per_year')->default(52);
            $table->integer('months_per_year')->default(12);
            $table->integer('days_per_month')->default(30);
            $table->integer('days_per_week')->default(7);
            $table->integer('hours_per_day')->default(24);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('configutations');
    }
}
