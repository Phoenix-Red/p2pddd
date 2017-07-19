<?php

namespace App\Http\Middleware;

use Closure;
use Nette\Mail\Message;
use Nette\Mail\SmtpMailer;
class EmailMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $res = $next($request);
        if($request->user()){
            $mail = new Message;
            $mail->setFrom("点点贷信贷服务系统".' <lxb1322046331@163.com>')
                ->addTo($request->user()->email)
                ->setSubject("尊敬的".$request->user()->name."先生")
                ->setBody("欢迎注册点点贷信贷服务系统.你的手机是".$request->user()->mobile."我们的网址是:ddd.com,欢迎访问");
               

            $mailer = new SmtpMailer([
                    'host' => 'smtp.163.com',
                    'username' => 'lxb1322046331',
                    'password' => 'lxb1322046331'
            ]);
            $mailer->send($mail);
        }
        return $res;
    }
}
