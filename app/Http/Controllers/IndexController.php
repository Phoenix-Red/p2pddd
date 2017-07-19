<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Project;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function Index(){
    	$pro = Project::where('status',1)->get();
    	return view('index',['pro'=>$pro]);
    }
}
