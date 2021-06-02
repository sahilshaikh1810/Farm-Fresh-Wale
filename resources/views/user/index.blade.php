@extends('user\master')
@section('content')
<?php
    use App\Models\Category;
    use App\Models\Banner;
    use App\Models\Product;
    use App\Models\Variation;
    use Illuminate\Support\Facades\Session;
    $s = Session::get('customer');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Book My Kart is one of the best grocery online store. Buy your organic favourite grocery online at best price & get deliver within 45 Mines at your doorstep.">
    <meta name="author" content="">
    <title>Book My Kart – Buy Grocery Online</title>
    <!-- Favicon Icon -->
   <link rel="icon" type="image/png" href="{{url('user')}}/img/icon.png">
    <!-- Bootstrap core CSS -->
    <link href="{{url('user')}}/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Icons -->
    <link href="{{url('user')}}/css/materialdesignicons.min.css" media="all" rel="stylesheet" type="text/css" />

    <!-- Select2 CSS -->
    <link href="{{url('user')}}/css/select2-bootstrap.css" />
    <link href="{{url('user')}}/css/select2.min.css" rel="stylesheet" />
    <!-- Custom styles for Grocery -->
    <link href="{{url('user')}}/css/style7b30.css?v=4" rel="stylesheet">
    <script>
    var baseurl='index.html';
    </script>
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="{{url('user')}}/css/owl.carousel.css">
    <link rel="stylesheet" href="{{url('user')}}/css/owl.theme.css">
    <script type="text/javascript" src="{{url('user')}}/js/function7b30.js?v=4"></script>
       <script src="{{url('user')}}/js/jquery.min.js"></script>
       
    <link rel="stylesheet" href="{{url('user')}}/auto/jqueryui/jquery-ui.css">
<script src="{{url('user')}}/auto/jqueryui/jquery-1.10.2.js"></script>
<script src="{{url('user')}}/auto/jqueryui/jquery-ui.js"></script>
<script>
 var jq = $.noConflict(true);
    jq(function () {
        jq("#search1").autocomplete({
            source: "https://grocery.riffretech.com/tags.php",
            minLength: 2,
            select: function (event, ui) {
              
                var value = jq("#search1").val(ui.item.value);
                document.searching.submit();
            }
        });
    });
</script>   
       
<script>
function tooltip(msg,tooltip)
    {
        document.getElementById(tooltip).innerHTML=msg;
        document.getElementById(tooltip).style.display='block';
    }
</script>   

<script>
            var x=document.getElementById("map");
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(savePosition);
    } else { 
         x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function savePosition(position) {
    jQuery.ajax({
        type:"POST",
        url : baseurl+"create-location-session.php",        
        data : { lat: position.coords.latitude, long: position.coords.longitude },
        success:function(response){
            
        }
    });
    
  x.innerHTML = "Latitude: " + position.coords.latitude + 
  "<br>Longitude: " + position.coords.longitude;
}
getLocation();
 function userregister()
{     	
var emailID=document.getElementById('uemail').value;
var new_password=document.getElementById('unew_password').value;
var password_repeat=document.getElementById('upassword_repeat').value;
     if (new_password==''||new_password.length<6){
		document.getElementById('err2').innerHTML="Password should have minimum 6 characters";
		document.getElementById('unew_password').focus();
                return false;
	}
        else if (new_password!=password_repeat){
		document.getElementById('err3').innerHTML="Repeated Password did not match";
		document.getElementById('upassword_repeat').focus();
                return false;
	}
    }
    
    function showReferralCodeField()
    {
        document.getElementById('referral').style.display="none";
        document.getElementById('rererralCodeField').style.display="block";
    }
</script>

    
 <style>
.li_first_child {
    position: relative;
       }
.li_second_child {
    display: none;
    position: absolute;
    width: 100%;
    border-radius: 0 0 2px 2px;
    box-shadow: 0 4px 4px #dcdcdc;
    top: 0;
    left: 100%;
    z-index: 1000;
    float: right;
    min-width: 10rem;
    padding:  0;
    margin: .125rem 0 0;
    font-size: 1rem;
    color: #212529;
    text-align: left;
    list-style: none;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0,0,0,.15);
}
.li_first_child:hover .li_second_child {
    display: block;
}
.li_second_child li a{
    font-size: 13px;
    padding: 5px 14px!important;
    display: block;
}

