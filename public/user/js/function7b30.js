var xmlHttp;
// JavaScript Document
var error_exists        = 0;
var gift_voucher_filled = 0;
function fill_input(source,destination){
    var txt=document.getElementById(source).innerHTML;
    document.getElementById(destination).value=txt;
    return false;
}
function add_to_list(product_id){ 
    jQuery.ajax({
        type:"POST",
        url : baseurl+"add-to-list.php",        
        data : { product_id: product_id },
        success:function(response){
            if(Number(response.success) == 1){
                document.getElementById("add-to-list-"+product_id).innerHTML='<a href="javascript:void(0);" onclick="remove_from_list(\''+product_id+'\')"><i style="font-size:30px;" class="mdi mdi-delete" aria-hidden="true"></i></a>';
    document.getElementById("flash-message").innerHTML="Item added to My list";
    document.getElementById("flash-message").style.display="block";
    setTimeout(function(){
        document.getElementById("flash-message").style.display="none";
    },2000);
            }
        }
    });
}
function remove_from_list(product_id){
    jQuery.ajax({
        type:"POST",
        url : baseurl+"remove-from-list.php",        
        data : { product_id: product_id },
        success:function(response){
            if(Number(response.success) == 1){
                document.getElementById("add-to-list-"+product_id).innerHTML='<a href="javascript:void(0);" onclick="add_to_list(\''+product_id+'\')"><i style="font-size: 30px;" class="mdi mdi-plus-circle-outline" aria-hidden="true"></i></a>';
    document.getElementById("flash-message").innerHTML="Item removed from My list";
    document.getElementById("flash-message").style.display="block";
    setTimeout(function(){
        document.getElementById("flash-message").style.display="none";
    },2000);
            }
        }
    });
}
/********************** set currency functionality start here *************************/
    function changeCurrency(currency){
        if(currency != ''){
            var xmlHttp = GetXmlHttpObject();
            if (xmlHttp == null) {
                alert("Browser does not support HTTP Request");
                return;
            } else {
                var params = "c_id="+currency;
                var url = baseurl+"currency-change.php"; 
                alert(params);
                xmlHttp.onreadystatechange = function () {
                    if(xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                        window.location.reload();
                    }
                };
                xmlHttp.open("POST", url, true);
                xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                xmlHttp.send(params);
            }
        }
    }
function isNumeric(elem){
	var numericExpression = /^[0-9]+$/;
	if(elem.match(numericExpression)){
		return true;
	}else{
		return false;
	}
}
function echeck(str) {

		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		   return false
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   return false
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    return false
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    return false
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    return false
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    return false
		 }
		
		 if (str.indexOf(" ")!=-1){
		    return false
		 }

 		 return true					
	}
function validate_review()
{
    var myform=document.reviewForm;
    if(myform.title.value.length<10)
    {
        document.getElementById('review_err').innerHTML='Review title can be of 10 characters minimum';
        myform.title.focus();
        return false;
    }
    else if(myform.title.value.length<10)
    {
        document.getElementById('review_err').innerHTML='Review Comments can be of 100 characters minimum';
        myform.comments.focus();
         return false;
    }
    else if(myform.person.value.length<3)
    {
        document.getElementById('review_err').innerHTML='Name can be of 3 characters minimum';
        myform.person.focus();
         return false;
    }
}
function change_email()
{
    document.getElementById("login-tab").innerHTML='<li id="err" style="color:#FF0000;"></li><li><input name="email" placeholder="Email" id="email" type="text" style="float: initial; margin: 0px;" onkeyup="detect_key(event);" class="inn-fo"></li><li><input type="submit" value="CONTINUE" class="inn-save" onclick="check_registration();"></li>';
}
function shortlist(product_id)
{ 
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"shortlist.php";
url=url+"?product_id="+product_id;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     window.location.href="wishlist.php";
	 document.getElementById("shortlist-tab").innerHTML=xmlHttp.responseText;
         //widget('shortlist');
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}

function verify_pin(pin)
{ 
    if(!isNumeric(pin))
        document.getElementById('pin-verifier').innerHTML='<span style="color:#ff0000;">Please Enter a valid pin code</span>'; 
    else if(pin.length<6)
         document.getElementById('pin-verifier').innerHTML='<span style="color:#ff0000;">Pin Code must be of 6 digits.</span>';
else{
    xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"verify-pin.php";
url=url+"?pin="+pin;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
	 if(xmlHttp.responseText=='1')
             document.getElementById('pin-verifier').innerHTML='<span style="color:#009933;">Delivery is available at your location</span>';
         else
             document.getElementById('pin-verifier').innerHTML='<span style="color:#ff0000;">Delivery is not available at your location</span>';
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
 }
}
function get_state(cid)
{
    xmlHttp=GetXmlHttpObject();
    if (xmlHttp==null)
     {
     alert ("Browser does not support HTTP Request");
     return;
     }
     else{
    var url=baseurl+"get-state.php";
    url=url+"?cid="+cid;
    xmlHttp.onreadystatechange=function(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
     { 
             document.getElementById("statelist").innerHTML=xmlHttp.responseText;
     } 
    };
    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);

     }
}
function delivery_addresses()
{ 
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"delivery-address.php";
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     if(xmlHttp.responseText!='0'){
         document.getElementById("existing-address").style.display='block';
	 document.getElementById("existing-address").innerHTML=xmlHttp.responseText;
         document.getElementById("new-address").style.display='none';
         document.getElementById("existing-address-link").style.display='block';
     }
     else
     {
          show_shipping_form();
         document.getElementById('signup-processing').innerHTML='';
         document.getElementById("existing-address-link").style.display='none';
     }
    show_widget('b');
    document.getElementById('link-b').onclick=function(){
                show_widget('b');
            };
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}

function checkout_delivery_addresses()
{ 
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"delivery-address.php";
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     if(xmlHttp.responseText!='0'){
         document.getElementById("existing-address").style.display='block';
	 document.getElementById("existing-address").innerHTML=xmlHttp.responseText;
         document.getElementById("new-address").style.display='none';
         document.getElementById("existing-address-link").style.display='block';
     }
     else
     {
         document.getElementById("existing-address-link").style.display='none';
     }
    
    document.getElementById('link-b').onclick=function(){
                show_widget('b');
            };
            show_widget('c');
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}

