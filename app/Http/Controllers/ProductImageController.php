<?php

namespace App\Http\Controllers;

use App\Models\ProductImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image As Image;

class ProductImageController extends Controller
{
    public function update(Request $request){

        $image=$request->image;
        $extention=$image->getClientOriginalExtension();
        $sourcePath=$image->getPathName();

        $productImage=new ProductImage();
        $productImage->product_id=$request->product_id;
        $productImage->image='NULL';
        $productImage->save();

        $imageName=$request->product_id.'-'.$productImage->id.'-'.time().'.'.$extention;
        $productImage->image=$imageName;
        $productImage->save();


        //genarate product thumnails

        //large image
        $destinationPath=public_path().'/upload/product/large/'.$imageName;
        $image = Image::make($sourcePath);
        $image->resize(1400,null,function($constraint){
            $constraint->aspectRatio();
        });
        $image->save($destinationPath);

        //small image
        $destinationPath=public_path().'/upload/product/small/'.$imageName;
        $image = Image::make($sourcePath);
        $image->fit(300,300,);
        $image->save($destinationPath);

        return response()->json([
            'status'=>true,
            'image_id'=>$productImage->id,
            'imagePath'=>asset('upload/product/small/'.$productImage->image),
            'message'=>'Image Saved Successfully',
        ]);

    }

    public function destroy(Request $request){

        $productImage=ProductImage::find($request->id);

        if(empty($productImage)){
            return response()->json([
                'status'=>false,
                'message'=>'Image Not Found',
            ]);
        }

        //delete image form folders
        File::delete(public_path('upload/product/large/'.$productImage->image));
        File::delete(public_path('upload/product/small/'.$productImage->image));

        //delete from database
        $productImage->delete();

        return response()->json([
            'status'=>true,
            'message'=>'Image deleted Successfully',
        ]);
    }
}
