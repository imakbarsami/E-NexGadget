@extends('front.layout.app')

@section('content')

</section>

<section class="section-6 pt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-3 sidebar">
                <div class="sub-title">
                    <h2>Categories</h2>
                </div>

                <div class="mb-3">
                    <a href="{{ route('front.shop') }}" class="btn btn-outline-secondary w-100 text-center">Reset Filter</a>
                </div>

                <div class="card">
                    <div class="card-body">
                        <div class="accordion accordion-flush" id="accordionExample">

                            @if ($categories->isNotEmpty())

                            @foreach ($categories as $key=> $category)
                            <div class="accordion-item">

                                @if ($category->subCategory->isNotEmpty())
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne-{{$key}}" aria-expanded="false" aria-controls="collapseOne-{{$key}}">
                                        {{$category->name}}
                                    </button>
                                </h2>
                                @else
                                <a href="{{route('front.shop',$category->slug)}}" class="nav-item nav-link {{($categorySelected==$category->id)? 'text-primary': ''}}">{{$category->name}}</a>
                                @endif

                                @if ($category->subCategory->isNotEmpty())
                                <div id="collapseOne-{{$key}}" class="accordion-collapse collapse {{($categorySelected==$category->id)?'show':''}}" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
                                    <div class="accordion-body">
                                        <div class="navbar-nav">
                                            @foreach ($category->subCategory as $subCategory)
                                            <a href="{{route('front.shop',[$category->slug,$subCategory->slug])}}" class="nav-item nav-link {{($subCategorySelected==$subCategory->id)? 'text-primary': ''}}">{{$subCategory->name}}</a>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                                @endif
                            </div>
                            @endforeach

                            @endif

                        </div>
                    </div>
                </div>

                <div class="sub-title mt-5">
                    <h2>Brand</h2>
                </div>

                <div class="card">
                    <div class="card-body">
                        @if ($brands->isNotEmpty())
                        @foreach ($brands as $brand )
                        <div class="form-check mb-2">
                            <input {{(in_array($brand->id,$brandArray))?'checked':''}} class="form-check-input brand-label" type="checkbox" name="brand[]" value="{{$brand->id}}" id="brand-{{$brand->id}}">
                            <label class="form-check-label" for="brand-{{$brand->id}}">
                                {{$brand->name}}
                            </label>
                        </div>
                        @endforeach
                        @endif
                    </div>
                </div>

                <div class="sub-title mt-5">
                    <h2>Price</h2>
                </div>

                <div class="card">
                    <div class="card-body">
                        <div class="card">
                            <div class="card-body">
                                <!-- Predefined price ranges -->
                                <div class="form-check mb-2">
                                    <input class="form-check-input price-label" type="checkbox" value="0-10000" id="flexCheck0-10000" {{ in_array('0-10000', $priceRangeArray) ? 'checked' : '' }}>
                                    <label class="form-check-label" for="flexCheck0-10000">
                                        0-10000 BDT
                                    </label>
                                </div>
                                <div class="form-check mb-2">
                                    <input class="form-check-input price-label" type="checkbox" value="10000-20000" id="flexCheck10000-20000" {{ in_array('10000-20000', $priceRangeArray) ? 'checked' : '' }}>
                                    <label class="form-check-label" for="flexCheck10000-20000">
                                        10000-20000 BDT
                                    </label>
                                </div>
                                <div class="form-check mb-2">
                                    <input class="form-check-input price-label" type="checkbox" value="20000-50000" id="flexCheck20000-50000" {{ in_array('20000-50000', $priceRangeArray) ? 'checked' : '' }}>
                                    <label class="form-check-label" for="flexCheck20000-50000">
                                        20000-50000 BDT
                                    </label>
                                </div>
                                <div class="form-check mb-2">
                                    <input class="form-check-input price-label" type="checkbox" value="50000-100000" id="flexChec50000-100000" {{ in_array('50000-100000', $priceRangeArray) ? 'checked' : '' }}>
                                    <label class="form-check-label" for="flexCheck50000-100000">
                                        50000-100000 BDT
                                    </label>
                                </div>


                                <!-- Custom price range -->
                                <div class="mb-2">
                                    <label for="price_min">Min Price</label>
                                    <input type="number" class="form-control" id="price_min" placeholder="Min Price" value="{{ request()->get('price_min') }}">
                                </div>
                                <div class="mb-2">
                                    <label for="price_max">Max Price</label>
                                    <input type="number" class="form-control" id="price_max" placeholder="Max Price" value="{{ request()->get('price_max') }}">
                                </div>
                                <button type="button" class="btn btn-primary w-100" onclick="apply_filters()">Apply Filters</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-end mb-4">
                            <div class="ml-2">
                                <select name="sort" id="sort" class="form-control">
                                    {{-- <option value="">Sort Product</option> --}}
                                    <option {{($sort=='latest')?'selected':''}} value="latest">Latest</option>
                                    <option {{($sort=='price_desc')?'selected':''}}  value="price_desc">Price High</option>
                                    <option {{($sort=='price_asc')?'selected':''}}  value="price_asc">Price Low</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    @if ($products->isNotEmpty())
                        @foreach ($products as $product )
                        <div class="col-md-4 mb-4">
                            @php
                            $productImage = $product->product_images->first();
                            @endphp
                            <div class="card product-card">
                                <div class="product-image position-relative">
                                    <a href="{{route('front.product',$product->slug)}}" class="product-img">
                                    @if (!(empty($productImage->image)))
                                    <img src="{{asset('upload/product/small/'.$productImage->image)}}" class="card-img-top"  >
                                    @else
                                    <img src="{{asset('admin_assets/img/default-150x150.png')}}" class="card-img-top" >
                                    @endif
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
                                        @if ($product->compare_price >0)
                                        <span class="h6 text-underline"><del>{{$product->compare_price}} BDT</del></span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    @endif

                    <div class="col-md-12 pt-5">
                       {{$products->withQueryString()->links()}}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection

@section('customjs')

<script>
        $(".brand-label, .price-label").change(function(){
        apply_filters();
    });

    $("#sort").change(function(){
        apply_filters();
    })


    function apply_filters() {
        var brands = [];
        var priceRanges = [];

        $(".brand-label").each(function() {
            if ($(this).is(":checked")) {
                brands.push($(this).val());
            }
        });

        $(".price-label").each(function() {
            if ($(this).is(":checked")) {
                priceRanges.push($(this).val());
            }
        });

        var minPrice = $('#price_min').val();
        var maxPrice = $('#price_max').val();

        var url = '{{url()->current()}}?';

        if (priceRanges.length > 0) {
            url += '&price_range=' + priceRanges.toString();
        }

        if (brands.length > 0) {
            url += '&brand=' + brands.toString();
        }

        if (minPrice) {
            url += '&price_min=' + minPrice;
        }

        if (maxPrice) {
            url += '&price_max=' + maxPrice;
        }

        var keyword=$("#search").val()
        if(keyword.length>0){
            url+='&search='+keyword
        }

        url+='&sort='+$("#sort").val()

        window.location.href = url;
    }

</script>

@endsection
