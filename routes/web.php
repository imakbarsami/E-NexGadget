<?php

use App\Http\Controllers\admin\AdminLoginController;
use App\Http\Controllers\admin\BrandsController;
use App\Http\Controllers\admin\CategoryController;
use App\Http\Controllers\admin\DiscountCodeController;
use App\Http\Controllers\admin\HomeController;
use App\Http\Controllers\admin\OrderController;
use App\Http\Controllers\admin\PageController;
use App\Http\Controllers\admin\ProductController;
use App\Http\Controllers\admin\ProductSubCategoryController;
use App\Http\Controllers\admin\SettingController;
use App\Http\Controllers\admin\ShippingController;
use App\Http\Controllers\admin\SubCategoryController;
use App\Http\Controllers\admin\TempImagesController;
use App\Http\Controllers\admin\UserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\FrontController;
use App\Http\Controllers\ProductImageController;
use App\Http\Controllers\ShopController;
use App\Models\SubCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;


Route::get('/',[FrontController::class,'index'])->name('front.home');
Route::get('/shop/{categorySlug?}/{subCategorySlug?}',[ShopController::class,'index'])->name('front.shop');
Route::get('/product/{slug}',[ShopController::class,'product'])->name('front.product');
Route::get('/cart',[CartController::class,'cart'])->name('front.cart');
Route::post('/add_to_cart',[CartController::class,'addToCart'])->name('front.add_to_cart');
Route::post('/update_cart',[CartController::class,'updateCart'])->name('front.update_cart');
Route::delete('/delete_item',[CartController::class,'deleteItem'])->name('front.delete_item.cart');
Route::get('/checkout',[CartController::class,'checkout'])->name('front.checkout');
Route::post('/process_checkout',[CartController::class,'processCheckout'])->name('front.process_checkout');
Route::get('/thanks/{orderId}',[CartController::class,'thankYou'])->name('front.thanks');
Route::post('/get_order_summery',[CartController::class,'getOrderSummery'])->name('front.get_order_summery');
Route::post('/apply_discount',[CartController::class,'applyDiscount'])->name('front.apply_discount');
Route::post('/remove_discount',[CartController::class,'removeCoupon'])->name('front.remove_discount');
Route::post('/add_to_wishlist',[FrontController::class,'addToWishlist'])->name('front.add_to_wishlist');
Route::get('/page/{slug}',[FrontController::class,'page'])->name('front.page');
Route::post('/send_contact_email',[FrontController::class,'sendContactEmail'])->name('front.send_contact_email');
Route::get('/forget_password',[AuthController::class,'forgetPassword'])->name('front.forget_password');
Route::post('/process_forget_password',[AuthController::class,'processForgetPassword'])->name('front.process_forget_password');
Route::get('/reset_password/{token}',[AuthController::class,'resetPassword'])->name('front.process_reset_password');
Route::post('/process_reset_password',[AuthController::class,'processResetPassword'])->name('front.processResetPassword');
Route::post('/save_rating/{product_id}',[ShopController::class,'saveRating'])->name('front.save_rating');


//for user
Route::group(['prefix'=>'account'],function(){

    //these routes for before user authentication
    Route::group(['middleware'=>'guest'],function(){

        Route::get('/login',[AuthController::class,'login'])->name('account.login');
        Route::get('/register',[AuthController::class,'register'])->name('account.register');
        Route::post('/process_register',[AuthController::class,'processRegister'])->name('account.process_register');
        Route::post('/login',[AuthController::class,'authenticate'])->name('account.authenticate');
    });

     //these routes for after successfully user authentication
    Route::group(['middleware'=>'auth'],function(){
        Route::get('/profile',[AuthController::class,'profile'])->name('account.profile');
        Route::post('/update_profile',[AuthController::class,'updateProfile'])->name('account.update_profile');
        Route::post('/update_address',[AuthController::class,'updateAddress'])->name('account.update_address');
        Route::get('/my_order',[AuthController::class,'orders'])->name('account.orders');
        Route::get('/order_details/{orderId}',[AuthController::class,'orderDetails'])->name('account.order_details');
        Route::get('/my_wishlist',[AuthController::class,'wishlist'])->name('account.wishlist');
        Route::post('/remove_product_from_wishlist',[AuthController::class,'removeProductFromWishlist'])->name('account.remove_product_from_wishlist');
        Route::get('/change_password',[AuthController::class,'showChangePasswordForm'])->name('account.change_password');
        Route::post('/process_change_password',[AuthController::class,'changePassword'])->name('account.process_change_password');
        Route::get('/logout',[AuthController::class,'logout'])->name('account.logout');


    });

});


