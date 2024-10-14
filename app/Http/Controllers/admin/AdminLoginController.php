<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AdminLoginController extends Controller
{
    //this funciton will work for showing admin login page
    public function index(){
        return view('admin.login');
    }

    //this funciton will work for authenticate admin 
    public function authenticate(Request $request) {

        //checking the validation of admin email and password
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        //if email or password input validation failed it will redirect in admin login page
        if ($validator->fails()) {
            return redirect()->route('admin.login')
                ->withErrors($validator)
                ->withInput($request->only('email'));
        }

        if (Auth::guard('admin')->attempt([
            'email' => $request->email,
            'password' => $request->password
        ], $request->filled('remember'))) {
            $admin = Auth::guard('admin')->user();

            //if role is 2 then it will redirect in admin dashboard otherwise it will redirect in admin login page
            if ($admin->role == 2) {
                return redirect()->route('admin.dashboard');
            } else {
                Auth::guard('admin')->logout();
                return redirect()->route('admin.login')
                    ->with('error', 'You are not authorized to access the admin panel.');
            }
        } else {
            // Failed authentication
            return redirect()->route('admin.login')
                ->with('error', 'Email or password is incorrect.');
        }
    }

}
