<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\SubCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SubCategoryController extends Controller
{
    //display subcategories list
    public function index(Request $request){

        //it will display category name in subcategory page
        $sub_categories = SubCategory::select('sub_categories.*', 'categories.name as categoryName')
                            ->latest('sub_categories.id')
                            ->leftJoin('categories', 'categories.id', 'sub_categories.category_id');


        //will display subcategories or categories based on requested keyword
        if(!empty($request->get('keyword'))){
            //for display subcategories
            $sub_categories = $sub_categories->where('sub_categories.name','like','%'.$request->get('keyword').'%');
            //for display categories
            $sub_categories = $sub_categories->orwhere('categories.name','like','%'.$request->get('keyword').'%');
        }

        //display 10 records of subcategories
        $sub_categories = $sub_categories->paginate(10);
        return view('admin.sub_category.list',compact('sub_categories'));
    }

    //
    public function create(){
        $categories=Category::orderBy('name','ASC')->get();
        return view('admin.sub_category.create',compact('categories'));
    }

    //it will store subcategory datas
    public function store(Request $request){

         //check validation of subcategories input fields
        $validator=Validator::make($request->all(),[
            'name'=>'required',
            'slug'=>'required|unique:sub_categories',
            'category'=>'required',
            'status'=>'required'
        ]);

        //if validation pass then it will save the subcategory datas successfully
        if($validator->passes()){
            $subCategory= new SubCategory();
            $subCategory->name= $request->name;
            $subCategory->slug= $request->slug;
            $subCategory->status= $request->status;
            $subCategory->category_id= $request->category;
            $subCategory->showHome= $request->showHome;
            $subCategory->save();

            session()->flash('success','Sub Category Created Successfully');
            return response()->json([
                'status'=>true,
                'message'=>'Sub Category Created Successfully'
            ]);

        }else{
            return response()->json([
                    'status'=>false,
                    'errors'=>$validator->errors()
                ]);
        }

    }

    //will work for display edit subcategory page
    public function edit($id,Request $request){

        //find subcategory based on requested subcategory id
        $subCategory=SubCategory::find($id);

        //if subcategory not found then it will redirect in subcategories list page
        if(empty($subCategory)){
            session()->flash('error','Record Not Found');
            return redirect()->route('sub_categories.index');
        }

        //category will display in asccending wise
        $categories=Category::orderBy('name','ASC')->get();
        return view('admin.sub_category.edit',compact('categories','subCategory'));
    }

    //it will work for update subcategory
    public function update($id,Request $request){

         //find subcategory based on requested subcategory id
        $subCategory=SubCategory::find($id);

        //if subcategory not found then it display record not found in subcategory edit page
        if(empty($subCategory)){
            session()->flash('error','Record Not Found');
            return response([
                'status'=>false,
                'notFound'=>true,
            ]);
        }

        //check validation of subcategories input fields
        $validator=Validator::make($request->all(),[
            'name'=>'required',
            'slug'=>'required|unique:sub_categories,slug,'.$subCategory->id.'id',
            'category'=>'required',
            'status'=>'required'
        ]);

        //if validation pass then subcategory will save or updated
        if($validator->passes()){
            $subCategory->name= $request->name;
            $subCategory->slug= $request->slug;
            $subCategory->status= $request->status;
            $subCategory->category_id= $request->category;
            $subCategory->showHome= $request->showHome;
            $subCategory->save();

            session()->flash('success','Sub Category Updated Successfully');
            return response()->json([
                'status'=>true,
                'message'=>'Sub Category Updated Successfully'
            ]);

        }else{
            return response()->json([
                    'status'=>false,
                    'errors'=>$validator->errors()
                ]);
        }
    }

    //it will delete the subcategories based on id
    public function destroy($id, Request $request){

        //find subcategory based on requested subcategory id
        $subCategory=SubCategory::find($id);

        //if subcategory not found then it display record not found in subcategory edit page
        if(empty($subCategory)){
            session()->flash('error','Record Not Found');
            return response([
                'status'=>false,
                'notFound'=>true,
            ]);
        }

        $subCategory->delete();

        session()->flash('success','Sub Category Deleted Successfully');
            return response()->json([
                'status'=>true,
                'message'=>'Sub Category Deleted Successfully'
            ]);
    }
}
