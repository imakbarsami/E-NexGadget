<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\ProductRating;
use App\Models\SubCategory;
use App\Models\TempImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image As Image;

class ProductController extends Controller
{
    public function index(Request $request){

       $products=Product::latest('id')->with('product_images');

       if($request->get('keyword')){
        $products = $products->where('title', 'like', '%' . $request->keyword.'%');
        }

       $products=$products->paginate(10);
       return view('admin.product.list',compact('products'));
    }
    //it will work for display products list
    public function create(){

        //access all categories in asccending order to display in product list page
        $categories=Category::orderBy('name','ASC')->get();

        //access all brands in asccending order to display in product list page
        $brands=Brand::orderBy('name','ASC')->get();

        return view('admin.product.create',compact('categories','brands'));
    }

    public function store(Request $request){

        //provide validation
        $rules=[
            'title'=>'required',
            'slug'=>'required|unique:products',
            'price'=>'required|numeric',
            'sku'=>'required|unique:products',
            'track_qty'=>'required|in:Yes,No',
            'category'=>'required|numeric',
            'is_featured'=>'required|in:Yes,No',
        ];

        if(!empty($request->track_qty) && $request->track_qty=='Yes'){
            $rules['qty']='required|numeric';
        }

        //checking validation for all the input field
        $validator=Validator::make($request->all(),$rules);

        //if validation pass then product datas will save successfully
        if($validator->passes()){
            $product=new Product();
            $product->title= $request->title;
            $product->slug= $request->slug;
            $product->description= $request->description;
            $product->price= $request->price;
            $product->compare_price= $request->compare_price;
            $product->sku= $request->sku;
            $product->barcode= $request->barcode;
            $product->track_qty= $request->track_qty;
            $product->qty= $request->qty;
            $product->status= $request->status;
            $product->category_id= $request->category;
            $product->sub_category_id= $request->sub_category;
            $product->brand_id= $request->brand_id;
            $product->is_featured=$request->is_featured;
            $product->short_description=$request->short_description;
            $product->shipping_returns=$request->shipping_returns;
            $product->related_products=(!empty($request->related_products))? implode(',',$request->related_products):'';
            $product->save();

            //save gallery pics
            if(!empty($request->image_array)){
                foreach($request->image_array as $temp_image_id){

                    $tempImageInfo=TempImage::find($temp_image_id);
                    $extArray=explode('.',$tempImageInfo->name);
                    $ext=last($extArray);

                    $productImage=new ProductImage();
                    $productImage->product_id=$product->id;
                    $productImage->image='NULL';
                    $productImage->save();

                    $imageName=$product->id.'-'.$productImage->id.'-'.time().'.'.$ext;
                    $productImage->image=$imageName;
                    $productImage->save();

                    //genarate product thumnails

                    //large image
                    $sourcePath=public_path().'/temp/'.$tempImageInfo->name;
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
                }

            }


            session()->flash('success','Product Added Succuessfully');

            return response()->json([
                'status'=>true,
                'message'=>'Product Added Succuessfully'
            ]);
            }else{
                return response()->json([
                    'status'=>false,
                    'errors'=>$validator->errors()
                ]);
            }
    }

    public function edit($productId,Request $request){

        //find product based on requested product id
        $products=Product::find($productId);

        //if product not found then it will redirect in categories list page
        if(empty($products)){
            session()->flash('error','Product Not Found');
            return redirect()->route('products.index')
            ->with('error','Product Not Found');
        }

        //fetch product image
        $productImages=ProductImage::where('product_id',$products->id)->get();

        $categories=Category::orderBy('name','ASC')->get();
        $brands=Brand::orderBy('name','ASC')->get();

        $sub_categories=SubCategory::where('category_id',$products->category_id)->get();

        //fetch related products
        $related_products=[];
        if($products->related_products !=''){
            $productArray=explode(',',$products->related_products);

           $related_products=Product::whereIn('id',$productArray)->with('product_images')->get();
        }

        return view('admin.product.edit',compact('products','categories','brands','sub_categories','productImages','related_products'));
    }

