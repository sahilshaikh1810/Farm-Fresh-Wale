<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Session; 
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Variation;
use App\Models\Cart;

class ProductController extends Controller
{
    function loading(Request $req)
    {
        $Product = Product::select('products.product_id ', 'variation.product_id', 'variation.price', 'variation.market_price', 'variation.product_discount', 'products.product_name', 'products.product_image')
        ->join('variation', 'variation.product_id', '=', 'products.product_id')
        ->where('products.product_id', $req->id)->first();
        return json_encode($Product);
    }

    function Add_to_cart(Request $req)
    {
        if ($req->session()->has('customer')) {
            $s  = $req->session()->get('customer');
            if ($req->input('submit')) {
                $product_id  = $req->input('product_id');
                $cart  = new Cart;
                $cart->price = $req->input('price');
                $cart->product_id = $product_id;
                $cart->quantity = 1;
                $cart->save();
                return redirect('/');
            }
        } else {
            return redirect('/');
        }
    }

    public static function cartItem()
    {
        $u = Session::get('customer');
        $uid  = $u->op_id;
        return Cart::where('op_id', $uid)->count();
    }
}