function apply_coupon()
{
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	
var coupon=document.getElementById('coupon').value;
var url=baseurl+"apply-coupon.php?code="+coupon;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 {
     var coupon_response=xmlHttp.responseText;
     if(coupon_response=="WrongCode")
     {
         document.getElementById("coupon-err").innerHTML='Invalid Coupon';     
     }
     else if(coupon_response!="WrongCode"){
          var arr=coupon_response.split('#');
          var total_discount=arr[0];
          var offer_type=arr[1];
          if(offer_type=='Instant')
          {
              var cod=arr[2];
          var finalDiscount=arr[5];
              var pid=arr[3];
              var discounts=arr[4];
              document.getElementById('discount_array').value=pid+':'+discounts
//              document.getElementById('discount_array1').value=pid+':'+finalDiscount
              var pid_arr=pid.split(',');
              var disc_arr=discounts.split(',');
//              for(i=0;i<pid_arr.length;i++)
//              {
//                  document.getElementById('charge_amount_'+pid_arr[i]).value=parseInt(document.getElementById('charge_amount_'+pid_arr[i]).value)-parseInt(disc_arr[i]);
//                  document.getElementById('discount_amount_'+pid_arr[i]).value=disc_arr[i];
//                  document.getElementById('checkout_price_'+pid_arr[i]).innerHTML='Rs.'+document.getElementById('charge_amount_'+pid_arr[i]).value+'<br><span class="small-green">Saved:Rs.'+disc_arr[i]+'</span>';
//              }
          
         document.getElementById('coupon-display').innerHTML='You saved Rs. '+total_discount+'. Code applied: '+coupon+' <a href="javascript:void(0);" style="color:blue;" onclick="remove_coupon('+total_discount+');">Remove</a>';
//         var final_amount=document.getElementById('final_amount').value;
         document.getElementById('discount_amount').value=total_discount;
//         document.getElementById('discount_amount1').value=finalDiscount;
         document.getElementById("coupon-err").innerHTML='';
//         document.getElementById('final_amount').value=parseInt(final_amount)-parseInt(finalDiscount);
         document.getElementById('coupon-div').style.display='none';
         var showAmount=document.getElementById('finalConvertedPrice').value;
         document.getElementById('finalConvertedPrice').value=parseInt(showAmount)-parseInt(total_discount);
         //document.getElementById('right-amounts').innerHTML="Rs. "+document.getElementById('final_amount').value;
         document.getElementById('net-payable').innerHTML=parseInt(showAmount)-parseInt(total_discount);
         }
         else if(offer_type=='abandoncart')
         {
             document.getElementById('coupon-display').innerHTML='You saved Rs. '+total_discount+'. Code applied: '+coupon+' <a href="javascript:void(0);" style="color:blue;"  onclick="remove_coupon('+total_discount+');">Remove</a>';
             var final_amount=document.getElementById('final_amount').value;
             document.getElementById('discount_amount').value=total_discount;
//             document.getElementById('final_amount').value=parseInt(final_amount)-parseInt(total_discount);
             document.getElementById('coupon-div').style.display='none';
             var showAmount=document.getElementById('finalConvertedPrice').value;
             document.getElementById('abandon_id').value=arr[2];
             document.getElementById('finalConvertedPrice').value=parseInt(showAmount)-parseInt(total_discount);
             //document.getElementById('right-amounts').innerHTML="Rs. "+document.getElementById('final_amount').value;
             document.getElementById('net-payable').innerHTML=parseInt(showAmount)-parseInt(total_discount); 
         }
         else
         {
             document.getElementById('coupon-display').innerHTML='You earned '+total_discount+' '+offer_type+'. Code applied: '+coupon+' <a href="javascript:void(0);" style="color:blue;" onclick="remove_coupon_cashback();">Remove</a>';
         
         document.getElementById("coupon-err").innerHTML='';
         document.getElementById('cashback').value=parseInt(total_discount);
         document.getElementById('coupon-div').style.display='none';
         
         }

     }
     
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}
function remove_coupon(couponAmount)
{
    //document.getElementById('cod_availornot').value = "";
    document.getElementById("coupon-err").innerHTML='';
    var discount_array=document.getElementById('discount_array').value;
    //var discount_array1=document.getElementById('discount_array1').value;
    if(discount_array!=''){
        var arr=discount_array.split(':');
        var parr=arr[0].split(',');
        
//        var arr1=discount_array1.split(':');
//        var parr1=arr1[0].split(',');
//        for(i=0;i<parr.length;i++)
//        {
//            document.getElementById('charge_amount_'+parr[i]).value=parseInt(document.getElementById('charge_amount_'+parr[i]).value)+parseInt(document.getElementById('discount_amount_'+parr[i]).value);
//            document.getElementById('discount_amount_'+parr[i]).value='0';
//            document.getElementById('checkout_price_'+parr[i]).innerHTML='Rs.'+document.getElementById('charge_amount_'+parr[i]).value;
//        }
    }
    document.getElementById('coupon').value='';
    if(document.getElementById('discount_amount').value=='')
    {
        document.getElementById('discount_amount').value='0';
        //document.getElementById('discount_amount1').value='0';
    }
    document.getElementById('finalConvertedPrice').value=parseInt(document.getElementById('finalConvertedPrice').value)+parseInt(document.getElementById('discount_amount').value);
    document.getElementById('discount_amount').value='';
    //document.getElementById('discount_amount1').value='';
    //document.getElementById('right-amounts').innerHTML="Rs. "+document.getElementById('final_amount').value;
    document.getElementById('finalConvertedPrice').value;
    document.getElementById('net-payable').innerHTML=parseInt(document.getElementById('finalConvertedPrice').value);
    document.getElementById('coupon-div').style.display='block';
    document.getElementById('coupon-display').innerHTML='Enter your coupon code if you have one.';
    //document.getElementById('coupon-display').innerHTML='HAVE A PROMO CODE?';
    document.getElementById('discount_array').value='';
    //document.getElementById('discount_array1').value='';
    //document.getElementById('net-payable').value=parseInt(document.getElementById('net-payable').value)+parseInt(couponAmount);
//     var final_amount=document.getElementById('final_amount').value;
//        var max_cod_amount=document.getElementById('max_cod_amount').value;
//        if(final_amount<=max_cod_amount)
//          {
//              document.getElementById('cod_link').onclick=function(){
//                show_option('cod');
//            };
//          }
//          apply_gift_voucher_cart_update();
}
function remove_coupon_cashback()
{
    document.getElementById("coupon-err").innerHTML='';
    document.getElementById('cashback').value='0';
    document.getElementById('coupon-div').style.display='block';
    document.getElementById('coupon-display').innerHTML='HAVE A PROMO CODE?';
}
function detect_key(e)
{
var code = (e.keyCode ? e.keyCode : e.which);
 if(code == 13) { //Enter keycode
   check_registration();
 }
}
function detect_pinkey(e,pin)
{
var code = (e.keyCode ? e.keyCode : e.which);
 if(code == 13) { //Enter keycode
   verify_pin(pin);
 }
}
function detect_price(e,uri)
{
var code = (e.keyCode ? e.keyCode : e.which);
 if(code == 13) { //Enter keycode
   filter(uri);
 }
}
function detect_passkey(e)
{
var code = (e.keyCode ? e.keyCode : e.which);
 if(code == 13) { //Enter keycode
   login();
 }
}
function detect_regkey(e)
{
var code = (e.keyCode ? e.keyCode : e.which);
 if(code == 13) { //Enter keycode
   signup();
 }
}
function detect_couponkey(e)
{
var code = (e.keyCode ? e.keyCode : e.which);
 if(code == 13) { //Enter keycode
   apply_coupon();
 }
}
function detect_deliverykey(e)
{
var code = (e.keyCode ? e.keyCode : e.which);
 if(code == 13) { //Enter keycode
   save_details();
 }
}
function submit_order(mode)
{ 
    document.getElementById('payment_mode').value=mode;
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
var cart_items=document.getElementById('order_items').value;
var cart_quantity=document.getElementById('final_quantity').value;
var url=baseurl+"submit-order.php";
var url_vars="mode="+mode+"&cart_items="+cart_items+"&cart_quantity="+cart_quantity;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     var verified=xmlHttp.responseText;
     if(verified=='ok')
     {
         document.finalize_payment.submit();
     }
     else
     {
         var arr=verified.split(',');
         for(i=0;i<arr.length;i++)
         {
             document.getElementById('cart-err').innerHTML='Items marked in red are sold out. Kindly remove them or reduce quantity to continue.';
             document.getElementById('checkout_cart_div_'+arr[i]).className="err";
         }
     }
 } 
};
xmlHttp.open("POST",url,true);
xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlHttp.send(url_vars);
 }
}


function check_registration()
{ 
    	
var emailID=document.getElementById('email').value;
if (emailID==null||emailID==""){
		document.getElementById('err').innerHTML="Please Enter valid email to continue";
		emailID.focus();
		
	}
	else if (echeck(emailID)==false){
		document.getElementById('err').innerHTML="Please Enter valid email to continue";
		emailID.focus();
		
	}
        else{
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{

var url=baseurl+"check-registration.php";
var url_vars="email="+emailID;
xmlHttp.onreadystatechange=function(){
 if (xmlHttp.readyState==1)
 { 
     document.getElementById('signup-processing').innerHTML='<img src="'+baseurl+'admin/images/loading.gif" /> Verifying Details...';
     
 }
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     document.getElementById("login-tab").innerHTML=xmlHttp.responseText;
 } 
};
xmlHttp.open("POST",url,true);
xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlHttp.send(url_vars);
 
 }
        }
}

function login()
{ 
    	
var emailID=document.getElementById('email').value;
var password=document.getElementById('password').value;
if (emailID==null||emailID==""){
		document.getElementById('err').innerHTML="Please Enter valid email to continue";
		document.getElementById('email').focus();
		
	}
	else if (echeck(emailID)==false){
		document.getElementById('err').innerHTML="Please Enter valid email to continue";
		document.getElementById('email').focus();
		
	}
        else if (password==''||password.length<6){
		document.getElementById('err').innerHTML="Password should have minimum 6 characters";
		document.getElementById('password').focus();
		
	}
        else{
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{

var url=baseurl+"check-login.php";
var url_vars="email="+emailID+"&password="+password;
xmlHttp.onreadystatechange=function(){
 if (xmlHttp.readyState==1)
 { 
     document.getElementById('login-button').className="inn-disabled";
     document.getElementById('signup-processing').innerHTML='<img src="'+baseurl+'admin/images/loading.gif" /> Logging in...';
     
 }
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     var response=xmlHttp.responseText;
     if(response=='Wrong')
         document.getElementById('err').innerHTML='Wrong Password';
     else{
         var arr=response.split('#');
         var userid=arr[0];
         var username=arr[1];
         document.getElementById('err').innerHTML='';
        document.getElementById("login-tab").innerHTML='<li>Welcome '+username+'</li><li>Not Your Account? <a href="'+baseurl+'/logout.php">Sign Out</a></li>';
        delivery_addresses();
        window.location.reload();
    }
    document.getElementById('login-button').className="inn-save";
     document.getElementById('signup-processing').innerHTML='';
 } 
};
xmlHttp.open("POST",url,true);
xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlHttp.send(url_vars);
 
 }
        }
}

