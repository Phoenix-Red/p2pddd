<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hks', function (Blueprint $table) {
            $table->increments('hid');//主键
            $table->integer('uid');//用户id
            $table->integer('pid');//项目id
            $table->string('title');//项目名称
            $table->integer('amount');//每月还款金额
            $table->date('paydate');//账单日
            $table->tinyinteger('status');//是否已还
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('hks');
    }
}
