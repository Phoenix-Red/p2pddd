<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use Auth;
use Validator;
use App\Project;
use App\Att;
use App\Bid;
use Session;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Gregwar\Captcha\CaptchaBuilder;//验证码
class ProController extends Controller{
  
  /**
    * 借款页面展示
    * @return [type] [description]
    */
    public function jie(){
        return view('woyaojiekuan');
    }

    /**
     * 提交借钱请求
     * @param  Request $req [description]
     * @return [type]       [description]
     */
    public function jiePost(Request $req){
    	//验证用户信息
        // $this->validate($req,
        //     ['age'=>'required|in:15,40,80',
        //     'money'=>'required|digits_between:2,7',
        //     'mobile'=>'required|regex:/^1[3,5,7,8]\d{9}$/',
        //     ],
        //     ['age.required'=>':attribute年龄段必须填写',
        //     'in'=>':attribute年龄必须在指定日期段中',
        //     'money.required'=>':attribute务必填写',
        //     'digits_between'=>':attribute小本生意,金额在2-7位之间',
        //     'mobile.required'=>':attribute请务必输入手机号',
        //     'regex'=>':attribute请填写正确格式的手机号',
        //     ]);
     //手动验证
        $validate = Validator::make($req->all() ,
            ['age'=>'required|in:15,40,80',
            'money'=>'required|digits_between:2,7',
            'mobile'=>'required|regex:/^1[3,5,7,8]\d{9}$/',
            ],
            ['age.required'=>':attribute年龄段必须填写',
            'in'=>':attribute年龄必须在指定日期段中',
            'money.required'=>':attribute务必填写',
            'digits_between'=>':attribute小本生意,金额在2-7位之间',
            'mobile.required'=>':attribute请务必输入手机号',
            'regex'=>':attribute请填写正确格式的手机号',
            ]);
        if($validate->fails()){
            return back()->withErrors($validate)->withInput();
        }
        /*图片验证码类判断*/
        if(strtoupper($req->imgcode) !==strtoupper($req->session()->get('captcha'))) {//不区分大小写
            //用户输入验证码有无误
            return back()->with('msg','图形验证码有误,请重新输入')->withInput();//with中的数据存到session中
        }
        /*短信验证码判断*/
        if($req->verify == ''){
            return back()->with('yzmpd','验证码不可为空!')->withInput();
        }else if($req->verify !== $req->session()->get('yzm')){
            return back()->with('yzmpd','验证码输入错误,请重新输入!')->withInput();
        }
        
        //获取用户信息
    	$user = Auth::user();
    	$user = $req->user();

    	$pro = new Project();
    	$att = new Att();
    	$pro->uid = $user->uid;
    	$pro->name = $user->name;
    	$pro->money = intval($req->money)*100;
    	$pro->mobile = $req->mobile;
    	$pro->pubtime = time();
    	$pro->save();
    	$att->uid = $pro->uid;
    	$att->age = $req->age;
		$att->pid = $pro->pid; //此时可以得到表对象中的任何字段值；
		$att->save();
		return ($pro->save()&&$att->save())?'借钱成功':'借钱失败';
	}

    /**
     * 验证码功能实现
     * @return [type] [description]
     */
    public function captcha(){
        $builder = new CaptchaBuilder;
        $builder->build();//创建图片验证码

        $phrase = $builder->getPhrase();//获取验证码的内容
        Session::flash('captcha', $phrase);//把内容存入session

        header('Content-type: image/jpeg');        
        $builder->output();//直接输出图片验证码
    }