//for mobile
function update_cart_increase(product_id)
{ 
  var qua = parseInt(document.getElementById('quantity_'+product_id).value, 10);
  qua = isNaN(qua) ? 0 : qua;
  var quantity=qua+1;
    if(quantity==''||quantity==0||isNaN(quantity)){
        quantity=1;
        document.getElementById('quantity_'+product_id).value=1;
    }
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
var url=baseurl+"update-cart.php";
url=url+"?product_id="+product_id+"&quantity="+quantity;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     var response=xmlHttp.responseText;
     if(response!=''&&response.indexOf('#--#')!=-1)
     {
        
         var arr=response.split('#--#');
         var subtotal=arr[0];
         var savings=arr[1];
         var shipping=arr[2];
         var net_shipping=arr[3];
         var net_payable=arr[4]; 
         var currency_code  =arr[6];
         document.getElementById('price_'+product_id).innerHTML=currency_code+' '+(subtotal-shipping)+'<br>';
         if(shipping==0)
             document.getElementById('delivery_'+product_id).innerHTML="Free Delivery";
         else
             document.getElementById('delivery_'+product_id).innerHTML=currency_code+' '+shipping+" Shipping Charges"; 
         document.getElementById('net-payable').innerHTML="Rs."+net_payable+"/-";
         if(net_shipping>0)
         document.getElementById('net-shipping-charges').innerHTML=currency_code+' '+net_shipping+'/- only';
         else
             document.getElementById('net-shipping-charges').innerHTML='Delivery Charges: Free';
          if(arr.length=='8'){
              document.getElementById('cart-msg').style.color='red';
             document.getElementById('cart-msg').innerHTML='Only '+arr[7]+' units are available.';
              document.getElementById('quantity_'+product_id).value=arr[7];
         }
         else{
         document.getElementById('quantity_'+product_id).value=quantity;
         document.getElementById('cart-msg').style.color='green';
         document.getElementById('cart-msg').innerHTML='Cart Updated';
        }        
     }	
//     window.location.href="cart.php";
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null); 
 }
}
function update_cart_decrease(product_id)
{ 
  var qua = parseInt(document.getElementById('quantity_'+product_id).value, 10);
  qua = isNaN(qua) ? 0 : qua;
  var quantity=qua-1;
    if(quantity==''||quantity==0||isNaN(quantity)){
        quantity=1;
        document.getElementById('quantity_'+product_id).value=1;
    }
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
var url=baseurl+"update-cart.php";
url=url+"?product_id="+product_id+"&quantity="+quantity;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     var response=xmlHttp.responseText;
     if(response!=''&&response.indexOf('#--#')!=-1)
     {

         
         var arr=response.split('#--#');
         var subtotal=arr[0];
         var savings=arr[1];
         var shipping=arr[2];
         var net_shipping=arr[3];
         var net_payable=arr[4]; 
         var currency_code  =arr[6];
         document.getElementById('price_'+product_id).innerHTML=currency_code+' '+(subtotal-shipping)+'<br>';
         if(shipping==0)
             document.getElementById('delivery_'+product_id).innerHTML="Free Delivery";
         else
             document.getElementById('delivery_'+product_id).innerHTML=currency_code+' '+shipping+" Shipping Charges"; 
         document.getElementById('net-payable').innerHTML="Rs."+net_payable+"/-";
         if(net_shipping>0)
         document.getElementById('net-shipping-charges').innerHTML=currency_code+' '+net_shipping+'/- only';
         else
             document.getElementById('net-shipping-charges').innerHTML='Delivery Charges: Free';
          if(arr.length=='8'){
              document.getElementById('cart-msg').style.color='red';
             document.getElementById('cart-msg').innerHTML='Only '+arr[7]+' units are available.';
              document.getElementById('quantity_'+product_id).value=arr[7];
             
         }
         else{
         document.getElementById('quantity_'+product_id).value=quantity;
         document.getElementById('cart-msg').style.color='green';
         document.getElementById('cart-msg').innerHTML='Cart Updated';
        } 
              
     }	 
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null); 
 }
}
function get_state(cid)
{
    xmlHttp=GetXmlHttpObject();
    if (xmlHttp==null)
     {
     alert ("Browser does not support HTTP Request");
     return;
     }
     else{
    var url=baseurl+"get-state.php";
    url=url+"?cid="+cid;
    xmlHttp.onreadystatechange=function(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
     { 
             document.getElementById("statelist").innerHTML=xmlHttp.responseText;
     } 
    };
    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);

     }
}
function save_details()
{ 
var name=document.getElementById('person_name').value;    	
var pincode=document.getElementById('pincode').value;
var shipping_address=document.getElementById('shipping_address').value;
var landmark=document.getElementById('landmark').value;
var city=document.getElementById('city').value;
var state=document.getElementById('state').value;
var phone=document.getElementById('phone').value;
var country=document.getElementById('country').value;
if(name.trim().length<3)
{
    document.getElementById('err_msg').innerHTML='Name must contain 3 characters minimum';
    document.getElementById('person_name').focus();
}
else if(phone.trim().length<10||phone.trim().length>10||!isNumeric(phone))
{
    document.getElementById('err_msg').innerHTML='Please Enter 10 digit valid mobile number';
    document.getElementById('phone').focus();
}
else if(state=='')
{
    document.getElementById('err_msg').innerHTML='Please Select State/Province';
    document.getElementById('state').focus();
}
else if(city.trim().length<3)
{
    document.getElementById('err_msg').innerHTML='City must contain a minimum of 3 characters';
    document.getElementById('city').focus();
}
else if(shipping_address.trim().length<6)
{
    document.getElementById('err_msg').innerHTML='Address must contain a minimum of 6 characters';
    document.getElementById('shipping_address').focus();
}
else if(pincode.trim().length<6||pincode.trim().length>6||!isNumeric(pincode))
{
    document.getElementById('err_msg').innerHTML='Pin code must be 6 digit number';
    document.getElementById('pincode').focus();
}
        else{
            
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{

var url=baseurl+"save-details.php";
var url_vars="person="+name+"&pincode="+pincode+"&shipping_address="+shipping_address+"&landmark="+landmark+"&city="+city+"&state="+state+"&phone="+phone+"&country="+country;
xmlHttp.onreadystatechange=function(){
    if (xmlHttp.readyState==1)
 { 
//     document.getElementById('save-delivery').className="inn-disabled";
//     document.getElementById('signup-processing').innerHTML='<img src="'+baseurl+'admin/images/loading.gif" /> Saving Details...';
 }
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 {      
     var response=xmlHttp.responseText;
  
     if(response=='NameEmpty')
         document.getElementById('err_msg').innerHTML='Name must contain minimum 3 characters';
     else if(response=='InvalidName')
         document.getElementById('err_msg').innerHTML='Name can not contain special characters';
     else if(response=='InvalidPIN')
         document.getElementById('err_msg').innerHTML='Pin code must be 6 digit number';
      else if(response=='UnacceptablePIN')
         document.getElementById('err_msg').innerHTML='Service not available at your location';
     else if(response=='InvalidAddress')
         document.getElementById('err_msg').innerHTML='Address must contain minimum 6 characters';
     else if(response=='InvalidCity')
         document.getElementById('err_msg').innerHTML='City name must contain minimum 3 characters';
     else if(response=='InvalidState')
         document.getElementById('err_msg').innerHTML='State can not be blank';
     else{
         document.getElementById('err_msg').innerHTML='';
         document.getElementById('existing_address').innerHTML=response;
         document.getElementById('existing_address').style.display="block";
         document.getElementById('diff_add').innerHTML="<input type=\"submit\" value=\"Continue\" >";
         document.getElementById('new-address').style.display="none";
         
         //checkout_delivery_addresses();
         
    }
//    else {
//        document.getElementById('err_msg').innerHTML='Some error encountered.';
//    }
//    document.getElementById('save-delivery').className="inn-save";
//     document.getElementById('signup-processing').innerHTML='';
    
 } 
};
xmlHttp.open("POST",url,true);
xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlHttp.send(url_vars);
 
 }
        }
}


function save_details1()
{ 
var name=document.getElementById('person_name').value;    	
//var pincode=document.getElementById('pincode').value;
var shipping_address=document.getElementById('par').innerHTML;
var landmark=document.getElementById('landmark').value;
//var city=document.getElementById('city').value;
//var state=document.getElementById('state').value;
var phone=document.getElementById('phone').value;

if(name.trim().length<3)
{
    document.getElementById('err_msg').innerHTML='Name must contain 3 characters minimum';
    document.getElementById('person_name').focus();
}
else if(phone.trim().length<10||phone.trim().length>10||!isNumeric(phone))
{
    document.getElementById('err_msg').innerHTML='Please Enter 10 digit valid mobile number';
    document.getElementById('phone').focus();
}
//else if(state=='')
//{
//    document.getElementById('err_msg').innerHTML='Please Select State/Province';
//    document.getElementById('state').focus();
//}
//else if(city.trim().length<3)
//{
//    document.getElementById('err_msg').innerHTML='City must contain a minimum of 3 characters';
//    document.getElementById('city').focus();
//}
//else if(shipping_address.trim().length<6)
//{
//    document.getElementById('err_msg').innerHTML='Address must contain a minimum of 6 characters';
//    document.getElementById('shipping_address').focus();
//}
//else if(pincode.trim().length<6||pincode.trim().length>6||!isNumeric(pincode))
//{
//    document.getElementById('err_msg').innerHTML='Pin code must be 6 digit number';
//    document.getElementById('pincode').focus();
//}
        else{
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 else{

var url=baseurl+"save-details.php";
//var url_vars="person="+name+"&pincode="+pincode+"&shipping_address="+shipping_address+"&landmark="+landmark+"&city="+city+"&state="+state+"&phone="+phone+"&country=India";
var url_vars="person="+name+"&landmark="+landmark+"&phone="+phone+"&country=India&shipping_address="+shipping_address;
xmlHttp.onreadystatechange=function(){
    if (xmlHttp.readyState==1)
 { 
//     document.getElementById('save-delivery').className="inn-disabled";
//     document.getElementById('signup-processing').innerHTML='<img src="'+baseurl+'admin/images/loading.gif" /> Saving Details...';
 }
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 {     
     
    //  window.location.href="checkout.php";
    var response=xmlHttp.responseText;
  
    
    if(response=='Service not available at your location')
    {
       document.getElementById('err_msg1').innerHTML='Service not available at your location';  
    }
    else if(response=='NameEmpty')
        document.getElementById('err_msg').innerHTML='Name must contain minimum 3 characters';
    else if(response=='InvalidName')
        document.getElementById('err_msg').innerHTML='Name can not contain special characters';
//    else if(response=='Pin Must be 6 digit')
//        document.getElementById('err_msg').innerHTML='Pin code must be 6 digit number';
//    else if(response=='Select State Name')
//         document.getElementById('err_msg').innerHTML='State can not be blank';
      else if(response=='Invalid Phone No')
         document.getElementById('err_msg').innerHTML='Invalid phone number';
     else if(!document.getElementById("manage")){
         window.location.href="checkout.php"; 
     }
         else
         {
           window.location.href="manage-address.php";     
         }
    
    
 } 
};
xmlHttp.open("POST",url,true);
xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlHttp.send(url_vars);
 
 }
        }
}



function signup()
{ 
    	
var emailID=document.getElementById('email').value;
var new_password=document.getElementById('new_password').value;
var password_repeat=document.getElementById('password_repeat').value;
if (emailID==null||emailID==""){
		document.getElementById('err').innerHTML="Please Enter valid email to continue";
		document.getElementById('email').focus();
		
	}
	else if (echeck(emailID)==false){
		document.getElementById('err').innerHTML="Please Enter valid email to continue";
		document.getElementById('email').focus();
		
	}
        else if (new_password==''||new_password.length<6){
		document.getElementById('err').innerHTML="Password should have minimum 6 characters";
		document.getElementById('new_password').focus();	
	}
        else if (new_password!=password_repeat){
		document.getElementById('err').innerHTML="Repeated Password did not match";
		document.getElementById('password_repeat').focus();	
	}
        else{
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{

var url=baseurl+"signup.php";
var url_vars="email="+emailID+"&newpass="+new_password+"&repeatpass="+password_repeat;
xmlHttp.onreadystatechange=function(){
 if (xmlHttp.readyState==1)
 { 
     document.getElementById('signup-button').className="inn-disabled";
     document.getElementById('signup-processing').innerHTML='<img src="'+baseurl+'admin/images/loading.gif" /> Saving Details...';
 }
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
      var response=xmlHttp.responseText;
      if(response=='WrongEmail')
      {
          document.getElementById('err').innerHTML='Please enter correct email address';
      }
      else  if(response=='WrongPassword')
      {
          document.getElementById('err').innerHTML='Please enter 6 characters password';
      }
       else  if(response=='EmailExists')
      {
          document.getElementById('err').innerHTML='Email Id already exists';
      }
      else  if(response=='NoPasswordMatch')
      {
          document.getElementById('err').innerHTML='Passwords did not match';
      }
     else{
        var arr=response.split('#');
         var userid=arr[0];
         var username=arr[1];
         document.getElementById('err').innerHTML='';
        document.getElementById("login-tab").innerHTML='<li>Welcome '+username+'</li><li>Not Your Account? <a href="'+baseurl+'/logout.php">Sign Out</a></li>';
        document.getElementById("existing-address-link").style.display='none';
        document.getElementById('link-b').onclick=function(){
                show_widget('b');
            };
        show_widget('b');
        
    }
    document.getElementById('signup-button').className="inn-save";
     document.getElementById('signup-processing').innerHTML='';
 } 
};
xmlHttp.open("POST",url,true);
xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlHttp.send(url_vars);
 
 }
        }
}

