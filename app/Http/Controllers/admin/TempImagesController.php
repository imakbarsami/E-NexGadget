<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\TempImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Intervention\Image\Facades\Image As Image;


class TempImagesController extends Controller
{
    //it will work for upload temporary image
    public function create(Request $request ){
        $image=$request->image;

        if(!empty($image)){
            $ext=$image->getClientOriginalExtension();

            $tempImage=new TempImage();
            $tempImage->name='TEST';
            $tempImage->save();

            $newName=$tempImage->id.'-'.time().'.'.$ext;
            $tempImage->name=$newName;
            $tempImage->save();

            //upload in specified folder
            $image->move(public_path().'/temp',$newName);

            //genrate thumbnail
            $sourcePath=public_path().'/temp/'.$newName;
            $destinationPath=public_path().'/temp/thumb/'.$newName;
            $image=Image::make($sourcePath);
            $image->fit(300,275);
            $image->save($destinationPath);

            return response()->json([
                'status'=>true,
                'image_id'=>$tempImage->id,
                'imagePath'=>asset('/temp/thumb/'.$newName),
                'message'=>'Image Uploaded Successfully'

            ]);
        }

    }

}
