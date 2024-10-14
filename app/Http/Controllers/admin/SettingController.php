<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class SettingController extends Controller
{
    public function showChangePasswordForm(){

        return view('admin.change_password');
    }

    public function processChangePassword(Request $request){

        $validator=Validator::make($request->all(),[
            'old_password'=>'required',
            'new_password'=>'required|min:5',
            'confirm_password'=>'required|same:new_password'
        ]);

        if($validator->passes()){

            if(!Hash::check($request->old_password,auth()->guard('admin')->user()->password)){

                session()->flash('error','Old password is incorrect');
                return response()->json([
                    'status'=>true,
                ]);
            }

            User::where('id',auth()->guard('admin')->user()->id)->update([
                'password'=>Hash::make($request->new_password)
            ]);

            session()->flash('success','Password Updated Successfully');
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
}
