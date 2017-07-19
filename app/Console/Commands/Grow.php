<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use DB;
class Grow extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'grow';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'grow mysy';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $today = date('Y-m-d H:i:s');//获取今天日期
        $tasks = DB::table('tasks')->where('enddate','>',$today)->get();//只要是截止日期大于今天的，都应该获得收益
        foreach ($tasks as $t) {
            $t->paytime = $today;
            $t = (array)$t;//对象强制转换成数组
            unset($t['tid']);//释放掉与插入grows无关的列
            unset($t['enddate']);
            DB::table('grows')->insert($t);//把查询数据插入到grows表中
        }
    }
}