function quick_view(product_id)
{ 
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"quick-view.php";
url=url+"?product_id="+product_id;
xmlHttp.onreadystatechange=function(){
    if(xmlHttp.readyState==1){
	document.getElementById("quick-view-box").style.display='block';
        document.getElementById("lightbox-shadow").style.display='block';
}
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
	 document.getElementById("quick-view-box").innerHTML=xmlHttp.responseText;
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}
function detect_deliverykey_profile(e)
{
    
var code = (e.keyCode ? e.keyCode : e.which);
 if(code == 13) { //Enter keycode
   update_profile();
 }
}

 function update_profile()
{ 
   
var name=document.getElementById('person_name').value;    	
var email=document.getElementById('email').value;

var phone=document.getElementById('phone').value;
if(name.trim().length<3)
{
    document.getElementById('err_msg').innerHTML='Name must contain 3 characters minimum';
    document.getElementById('person_name').focus();
}


else if(phone.trim().length<10||phone.trim().length>10||!isNumeric(phone))
{
    document.getElementById('err_msg').innerHTML='Please Enter 10 digit valid mobile number';
    document.getElementById('phone').focus();
}
        else{
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
console.log(baseurl);
var url=baseurl+"update-profile.php";
var url_vars="person="+name+"&email="+email+"&phone="+phone;
xmlHttp.onreadystatechange=function(){
    if (xmlHttp.readyState==1)
 { 
     document.getElementById('save-delivery').className="inn-disabled";
     document.getElementById('signup-processing').innerHTML='<img src="'+baseurl+'admin/images/loading.gif" /> Saving Details...';
 }
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     
     var response=xmlHttp.responseText;
     if(response=='NameEmpty')
         document.getElementById('err_msg').innerHTML='Name must contain minimum 3 characters';
     else if(response=='InvalidName')
         document.getElementById('err_msg').innerHTML='Name can not contain special characters';
     else if(response=='InvalidPhone')
         document.getElementById('err_msg').innerHTML='Phone number should be 10 characters';
     
     else if(isNumeric(response)){
         document.getElementById('err_msg').innerHTML='Updated successfully';
       // window.location="manage-addresses.php";
         
    }
     
    else {
        document.getElementById('err_msg').innerHTML='Some error encountered.';
    }
    document.getElementById('save-delivery').className="inn-save";
     document.getElementById('signup-processing').innerHTML='';
    
 } 
};
xmlHttp.open("POST",url,true);
xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlHttp.send(url_vars);
 
}
}
}
function view_cart()
{ 
    document.getElementById('shipment').style.display='none';
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"view-cart.php";
xmlHttp.onreadystatechange=function(){
    if(xmlHttp.readyState==1){
	document.getElementById("view-cart-box").style.display='block';
        document.getElementById("lightbox-shadow").style.display='block';
}
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
	 document.getElementById("view-cart-box").innerHTML=xmlHttp.responseText;
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}
function get_state_mobile(cid)
{
    xmlHttp=GetXmlHttpObject();
    if (xmlHttp==null)
     {
     alert ("Browser does not support HTTP Request");
     return;
     }
     else{
    var url=baseurl+"get-state-mobile.php";
    url=url+"?cid="+cid;
    xmlHttp.onreadystatechange=function(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
     { 
             document.getElementById("statelist").innerHTML=xmlHttp.responseText;
     } 
    };
    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);

     }
}
function review_helpful(review_id,feedback)
{ 
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"review-helpful.php?review_id="+review_id+'&feedback='+feedback;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
	 document.getElementById("review_counter_"+review_id).innerHTML=xmlHttp.responseText;
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}

