<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAttsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //借款表
        Schema::create('atts', function (Blueprint $table) {
            $table->increments('aid');//主键
            $table->integer('uid');//用户id
            $table->integer('pid');//项目id
            $table->string('title');//项目名称
            $table->string('realname');//真实姓名
            $table->tinyinteger('age');//年龄
            $table->enum('gender',['男','女']);//性别
            $table->tinyinteger('salary');//收入
            $table->string('jobcity');//工作城市
            $table->string('udesc');//用户描述
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('atts');
    }
}