.li_second_child li a:hover{
    background-color: #f8f9fa;
}
/*ui-autocomplete ui-front ui-menu ui-widget ui-widget-content {*/
/*    display: block !important;*/
/*}*/
.ui-front {
    z-index: 9999;
}
.table-responsive img{height: 80px; max-width: 80px;}
#flash-message{position: fixed; z-index: 2000; background: #ffcc99; padding: 15px; width: auto; display: none; top: 25%; border-radius: 10px; left:15%}
</style>
<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window,document,'script',
'../connect.facebook.net/en_US/fbevents.js');
 fbq('init', '741967812964043'); 
fbq('track', 'PageView');
</script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-157949336-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-157949336-1');
</script>
<noscript>
 <img height="1" width="1" 
src="https://www.facebook.com/tr?id=741967812964043&amp;ev=PageView&amp;noscript=1"/>
</noscript>
<!-- End Facebook Pixel Code -->
</head>
<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>

   
    
    <script>
    function current_location()
    {
      $.ajax({
      type: "POST",
      url: "current_location.php",
      success: function(resultData){
                    //window.location.href=index.php;
       
      }
});   
        
    }
    </script>
    
    
        
    <script>
      // Note: This example requires that you consent to location sharing when
      // prompted by your browser. If you see the error "The Geolocation service
      // failed.", it means you probably did not give permission for the browser to
      // locate you.
      var map, infoWindow;
      function initMap() {
      
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 6
        });
        infoWindow = new google.maps.InfoWindow;

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            var currlat=pos.lat;
            var currlong=pos.lng;
            
            
            
            
          
      $.ajax({
      type: "POST",
      url: "getlonglat.php",
      data:"lat="+currlat+"&long="+currlong,
      success: function(resultData){
                    //window.location.href=index.php;
          
                }
});
                      
            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            infoWindow.open(map);
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDChuwfLK7GNt7wxmkk6aohKHZHS2Q86yQ&amp;callback=initMap">
    </script>
<script src="{{url('user')}}/js/jquery.min.js"></script>
<link rel="stylesheet" href="{{url('user')}}/auto/jqueryui/jquery-ui.css">
<script src="{{url('user')}}/auto/jqueryui/jquery-1.10.2.js"></script>
<script src="{{url('user')}}/auto/jqueryui/jquery-ui.js"></script>
<script>

 var jq = $.noConflict(true);
    jq(function () {
        jq("#search1").autocomplete({
            source: "https://grocery.riffretech.com/tags.php",
            minLength: 2,
            select: function (event, ui) {
              
                var value = jq("#search1").val(ui.item.value);
                document.searching.submit();
            }
        });
    });
</script>   
</head>