function login_form()
{ 
    document.getElementById('shipment').style.display='none';
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"login-form.php";
xmlHttp.onreadystatechange=function(){
    if(xmlHttp.readyState==1){
	document.getElementById("view-cart-box").style.display='block';
        document.getElementById("lightbox-shadow").style.display='block';
}
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
	 document.getElementById("view-cart-box").innerHTML=xmlHttp.responseText;
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}

function close_quick_view()
{
    document.getElementById("quick-view-box").style.display='none';
    document.getElementById("lightbox-shadow").style.display='none';
    document.getElementById("quick-view-box").innerHTML='';
}
function close_view_cart()
{
    document.getElementById("view-cart-box").style.display='none';
    document.getElementById("lightbox-shadow").style.display='none';
    document.getElementById("view-cart-box").innerHTML='';
}
function widget_display(id)
{ 
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	
            if(id=='recent')
            {
                var url=baseurl+"recent-display.php";
            }
            else if(id=='comparables')
            {
                var url=baseurl+"comparison-display.php";
            }
            else if(id=='shortlist')
            {
                var url=baseurl+"shortlist-display.php";
            }
            else if(id=='recommended')
            {
                var url=baseurl+"recommended-display.php";
            }

xmlHttp.onreadystatechange=function(){
    if(xmlHttp.readyState==1){
        document.getElementById(id).style.display='block';
    }
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
	 document.getElementById(id).innerHTML=xmlHttp.responseText;
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}
function add_to_cart(product_id,page)
{
   xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"add-to-cart.php";
url=url+"?product_id="+product_id;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     if(xmlHttp.responseText!='')
	 document.getElementById("cartItemQtyId").innerHTML=xmlHttp.responseText;
  //  if(page==undefined){
  //     	window.location.href="cart.php"; 
  // } else {
 	// window.location.href=page; 
  //   }
    

   var    a =document.getElementById('finc'+product_id);
     var    b =document.getElementById('ninc'+product_id);
       var    c =document.getElementById('binc'+product_id);


   var    d =document.getElementById('fadd'+product_id);
     var    e =document.getElementById('nadd'+product_id);
       var    f =document.getElementById('badd'+product_id);

    if(a){
       document.getElementById("finc"+product_id).style.display='block'; 
    }
     if(d){
   document.getElementById("fadd"+product_id).style.display='none'; 
}
if(b){
  document.getElementById("ninc"+product_id).style.display='block'; 
}
if(e){
   document.getElementById("nadd"+product_id).style.display='none'; 
}
if(c){
     document.getElementById("binc"+product_id).style.display='block'; 
}

if(f){
   document.getElementById("badd"+product_id).style.display='none'; 
}

   //   document.getElementById("quantaa"+product_id).style.display='block'; 
   // document.getElementById("addaa"+product_id).style.display='none'; 
   //   document.getElementById("quantaa"+product_id).style.display='block'; 
   // document.getElementById("addaa"+product_id).style.display='none'; 
    
    
    
    
    
    
    
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}
function show_shipment(order_item_id)
{ 
    widget_close();
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"track-shipment.php";
url=url+"?order_item_id="+order_item_id;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     document.getElementById("shipment").style.display='block';
     if(xmlHttp.responseText!='')
	 document.getElementById("shipment").innerHTML=xmlHttp.responseText;
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}

function cart_update()
{
    widget_close();
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"check-cart.php";
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     var str=xmlHttp.responseText;
     var arr=str.split(':');
     document.getElementById('order_items').value=arr[0];
     document.getElementById('final_quantity').value=arr[1];
     apply_gift_voucher_cart_update();
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}

function remove_from_cart(product_id)
{ 
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"remove-from-cart.php";
url=url+"?product_id="+product_id;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     if(xmlHttp.responseText!='')
     document.getElementById("cartItemQtyId").innerHTML=xmlHttp.responseText;



    

   var    a =document.getElementById('finc'+product_id);
     var    b =document.getElementById('ninc'+product_id);
       var    c =document.getElementById('binc'+product_id);


   var    d =document.getElementById('fadd'+product_id);
     var    e =document.getElementById('nadd'+product_id);
       var    f =document.getElementById('badd'+product_id);

    if(a){
       document.getElementById("finc"+product_id).style.display='none'; 
    }
     if(d){
   document.getElementById("fadd"+product_id).style.display='block'; 
}
if(b){
  document.getElementById("ninc"+product_id).style.display='none'; 
}
if(e){
   document.getElementById("nadd"+product_id).style.display='block'; 
}
if(c){
     document.getElementById("binc"+product_id).style.display='none'; 
}

if(f){
   document.getElementById("badd"+product_id).style.display='block'; 
}




     
//     if(xmlHttp.responseText!='')
//     {
//         document.getElementById('cart_product_'+product_id).style.display='none';
//         var response=xmlHttp.responseText;
//         var arr=response.split('#');
//         var total_products=arr[0];
//         var net_shipping=arr[1];
//         var net_payable=arr[2];
//         document.getElementById('net-payable').innerHTML="Payable Amount: Rs."+net_payable+"/-";
//         if(net_shipping>0)
//         document.getElementById('net-shipping-charges').innerHTML='Delivery Charges: Rs.'+net_shipping+'/- only';
//         else
//             document.getElementById('net-shipping-charges').innerHTML='Delivery Charges: Free';
//         document.getElementById('cartItemQtyId').innerHTML=total_products;
//         document.getElementById('productTotal').innerHTML=total_products;
//         document.getElementById('cartTotal').innerHTML=total_products;
//         if(total_products==0)
//             document.getElementById('full-cart').innerHTML='<div style="padding:15px;">0 items in the cart</div>';
//     }
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}

function remove_from_checkout_cart(product_id)
{ 
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"remove-from-cart.php";
url=url+"?product_id="+product_id;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 {  
     if(xmlHttp.responseText!='')
     {        
         document.getElementById('checkout_cart_product_'+product_id).style.display='none';
         var response=xmlHttp.responseText;
         var arr=response.split('#');
         var total_products=arr[0];
         var net_shipping=arr[1];
         var net_payable=arr[2];
         remove_coupon();
         document.getElementById('right-amounts').innerHTML="Rs. "+net_payable;
         document.getElementById('left-amount').innerHTML=net_payable;
         document.getElementById('final_amount').value=net_payable;
         document.getElementById('checkout_cartTotal').innerHTML=total_products;
         
         cart_update();
         if(net_payable==0)
             window.location.href=baseurl;
      
     }
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}

function update_cart(product_id,quantity,page)
{ 
   
    if(quantity==''||quantity==0||isNaN(quantity)){
        quantity=1;
        document.getElementById('quantity_'+product_id).value=1;
        
    }
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{


var url=baseurl+"update-cart.php";
url=url+"?product_id="+product_id+"&quantity="+quantity;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
    var response=xmlHttp.responseText;
     if(response!=''&&response.indexOf('#--#')!=-1)
     {
      
         //remove_coupon();
         var arr=response.split('#--#');
         var subtotal=arr[0];
         var savings=arr[1];
         var shipping=arr[2];
          var quantity=arr[3];
         var net_shipping=arr[4];
         var net_payable=arr[5];
         var currency_code=arr[7];
          var    p =document.getElementById('price_'+product_id);
          if(p){
         document.getElementById('price_'+product_id).innerHTML=''+currency_code+' '+subtotal;
                }
         if(shipping==0){
              var    d =document.getElementById('delivery_'+product_id);
          if(d){
             document.getElementById('delivery_'+product_id).innerHTML="Free Delivery";
         }
         }
         else
             document.getElementById('delivery_'+product_id).innerHTML="+ "+currency_code+' '+shipping+" Shipping Charges"; 
         document.getElementById('net-payable').innerHTML=""+currency_code+' '+net_payable+"/-";
         if(net_shipping>0)
         {
             document.getElementById('total-subtotal').innerHTML=''+currency_code+' '+(net_payable-net_shipping)+'/-';
         document.getElementById('net-shipping-charges').innerHTML=''+currency_code+' '+net_shipping+'/-';
            }
         else
         {
             document.getElementById('net-shipping-charges').innerHTML='Free Delivery';
             document.getElementById('total-subtotal').innerHTML=''+currency_code+' '+(net_payable-net_shipping)+'/-';
         }
          if(arr.length=='9'){
              document.getElementById('cart-msg').style.color='red';
             document.getElementById('cart-msg').innerHTML='Only '+arr[8]+' units are available.';
         document.getElementById('quantity_'+product_id).value=arr[8];
         
       var    a =document.getElementById('qunt_'+product_id);
       var b=document.getElementById('qunto_'+product_id);
       var  c=document.getElementById('quntoo_'+product_id); 
  var  d=document.getElementById('quntb_'+product_id); 
       var  dd=document.getElementById('quntbb_'+product_id); 
        var  ddd=document.getElementById('quntbbb_'+product_id); 

       
         
         if(a){
        document.getElementById('qunt_'+product_id).innerHTML=arr[8];
         }
         if(b){
        document.getElementById('qunto_'+product_id).innerHTML=arr[8];
         }
         if(c){
        document.getElementById('quntoo_'+product_id).innerHTML=arr[8];
         }
          if(d){
        document.getElementById('quntb_'+product_id).innerHTML=arr[8];
         }

            if(dd){
        document.getElementById('quntbb_'+product_id).innerHTML=quantity;
         }
             if(ddd){
        document.getElementById('quntbbb_'+product_id).innerHTML=quantity;
         }

             
         }
         else{
             
             
             var    a =document.getElementById('qunt_'+product_id);
       var b=document.getElementById('qunto_'+product_id);
       var  c=document.getElementById('quntoo_'+product_id); 
        var  d=document.getElementById('quntb_'+product_id); 
        var  dd=document.getElementById('quntbb_'+product_id); 
        var  ddd=document.getElementById('quntbbb_'+product_id); 

         
         if(a){
        document.getElementById('qunt_'+product_id).innerHTML=quantity;
         }
         if(b){
        document.getElementById('qunto_'+product_id).innerHTML=quantity;
         }
         if(c){
        document.getElementById('quntoo_'+product_id).innerHTML=quantity;
         }  
           if(d){
        document.getElementById('quntb_'+product_id).innerHTML=quantity;
         }
            if(dd){
        document.getElementById('quntbb_'+product_id).innerHTML=quantity;
         }
             if(ddd){
        document.getElementById('quntbbb_'+product_id).innerHTML=quantity;
         }


             
         document.getElementById('cart-msg').style.color='green';
         document.getElementById('cart-msg').innerHTML='Cart Updated';
        }
//        document.getElementById('final_amount').value=net_payable;
//        document.getElementById('finalConvertedPrice').value=net_payable;
     }
     
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}
function update_cart_q(product_id,quantity)
{ 
  
    if(quantity==''||quantity==0||isNaN(quantity)){
        quantity=1;
        document.getElementById('quantity_'+product_id).value=1;
    }
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"update-cart.php";
url=url+"?product_id="+product_id+"&quantity="+quantity;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
  
//	window.location.href="cart.php"; 
     var response=xmlHttp.responseText;
     if(response!=''&&response.indexOf('#--#')!=-1)
     {
         //remove_coupon();
         var arr=response.split('#--#');
         var subtotal=arr[0];
         var savings=arr[1];
         var shipping=arr[2];
         var net_shipping=arr[3];
         var net_payable=arr[4];
         var currency_code=arr[6];
         document.getElementById('price_'+product_id).innerHTML=''+currency_code+' '+subtotal;
         if(shipping==0)
             document.getElementById('delivery_'+product_id).innerHTML="Free Delivery";
         else
             document.getElementById('delivery_'+product_id).innerHTML="+ "+currency_code+' '+shipping+" Shipping Charges"; 
         document.getElementById('net-payable').innerHTML=""+currency_code+' '+net_payable+"/-";
         if(net_shipping>0)
         {
             document.getElementById('total-subtotal').innerHTML=''+currency_code+' '+(net_payable-net_shipping)+'/-';
         document.getElementById('net-shipping-charges').innerHTML=''+currency_code+' '+net_shipping+'/-';
            }
         else
         {
             document.getElementById('net-shipping-charges').innerHTML='Free Delivery';
             document.getElementById('total-subtotal').innerHTML=''+currency_code+' '+(net_payable-net_shipping)+'/-';
         }
         
          if(arr.length=='8'){
              document.getElementById('cart-msg').style.color='red';
             document.getElementById('cart-msg').innerHTML='Only '+arr[7]+' units are available.';
              document.getElementById('quantity_'+product_id).value=arr[7];
              document.getElementById('qunt_'+product_id).value=arr[7];
         }
         else{
            
//         document.getElementById('quantity_'+product_id).value=arr[7];
//         document.getElementById('qunt_'+product_id).value=arr[7];
         document.getElementById('cart-msg').style.color='green';
         document.getElementById('cart-msg').innerHTML='Cart Updated';
        }
//        document.getElementById('final_amount').value=net_payable;
//        document.getElementById('finalConvertedPrice').value=net_payable;
     }
     
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}


function update_checkout_cart(product_id,quantity)
{ 
    if(quantity==''||quantity==0||isNaN(quantity)){
        quantity=1;
        document.getElementById('quantity_'+product_id).value=1;
    }
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"update-cart.php";
url=url+"?product_id="+product_id+"&quantity="+quantity;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
  
	window.location.href="checkout.php"; 
     var response=xmlHttp.responseText;
     if(response!=''&&response.indexOf('#--#')!=-1)
     {
         //remove_coupon();
         var arr=response.split('#--#');
         var subtotal=arr[0];
         var savings=arr[1];
         var shipping=arr[2];
         var net_shipping=arr[3];
         var net_payable=arr[4];
         var currency_code=arr[6];
         document.getElementById('price_'+product_id).innerHTML=''+currency_code+' '+subtotal;
         if(shipping==0)
             document.getElementById('delivery_'+product_id).innerHTML="Free Delivery";
         else
             document.getElementById('delivery_'+product_id).innerHTML="+ "+currency_code+' '+shipping+" Shipping Charges"; 
         document.getElementById('net-payable').innerHTML=""+currency_code+' '+net_payable+"/-";
         if(net_shipping>0)
         {
             document.getElementById('total-subtotal').innerHTML=''+currency_code+' '+(net_payable-net_shipping)+'/-';
         document.getElementById('net-shipping-charges').innerHTML=''+currency_code+' '+net_shipping+'/-';
            }
         else
         {
             document.getElementById('net-shipping-charges').innerHTML='Free Delivery';
             document.getElementById('total-subtotal').innerHTML=''+currency_code+' '+(net_payable-net_shipping)+'/-';
         }
          if(arr.length=='8'){
              document.getElementById('cart-msg').style.color='red';
             document.getElementById('cart-msg').innerHTML='Only '+arr[7]+' units are available.';
              document.getElementById('quantity_'+product_id).value=arr[7];
              document.getElementById('qunt_'+product_id).value=arr[7];
         }
         else{
         document.getElementById('cart-msg').style.color='green';
         document.getElementById('cart-msg').innerHTML='Cart Updated';
        }
//        document.getElementById('final_amount').value=net_payable;
//        document.getElementById('finalConvertedPrice').value=net_payable;
     }
     
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}



function noshow()
{
    document.getElementById('cart-err').innerHTML='Cash on Delivery is not available for this transaction.';
}
function add_to_compare(product_id,category)
{ 
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"add-to-compare.php";
url=url+"?product_id="+product_id+'&category='+category;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     if(xmlHttp.responseText=='f'){
         alert("You already have products ready for comparison from other category. First remove them to start a fresh comparison.");
         document.getElementById('compare-'+product_id).checked='';
     }
     else if(xmlHttp.responseText=='e'){
         alert("You already have 4 products ready for comparison.");
         document.getElementById('compare-'+product_id).checked='';
     }
     else
        document.getElementById("comparison-tab").innerHTML="("+xmlHttp.responseText+")";
    if(widget_active!='comparables')
        widget('comparables');
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}

function remove_from_compare(product_id)
{ 
   
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"remove-from-compare.php";
url=url+"?product_id="+product_id;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
	 document.getElementById("comparison-tab").innerHTML="("+xmlHttp.responseText+")";
         if(document.getElementById("comp-"+product_id)!='undefined'&&document.getElementById("comp-"+product_id)!==null)
             document.getElementById("comp-"+product_id).style.display='none';
         if(document.getElementById("compare-"+product_id)!='undefined'&&document.getElementById("compare-"+product_id)!==null)
             document.getElementById("compare-"+product_id).checked='';
         if(document.getElementById("comp-button")!='undefined'&&document.getElementById("comp-button")!==null&&parseInt(xmlHttp.responseText)<2)
             document.getElementById("comp-button").style.display='none';
         else{
             widget('comparables');
             widget('comparables');
         }
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}

function remove_from_shortlist(product_id)
{ 
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"remove-from-shortlist.php";
url=url+"?product_id="+product_id;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     window.location.href="wishlist.php";
	 document.getElementById("shortlist-tab").innerHTML=xmlHttp.responseText;
         if(document.getElementById("short-"+product_id)!='undefined'&&document.getElementById("short-"+product_id)!=null)
             document.getElementById("short-"+product_id).style.display='none';
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}

function remove_from_recent(product_id)
{ 
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"remove-from-recent.php";
url=url+"?product_id="+product_id;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
	 document.getElementById("recent-tab").innerHTML=xmlHttp.responseText;
         if(document.getElementById("recent-tr-"+product_id)!='undefined'&&document.getElementById("recent-tr-"+product_id)!=null)
             document.getElementById("recent-tr-"+product_id).style.display='none';
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
}

function remove_from_recommended(product_id)
{ 
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{
	

var url=baseurl+"remove-from-recommended.php";
url=url+"?product_id="+product_id;
xmlHttp.onreadystatechange=function(){
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
	 document.getElementById("recommended-tab").innerHTML=xmlHttp.responseText;
         if(document.getElementById("recommended-tr-"+product_id)!='undefined'&&document.getElementById("recommended-tr-"+product_id)!==null)
             document.getElementById("recommended-tr-"+product_id).style.display='none';
 } 
};
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
 
 }
} 

function options_clicked(option) {

            var rows = document.getElementsByName(option+'[]');
            var selectedRows = [];
            var str='';
            for (var i = 0, l = rows.length; i < l; i++) {
                if (rows[i].checked) {
                    selectedRows.push(rows[i]);
                   
                }
            }
           var j=1;
           for (var i = 0, l = selectedRows.length; i < l; i++) {
                str+=selectedRows[i].value;
                if(j!=selectedRows.length)
                    str+=',';
                j++;
           }      
           return str;
}
function increase_quantity(id,page)
{
     
    var val=document.getElementById('quantity_'+id).value;
    document.getElementById('quantity_'+id).value=parseInt(val)+1;
    var newval=document.getElementById('quantity_'+id).value;
    update_cart(id,newval,page);
}
function decrease_quantity(id,page)
{
    
    var val=document.getElementById('quantity_'+id).value;
  
   if(parseInt(val)>1){ 
  
    document.getElementById('quantity_'+id).value=parseInt(val)-1;
    var newval=document.getElementById('quantity_'+id).value;
    update_cart(id,newval,page);
} else
{
  
  if(page==undefined){
    page="cart.php";
   window.location.href="remove-from-cart.php?product_id="+id+"&page="+page;  
}
else
{
   remove_from_cart(id)   
}
}

}


function increase_quantity_q(id)
{
    var val=document.getElementById('quantity_'+id).value;
    document.getElementById('quantity_'+id).value=parseInt(val)+1;
    var newval=document.getElementById('quantity_'+id).value;
    update_cart_q(id,newval);
}
function decrease_quantity_q(id)
{
    var val=document.getElementById('quantity_'+id).value;
    if(parseInt(val)>0){
    document.getElementById('quantity_'+id).value=parseInt(val)-1;
    var newval=document.getElementById('quantity_'+id).value;
    update_cart_q(id,newval);
}
}
function increase_checkout_quantity(id)
{
    var val=document.getElementById('checkout_quantity_'+id).value;
    document.getElementById('checkout_quantity_'+id).value=parseInt(val)+1;
    var newval=document.getElementById('checkout_quantity_'+id).value;
    update_checkout_cart(id,newval);
}
function decrease_checkout_quantity(id)
{
    var val=document.getElementById('checkout_quantity_'+id).value;
    
    if(parseInt(val)>1){
 
    document.getElementById('checkout_quantity_'+id).value=parseInt(val)-1;
    var newval=document.getElementById('checkout_quantity_'+id).value;
    update_checkout_cart(id,newval);
} else
{
     remove_from_checkout_cart(id);
      document.getElementById('checkout_quantity_'+id).value=parseInt(val)-1;
    var newval=document.getElementById('checkout_quantity_'+id).value;
    update_checkout_cart(id,newval);
}

}
function filter(url)
{
    if(url.indexOf('?')!=-1)
    {
        var url_arr=url.split('?');
        url=url_arr[0];
    }
    var conj='?';
    
    var search=document.getElementById('keyword').value;
    
    var min=document.getElementById('min').value;
    var max=document.getElementById('max').value;
    var brands=options_clicked('brands');
    var models=options_clicked('models');
    var filters=options_clicked('filters');
    var colors = options_clicked('colors');
    var sort=document.getElementById('sort').value;
 
    if(parseInt(min)>parseInt(max)&&min!=''&&max!=''){
        document.getElementById('max').focus;
        document.getElementById('max').style.color='#ff0000';
    }
    else{
    if(sort!='')
    {
        url=url+conj+"sort="+sort;
        conj='&';
    }
    if(search!='')
    {
        search.replace(' ','+');
        search.replace('&','%26');
        url=url+conj+"q="+search;
        conj='&';
    }
    if(brands!='')
    {
        brands.replace(' ','+');
        brands.replace('&','%26');
        url=url+conj+"brands="+brands;
        conj='&';
    }
    if(models!='')
    {
        models.replace(' ','+');
        models.replace('&','%26');
        url=url+conj+"models="+models;
        conj='&';
    }
    if(filters!='')
    {
        filters.replace(' ','+');
        filters.replace('&','%26');
        url=url+conj+"filters="+filters;
        conj='&';
    }
    if(min!=''&&isNumeric(min)==true)
    {
        url=url+conj+"min="+min;
        conj='&';
    }
    if(max!=''&&isNumeric(max)==true)
    {
        url=url+conj+"max="+max;
        conj='&';
    }
       if(colors!='')
    {
        colors.replace(' ','+');
        colors.replace('&','%26');
        url=url+"&filter_colors="+colors;
    }
    window.location.href=url;
    }   
}

function remove_search(url,parent,cat)
{
    document.getElementById('search').value='';
    filter(url,parent,cat);
}
function GetXmlHttpObject()
{
var xmlHttp=null;
try
 {
 // Firefox, Opera 8.0+, Safari
 xmlHttp=new XMLHttpRequest();
 }
catch (e)
 {
 //Internet Explorer
 try
  {
  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e)
  {
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp;
}


/*************************** gift voucher functionality start here By Vishnu Bhardwaj ************************************/
function open_gift_voucher_pop(){
    var options = "";
    document.getElementById("gift-voucher-box").style.display='block';
    document.getElementById("lightbox-shadow").style.display='block';
    var preDefinedHtml = jQuery("#content_voucher_div").html();    
    if(preDefinedHtml =="" || preDefinedHtml == null){
        for(var k=1; k<=document.getElementById('dynamic_no_of_vouchers').value; k++ ){
            options += '<div id="main_div_'+k+'" class="total_divs"><input type="text" placeholder="Enter Gift Voucher Code" class="popup-input" name="voucher_code[]" id="voucher_code_'+k+'" value="" /><input placeholder="Enter Gift Pin" class="popup-input" type="text" name="voucher_pin[]" id="voucher_pin_'+k+'" value="" />  <input type="button" class="order" style="cursor:pointer; width: 100px;" onclick="clearVoucher('+k+')" value="Clear"></div><br />';
        }
        document.getElementById("gift-voucher-box").innerHTML = '<div style="background-color: #006699; color: #fff; height: 30px; padding: 4px;"><h1 style="float:  left; width: 93%; font-size: 18px;">Gift Vouchers</h1><a class="close-product-lightbox" href="javascript:void(0);" onclick="close_gift_voucher_pop();" style="color: #fff;">Close</a></div>    <div id="content_voucher_div">'+options+'</div>     <div id="bottom_button_div" style="padding-top: 0;"><input type="button" class="order" onclick="apply_gift_vouchers();" style="cursor:pointer;" name="apply_gift_voucher" value="Apply" /></div>';
    }
}

function create_dynamic_content(value){
    var html = "";
    document.getElementById('bottom_button_div').innerHTML = "";
    var applied_vouchers = jQuery("#gift_voucher_codes").val();
    if(applied_vouchers !=""){
        var total_applied_vouchers = applied_vouchers.split(",");
        var k=1;
        if(total_applied_vouchers.length > 0){
            for(k; k<=total_applied_vouchers.length; k++){
                html += '<div id="remove_div_'+total_applied_vouchers[(k-1)]+'">'+total_applied_vouchers[(k-1)]+'</div><br />';
            }
            if(--k < value){
                for(var s=1; s<=(value-k); s++){
                    if(jQuery(".total_divs").length > 0){ }
                    
                    html += '<div id="main_div_'+s+'"  class="total_divs"><input type="text" placeholder="Enter Gift Voucher Code" class="popup-input" name="voucher_code[]" id="voucher_code_'+s+'" value="" /><input placeholder="Enter Gift Pin" class="popup-input" type="text" name="voucher_pin[]" id="voucher_pin_'+s+'" value="" /></div><br />';
                }
            }
        }
    }
    else {
        if(value.trim() > 0){
            for(var s=1; s<=value; s++){
                html += '<div id="main_div_'+s+'" class="total_divs"><input type="text" placeholder="Enter Gift Voucher Code" class="popup-input" name="voucher_code[]" id="voucher_code_'+s+'" value="" /><input placeholder="Enter Gift Pin" class="popup-input" type="text" name="voucher_pin[]" id="voucher_pin_'+s+'" value="" /></div><br />';
            }
            document.getElementById('bottom_button_div').innerHTML = '<input type="button" class="order" onclick="apply_gift_vouchers();" style="cursor:pointer;" name="apply_gift_voucher" value="Apply">';
        }
    }
    document.getElementById('content_voucher_div').innerHTML = html;
}

function apply_gift_vouchers(){
    var total_vouchers = document.getElementById('dynamic_no_of_vouchers').value;
    gift_voucher_filled = 0;
    error_exists        = 0;
    for(var j = 1; j<=total_vouchers; j++ ){
        apply_giftVoucher(j,total_vouchers);       
    }
}

function clearVoucher(obj){
    if(Number(obj) > 0){
        if(document.getElementById('error_div_'+Number(obj)) != null) { jQuery("#error_div_"+Number(obj)).remove(); }
        var gift_voucher_code           = document.getElementById('voucher_code_'+obj).value;
        var all_applied_vouchers        = document.getElementById('gift_voucher_codes').value.split(",");
        var getIndexValue               = all_applied_vouchers.indexOf(gift_voucher_code);
        if(getIndexValue >= 0 && gift_voucher_code!=""){
            remove_gift_voucher(gift_voucher_code);
            document.getElementById('voucher_code_'+obj).value = "";
            document.getElementById('voucher_pin_'+obj).value = "";
        }
        else {
            document.getElementById('voucher_code_'+obj).value = "";
            document.getElementById('voucher_pin_'+obj).value = "";
        }
    }
}

function apply_gift_voucher_cart_update(){    
    xmlHttp=GetXmlHttpObject();        
    if (xmlHttp==null)
    {
        alert ("Browser does not support HTTP Request");
        return;
    }
    else {        
        var cod_avail_or_not = document.getElementById('cod_availornot').value;
        
        var all_applied_voucher_values  = document.getElementById('gift_voucher_values').value.split(",");
        var discount = document.getElementById('discount_amount').value;
        var total = 0;
        for(var t=0; t < all_applied_voucher_values.length; t++){
            total = Number(total)+Number(all_applied_voucher_values[t]);
        }
        var totlaDisAmount=Number(discount)+Number(total);
        var url = baseurl+"reload-cart.php";
         var post_data = "amnt="+totlaDisAmount;
        xmlHttp.onreadystatechange=function(){
            if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete") {
                var coupon_response=JSON.parse(xmlHttp.responseText);
                document.getElementById('final_amount').value = Number(coupon_response.payable_amount);
                 
                
                document.getElementById('final_amount').value = Number(document.getElementById('final_amount').value)-Number(discount);               
                if(document.getElementById('wallet_redemption_checkbox').checked){ 
                    if(Number(coupon_response.wallet_redemption) > 0 && Number(document.getElementById('final_amount').value) > 0){ 
                        if(Number(coupon_response.wallet_redemption) > Number(document.getElementById('final_amount').value)){
                            var deduct_wallet_balance = Number(Number(coupon_response.wallet_redemption) - (Number(coupon_response.wallet_redemption)-Number(document.getElementById('final_amount').value)));
                        }
                        else {
                            var deduct_wallet_balance = Number(coupon_response.wallet_redemption);
                        }
                        document.getElementById('wallet_redemption_amount').value = Number(deduct_wallet_balance);
                        document.getElementById('final_amount').value = Number(document.getElementById('final_amount').value)-Number(deduct_wallet_balance);
                        if(document.getElementById('wallet_deduction') != null) {
                            document.getElementById('wallet_deduction').innerHTML= "Rs. - "+new Intl.NumberFormat('en-IN').format(Number(document.getElementById('wallet_redemption_amount').value));
                        }
                    }
                    else {
                        document.getElementById('wallet_redemption_checkbox').checked = false;
                        document.getElementById('wallet_redemption_amount').value = Number(0);
                        if(document.getElementById('wallet_deduction') != null) {
                            document.getElementById('wallet_deduction').innerHTML= "Rs. - "+new Intl.NumberFormat('en-IN').format(Number(0));
                        }
                    }
                }
                else {
                    //document.getElementById('wallet_redemption_amount').value = '0';
                    if(document.getElementById('wallet_deduction') != null) {
                        document.getElementById('wallet_deduction').innerHTML= "Rs. - "+new Intl.NumberFormat('en-IN').format(Number(0));
                    }
                }                
                var final_amount = Number(document.getElementById('final_amount').value);
                if(Number(final_amount)-Number(total) > 0){
                    document.getElementById('final_amount').value               = Number(final_amount)-Number(total); 
                    document.getElementById('final_gift_voucher_values').value  = Number(total);
                    document.getElementById('left-amount').innerHTML=coupon_response.convertedAmount;
                    document.getElementById('finalConvertedPrice').value=coupon_response.convertedAmount;
                    //document.getElementById('right-amounts').innerHTML = "Rs. "+ new Intl.NumberFormat('en-IN').format(Number(document.getElementById('final_amount').value));
                    //document.getElementById('left-amount').innerHTML   = new Intl.NumberFormat('en-IN').format(Number(document.getElementById('final_amount').value));
                    
                    var max_cod_amount=document.getElementById('max_cod_amount').value;
                    if(cod_avail_or_not=='NoCOD')
                    {
                        document.getElementById('cod_link').onclick=function(){
                            noshow();
                        };
                        show_option('cc');
                    }
                    else if(Number(document.getElementById('final_amount').value)<=max_cod_amount)
                    {
                        document.getElementById('cod_link').onclick=function(){
                            show_option('cod');
                        };
                    }
                    /*
                    if(Number(document.getElementById('final_amount').value) <= Number(max_cod_amount))
                    {
                        document.getElementById('cod_link').onclick=function(){
                            show_option('cod');
                        };
                        show_option('cod');
                    }
                    else {
                        document.getElementById('cod_link').onclick=function(){
                            noshow();
                        };
                        show_option('cc');                                            
                    }                */    
                }
                else {
                    document.getElementById('final_amount').value = 0;
                    document.getElementById('final_gift_voucher_values').value  = Number(total);
                    //document.getElementById('right-amounts').innerHTML = "Rs. "+ new Intl.NumberFormat('en-IN').format(Number(document.getElementById('final_amount').value));
                    //document.getElementById('left-amount').innerHTML   = new Intl.NumberFormat('en-IN').format(Number(document.getElementById('final_amount').value));
                    
                    var max_cod_amount=document.getElementById('max_cod_amount').value;
                    if(cod_avail_or_not=='NoCOD')
                    {
                        document.getElementById('cod_link').onclick=function(){
                            noshow();
                        };
                        show_option('cc');
                    }
                    else if(Number(document.getElementById('final_amount').value)<=max_cod_amount)
                    {
                        document.getElementById('cod_link').onclick=function(){
                            show_option('cod');
                        };
                    }
                    /*if(Number(document.getElementById('final_amount').value) <= Number(max_cod_amount))
                    {
                        document.getElementById('cod_link').onclick=function(){
                            show_option('cod');
                        };
                        show_option('cod');
                    }
                    else {
                        document.getElementById('cod_link').onclick=function(){
                            noshow();
                        };
                        show_option('cc');                                            
                    }*/
                }
            }            
        };
        xmlHttp.open("POST",url,false);
        xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlHttp.send(post_data);                
    }   
}

function close_gift_voucher_pop()
{
    document.getElementById("gift-voucher-box").style.display='none';
    document.getElementById("lightbox-shadow").style.display='none';
    //document.getElementById("gift-voucher-box").innerHTML='';
}




    function apply_giftVoucher(number, total_gift_cards){
        xmlHttp=GetXmlHttpObject();        
        if (xmlHttp==null)
        {
            alert ("Browser does not support HTTP Request");
            return;
        }
        else {
            var cod_avail_or_not = document.getElementById('cod_availornot').value;
            var gift_voucher     = document.getElementById('voucher_code_'+number).value;
            var gift_voucher_pin = document.getElementById('voucher_pin_'+number).value;  
            var applied_vouchers = document.getElementById('gift_voucher_codes').value;
            if(document.getElementById('error_div_'+Number(number)) != null) { jQuery("#error_div_"+Number(number)).remove(); }
            if(gift_voucher!=''){                
                if(gift_voucher.length == 16){                    
                    if(gift_voucher_pin !="" && gift_voucher_pin.length == 6){ 
                        var url = baseurl+"apply-giftvouchers.php";
                        var post_data = "gift_code="+gift_voucher.trim()+"&gift_pin="+gift_voucher_pin.trim()+"&gift_applied_codes="+applied_vouchers.trim();
                        xmlHttp.onreadystatechange=function(){
                            if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete") {
                                var coupon_response=JSON.parse(xmlHttp.responseText);
                                if(coupon_response.status==true){
                                    //document.getElementById('giftcod').style.display="none";
                                    if(document.getElementById('error_div_'+Number(number)) != null) { jQuery("#error_div_"+Number(number)).remove(); }
                                    var html_new = "<div id='gift-dynamic-div-"+gift_voucher+"'><span style='width:30%; float:left;'>Voucher applied: </span><b style='width:47%; float:left;'>"+gift_voucher+"</b><font style='width:19%; float:left;'> <span style='float:right;'>"+coupon_response.symbol+" -"+new Intl.NumberFormat('en-IN').format(Number(coupon_response.voucher_amount_converted))+"</span></font><span style='width:2%; float:left;'><a href='javascript:void(0);' onclick='remove_gift_voucher(&#39;"+gift_voucher+"&#39;)'><img src='"+baseurl+"/desktop/gifs/pay-close.png' /></a></span> </div>";
                                    document.getElementById('successful_gift_vouchers').innerHTML += html_new;
                                    var final_amount = document.getElementById('final_amount').value;  
                                    if(Number(final_amount)-Number(coupon_response.voucher_amount) > 0){
                                        document.getElementById('final_gift_voucher_values').value = Number(document.getElementById('final_gift_voucher_values').value)+Number(coupon_response.voucher_amount);
                                        document.getElementById('final_amount').value = Number(final_amount)-Number(coupon_response.voucher_amount);
                                        document.getElementById('gift_voucher_codes').value = document.getElementById('gift_voucher_codes').value !=''?document.getElementById('gift_voucher_codes').value+","+gift_voucher:gift_voucher;
                                        document.getElementById('gift_voucher_values').value = document.getElementById('gift_voucher_values').value !=''?document.getElementById('gift_voucher_values').value+","+Number(coupon_response.voucher_amount):Number(coupon_response.voucher_amount);
                                        document.getElementById('left-amount').innerHTML += html_new;
                                        var showAmount=document.getElementById('finalConvertedPrice').value;
                                         document.getElementById('left-amount').innerHTML=parseInt(showAmount)-parseInt(coupon_response.voucher_amount_converted);
                                         document.getElementById('finalConvertedPrice').value=parseInt(showAmount)-parseInt(coupon_response.voucher_amount_converted);
                                        //document.getElementById('right-amounts').innerHTML = "Rs. "+new Intl.NumberFormat('en-IN').format(Number(document.getElementById('final_amount').value));
                                        //document.getElementById('left-amount').innerHTML   = new Intl.NumberFormat('en-IN').format(Number(document.getElementById('final_amount').value));
                                        var max_cod_amount=document.getElementById('max_cod_amount').value;
                                        if(cod_avail_or_not=='NoCOD')
                                        {
                                            document.getElementById('cod_link').onclick=function(){
                                                noshow();
                                            };
                                            show_option('cc');
                                        }
                                        else if(Number(document.getElementById('final_amount').value)<=max_cod_amount)
                                        {
                                            document.getElementById('cod_link').onclick=function(){
                                                show_option('cod');
                                            };
                                        }
                                       /* if(Number(document.getElementById('final_amount').value)<=max_cod_amount)
                                        {
                                            document.getElementById('cod_link').onclick=function(){
                                                show_option('cod');
                                            };
                                            show_option('cod');
                                        }
                                        else {
                                            document.getElementById('cod_link').onclick=function(){
                                                noshow();
                                            };
                                            show_option('cc');                                            
                                        }*/
                                    }
                                    else {
                                        document.getElementById('final_amount').value = 0;
                                        document.getElementById('gift_voucher_codes').value = document.getElementById('gift_voucher_codes').value !=''?document.getElementById('gift_voucher_codes').value+","+gift_voucher:gift_voucher;
                                        document.getElementById('gift_voucher_values').value = document.getElementById('gift_voucher_values').value !=''?document.getElementById('gift_voucher_values').value+","+Number(coupon_response.voucher_amount):Number(coupon_response.voucher_amount);
                                        document.getElementById('final_gift_voucher_values').value = Number(document.getElementById('final_gift_voucher_values').value)+Number(final_amount);
                                        //document.getElementById('right-amounts').innerHTML = new Intl.NumberFormat('en-IN', { style: 'currency', currency: 'INR' }).format(Number(document.getElementById('final_amount').value));
                                        //document.getElementById('left-amount').innerHTML   = new Intl.NumberFormat('en-IN', { style: 'currency', currency: 'INR' }).format(Number(document.getElementById('final_amount').value));
                                        var max_cod_amount=document.getElementById('max_cod_amount').value;
                                        if(cod_avail_or_not=='NoCOD')
                                        {
                                            document.getElementById('cod_link').onclick=function(){
                                                noshow();
                                            };
                                            show_option('cc');
                                        }
                                        else if(Number(document.getElementById('final_amount').value)<=max_cod_amount)
                                        {
                                            document.getElementById('cod_link').onclick=function(){
                                                show_option('cod');
                                            };
                                        }
                                        /*
                                        if(Number(document.getElementById('final_amount').value)<=max_cod_amount)
                                        {
                                            document.getElementById('cod_link').onclick=function(){
                                                show_option('cod');
                                            };
                                            show_option('cod');
                                        }
                                        else {
                                            document.getElementById('cod_link').onclick=function(){
                                                noshow();
                                            };
                                            show_option('cc');                                            
                                        }*/
                                    }                                    
                                }
                                else{
                                    if(document.getElementById('error_div_'+Number(number)) != null) { jQuery("#error_div_"+Number(number)).remove(); }
                                    var html_error_div = '<div id="error_div_'+Number(number)+'" style="color:#ff0000">'+coupon_response.msg+'</div>';
                                    jQuery("#main_div_"+Number(number)).before(html_error_div);                                    
                                }
                            } 
                        };
                        xmlHttp.open("POST",url,false);
                        xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                        xmlHttp.send(post_data);
                    }
                    else { 
                        var html_error_div = '<div id="error_div_'+Number(number)+'" style="color:#ff0000">Gift voucher pin is must and it should be 6 characters long.</div>';
                        jQuery("#main_div_"+Number(number)).before(html_error_div);                        
                    }
                }
                else {
                    var html_error_div = '<div id="error_div_'+Number(number)+'" style="color:#ff0000">Gift voucher code should be 16 characters long.</div>';
                    jQuery("#main_div_"+Number(number)).before(html_error_div);                    
                }
            }
            /*else {
                var html_error_div = '<div id="error_div_'+Number(number)+'"></div>';
                jQuery("#main_div_"+Number(number)).before(html_error_div);
            }*/
            if(number==total_gift_cards){
                for(var z=1; z<=total_gift_cards; z++){
                    if(jQuery("#voucher_code_"+z).val()!=""){
                        gift_voucher_filled = 1;
                    }
                    if(document.getElementById('error_div_'+Number(z)) != null) {
                        error_exists = 1;
                    }
                }  
                if(gift_voucher_filled > 0 && error_exists == 0){
                    close_gift_voucher_pop();
                }
                else if(gift_voucher_filled == 0) {
                    var html_error_div = '<div id="error_div_1" style="color:#ff0000">Please fill atleast one gift voucher.</div>';
                    jQuery("#main_div_1").before(html_error_div);
                }
            }
        }
    } 
    
    
    function remove_gift_voucher(gift_voucher_code){
        var all_applied_vouchers        = document.getElementById('gift_voucher_codes').value.split(",");
        var getIndexValue               = all_applied_vouchers.indexOf(gift_voucher_code);        
        var all_applied_voucher_values  = document.getElementById('gift_voucher_values').value.split(",");
        document.getElementById('final_gift_voucher_values').value = Number(document.getElementById('final_gift_voucher_values').value)-Number(all_applied_voucher_values[getIndexValue]);
        document.getElementById('final_amount').value = Number(document.getElementById('final_gift_voucher_values').value)+Number(all_applied_voucher_values[getIndexValue]);
        all_applied_vouchers.splice(getIndexValue,1);
        all_applied_voucher_values.splice(getIndexValue,1);
        document.getElementById('gift_voucher_codes').value    =   all_applied_vouchers;
        document.getElementById('gift_voucher_values').value   =   all_applied_voucher_values;      
        document.getElementById('gift-dynamic-div-'+gift_voucher_code).remove();
        apply_gift_voucher_cart_update();
    }
/*************************** eof gift voucher functionality here ************************************/

/****************************** wallet functionality start here by vishnu Bhardwaj *****************************/
window.onload = function(){
    if(document.getElementById('wallet_redemption_checkbox') != null) {
        document.getElementById('wallet_redemption_checkbox').onchange = function checkWalletCheckbox(){ apply_gift_voucher_cart_update(); }
    }
}; 
    
/****************************** eof wallet functionality here **************************************************/
/*********************** Update Details ***********************/
 function update_details()
{ 
   
var name=document.getElementById('person_name').value;    	
//var pincode=document.getElementById('pincode').value;
var shipping_address=document.getElementById('par').innerHTML;
var landmark=document.getElementById('landmark').value;
//var city=document.getElementById('city').value;
//var state=document.getElementById('state').value;
var phone=document.getElementById('phone').value;
//var address_type = jQuery('#address_type').is(':checked');
//var page = document.getElementById('manage').value;
var address_id = document.getElementById('address_id').value;
if(name.trim().length<3)
{
    document.getElementById('err_msg').innerHTML='Name must contain 3 characters minimum';
    document.getElementById('person_name').focus();
}
//else if(pincode.trim().length<6||pincode.trim().length>6||!isNumeric(pincode))
//{
//    document.getElementById('err_msg').innerHTML='Pin code must be 6 digit number';
//    document.getElementById('pincode').focus();
//}
//else if(shipping_address.trim().length<6)
//{
//    document.getElementById('err_msg').innerHTML='Address must contain a minimum of 6 characters';
//    document.getElementById('shipping_address').focus();
//}
//else if(city.trim().length<3)
//{
//    document.getElementById('err_msg').innerHTML='City must contain a minimum of 3 characters';
//    document.getElementById('city').focus();
//}
//else if(state=='')
//{
//    document.getElementById('err_msg').innerHTML='Please Select State/Province';
//    document.getElementById('state').focus();
//}
else if(phone.trim().length<10||phone.trim().length>10||!isNumeric(phone))
{
    document.getElementById('err_msg').innerHTML='Please Enter 10 digit valid mobile number';
    document.getElementById('phone').focus();
}
        else{
	xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request");
 return;
 }
 
 else{

var url=baseurl+"update-details.php";
var url_vars="person="+name+"&shipping_address="+shipping_address+"&landmark="+landmark+"&phone="+phone+"&id="+address_id;
xmlHttp.onreadystatechange=function(){
//    if (xmlHttp.readyState==1)
// { 
//     document.getElementById('save-delivery').className="inn-disabled";
//     document.getElementById('signup-processing').innerHTML='<img src="'+baseurl+'admin/images/loading.gif" /> Saving Details...';
// }
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
     
     var response=xmlHttp.responseText;
     if(response=='NameEmpty')
         document.getElementById('err_msg').innerHTML='Name must contain minimum 3 characters';
     else if(response=='InvalidName')
         document.getElementById('err_msg').innerHTML='Name can not contain special characters';
//     else if(response=='InvalidPIN')
//         document.getElementById('err_msg').innerHTML='Pin code must be 6 digit number';
//      else if(response=='UnacceptablePIN')
//         document.getElementById('err_msg').innerHTML='Service not available at your location';
//     else if(response=='InvalidAddress')
//         document.getElementById('err_msg').innerHTML='Address must contain minimum 6 characters';
//     else if(response=='InvalidCity')
//         document.getElementById('err_msg').innerHTML='City name must contain minimum 3 characters';
//     else if(response=='InvalidState')
//         document.getElementById('err_msg').innerHTML='State can not be blank';
     else if(isNumeric(response)){
         document.getElementById('err_msg').innerHTML='';
        window.location="manage-address.php";
         
    }
     
    else {
        document.getElementById('err_msg').innerHTML='Some error encountered.';
    }
    document.getElementById('save-delivery').className="inn-save";
     document.getElementById('signup-processing').innerHTML='';
    
 } 
};
xmlHttp.open("POST",url,true);
xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlHttp.send(url_vars);
 
 }
        }
}