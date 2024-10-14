<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\SubCategory;
use Illuminate\Http\Request;

class ProductSubCategoryController extends Controller
{
    //display subcategories in product page
    public function index(Request $request){

        //access subcategories based on categoryid
        if(!empty($request->category_id)){
            $sub_categories=SubCategory::where('category_id',$request->category_id)
            ->orderBy('name','ASC')->get();

            return response()->json([
                'status'=>true,
                'sub_categories'=>$sub_categories,
            ]);
        }else{
            return response()->json([
                'status'=>true,
                'sub_categories'=>[],
            ]);
        }

    }

}
