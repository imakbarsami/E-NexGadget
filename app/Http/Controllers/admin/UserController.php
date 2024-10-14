<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function index(Request $request){

        $users=User::latest();

        if(!empty($request->get('keyword'))){
            $users = $users->where('name','like','%'.$request->get('keyword').'%');
            $users = $users->orWhere('email','like','%'.$request->get('keyword').'%');
        }

        $users=$users->paginate(4);

        return view('admin.users.list',compact('users'));
    }

    public function create(){

        return view('admin.users.create');
    }

    public function store(Request $request){

        $validator=Validator::make($request->all(),[

            'name'=>'required',
            'email'=>'required|email|unique:users',
            'phone'=>'required',
            'password'=>'required|min:5'
        ]);

        if($validator->passes()){

            $user=new User;
            $user->name=$request->name;
            $user->email=$request->email;
            $user->phone=$request->phone;
            $user->status=$request->status;
            $user->password=Hash::make($request->password);
            $user->save();

            session()->flash('success','User Added Successfully');
            return response()->json([
                'status'=>true,
                'message'=>'User Added Successfully'
            ]);


        }else{

            return response()->json([
                'status'=>false,
                'errors'=>$validator->errors()
            ]);
        }
    }

    public function edit($id,Request $request){

        $user=User::find($id);

        if($user==null){
            session()->flash('error','User Not Found');
            return redirect()->route('users.index');
        }

        return view('admin.users.edit',compact('user'));
    }


    public function update($id,Request $request){

        $user=User::find($id);

        if($user==null){
            session()->flash('error','User Not Found');

            return response()->json([
                'status'=>true,
                'message'=>'User Not Found'
            ]);
        }


        $validator=Validator::make($request->all(),[

            'name'=>'required',
            'email'=>'required|email|unique:users,email,'.$user->id.',id',
            'phone'=>'required',

        ]);

        if($validator->passes()){
            $user->name=$request->name;
            $user->email=$request->email;
            $user->phone=$request->phone;
            $user->status=$request->status;
            if($request->password !=''){
              $user->password=Hash::make($request->password);
            }
            $user->save();

            session()->flash('success','User Updated Successfully');
            return response()->json([
                'status'=>true,
                'message'=>'User Updated Successfully'
            ]);


        }else{

            return response()->json([
                'status'=>false,
                'errors'=>$validator->errors()
            ]);
        }
    }

    public function destroy($brandId,Request $request){

        $user=User::find($brandId);

        if(empty($user)){

            session()->flash('error','User not  found');

            return response()->json([
                'status'=>true,
                'message'=>'User not found',
            ]);
        }
        $user->delete();

        session()->flash('success','User deleted successfully');
        return response()->json([
            'status'=>true,
            'message'=>'User deleted successfully',
        ]);
    }
}
