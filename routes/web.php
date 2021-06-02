<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\user\CustomerController;
use App\Http\Controllers\user\ProductController;
use App\Http\Controllers\user\HomeController;



/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [HomeController::class, 'index']);
Route::get('login', [CustomerController::class, 'login']);
Route::post('login', [CustomerController::class, 'login']);
Route::get('register', [CustomerController::class, 'register']);
Route::post('register', [CustomerController::class, 'register']);
Route::post('addtocart', [ProductController::class, 'add_to_cart'])->name('addtocart');
Route::get('signout', [CustomerController::class, 'signout']);
