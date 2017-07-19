<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->increments('tid');//主键
            $table->integer('uid');//用户id
            $table->integer('pid');//项目id
            $table->string('title');//项目名称
            $table->integer('amount');//每天收到的利息
            $table->date('enddate');//利息截止日
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('tasks');
    }
}
