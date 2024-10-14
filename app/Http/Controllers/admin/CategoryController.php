<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Category;
use App\Models\TempImage;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image;

class CategoryController extends Controller
{
    //it will work for display categories list
    public function index(Request $request){
        $categories = Category::latest();

        // Display brands that match the keyword by searching
        if(!empty($request->get('keyword'))){
            $categories = $categories->where('name','like','%'.$request->get('keyword').'%');
        }
        //10 records will show in category page
        $categories = $categories->paginate(10);
        return view('admin.category.list',compact('categories'));
    }

    //display category creation form
    public function create(){
        return view('admin.category.create');
    }

    //it will store categories datas
    public function store(Request $request){

        //check validation of name and slug field
        $validator=Validator::make($request->all(),[
            'name'=>'required',
            'slug'=>'required|unique:categories',
        ]);

        //if validation pass then category datas will save successfully
        if($validator->passes()){
            $category=new Category();
            $category->name=$request->name;
            $category->slug=$request->slug;
            $category->status=$request->status;
            $category->showHome=$request->showHome;
            $category->save();

            //save image
            if(!empty($request->image_id)){
                $tempImage=TempImage::find($request->image_id);
                $extArray=explode('.',$tempImage->name);
                $ext=last($extArray);

                $newImageName=$category->id.'.'.$ext;
                $sourcePath=public_path().'/temp/'.$tempImage->name;
                $destinationPath=public_path().'/upload/category/'.$newImageName;

                File::copy($sourcePath,$destinationPath);

                //genarate image thumbnail
                $destinationPath=public_path().'/upload/category/thumb/'.$newImageName;
                $img = Image::make($sourcePath);
                $img->resize(450, 600);
                $img->save($destinationPath);


                $category->image=$newImageName;
                $category->save();
            }

            session()->flash('success', 'Category added successfully');

            return response()->json([
                'status'=>true,
                'message'=>'Category added successfully',
            ]);
        }else{
            return response()->json([
                'status'=>false,
                'errors'=>$validator->errors()
            ]);
        }
    }

    //will work for display edit category page
    public function edit($categoryId,Request $request){

        //find category based on requested category id
        $category=Category::find($categoryId);

        //if category not found then it will redirect in categories list page
        if(empty($category)){
            return redirect()->route('categories.index');
        }
        return view('admin.category.edit',compact('category'));
    }

    //it will work for update category
    public function update($categoryId,Request $request){

        //find category based on requested category id
        $category=Category::find($categoryId);

        //if category not found then it will redirect in categories list page
        if(empty($category)){

            session()->flash('error', 'Category not found');

            return response()->json([
                'status'=>false,
                'notFound'=>true,
                'message'=>'Category not found'
            ]);
        }

        //checking validation of name and slug updated data
        $validator=Validator::make($request->all(),[
            'name'=>'required',
            'slug'=>'required|unique:categories,slug,'.$category->id.'id',
        ]);

        //if validation pass then category will save or updated
        if($validator->passes()){
            $category->name=$request->name;
            $category->slug=$request->slug;
            $category->status=$request->status;
            $category->showHome=$request->showHome;
            $category->save();

            $oldImage=$category->image;

            //save image
            // if(!empty($request->image_id)){
            //     $tempImage=TempImage::find($request->image_id);
            //     $extArray=explode('.',$tempImage->name);
            //     $ext=last($extArray);

            //     $newImageName=$category->id.'-'.time().'.'.$ext;
            //     // $newImageName=$category->id.'.'.$ext;
            //     $sourcePath=public_path().'/temp/'.$tempImage->name;
            //     $destinationPath=public_path().'/upload/category/'.$newImageName;

            //     File::copy($sourcePath,$destinationPath);

            //     //genarate image thumbnail
            //     // $destinationPath=public_path().'/upload/category/thumb/'.$newImageName;
            //     // $img = Image::make($sourcePath);
            //     // $img->resize(450, 600);
            //     // $img->save($destinationPath);


            //     $category->image=$newImageName;
            //     $category->save();

            //     //delete old images
            //     File::delete(public_path().'/upload/category/'.$oldImage);
            // }

            if(!empty($request->image_id)){
                $tempImage=TempImage::find($request->image_id);
                $extArray=explode('.',$tempImage->name);
                $ext=last($extArray);

                $newImageName=$category->id.'.'.$ext;
                $sourcePath=public_path().'/temp/'.$tempImage->name;
                $destinationPath=public_path().'/upload/category/'.$newImageName;

                File::copy($sourcePath,$destinationPath);

                //genarate image thumbnail
                $destinationPath=public_path().'/upload/category/thumb/'.$newImageName;
                $img = Image::make($sourcePath);
                $img->resize(450, 600);
                $img->save($destinationPath);


                $category->image=$newImageName;
                $category->save();
            }

            session()->flash('success', 'Category updated successfully');

            return response()->json([
                'status'=>true,
                'message'=>'Category updated successfully',
            ]);
        }else{
            return response()->json([
                'status'=>true,
                'errors'=>$validator->errors()
            ]);
        }
    }

    //it will delete the categories based on id
    public function destroy($categoryId,Request $request){

        //find category based on requested category id
        $category=Category::find($categoryId);

        //if category not found then it will redirect in categories list page
        if(empty($category)){

            session()->flash('error','Category not  found');

            return response()->json([
                'status'=>true,
                'message'=>'Category not found',
            ]);
        }
        //delete pics from uploded folder
        File::delete(public_path().'/upload/category/'.$category->image);
        $category->delete();

        session()->flash('success','Category deleted successfully');
        return response()->json([
            'status'=>true,
            'message'=>'Category deleted successfully',
        ]);
    }
}