    /**
     * 短信发送功能实现
     */
    public function sm(Request $req){
       //return response()->json(['status'=>$req->all()],200);
        header("Content-Type:text/html;charset=utf-8");
        $money = $req->money;//获取借款金额
        $mobile = $req->mobile; //接受者手机号
        $apikey = "a43221a6be467a935dea8ccb81cc3e7c"; //修改为您的apikey(https://www.yunpian.com)登录官网后获取
       
        $yzm = mt_rand(1000,9999);
        Session::flash('yzm',$yzm);

        $text = "【布尔教育】您的验证码是".$yzm;
        //$text="【布尔教育】您现在正在通过点点贷网贷平台借款".$money."元,您的验证码是".$yzm."如非您本人操作,请忽略此短信并报警.";
        
        $ch = curl_init();
        /* 设置验证方式 */

        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept:text/plain;charset=utf-8', 'Content-Type:application/x-www-form-urlencoded','charset=utf-8'));

        /* 设置返回结果为流 */
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        /* 设置超时时间*/
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);

        /* 设置通信方式 */
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
       
        // 取得用户信息
        $json_data = $this->get_user($ch,$apikey);
        $array = json_decode($json_data,true);
        echo '<pre>';print_r($array);
        
        // 发送短信
        $data=array('text'=>$text,'apikey'=>$apikey,'mobile'=>$mobile);
        $json_data = $this->send($ch,$data);
        
        //解析返回结果
        $array = json_decode($json_data,true);
        echo '<pre>';print_r($array);
        curl_close($ch);
    }
   //获得账户
    function get_user($ch,$apikey){
        curl_setopt ($ch, CURLOPT_URL, 'https://sms.yunpian.com/v2/user/get.json');
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query(array('apikey' => $apikey)));
        return curl_exec($ch);
    }
    //发送短信
    public function send($ch,$data){
        curl_setopt ($ch, CURLOPT_URL, 'https://sms.yunpian.com/v2/sms/single_send.json');
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        return curl_exec($ch);
        } 

    /**
     * 投资页面展示
     */
    public function GetPro($pid){

        $pro = Project::where(['pid'=>$pid,'status'=>1])->first();
        return view('lijitouzi',['pro'=>$pro]);
    }

    /**
     * 投资确认
     * @param [type] $pid [description]
     */
    public function touzi(Request $req,$pid){
        $pro = Project::where('pid',$pid)->first();
        $bid = new Bid();
        $user = Auth::user();
        if($req->money > ($pro->money-$pro->recive)){
            return "金额不能多于所投金额";
        }

        $bid->uid = $user->uid;
        $bid->pid = $pro->pid;
        $bid->title = $pro->title;
        $bid->money = $req->money * 100;
        $bid->pubtime = time();
        $bid->save();

        $pro->recive += $bid->money;
        $pro->save();
        if($pro->recive == $pro->money){
            $this->touziDone($pid);//投资完成
        }
        return redirect('/');
    }

    /**
     * 投资完成
     * @return [type] [description]
     */
    protected function touziDone($pid){
        
        //1修改投资状态
        $pro = Project::find($pid);
        $pro->status = 2;
        $pro->save();

        //2为借款者生成还款记录
        //每月应还钱数 = 利息 + 本金
        $amount = ($pro->money *$pro->rate /1200) + ($pro->money/$pro->hrange);
        $row = ['uid'=>$pro->uid,'pid'=>$pro->pid,'title'=>$pro->title];
        $row['amount'] = $amount;
        $row['status'] = 0;
        $today = date('Y-m-d H:i:s',time());//今天日期
        for($i = 1;$i<=$pro->hrange;$i++){
            $paydate = date('Y-m-d H:i:s',strtotime("+ $i months"));//下月日期
            $row['paydate'] = $paydate;
            DB::table('hks')->insert($row);
        }
        //3为投资者生成收益记录
        $bid = Bid::where('pid',$pid)->get();
        $row = [];
        $row['pid'] = $pid;
        $row['title'] = $pro->title;
        $row['enddate'] = date('Y-m-d h:i:s',strtotime("+ {$pro->hrange} months"));//收益截止日期
        //循环为每位投资者生成预期收益信息
        foreach ($bid as $bid) {
            $row['uid'] = $bid->uid;
            $row['amount'] = $bid->money *$pro->rate /36500;
            DB::table('tasks')->insert($row);
        }
    }
}