@extends('user\master')
@section('content')
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
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="login-modal">
                        <div class="row">
                            <div class="col-lg-6 pad-right-0">
                                <div class="login-modal-left"  style="background: url(user/img/icon.png) center no-repeat   rgba(0, 0, 0, 0); ">
                                </div>
                            </div>
                            <div class="col-lg-6 pad-left-0">
                                <button type="button" class="close close-top-right" data-dismiss="modal" aria-label="Close">
                                 
                                </button>
                                
                                    <div class="login-modal-right">
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="login" role="tabpanel">
                                                <p id="e-arr" style="text-align: center; color: red; font-size: 16px;">
                                                                                                </p>
                                                <form name="loginForm" onsubmit="return validate_login()" method="POST">
                                                @csrf
                                                <h5 class="heading-design-h5">Login to your account</h5>
                                                <fieldset class="form-group">
                                                    <label>Mobile number</label>
                                                    <input class="form-control" name="mobile" type="text" required id="umobile" pattern="[1-9]{1}[0-9]{9}"  placeholder="Mobile No.">
                                                    <!--<input type="text" class="form-control" placeholder="+91 123 456 7890">-->
                                                </fieldset>
                                                <fieldset class="form-group">
                                                    <label>Enter a Password</label>
                           <input class="form-control" type="password" value="" name="password" id="password" placeholder="Password">                         
                                                    <!--<input type="password" class="" placeholder="********">-->
                                                </fieldset>
                                                <fieldset class="form-group">
                                       <input type="submit" class="btn btn-lg btn-secondary btn-block" name="loginSubmit" value="Login"/>
                                                </fieldset>
                                                
                                                <a style="color:blue;" href="forgot-password.html">Forgot Password? Click here</a>     

                                                </form>
                                            </div>
                                            <div class="tab-pane" id="register" role="tabpanel">
                                                
                                                  <p id="err" style="text-align: center; color: red; font-size: 16px;">
                                                                            </p>
                                 <form method="post" action="#" onsubmit="return userregister();">
                                <span id="err1" style="color: #ff0000f2;"></span>
                                                <h5 class="heading-design-h5">Register Now!</h5>
                                                <fieldset class="form-group">
                                                    <label>Enter Email/Mobile number</label>
                                                    <input type="text" class="form-control" placeholder="+91 123 456 7890">
                                                </fieldset>
                                                <fieldset class="form-group">
                                                    <label>Enter Password</label>
                                                    <input type="password" class="form-control" placeholder="********">
                                                </fieldset>
                                                <fieldset class="form-group">
                                                    <label>Enter Confirm Password </label>
                                                    <input type="password" class="form-control" placeholder="********">
                                                </fieldset>
                                                <fieldset class="form-group">
                                                    <button type="submit" class="btn btn-lg btn-secondary btn-block">Create Your Account</button>
                                                </fieldset>
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck2">
                                                    <label class="custom-control-label" for="customCheck2">I Agree with <a href="#">Term and Conditions</a></label>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="text-center login-footer-tab">
                                            <ul class="nav nav-tabs" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link active"  href="{{url('login')}}" role="tab"><i class="mdi mdi-lock"></i> LOGIN</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link"  href="{{url('register')}}" role="tab"><i class="mdi mdi-pencil"></i> REGISTER</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
</html>
@endsection