    //it will work for update product
    public function update($productId, Request $request){

        $product=Product::find($productId);

         //provide validation
         $rules=[
            'title'=>'required',
            'slug'=>'required|unique:products,slug,'.$product->id.'id',
            'price'=>'required|numeric',
            'sku'=>'required|unique:products,slug,'.$product->id.'id',
            'track_qty'=>'required|in:Yes,No',
            'category'=>'required|numeric',
            'is_featured'=>'required|in:Yes,No',
        ];

        if(!empty($request->track_qty) && $request->track_qty=='Yes'){
            $rules['qty']='required|numeric';
        }

        //checking validation for all the input field
        $validator=Validator::make($request->all(),$rules);

        //if validation pass then product datas will save successfully
        if($validator->passes()){
            $product->title= $request->title;
            $product->slug= $request->slug;
            $product->description= $request->description;
            $product->price= $request->price;
            $product->compare_price= $request->compare_price;
            $product->sku= $request->sku;
            $product->barcode= $request->barcode;
            $product->track_qty= $request->track_qty;
            $product->qty= $request->qty;
            $product->status= $request->status;
            $product->category_id= $request->category;
            $product->sub_category_id= $request->sub_category;
            $product->brand_id= $request->brand_id;
            $product->is_featured=$request->is_featured;
            $product->short_description=$request->short_description;
            $product->shipping_returns=$request->shipping_returns;
            $product->related_products=(!empty($request->related_products))? implode(',',$request->related_products):'';
            $product->save();

            session()->flash('success','Product Updated Succuessfully');

            return response()->json([
                'status'=>true,
                'message'=>'Product Updated Succuessfully'
            ]);
            }else{
                return response()->json([
                    'status'=>false,
                    'errors'=>$validator->errors()
                ]);
            }
    }

    public function destroy($product_id,Request $request){


        $product=Product::find($product_id);

        if(empty($product)){
            session()->flash('error','Product Not Found');
            return response()->json([
                'status'=>false,
                'notFound'=>true
            ]);
        }

        $productImages=ProductImage::where('product_id',$product_id)->get();

        if(!empty($productImages)){
            foreach ($productImages as $productImage) {
                File::delete(public_path('upload/product/large/'.$productImage->image));
                File::delete(public_path('upload/product/small/'.$productImage->image));
            }

                ProductImage::where('product_id',$product_id)->delete();
        }

        $product->delete();

        session()->flash('success','Product Deleted Succuessfully');

        return response()->json([
            'status'=>true,
            'message'=>'Product Deleted Successfully'
        ]);

    }

    public function getProducts(Request $request){

        $tempProducts=[];

        if($request->term !=''){
            $products=Product::where('title','like','%'.$request->term.'%')->get();
            if($products !=null){
                foreach($products as $product){
                    $tempProducts[]=array('id'=>$product->id,'text'=>$product->title);
                }
            }

        }
       return response()->json([
        'tags'=>$tempProducts,
        'status'=>true
       ]);
    }

    public function productRating(Request $request){

        $ratings=ProductRating::select('product_ratings.*','products.title as productTittle')
                               ->orderBy('product_ratings.created_at','DESC');

        $ratings=$ratings->leftJoin('products','products.id','product_ratings.product_id');

        if($request->get('keyword')){
            $ratings = $ratings->where('username', 'like', '%' . $request->keyword.'%');
            $ratings = $ratings->orWhere('rating', 'like', '%' . $request->keyword.'%');
            $ratings = $ratings->orWhere('title', 'like', '%' . $request->keyword.'%');
        }

        $ratings=$ratings->paginate(10);

        return view('admin.product.ratings',compact('ratings'));
    }


    public function changeRatingStatus(Request $request){

        $productRating=ProductRating::find($request->id);
        $productRating->status=$request->status;
        $productRating->save();


        session()->flash('success','Status Changed Successfully');
        return response()->json([
           'status'=>true,
           'message'=>'Status Changed Successfully'
        ]);
    }
}
