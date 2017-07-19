<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use Auth;
use App\user;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class GrowController extends Controller
{
	/**
	 * 投资者生成收益
	 * @return [type] [description]
	 */
    public function run(){
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

    /**
     *	借款者生成还款账单
     * @return [type] [description]
     */
    public function myzd(){
    	$user = Auth::user();
    	$hks = DB::table('hks')->where('uid',$user->uid)->paginate(5);
    	return view('myzd',['hks'=>$hks]);
    }

    /**
     * 我的投资
     */
    public function mytz(){
    	$user = Auth::user();
    	$bids = DB::table('bids')->where('bids.uid',$user->uid)->whereIn('status',[1,2])->join('projects' , 'bids.pid' , '=' , 'projects.pid')->get(['bids.*' , 'projects.status']);
    	return view('mytz',['bids'=>$bids]);
    }

    /**
     * 我的收益
     */
    public function mysy() {
		$user = Auth::user();
		$grows = DB::table('grows')->where('uid' , $user->uid)->orderBy('gid' , 'desc')->get();
		return view('mysy' , ['grows'=>$grows]);
	}
	
}