<body>
<div id="map" style="display:none;"></div>
   <div id="flash-message"></div>
    <div class="navbar-top bg-success  ">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <a href="#" class="mb-0 text-white">
                    </a>
                </div>
            </div>
        </div>
    </div>

  
   <!--    <div class="modal-backdrop fade show"></div>-->
   <?php
        $Category = Category::all();
   ?>
    <section class="top-category section-padding">
        <div class="container">
            <div class="owl-carousel owl-carousel-category">                                 
            @foreach($Category as $item)
                <div class="item">                    
                    <div class="category-item">
                        <a href="grocery-staples.html">
                            <img class="img-fluid" src="{{url('user')}}/category/1586237530.png" alt="">
                            <h6>{{$item->category_name}}</h6>                            
                        </a>
                    </div>
                </div> 
                @endforeach       
            </div>      
        </div>
    </section>

        <section class="offer-product">
        <?php $Banner  = Banner::all();?>
            @foreach($Banner as $B)
            <div class="container">
                     
            <div class="row no-gutters">               
                <div class="col-md-12">
                      <a href="products.html"><img class="img-fluid" src="{{url('user/uploads/banner/'.$B->banner_image)}}" alt=""></a>
                </div>                             
            </div>
        </div>
        @endforeach
    </section>
 

    <section class="product-items-slider section-padding">
    <div class="container ">
         
            <div class="section-header">
                <h5 class="heading-design-h5">Featured Product <span class="badge badge-primary"></span>
                  <a class="float-right text-secondary" href="products.html">View All</a>
               </h5>
            </div>
            <div class="owl-carousel owl-carousel-featured"> 
            <?php
                $Product = Product::all();
            ?>
            @foreach($Product as $P)           
                <div class="item">
                    <div class="product">                                                
                        <a href="harpic-cistern-block-flushmatic-twin-pine-100g-329.html">
                            <div class="product-header">
                                <span class="badge badge-success">{{$P->product_discount}}</span>
                                <img class="img-fluid" src="{{url('user')}}/product-images/2020/04/29/329/medium/harpic-flushmatic-100g-1.jpg" alt="">
                                <span class="veg text-danger mdi mdi-circle"></span>
                            </div>
                            
                            <div class="product-body">
                                <h5>{{$P->product_name}}</h5>
                            </div>
                        </a>
                            <div class="product-footer">                                              
                                <form action="{{route('addtocart')}}" method="POST">    
                                @if(Session::has('customer'))
								@csrf
                                <input type="hidden" name="product_id" value="{{$P->product_id}}">
                                <input type="hidden" name="price" value="{{$P->price}}">
                                <input  class="btn btn-secondary btn-sm float-right" type="submit" name="submit" value="Add to cart" class="button btn" />    
                                <i class="mdi mdi-cart-outline"></i> Add To Cart</button>                
                                </form>
                                @endif
                                <div id="finc306"    style="display:none;">
                                <div class="input-group float-right"  >
                                <span class="input-group-btn"><button  class="btn btn-theme-round btn-number"  onclick="decrease_quantity(306,'')" type="button">-</button></span>
                                    <div  class="input-number" id="quntb_306">1</div> 
                                        <input type="hidden" name="qty" id="quantity_306" value="1">
                                        <button onclick="increase_quantity(306,'')" class="btn btn-theme-round btn-number" type="button">+</button>                     
                                </div>     
                            </div>    
                              		<p class="offer-price mb-0">&#x20B9 {{$P->price}}<i class="mdi mdi-tag-outline"></i>
                                    <br><span class="regular-price">&#x20B9 {{$P->market_price}} </span></p>                    
                            </div>                                            
                    </div>        
                </div> 
            @endforeach           
            </div>   
            </div>              
    </div>
    </div>
    </section>
       


    <section class="product-items-slider section-padding">
        <div class="container">
            <div class="section-header">
                <h5 class="heading-design-h5">Best products<span class="badge badge-info"></span>
                  <a class="float-right text-secondary" href="products.html">View All</a>
               </h5>
            </div>
            <div class="owl-carousel owl-carousel-featured">
                
                 <div class="item">
                    <div class="product">
                        <a href="isopropyl-alcohol-hand-rub-70-vv-alcohol-based-evaporating-antiseptic-lotion-500-ml-202.html">
                            <div class="product-header">
                                <span class="badge badge-success"></span>
                                <img class="img-fluid" src="{{url('user')}}/product-images/2020/06/02/202/medium/isopropyl-alcohol-hand-rub-70-vv-alcohol-based-evaporating-antiseptic-lotion-500-ml-21591118394.jpg" alt="">
                                <span class="veg text-success mdi mdi-circle"></span>
                            </div>
                            <div class="product-body">
                                <h5></h5>
                            </div>
                               </a>
                            <div class="product-footer">
                                
                            <button type="button" id="badd198"  onclick="add_to_cart('198','')"   class="btn btn-secondary btn-sm float-right"><i class="mdi mdi-cart-outline"></i> Add To Cart</button>

                            <div  id="binc198"    style="display:none;">

                             <div class="input-group float-right" >
                                <span class="input-group-btn"><button  class="btn btn-theme-round btn-number"  onclick="decrease_quantity(198,'')" type="button">-</button></span>
                                <div  class="input-number" id="quntbb_198">1</div> 
                                <input type="hidden" name="qty" id="quantity_198" value="1">
                                <button onclick="increase_quantity(198,'')" class="btn btn-theme-round btn-number" type="button">+</button>         
                          </div>  
                        </div>
                            <p class="offer-price mb-0"> &#x20B9 230<i class="mdi mdi-tag-outline"></i>
                            <br><span class="regular-price">&#x20B9  250</span></p>
                        </div>                     
                    </div>
                </div> 
                
            </div>            
        </div>
    </section>

    <div class="cart-sidebar">
        <div class="cart-sidebar-header">
            <h5>
               My Cart <span class="text-success">(0                                                                                 item)</span> <a data-toggle="offcanvas" class="float-right" href="#"><i class="mdi mdi-close"></i>
               </a>
            </h5>
        </div>
        <div class="cart-sidebar-body">
            <div id="cart-msg"></div>
            
              <div class="cart-list-product">
             	<img src="{{url('user')}}/img/emptycart.png">
         </div>   
            
             
        </div>
        <form action="https://grocery.riffretech.com/login.php" method="post">
                        
                    <input type="hidden" name="discount_amount" id="discount_amount" value="" />
                    <input type="hidden" name="discount_array" id="discount_array" value="" />
                    <input type="hidden" name="cashback" id="cashback" value="" />
        <div class="cart-sidebar-footer">
            <div class="cart-store-details">
                <p>Sub Total <strong class="float-right"><i class="mdi mdi-currency-inr" aria-hidden="true"></i> <span class="price-amount amount" id="total-subtotal">&#x20B9  0/- </span></strong></p>
                <p>Delivery Charges <strong class="float-right text-danger">+ <i class="mdi mdi-currency-inr" aria-hidden="true"></i><span class="price-amount amount" id="net-shipping-charges">Free</span></strong></p>
                <!--<h6>Your total savings <strong class="float-right text-danger"><i class="mdi mdi-currency-inr" aria-hidden="true"></i> 55 (42.31%)</strong></h6>-->
            </div>
              <input type="hidden" name="net-payable" value="0" id="finalConvertedPrice">
            
                <button class="btn btn-secondary btn-lg btn-block text-left" type="submit"><span class="float-left"><i class="mdi mdi-cart-outline"></i> Proceed to Checkout </span><span class="float-right"><strong><i class="mdi mdi-currency-inr" aria-hidden="true"></i><span class="price-amount amount" id="net-payable">&#x20B9  0/-</span></strong> <span class="mdi mdi-chevron-right"></span></span>
                </button>
           
        </div>
        </form>
    </div>
  
    <div style="padding: 5px; text-align: justify; margin: 5px;">  <p>Mycart</p>    </div>
    <!-- Bootstrap core JavaScript -->
 
    <script src="{{url('user')}}/js/bootstrap.min.js"></script>
    <!-- select2 Js -->
    <script src="{{url('user')}}/js/select2.min.js"></script>
    <!-- Owl Carousel -->
    <script src="{{url('user')}}/js/owl.carousel.js"></script>
    <!-- Custom -->
    <script src="{{url('user')}}/js/custom.min.js"></script>
    <div style="position: fixed; bottom: 10px; right: 10px; z-index: 1005;">
        <a href="https://wa.me/"><img src="{{url('user')}}/images/whatapporder.gif" style="max-width: 200px;" /></a>
    </div>
</body>


<!-- Mirrored from grocery.riffretech.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 07 Apr 2021 11:08:31 GMT -->
</html>   
@endsection