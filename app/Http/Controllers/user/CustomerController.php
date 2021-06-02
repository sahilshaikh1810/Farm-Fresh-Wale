<?php

namespace App\Http\Controllers\user;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customer;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;


class customerController extends Controller
{
    function login(Request $req)
    {
        if ($req->input('loginSubmit')) {
            $customer = new Customer;
            $mobile = $req->input('mobile');
            $password = $req->input('password');
            $customer = $customer->where('customer_phone', $req->input('mobile'))
            ->where('password', Hash::check($req->input('password'), $customer->password))
            ->first();
            if (!$customer){
                return response()->json(['status' => 'login failed']);
            } else {
                $req->session()->put('customer', $customer);
                return redirect('/');
            }
        }
        return view('user\login');
    }

    function register(Request $req)
    {
        if ($req->input('signupSubmit')) {
            $customer = new Customer;
            $customer->customer_name = 'sahil';
            $customer->forgot_token_date = '0';
            $customer->forgot_token = '0';
            $customer->address = '111';
            $customer->login_token = '111';
            $customer->customer_email = $req->email;
            $customer->customer_phone = $req->mobile;           
            $customer->password =  Hash::make($req->input('password'));
            $customer->password =  Hash::make($req->input('passwordRepeat'));
            $customer->ref_code = $req->referralcode;            
            $customer->save();
            return redirect('login');
        }
            return view('user\register');
    }

    function signout(Request $req)
    {
        if ($req->session()->has('customer')) {
            $req->session()->forget('customer');
            return redirect('/');
        }
    }
}