//for admin
Route::group(['prefix'=>'admin'],function(){
    //these routes for before admin authentication
    Route::group(['middleware'=>'admin.guest'],function(){
        Route::get('',[AdminLoginController::class,'index'])->name('admin.login');
        Route::post('/authenticate',[AdminLoginController::class,'authenticate'])->name('admin.authenticate');

    });

    //these routes for after successfully admin authentication
    Route::group(['middleware'=>'admin.auth'],function(){
        Route::get('/dashboard',[HomeController::class,'index'])->name('admin.dashboard');
        Route::get('/logout',[HomeController::class,'logout'])->name('admin.logout');

        //category route
        Route::get('/categories',[CategoryController::class,'index'])->name('categories.index');
        Route::get('/categories/create',[CategoryController::class,'create'])->name('categories.create');
        Route::post('/categories',[CategoryController::class,'store'])->name('categories.store');
        Route::get('/categories/{category}/edit',[CategoryController::class,'edit'])->name('categories.edit');
        Route::put('/categories/{category}',[CategoryController::class,'update'])->name('categories.update');
        Route::delete('/categories/{category}',[CategoryController::class,'destroy'])->name('categories.delete');


        //sub category route
        Route::get('/sub_categories',[SubCategoryController::class,'index'])->name('sub_categories.index');
        Route::get('/sub_categories/create',[SubCategoryController::class,'create'])->name('sub_categories.create');
        Route::post('/sub_categories',[SubCategoryController::class,'store'])->name('sub_categories.store');
        Route::get('/sub_categories/{sub_category}/edit',[SubCategoryController::class,'edit'])->name('sub_categories.edit');
        Route::put('/sub_categories/{sub_category}',[SubCategoryController::class,'update'])->name('sub_categories.update');
        Route::delete('/sub_categories/{sub_category}',[SubCategoryController::class,'destroy'])->name('sub_categories.delete');

        //brand route
        Route::get('/brands',[BrandsController::class,'index'])->name('brands.index');
        Route::get('/brands/create',[BrandsController::class,'create'])->name('brands.create');
        Route::post('/brands',[BrandsController::class,'store'])->name('brands.store');
        Route::get('/brands/{brand}/edit',[BrandsController::class,'edit'])->name('brands.edit');
        Route::put('/brands/{brand}',[BrandsController::class,'update'])->name('brands.update');
        Route::delete('/brands/{brand}',[BrandsController::class,'destroy'])->name('brands.delete');


        //route for product
        Route::get('/products',[ProductController::class,'index'])->name('products.index');
        Route::get('/products/create',[ProductController::class,'create'])->name('products.create');
        Route::get('/product_sub_categories',[ProductSubCategoryController::class,'index'])->name('product_sub_categories.index');
        Route::post('/products',[ProductController::class,'store'])->name('products.store');
        Route::get('/products/{product}/edit',[ProductController::class,'edit'])->name('products.edit');
        Route::put('/products/{product}',[ProductController::class,'update'])->name('products.update');
        Route::post('/products_images/update',[ProductImageController::class,'update'])->name('products_images.update');
        Route::delete('/products_images',[ProductImageController::class,'destroy'])->name('products_images.destroy');
        Route::delete('/products/{product}',[ProductController::class,'destroy'])->name('products.delete');
        Route::get('/get_products',[ProductController::class,'getProducts'])->name('products.get_products');
        Route::get('/ratings',[ProductController::class,'productRating'])->name('products.ratings');
        Route::get('/change_rating_status',[ProductController::class,'changeRatingStatus'])->name('products.change_rating_status');

        //route for shipping
        Route::get('/shipping/create',[ShippingController::class,'create'])->name('shipping.create');
        Route::post('/shipping',[ShippingController::class,'store'])->name('shipping.store');
        Route::get('/shipping/{shipping}/edit',[ShippingController::class,'edit'])->name('shipping.edit');
        Route::put('/shipping/{shipping}',[ShippingController::class,'update'])->name('shipping.update');
        Route::delete('/shipping/{shipping}',[ShippingController::class,'destroy'])->name('shipping.delete');


        //route for coupon code
        Route::get('/coupons/create',[DiscountCodeController::class,'create'])->name('coupons.create');
        Route::post('/coupons',[DiscountCodeController::class,'store'])->name('coupons.store');
        Route::get('/coupons',[DiscountCodeController::class,'index'])->name('coupons.index');
        Route::get('/coupons/{coupon}/edit',[DiscountCodeController::class,'edit'])->name('coupons.edit');
        Route::put('/coupons/{coupon}',[DiscountCodeController::class,'update'])->name('coupons.update');
        Route::delete('/coupons/{coupon}',[DiscountCodeController::class,'destroy'])->name('coupons.delete');


        //route for order
        Route::get('/orders',[OrderController::class,'index'])->name('orders.index');
        Route::get('/orders/{id}',[OrderController::class,'detail'])->name('orders.detail');
        Route::post('/order/change_status/{id}',[OrderController::class,'changeOrderStatus'])->name('orders.change_order_status');
        Route::post('/order/send_email/{id}',[OrderController::class,'sendInvoiceEmail'])->name('orders.send_invoice_email');


        //route for users
        Route::get('/users',[UserController::class,'index'])->name('users.index');
        Route::get('/users/user',[UserController::class,'create'])->name('users.create');
        Route::post('/users',[UserController::class,'store'])->name('users.store');
        Route::get('/users/{user}/edit',[UserController::class,'edit'])->name('users.edit');
        Route::put('/users/{user}',[UserController::class,'update'])->name('users.update');
        Route::delete('/users/{user}',[UserController::class,'destroy'])->name('users.delete');

        //route for pages
        Route::get('/pages',[PageController::class,'index'])->name('pages.index');
        Route::get('/pages/page',[PageController::class,'create'])->name('pages.create');
        Route::post('/pages',[PageController::class,'store'])->name('pages.store');
        Route::get('/pages/{page}/edit',[PageController::class,'edit'])->name('pages.edit');
        Route::put('/pages/{page}',[PageController::class,'update'])->name('pages.update');
        Route::delete('/pages/{page}',[PageController::class,'destroy'])->name('pages.delete');


        //setting route
        Route::get('/change_password',[SettingController::class,'showChangePasswordForm'])->name('admin.show_change_password_form');
        Route::post('/process_change_password',[SettingController::class,'processChangePassword'])->name('admin.process_change_password');


        //route for create slug based on provided name
        Route::get('/getSlug',function(Request $request){
            $slug='';
            if(!empty($request->title)){
                $slug=Str::slug($request->title);
            }

            return response()->json([
                'status'=>true,
                'slug'=>$slug
            ]);
        })->name('getSlug');

    });

    //route for upload temporary image
    Route::post('/upload_temp_image',[TempImagesController::class,'create'])->name('temp_images.create');


});
