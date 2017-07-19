<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProjectsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //还款表
        Schema::create('projects', function (Blueprint $table) {
            $table->increments('pid');//主键自增
            $table->integer('uid');//用户id
            $table->string('name');//用户名
            $table->integer('money');//贷款金额
            $table->string('mobile',11);//手机号
            $table->string('title');//项目名称
            $table->tinyinteger('rate');//年利率，百分比
            $table->tinyinteger('hrange');//还款期限，月为单位
            $table->tinyinteger('status');//审核标志 -1不通过 0审核中 1招标中 2还款中 3已结束
            $table->integer('recive');//已经招标金额
            $table->integer('pubtime');//项目发布时间
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('projects');
    }
}
