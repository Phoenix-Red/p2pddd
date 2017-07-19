<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Project;
use App\Att;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class CheckController extends Controller
{
	/**
	 * 借款列表
	 * @return [type] [description]
	 */
    public function prolist(){
    	
    	$prolist = Project::orderBy('pid','desc')->get();
    	return view('prolist',['prolist'=>$prolist]);
    }

    /**
     * 借款审核
     * @param  [type] $pid [description]
     * @return [type]      [description]
     */
    public function getCheck($pid){
    	$pro = Project::find($pid);
    	$att = Att::where('pid',$pid)->first();
    	if(empty($pid)){
    		return redirect('/prolist');
    	}
    	return view('shen',['pro'=>$pro]);

    }
    public function postCheck(Request $req ,$pid){

    	$pro = Project::find($pid);
    	$att = Att::where('pid',$pid)->first();
    	if(empty($pid)){
    		return redirect('/prolist');
    	}
		$pro->title = $req->title; //项目名称
		$pro->hrange = $req->hrange; //借款期限
		$pro->rate = $req->rate; // 百分比
		$pro->status = $req->status; //审核结果

		$att->realname = $req->realname; //真实姓名
		$att->gender = $req->gender; //性别
		$att->age = $req->age; //年龄
		$att->udesc = $req->udesc; //借款人基本信息
		if($pro->save()&&$att->save()){
			return redirect('/prolist');
		}else{
			return 'error';
		}
    	
    }

}
