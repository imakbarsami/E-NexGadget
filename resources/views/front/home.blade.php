@extends('front.layout.app')

@section('content')
<section class="section-1">
    <div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="2000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <!-- <img src="images/carousel-1.jpg" class="d-block w-100" alt=""> -->

                <picture>
                    <source media="(max-width: 799px)" srcset="{{asset('images/hitech.jpg')}}" />
                    <source media="(min-width: 800px)" srcset="{{asset('images/hitech.jpg')}}" />
                    <img src="images/hitech.jpg" alt="" />
                </picture>

                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3">
                        <h1 class="display-4 mb-3" style="font-family: 'Bungee', cursive; color: white; text-shadow: 0 0 10px rgba(255, 255, 255, 0.8), 0 0 20px rgba(0, 0, 255, 0.7);">Heaven for Tech Geeks</h1>
                        <p class="mx-md-5 px-5" style="font-family: 'Bungee', cursive; color: white;">Check Our Latest Collection</p>
                    <a class="btn btn-outline-light py-2 px-4 mt-3" href="http://127.0.0.1:8000/shop">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="carousel-item">

                <picture>
                    <source media="(max-width: 799px)" srcset="{{asset('images/iphone.jpg')}}" />
                    <source media="(min-width: 800px)" srcset="{{asset('images/iphone.jpg')}}" />
                    <img src="{{asset('images/iphone.jpg')}}" alt="" />
                </picture>

                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3">
                        <h1 class="display-4 mb-3" style="font-family: 'Bungee', cursive; color: white; text-shadow: 0 0 10px rgba(255, 255, 255, 0.8), 0 0 20px rgba(0, 0, 255, 0.7);">Amazing Brands</h1>
                    <p class="mx-md-5 px-5" style="font-family: 'Bungee', cursive; color: white;">Discover The Trendiest Products</p>
                    <a class="btn btn-outline-light py-2 px-4 mt-3" href="http://127.0.0.1:8000/shop">Shop Now</a>
                </div>
                </div>
            </div>
            <div class="carousel-item">
                <!-- <img src="images/photo.jpg" class="d-block w-100" alt=""> -->

                <picture>
                    <source media="(max-width: 799px)" srcset="{{asset('images/photo.jpg')}}"/>
                    <source media="(min-width: 800px)" srcset="{{asset('images/photo.jpg')}}"/>
                    <img src="images/photo.jpg" alt="" />
                </picture>

                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3">
                        <h1 class="display-4 mb-3" style="font-family: 'Bungee', cursive; color: white; text-shadow: 0 0 10px rgba(255, 255, 255, 0.8), 0 0 20px rgba(0, 0, 255, 0.7);">Flat 70% Off</h1>
                    <p class="mx-md-5 px-5" style="font-family: 'Bungee', cursive; color: white;">Best Deals At Trendiest Gadgets</p>
                    <a class="btn btn-outline-light py-2 px-4 mt-3" href="http://127.0.0.1:8000/shop">Shop Now</a>
                </div>
                </div>
            </div>
            <div class="carousel-item">
                <!-- <img src="images/photo.jpg" class="d-block w-100" alt=""> -->

                <picture>
                    <source media="(max-width: 799px)" srcset="{{asset('images/gad.avif')}}"/>
                    <source media="(min-width: 800px)" srcset="{{asset('images/gad.avif')}}"/>
                    <img src="images/photo.jpg" alt="" />
                </picture>

                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3">
                        <h1 class="display-4 mb-3" style="font-family: 'Bungee', cursive; color: white; text-shadow: 0 0 10px rgba(255, 255, 255, 0.8), 0 0 20px rgba(0, 0, 255, 0.7);">Explore Our Collection</h1>
                    <p class="mx-md-5 px-5" style="font-family: 'Bungee', cursive; color: white;">Find the best products at amazing prices!</p>
                    <a class="btn btn-outline-light py-2 px-4 mt-3" href="http://127.0.0.1:8000/shop">Shop Now</a>
                </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</section>
