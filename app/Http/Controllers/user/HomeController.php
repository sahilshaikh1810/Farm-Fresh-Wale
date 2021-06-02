<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Banner;
use App\Models\Category;

class HomeController extends Controller
{
    function index(Request $req)
    {
        $Category = Category::all();
        $Banner = Banner::all();
        $product = Product::all()	;
        return view('user/index', compact($Category));
    }
}
