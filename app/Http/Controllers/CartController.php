<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\CustomerAddress;
use App\Models\DiscountCoupon;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\ShippingCharge;
use Carbon\Carbon;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class CartController extends Controller
{
    // public function addToCart(Request $request){

    //     $product=Product::with('product_images')->find($request->id);
    //     //Cart::add('293ad','Product 1',1,9.99);

    //     if($product==null){
    //         return response()->json([
    //             'status'=>false,
    //             'message'=>'Product Not Found'
    //         ]);
    //     }

    //     $status=false;
    //     $message='';

    //     if(Cart::count()>0){
    //         echo "product already in cart";

    //     }else{
    //         echo "product not in cart";
    //         //cart is empty so product will add in cart
    //         Cart::add($product->id,$product->title,1,$product->price,['productImage'=>(!empty($product->product_images))? $product->product_images->first():'']);
    //         $status=true;
    //         $message=$product->title.' added in cart';
    //     }

    //     return response()->json([
    //         'status'=> $status,
    //         'message'=> $message
    //     ]);

    // }

    public function addToCart(Request $request){

        $product = Product::with('product_images')->find($request->id);

        if ($product == null) {
            return response()->json([
                'status' => false,
                'message' => 'Product Not Found'
            ]);
        }

        $status = false;
        $message = '';

        $isProductInCart = Cart::content()->contains('id', $product->id);

        if ($isProductInCart) {
           //product found in cart
           $cartContent=Cart::content();
           $productAlreadyExist=false;

           foreach($cartContent as $item){
                if($item->id==$product->id){
                    $productAlreadyExist=true;
                }
           }

           if($productAlreadyExist==false){
                Cart::add($product->id, $product->title, 1, $product->price, [
                    'productImage' => (!empty($product->product_images)) ? $product->product_images->first() : ''
                ]);

                $status = true;
                $message = '<strong>'.$product->title . '</strong> added in your cart successfully';
                session()->flash('success', $message);

           }else{
                $status = false;
                $message = $product->title . ' already added in cart';
           }

        } else {
            // Cart is empty or product not in cart, so product will add in cart
            Cart::add($product->id, $product->title, 1, $product->price, [
                'productImage' => (!empty($product->product_images)) ? $product->product_images->first() : ''
            ]);
            $status = true;
            $message = '<strong>'.$product->title . '</strong> added in your cart successfully';
            session()->flash('success', $message);
        }

        return response()->json([
            'status' => $status,
            'message' => $message
        ]);
    }




    public function cart(){

        $cartContent = Cart::content();

        return view('front.cart',compact('cartContent'));
    }

    public function updateCart(Request $request){

        $rowId=$request->rowId;
        $qty=$request->qty;
        Cart::update($rowId,$qty);

        $itemInfo=Cart::get($rowId);
        $product=Product::find($itemInfo->id);

        //check quantity available or not
        if($product->track_qty=='Yes'){
            if($qty<=$product->qty){
                Cart::update($rowId,$qty);
                $message='Cart Updated Successfully';
                $status=true;
                session()->flash('success',$message);
            }else{
                $message='Requested quantity '.$qty.' for '.$product->title.' is not available in stock';
                $status=false;
                session()->flash('error',$message);
            }
        }else{
            Cart::update($rowId,$qty);
                $message='Cart Updated Successfully';
                $status=true;
                session()->flash('success',$message);
        }

        return response()->json([
            'status' => $status,
            'message' => $message
        ]);

    }

    public function deleteItem(Request $request){

        $rowId=$request->rowId;
        $itemInfo=Cart::get($rowId);
        if($itemInfo ==null){
            session()->flash('error','Item Not Found In Cart');
            return response()->json([
                'status' => false,
                'message' => 'Item Not Found In Cart'
            ]);
        }

        Cart::remove($request->rowId);
        session()->flash('success','Item Remove From Cart Successfully');
            return response()->json([
                'status' => true,
                'message' => 'Item Remove From Cart Successfully'
            ]);
    }

    public function checkout(){

        $discount=0;

        //if cart empty
        if(Cart::count()==0){
            return redirect()->route('front.cart');
        }

        //if user not logged in
        if(Auth::check()==false){

            if(!session()->has('url.intended')){
                session(['url.intended'=>url()->current()]);
            }

            return redirect()->route('account.login');
        }

        $customerAddress=CustomerAddress::where('user_id',Auth::user()->id)->first();
        session()->forget('url.intended');

        $countries=Country::orderBy('name','ASC')->get();

        $subTotal=Cart::subtotal(2,'.','');
        //apply discount here
        if(session()->has('code')){

            $code=session()->get('code');

            if($code->type=='percent'){
                $discount=($code->discount_amount/100)*$subTotal;
            }else{
                $discount=$code->discount_amount;
            }
        }

        //calculate shipping
        if($customerAddress!=null){
            $userCountry=$customerAddress->country_id;
            $shippingInfo=ShippingCharge::where('country_id',$userCountry)->first();

            $totalQty=0;
            foreach(Cart::content() as $item){
                $totalQty+=$item->qty;
            }

            $totalShippingCharge=$totalQty*$shippingInfo->amount;
            $grandTotal=($subTotal-$discount)+$totalShippingCharge;
        }else{
            $grandTotal=($subTotal-$discount);
            $totalShippingCharge=0;
        }

        return view('front.checkout',compact('countries','customerAddress','totalShippingCharge','grandTotal','discount'));
    }

    public function processCheckout(Request $request){

        //apply validation
        $validator=Validator::make($request->all(),[
            'first_name'=>'required|min:5',
            'last_name'=>'required',
            'email'=>'required|email',
            'country'=>'required',
            'address'=>'required|max:30',
            'city'=>'required',
            'state'=>'required',
            'zip'=>'required',
            'mobile'=>'required',
        ]);

        if($validator->fails()){

            return response()->json([
                'status' => false,
                'message' => 'please fix error',
                'errors' => $validator->errors()
            ]);
        }

        //save user address
        $user=Auth::user();
        CustomerAddress::updateOrCreate(
            ['user_id'=>$user->id],
            [
                'user_id'=>$user->id,
                'first_name'=>$request->first_name,
                'last_name'=>$request->last_name,
                'email'=>$request->email,
                'mobile'=>$request->mobile,
                'address'=>$request->address,
                'apartment'=>$request->appartment,
                'city'=>$request->city,
                'country_id'=>$request->country,
                'state'=>$request->state,
                'zip'=>$request->zip,
            ]
        );

        //store data in order table
        if($request->payment_method=='cod'){

            $shipping=0;
            $discount=0;
            $discountCodeId=0;
            $promoCode='';
            $subTotal=Cart::subtotal(2,'.','');

            //apply discount here
            if(session()->has('code')){

                $code=session()->get('code');

                if($code->type=='percent'){
                    $discount=($code->discount_amount/100)*$subTotal;
                }else{
                    $discount=$code->discount_amount;
                }

                $discountCodeId=$code->id;
                $promoCode=$code->code;
            }

            //calculate shipping
            $shippingInfo = ShippingCharge::where('country_id', $request->country)->first();
            $totalQty = 0;
            foreach (Cart::content() as $item) {
                $totalQty += $item->qty;
            }

            if ($shippingInfo != null) {
                $shipping = $totalQty * $shippingInfo->amount;
                $grandTotal =($subTotal-$discount) + $shipping;


            } else {
                $shippingInfo = ShippingCharge::where('country_id', 'rest_of_world')->first();
                $shipping = $totalQty * $shippingInfo->amount;
                $grandTotal =  ($subTotal-$discount) + $shipping;
            }


            $order= new Order;
            $order->subtotal=$subTotal;
            $order->shipping=$shipping;
            $order->grand_total=$grandTotal;
            $order->discount=$discount;
            $order->coupon_code_id=$discountCodeId;
            $order->payment_status='not paid';
            $order->status='pending';
            $order->cupon_code=$promoCode;
            $order->user_id=$user->id;

            $order->first_name=$request->first_name;
            $order->last_name=$request->last_name;
            $order->email=$request->email;
            $order->mobile=$request->mobile;
            $order->address=$request->address;
            $order->apartment=$request->appartment;
            $order->state=$request->state;
            $order->city=$request->city;
            $order->zip=$request->zip;
            $order->notes=$request->order_notes;
            $order->country_id=$request->country;
            $order->save();

            //stoer items in order items
            foreach(Cart::content() as $item){
                $orderItem=new OrderItem;
                $orderItem->order_id=$order->id;
                $orderItem->product_id=$item->id;
                $orderItem->name=$item->name;
                $orderItem->qty=$item->qty;
                $orderItem->price=$item->price;
                $orderItem->total=$item->qty*$item->price;
                $orderItem->save();

                //update product stock
                $productData=Product::find($item->id);

                if($productData->track_qty=='Yes'){

                    $currentQty=$productData->qty;
                    $updateQty=$currentQty-$item->qty;
                    $productData->qty=$updateQty;
                    $productData->save();
                }

            }

            //send order email
            orderEmail($order->id,'customer');

            session()->flash('success','Order Saved Successfully');
            Cart::destroy();
            session()->forget('code');
            return response()->json([
                'status' => true,
                'message' => 'Order Saved Successfully',
                'orderId' => $order->id,
            ]);
        }

    }

    public function thankYou($id){

        return view('front.thanks',['id'=>$id]);
    }

    public function getOrderSummery(Request $request) {

        $subTotal = Cart::subtotal(2, '.', '');
        $discount=0;
        $discountString='';

        //apply discount here
        if(session()->has('code')){

            $code=session()->get('code');

            if($code->type=='percent'){
                $discount=($code->discount_amount/100)*$subTotal;
            }else{
                $discount=$code->discount_amount;
            }


            $discountString='<div class=" mt-4" id="discount_response">
            <strong>'.session()->get('code')->code.'</strong>
            <a class="btn btn-sm btn-danger" id="remove_discount"><i class="fa fa-times"></i></a>
            </div>';
            }


        if ($request->country_id > 0) {
            $shippingInfo = ShippingCharge::where('country_id', $request->country_id)->first();
            $totalQty = 0;
            foreach (Cart::content() as $item) {
                $totalQty += $item->qty;
            }

            if ($shippingInfo != null) {
                $shippingCharge = $totalQty * $shippingInfo->amount;
                $grandTotal = ($subTotal-$discount) + $shippingCharge;

                return response()->json([
                    'status' => true,
                    'grandTotal' => number_format($grandTotal, 2),
                    'discount'=>number_format($discount,2),
                    'discountString'=>$discountString,
                    'shippingCharge' => number_format($shippingCharge, 2)
                ]);
            } else {
                $shippingInfo = ShippingCharge::where('country_id', 'rest_of_world')->first();
                $shippingCharge = $totalQty * $shippingInfo->amount;
                $grandTotal = ($subTotal-$discount)+ $shippingCharge;

                return response()->json([
                    'status' => true,
                    'grandTotal' => number_format($grandTotal, 2),
                    'discount'=>number_format($discount,2),
                    'discountString'=>$discountString,
                    'shippingCharge' => number_format($shippingCharge, 2)
                ]);
            }
        } else {
            return response()->json([
                'status' => true,
                'grandTotal' =>number_format(($subTotal-$discount), 2),
                'discount'=>number_format($discount,2),
                'discountString'=>$discountString,
                'shippingCharge' => number_format(0, 2)
            ]);
        }
    }

    public function applyDiscount(Request $request){

        $code=DiscountCoupon::where('code',$request->code)->first();
        if($code==null){
            return response()->json([
                'status' => false,
                'message'=>'Invalid Discount Coupon'
            ]);
        }

        //check if coupoon start date is valid or not
        $now=Carbon::now();
        if($code->starts_at!=""){
            $startDate=Carbon::createFromFormat('Y-m-d H:i:s',$code->starts_at);
            if($now->lte($startDate)){

                return response()->json([
                    'status' => false,
                    'message'=>'Invalid Discount Coupon'
                ]);
            }
        }

        if($code->expires_at!=""){
            $endDate=Carbon::createFromFormat('Y-m-d H:i:s',$code->expires_at);
            if($now->gte($endDate)){

                return response()->json([
                    'status' => false,
                    'message'=>'Invalid Discount Coupon'
                ]);
            }
        }

        //max uses checked
        if($code->max_uses>0){

            $couponCodeUsed=Order::where('coupon_code_id',$code->id)->count();
            if($couponCodeUsed>=$code->max_uses){

                return response()->json([
                    'status' => false,
                    'message'=>'Invalid Discount Coupon'
                ]);
            }
        }


        //max uses user checked
        if($code->max_uses_user>0){

            $couponCodeUsedByUser=Order::where(['coupon_code_id'=>$code->id,'user_id'=>Auth::user()->id])->count();
            if($couponCodeUsedByUser>=$code->max_uses_user){

                return response()->json([
                    'status' => false,
                    'message'=>'you already used this coupon'
                ]);
            }
        }
        //min amount conditon check
        $subTotal = Cart::subtotal(2, '.', '');
        if($code->min_amount>0){
            if($subTotal<$code->min_amount){
                return response()->json([
                    'status' => false,
                    'message'=>'your minimum amount must be '.$code->min_amount.' BDT'
                ]);
            }
        }

        session()->put('code',$code);
        return $this->getOrderSummery($request);

    }

    public function removeCoupon(Request $request){
        session()->forget('code');
        return $this->getOrderSummery($request);
    }

}
