<?php

namespace App\Http\Controllers;

use App\Mail\ResetPasswordEmail;
use App\Models\Country;
use App\Models\CustomerAddress;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Wishlist;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    public function login(){

        return view('front.account.login');
    }

    public function register(){

        return view('front.account.register');
    }

    public function processRegister(Request $request){

        $validator=Validator::make($request->all(),[
            'name'=>'required|min:3',
            'email'=>'required|email|unique:users',
            'password'=>'required|min:5|confirmed'
        ]);

        if($validator->passes()){
            $user=new User();
            $user->name=$request->name;
            $user->email=$request->email;
            $user->phone=$request->phone;
            $user->password=Hash::make($request->password);
            $user->save();

            session()->flash('success','Customer Register Successfully');

            return response()->json([
                'status'=>true,
                'message'=>'Customer Register Successfully'
            ]);
        }else{
            return response()->json([
                'status'=>false,
                'errors'=>$validator->errors()
            ]);
        }
    }

    public function authenticate(Request $request){

        $validator=Validator::make($request->all(),[
            'email'=>'required|email',
            'password'=>'required'
        ]);

        if($validator->passes()){

            if(Auth::attempt(['email'=>$request->email,'password'=>$request->password],$request->get('remember'))){

                if(session()->has('url.intended')){
                    return redirect(session()->get('url.intended'));
                }

               // $user=User::where('email',$request->email)->first();
                return redirect()->route('account.profile');
            }else{
                session()->flash('error','Invalid password or email');
                return redirect()->route('account.login')->withInput($request->only('email'));;
            }
        }else{
            return redirect()->route('account.login')
            ->withErrors($validator)
            ->withInput($request->only('email'));
        }
    }

    public function profile(){

        $countries=Country::orderBy('name','ASC')->get();

        $userAddress=CustomerAddress::where('user_id',Auth::user()->id)->first();

        $user=User::where('id',Auth::user()->id)->first();
        return view('front.account.profile',compact('user','countries','userAddress'));
    }

    public function logout(){
        Auth::logout();
        return redirect()->route('account.login')
        ->with('success','Logout Successfully');
    }

    public function orders(){

        $user=Auth::user();
        $orders=Order::where('user_id',$user->id)
                       ->orderBy('created_at','DESC')->get();

        return view('front.account.order',compact('orders'));
    }

    public function orderDetails($id){

        $user=Auth::user();
        $order=Order::where('user_id',$user->id)
                     ->where('id',$id)->first();

        $orderItems=OrderItem::where('order_id',$id)->get();

        $orderItemsCount=OrderItem::where('order_id',$id)->count();

        return view('front.account.order_details',compact('order','orderItems','orderItemsCount'));
    }

    public function wishlist(){

        $wishlists=Wishlist::where('user_id',Auth::user()->id)->with('product')->get();

        return view('front.account.wishlist',compact('wishlists'));
    }

    public function removeProductFromWishlist(Request $request){

        $wishlist=Wishlist::where('user_id',Auth::user()->id)->where('product_id',$request->id)->first();
        if($wishlist==null){

            session()->flash('error','Product already removed');
            return response()->json([
                'status'=>true

            ]);
        }else{
            Wishlist::where('user_id',Auth::user()->id)->where('product_id',$request->id)->delete();
            session()->flash('success','Product removed  successfully');
            return response()->json([
                'status'=>true

            ]);
        }
    }

    public function updateProfile(Request $request){

        $userId=Auth::user()->id;

       $validator=Validator::make($request->all(),[
            'name'=>'required',
            'email'=>'required|email|unique:users,email,'.$userId.',id',
            'phone'=>'required'
       ]);

       if($validator->passes()){

        $user=User::find($userId);
        $user->name=$request->name;
        $user->email=$request->email;
        $user->phone=$request->phone;
        $user->save();

        session()->flash('success','Profile Updated  successfully');

        return response()->json([
            'status'=>true,
            'errors'=> 'Profile Updated Successfully'
        ]);

       }else{

            return response()->json([
                'status'=>false,
                'errors'=> $validator->errors()
            ]);
       }

    }

    public function updateAddress(Request $request){

        $userId=Auth::user()->id;

        $validator=Validator::make($request->all(),[
            'first_name'=>'required|min:5',
            'last_name'=>'required',
            'email'=>'required|email',
            'country_id'=>'required',
            'address'=>'required|max:30',
            'city'=>'required',
            'state'=>'required',
            'zip'=>'required',
            'mobile'=>'required',

        ]);

       if($validator->passes()){

            CustomerAddress::updateOrCreate(
                ['user_id'=>$userId],
                [
                    'user_id'=>$userId,
                    'first_name'=>$request->first_name,
                    'last_name'=>$request->last_name,
                    'email'=>$request->email,
                    'mobile'=>$request->mobile,
                    'address'=>$request->address,
                    'apartment'=>$request->apartment,
                    'city'=>$request->city,
                    'country_id'=>$request->country_id,
                    'state'=>$request->state,
                    'zip'=>$request->zip,
                ]
            );

            session()->flash('success','Address Updated  successfully');

            return response()->json([
                'status'=>true,
                'errors'=> 'Address Updated Successfully'
            ]);


       }else{

            return response()->json([
                'status'=>false,
                'errors'=> $validator->errors()
            ]);
       }

    }

    public function showChangePasswordForm(){


        return view('front.account.change_password');
    }


    public function changePassword(Request $request){

        $validator=Validator::make($request->all(),[
            'old_password'=>'required',
            'new_password'=>'required|min:5|',
            'confirm_password'=>'required|same:new_password',
        ]);

        if($validator->passes()){

            $user=User::where('id',Auth::user()->id)->first();

            if(!Hash::check($request->old_password,$user->password)){

                session()->flash('error','Your old password is wrong, try again!!');
                return response()->json([
                    'status'=>true,
                ]);
            }

            User::where('id',$user->id)->update([
                'password'=>Hash::make($request->new_password)
            ]);

            session()->flash('success','Password Changed Successfully');
                return response()->json([
                    'status'=>true,
                ]);

        }else{

            return response()->json([
                'status'=>false,
                'errors'=>$validator->errors()
            ]);
        }
    }

    public function forgetPassword(){

        return view('front.account.forget_password');
    }

    public function processForgetPassword(Request $request){

        $validator=Validator::make($request->all(),[
            'email'=>'required|email|exists:users,email'
        ]);

        if($validator->fails()){
            return redirect()->route('front.forget_password')->withInput()->withErrors($validator);
        }

        $token=Str::random(60);

        DB::table('password_reset_tokens')->where('email',$request->email)->delete();

        DB::table('password_reset_tokens')->insert([
            'email'=>$request->email,
            'token'=>$token,
            'created_at'=>now()
        ]);

        $user=User::where('email',$request->email)->first();

        $formData=[
            'token'=>$token,
            'user'=>$user,
            'mail_subject'=>'You have requested to reset your password',
        ];
        //send email
        Mail::to($request->email)->send(new ResetPasswordEmail($formData));

        return redirect()->route('front.forget_password')->with('success','Please check your email to reset your password');
    }

    public function resetPassword($token){

        $tokenExist=DB::table('password_reset_tokens')->where('token',$token)->first();

        if($tokenExist==null){
            return redirect()->route('front.forget_password')->with('error','Invalid Request');
        }
        return view('front.account.reset_password',compact('token'));
    }

    public function processResetPassword(Request $request){

        $token=$request->token;

        $tokenExist=DB::table('password_reset_tokens')->where('token',$token)->first();

        if($tokenExist==null){
            return redirect()->route('front.forget_password')->with('error','Invalid Request');
        }

        $user=User::where('email',$tokenExist->email)->first();

        $validator=Validator::make($request->all(),[
            'new_password'=>'required|min:5|',
            'confirm_password'=>'required|same:new_password',
        ]);

        if($validator->fails()){
            return redirect()->route('front.process_reset_password',$token)->withErrors($validator);
        }

        User::where('email',$user->email)->update([
            'password'=>Hash::make($request->new_password)
        ]);

        DB::table('password_reset_tokens')->where('email',$user->email)->delete();

        return redirect()->route('account.login')->with('success','Password Updated Successfully');

    }
}
