<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductRating;
use App\Models\SubCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ShopController extends Controller
{
    public function index(Request $request, $categorySlug = null, $subCategorySlug = null) {
        $categorySelected = '';
        $subCategorySelected = '';
        $brandArray = [];
        $priceRangeArray = [];

        $categories = Category::orderBy('name', 'ASC')->with('subCategory')->where('status', 1)->get();
        $brands = Brand::orderBy('name', 'ASC')->where('status', 1)->get();
        $products = Product::where('status', 1);

        // Apply filters here
        if (!empty($categorySlug)) {
            $category = Category::where('slug', $categorySlug)->first();
            $products = $products->where('category_id', $category->id);
            $categorySelected = $category->id;
        }

        if (!empty($subCategorySlug)) {
            $subCategory = SubCategory::where('slug', $subCategorySlug)->first();
            $products = $products->where('sub_category_id', $subCategory->id);
            $subCategorySelected = $subCategory->id;
        }

        if (!empty($request->get('brand'))) {
            $brandArray = explode(',', $request->get('brand'));
            $products = $products->whereIn('brand_id', $brandArray);
        }

        if (!empty($request->get('price_range'))) {
            $priceRangeArray = explode(',', $request->get('price_range'));
            foreach ($priceRangeArray as $range) {
                [$min, $max] = explode('-', $range);
                if ($max == '+') {
                    $products = $products->where('price', '>=', $min);
                } else {
                    $products = $products->whereBetween('price', [$min, $max]);
                }
            }
        }

        if ($request->get('price_max') != '' && $request->get('price_min') != '') {
            $products = $products->whereBetween('price', [$request->get('price_min'), $request->get('price_max')]);
        }

        if(!empty($request->get('search'))){

            $products=$products->where('title','like','%'.$request->get('search').'%');

        }


        if($request->get('sort')!=''){

            if($request->get('sort')=='latest'){

                $products = $products->orderBy('id', 'DESC');

            }else if($request->get('sort')=='price_asc'){

                $products = $products->orderBy('price', 'ASC');
            }else{
                $products = $products->orderBy('price', 'DESC');
            }
        }else{
            $products = $products->orderBy('id', 'DESC');
        }

        $sort=$request->get('sort');

        $products=$products->paginate(9);

        return view('front.shop', compact('categories', 'brands', 'products', 'categorySelected',
                    'subCategorySelected', 'brandArray', 'priceRangeArray','sort'));
    }

    public function product($slug){
        $product=Product::where('slug',$slug)
                    ->withCount('product_ratings')
                    ->withSum('product_ratings','rating')
                    ->with(['product_images','product_ratings'])
                    ->first();

        if($product==null){
            abort(404);
        }

        //fetch related products
        $related_products=[];
        if($product->related_products !=''){
            $productArray=explode(',',$product->related_products);

           $related_products=Product::whereIn('id',$productArray)->where('status',1)->get();
        }

        //average product rating
        if($product->product_ratings_count>0){
            $avgRating=number_format(($product->product_ratings_sum_rating/$product->product_ratings_count),1);
        }else{
            $avgRating=0.0;
        }

        return view('front.product',compact('product','related_products','avgRating'));
    }

    public function saveRating($id,Request $request){

        if(!Auth::check()){
            session()->flash('error','You have to login first for review');
            return response()->json([
                'status'=>true,
                'message'=>'You have to login first for review'
            ]);
        }

        $validator=Validator::make($request->all(),[
            'name'=>'required',
            'email'=>'required|email|in:'.Auth::user()->email,
            'rating'=>'required',
            'comment'=>'required',
        ],[
            'email.in' => 'Please provide your own email.',
        ]);

        if($validator->fails()){

            return response()->json([
                'status'=>false,
                'errors'=>$validator->errors()
            ]);
        }

        $count=ProductRating::where('email',$request->email)->where('product_id',$id)->count();

        if($count>0){
            session()->flash('error','You have already rated this product');
            return response()->json([
                'status'=>true,
                'message'=>'You have already rated this product'
            ]);
        }
        $productRating=new ProductRating();
        $productRating->product_id=$id;
        $productRating->username=$request->name;
        $productRating->email=$request->email;
        $productRating->rating=$request->rating;
        $productRating->comment=$request->comment;
        $productRating->status=0;
        $productRating->save();

        session()->flash('success','Thank you for your feedback');
        return response()->json([
            'status'=>true,
            'message'=>'Thank you for your feedback'
        ]);
    }
}
