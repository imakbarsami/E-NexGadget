<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BrandsController extends Controller
{
    //it will work for display brand list
    public function index(Request $request){

        $brands = Brand::latest('id');

        // Display brands that match the keyword by searching
        if($request->get('keyword')){
            $brands = $brands->where('name', 'like', '%' . $request->keyword.'%');
        }
        //10 records will show in category page
        $brands=$brands->paginate(10);

        return view('admin.brand.list',compact('brands'));
    }

    //display brand creation form
    public function create(){
        return view('admin.brand.create');
    }

    //it will store brands datas
    public function store(Request $request){

        //check validation of name and slug field
        $validator=Validator::make($request->all(),[
            'name'=>'required',
            'slug'=> 'required|unique:brands',
        ]);

        //if validation pass then  the brand datas will save successfully
        if($validator->passes()){
            $brand=new Brand();
            $brand->name=$request->name;
            $brand->slug=$request->slug;
            $brand->status=$request->status;
            $brand->save();

            return response()->json([
                'status'=>true,
                'message'=>'Brand Created Successfully',
            ]);
        }else{
            return response()->json([
                'status'=>false,
                'errors'=>$validator->errors()
            ]);
        }
    }

     //will work for display edit brand page
     public function edit($brandId,Request $request){

        //find brand based on requested brand id
        $brand=Brand::find($brandId);

        //if brand not found then it will redirect in brand list page
        if(empty($brand)){
            return redirect()->route('brands.index');
        }
        return view('admin.brand.edit',compact('brand'));
    }

     //it will work for update brand
     public function update($brandId,Request $request){

        //find brand based on requested brand id
        $brand=Brand::find($brandId);

        //if brand not found then it will redirect in brand list page
        if(empty($brand)){

            session()->flash('error', 'Brand not found');

            return response()->json([
                'status'=>false,
                'notFound'=>true,
                'message'=>'Brand not found'
            ]);
        }

        //checking validation of name and slug updated data
        $validator=Validator::make($request->all(),[
            'name'=>'required',
            'slug'=>'required|unique:brands,slug,'.$brand->id.'id',
        ]);

        //if validation pass then brand will save or updated
        if($validator->passes()){
            $brand->name=$request->name;
            $brand->slug=$request->slug;
            $brand->status=$request->status;
            $brand->save();

            session()->flash('success', 'Brand updated successfully');

            return response()->json([
                'status'=>true,
                'message'=>'Brand updated successfully',
            ]);
        }else{
            return response()->json([
                'status'=>true,
                'errors'=>$validator->errors()
            ]);
        }
    }

    //it will delete the brands based on id
    public function destroy($brandId,Request $request){

        //find brand based on requested brand id
        $brand=Brand::find($brandId);

        //if brand not found then it will redirect in brands list page
        if(empty($brand)){

            session()->flash('error','Brand not  found');

            return response()->json([
                'status'=>true,
                'message'=>'Brand not found',
            ]);
        }
        $brand->delete();

        session()->flash('success','Brand deleted successfully');
        return response()->json([
            'status'=>true,
            'message'=>'Brand deleted successfully',
        ]);
    }
}
