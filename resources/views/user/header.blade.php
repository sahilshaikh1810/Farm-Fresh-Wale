<?php 
    use Illuminate\Support\Facades\Session;    
    use App\Models\Product;
    use App\Http\Controllers\user\ProductController;
    $uid = Session::get('customer'); 
    $s = Session::get('customer');
    $total = 0;
    if(Session::get('client'))
	{
		$total = ProductController::cartItem();
	}
?>
<nav class="navbar navbar-light navbar-expand-lg   bg-faded fresh_zone-menu" id="top-navbar">
        <div class="container-fluid">
                      
            <a class="navbar-brand" href="{{url('/')}}"> <img   src="user/images/logo.jpeg" alt="logo" class="destop_logo"> 
                <img src="user/images/logo.jpeg" class="mobile_logo" alt="logo">
            </a>

            <button class="navbar-toggler navbar-toggler-white" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>	
  
            <div class="navbar-collapse">
                <div class="navbar-nav mr-auto mt-2 mt-lg-0 margin-auto top-categories-search-main">
                    <div class="top-categories-search">
                         <form action="https://grocery.riffretech.com/products.php" name="searching" method="get">
                        <div class="input-group">
                            <input class="form-control" type="text" name="q" id="search1" value="" style="color:black; border: 1px solid #999;" placeholder="Search">
                            <span class="input-group-btn">
                        <button class="btn btn-secondary"  type="submit" name="submit_search"><i class="mdi mdi-file-find"></i> Search</button>
                        </span>
                        </div>
                         </form>                            
                    </div>
                </div>
                <div class="my-2 my-lg-0">
                    <ul class="list-inline main-nav-right">
                        	@if(!Session::has('customer'))	
                            <li class="list-inline-item">
                            <a href="{{url('login')}}" class="btn btn-link"><i class="mdi mdi-account-circle"></i>Login/Sign Up</a>
                            </li>
                            @else
                            <li class="list-inline-item">
                            <a class="btn btn-link" href="membership.html"  aria-haspopup="true" aria-expanded="false">
                            <i class="mdi mdi-wallet-giftcard" aria-hidden="true"></i>My Wallet</a></li>
                            <li class="list-inline-item cart-btn">
                                <a href="cart.html"  class="btn btn-link border-none"><i class="mdi mdi-cart"></i> My Cart 
                                    <small class="cart-value" id="cartItemQtyId">{{$total}}</small></a>
                            </li>
                            <li class="list-inline-item cart-btn">
                                <a href="wishlist.html"  class="btn btn-link border-none"><i class="mdi mdi-heart"></i> Wishlist <small class="cart-value">
                                0</small></a>
                            </li>
        
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Welcome {{$s->customer_name}}
                            </button>
                            <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Manage Profile </a>
                                    <a class="dropdown-item" href="{{url('signout')}}">Log Out</a>
                            </div>
                            </div>
                    </ul>  
                    @endif                  
                </div>
            </div>
        </div>
    </nav>