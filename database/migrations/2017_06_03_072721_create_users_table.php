<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('uid');
            $table->string('name');
            $table->string('email')->unique(); //加入唯一索引
            $table->string('mobile',11);
            $table->string('password', 60);
            $table->rememberToken();//记录cookie
            $table->integer('regtime');//注册时间
            $table->integer('lastlogin');//最后登录时间
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('users');
    }
}
