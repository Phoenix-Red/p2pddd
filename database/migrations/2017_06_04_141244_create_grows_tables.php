<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGrowsTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('grows', function (Blueprint $table) {
            $table->increments('gid');
            $table->integer('uid');
            $table->integer('pid');
            $table->string('title',60);
            $table->integer('amount');//每天利息
            $table->date('paytime');//收益日期
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('grows');
    }
}
