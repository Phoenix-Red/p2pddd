<?php
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/
/*首页展示*/
// Route::get('/', function () {
//     return view('index');
// });


/*注册路由*/
Route::get('auth/register', 'Auth\AuthController@getRegister');
Route::post('auth/register', ['middleware'=>'App\Http\Middleware\EmailMiddleware','uses'=>'Auth\AuthController@postRegister']);

/*用户登录*/
Route::get('auth/login', 'Auth\AuthController@getLogin');
Route::post('auth/login', 'Auth\AuthController@postLogin');

/*用户退出*/
Route::get('auth/logout','Auth\AuthController@getLogout');

/*借款路由*/
Route::get('jie','ProController@jie');
Route::post('jie','ProController@jiePost');

/*借款清单路由*/
Route::get('prolist','CheckController@prolist');

/*验证码类路由*/
Route::get('captcha','ProController@captcha');

/*短信验证码路由*/
Route::post('sm','ProController@sm');

/*借款审核路由*/
Route::get('check/{pid}','CheckController@getCheck');
Route::post('check/{pid}','CheckController@postCheck');

/*投资首页展示*/
Route::get('/','IndexController@Index');
Route::get('/home','IndexController@Index');

/*投资页面展示*/
Route::get('pro/{pid}','ProController@GetPro');

/*投资确认*/
Route::post('touzi/{pid}','ProController@touzi');

/*为投资者生成预期收益*/
Route::get('payrun','GrowController@run');

/*为借款者生成还款账单*/
Route::get('myzd','GrowController@myzd');

/*投资者投资账单*/
Route::get('mytz','GrowController@mytz');

/*投资收益账单*/
Route::get('mysy','GrowController@mysy');


Route::get('session','ProController@captcha');