<!-- Section 2: Transparent Centered Fields with Dark Blue Background -->
<section class="section-2" style="background-color: #001f3f; padding: 20px 0; margin: 0;"> 
    <div class="container">
        <div class="row justify-content-center text-center">
            <!-- Quality Product -->
            <div class="col-lg-3 mb-3">
                <div class="box shadow-lg p-4" style="background-color: rgba(255, 255, 255, 0.1); border-radius: 10px;">
                    <div class="fa icon fa-check text-white mb-3" style="font-size: 50px; text-align: center;"></div>
                    <h2 class="text-white font-weight-semi-bold">Quality Product</h2>
                </div>
            </div>
            <!-- Free Shipping -->
            <div class="col-lg-3 mb-3">
                <div class="box shadow-lg p-4" style="background-color: rgba(255, 255, 255, 0.1); border-radius: 10px;">
                    <div class="fa icon fa-shipping-fast text-white mb-3" style="font-size: 50px; text-align: center;"></div>
                    <h2 class="text-white font-weight-semi-bold">Free Shipping</h2>
                </div>
            </div>
            <!-- 14-Day Return -->
            <div class="col-lg-3 mb-3">
                <div class="box shadow-lg p-4" style="background-color: rgba(255, 255, 255, 0.1); border-radius: 10px;">
                    <div class="fa icon fa-exchange-alt text-white mb-3" style="font-size: 50px; text-align: center;"></div>
                    <h2 class="text-white font-weight-semi-bold">14-Day Return</h2>
                </div>
            </div>
            <!-- 24/7 Support -->
            <div class="col-lg-3 mb-3">
                <div class="box shadow-lg p-4" style="background-color: rgba(255, 255, 255, 0.1); border-radius: 10px;">
                    <div class="fa icon fa-phone-volume text-white mb-3" style="font-size: 50px; text-align: center;"></div>
                    <h2 class="text-white font-weight-semi-bold">24/7 Support</h2>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section-3" style="background-color: #001f3f;">
    <style>
        .cat-card {
            display: flex;
            height: 175px; /* Adjusted height */
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
    </style>
    <div class="container">
        <div class="section-title">
            <h1 style="font-family: 'Bungee', cursive; color: rgb(240, 240, 243); text-shadow: 0 0 5px rgba(70, 70, 74, 0.8), 0 0 10px rgba(214, 214, 221, 0.6), 0 0 15px rgba(168, 168, 172, 0.4); padding: 0.5rem; font-weight: bold;">Categories</h1>
        </div>
        <div class="row pb-3">
            @if (getCategories()->isNotEmpty())
                @foreach (getCategories() as $category)
                    <div class="col-lg-3">
                        <a href="{{ route('front.shop', $category->slug) }}" class="cat-card" style="text-decoration: none; color: black;">
                            <div class="left" style="flex: 0 0 50%; display: flex; align-items: center; justify-content: center;">
                                @if ($category->image != "")
                                    <img src="{{ asset('upload/category/thumb/' . $category->image) }}" alt="" class="img-fluid">
                                @endif
                            </div>
                            <div class="right" style="flex: 0 0 50%; display: flex; align-items: center; justify-content: center; font-family: 'Bungee', cursive;">
                                <div class="cat-data">
                                    <h2>{{$category->name}}</h2>
                                    <p>{{ $category->products->count() }} Products</p>
                                </div>
                            </div>
                        </a>
                    </div>
                @endforeach
            @endif
        </div>
    </div>
</section>

<section class="section-4 pt-5" style="background-color: #001f3f;">
    <div class="container">
        <div class="section-title">
            <h1 style= "font-family: 'Bungee', cursive; color: rgb(240, 240, 243); text-shadow: 0 0 5px rgba(70, 70, 74, 0.8), 0 0 10px rgba(214, 214, 221, 0.6), 0 0 15px rgba(168, 168, 172, 0.4);  padding: 0.5rem;font-weight: bold">Featured Products</h1>
        </div>

        <div class="row pb-3">
            @if ($featuredProducts->isNotEmpty())
                @foreach ($featuredProducts as $product )
                    @php
                    $productImage=$product->product_images->first();
                    @endphp
                <div class="col-md-3">
                    <div class="card product-card">
                        <div class="product-image position-relative">
                            <a href="{{route('front.product',$product->slug)}}" class="product-img">
                            {{-- <img class="card-img-top" src="{{asset('front_assets/images/product-1.jpg')}}" alt=""> --}}

                            @if (!(empty($productImage->image)))
                            <img src="{{asset('upload/product/small/'.$productImage->image)}}" class="card-img-top"  >
                            @else
                            <img src="{{asset('admin_assets/img/default-150x150.png')}}" class="card-img-top" >
                            @endif

                        </a>
                            <a onclick="addToWishlist({{$product->id}})" class="whishlist" href="javascript:void(0);"><i class="far fa-heart"></i></a>



                            <div class="product-action">

                                @if ($product->track_qty == 'Yes')
                                    @if ($product->qty>0)
                                    <a class="btn btn-dark" href="javascript:void(0);" onclick="addToCart({{$product->id}});">
                                        <i class="fa fa-shopping-cart"></i> Add To Cart
                                    </a>

                                    @else
                                    <a class="btn btn-dark" href="javascript:void(0);">
                                        Out Of stock
                                        </a>
                                    @endif


                                @else
                                    <a class="btn btn-dark" href="javascript:void(0);" onclick="addToCart({{$product->id}});">
                                        <i class="fa fa-shopping-cart"></i> Add To Cart
                                    </a>
                                @endif

                            </div>
                        </div>
                        <div class="card-body text-center mt-3">
                            <a class="h6 link" href="{{route('front.product',$product->slug)}}">{{$product->title}}</a>
                            <div class="price mt-2">
                                <span class="h5"><strong>{{$product->price}} BDT</strong></span>
                                @if ($product->compare_price>0)
                                <span class="h6 text-underline"><del>{{$product->compare_price}} BDT</del></span>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            @endif
        </div>
    </div>
</section>

<section class="section-4 pt-5" style="background-color: #001f3f;">
    <div class="container">
        <div class="section-title">
            <h1 style= "font-family: 'Bungee', cursive; color: rgb(240, 240, 243); text-shadow: 0 0 5px rgba(70, 70, 74, 0.8), 0 0 10px rgba(214, 214, 221, 0.6), 0 0 15px rgba(168, 168, 172, 0.4);  padding: 0.5rem;font-weight: bold">Latest Produsts</h1>
        </div>
        <div class="row pb-3">
            @if ($latestProducts->isNotEmpty())
                @foreach ($latestProducts as $product )
                    @php
                    $productImage=$product->product_images->first();
                    @endphp
                <div class="col-md-3">
                    <div class="card product-card">
                        <div class="product-image position-relative">
                            <a href="{{route('front.product',$product->slug)}}" class="product-img">
                            {{-- <img class="card-img-top" src="{{asset('front_assets/images/product-1.jpg')}}" alt=""> --}}

                            @if (!(empty($productImage->image)))
                            <img src="{{asset('upload/product/small/'.$productImage->image)}}" class="card-img-top"  >
                            @else
                            <img src="{{asset('admin_assets/img/default-150x150.png')}}" class="card-img-top" >
                            @endif

                        </a>
                        <a onclick="addToWishlist({{$product->id}})" class="whishlist" href="javascript:void(0);"><i class="far fa-heart"></i></a>


                            <div class="product-action">

                                @if ($product->track_qty == 'Yes')
                                    @if ($product->qty>0)
                                    <a class="btn btn-dark" href="javascript:void(0);" onclick="addToCart({{$product->id}});">
                                        <i class="fa fa-shopping-cart"></i> Add To Cart
                                    </a>

                                    @else
                                    <a class="btn btn-dark" href="javascript:void(0);">
                                        Out Of stock
                                        </a>
                                    @endif


                                @else
                                    <a class="btn btn-dark" href="javascript:void(0);" onclick="addToCart({{$product->id}});">
                                        <i class="fa fa-shopping-cart"></i> Add To Cart
                                    </a>
                                @endif

                            </div>
                        </div>
                        <div class="card-body text-center mt-3">
                            <a class="h6 link" href="{{route('front.product',$product->slug)}}">{{$product->title}}</a>
                            <div class="price mt-2">
                                <span class="h5"><strong>{{$product->price}} BDT</strong></span>
                                @if ($product->compare_price>0)
                                <span class="h6 text-underline"><del>{{$product->compare_price}}BDT</del></span>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            @endif
        </div>
    </div>
</section>

@endsection
