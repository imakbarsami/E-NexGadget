<!DOCTYPE html>
<html class="no-js" lang="en_AU" />
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>E-NexGadget</title>
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, maximum-scale=1, user-scalable=no" />

	<meta name="HandheldFriendly" content="True" />
	<meta name="pinterest" content="nopin" />

	<meta property="og:locale" content="en_AU" />
	<meta property="og:type" content="website" />
	<meta property="fb:admins" content="" />
	<meta property="fb:app_id" content="" />
	<meta property="og:site_name" content="" />
	<meta property="og:title" content="" />
	<meta property="og:description" content="" />
	<meta property="og:url" content="" />
	<meta property="og:image" content="" />
	<meta property="og:image:type" content="image/jpeg" />
	<meta property="og:image:width" content="" />
	<meta property="og:image:height" content="" />
	<meta property="og:image:alt" content="" />

	<meta name="twitter:title" content="" />
	<meta name="twitter:site" content="" />
	<meta name="twitter:description" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:image:alt" content="" />
	<meta name="twitter:card" content="summary_large_image" />
    <meta name="csrf-token" content="{{csrf_token()}}">



	<link rel="stylesheet" type="text/css" href="{{asset('front_assets/css/slick.css')}}" />
	<link rel="stylesheet" type="text/css" href="{{asset('front_assets/css/slick-theme.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('front_assets/css/ion.rangeSlider.min.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('front_assets/css/style.css')}}" />

	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;500&family=Raleway:ital,wght@0,400;0,600;0,800;1,200&family=Roboto+Condensed:wght@400;700&family=Roboto:wght@300;400;700;900&display=swap" rel="stylesheet">

	<!-- Fav Icon -->
	<link rel="shortcut icon" type="image/x-icon" href="#" />
</head>
<body data-instant-intensity="mousedown">

<div class="top-header" style="background-color: #001f3f;">
	<div class="container" >
		<div class="row align-items-center py-3 d-none d-lg-flex justify-content-between">
			<div class="col-lg-4 logo">
				<a href="{{route('front.home')}}" class="text-decoration-none">
					<span class="h1 text-uppercase" style="font-family: 'Bungee', cursive; color: rgb(240, 240, 243); text-shadow: 0 0 5px rgba(70, 70, 74, 0.8), 0 0 10px rgba(214, 214, 221, 0.6), 0 0 15px rgba(168, 168, 172, 0.4);  padding: 0.5rem;">E-NexGadget</span>
				</a>
			</div>
			<div class="col-lg-6 col-6 text-left  d-flex justify-content-end align-items-center">
                @if (Auth::check())
                <a href="{{route('account.profile')}}" class="nav-link text-white" style="font-family: 'Bungee', cursive; color: rgb(240, 240, 243); text-shadow: 0 0 5px rgba(180, 180, 186, 0.8), 0 0 10px rgba(135, 135, 140, 0.6), 0 0 15px rgba(119, 119, 120, 0.4);  padding: 0.5rem;">My Account</a>
                @else
                <a href="http://127.0.0.1:8000/account/login" class="nav-link text-white" style="font-family: 'Bungee', cursive; color: rgb(240, 240, 243); text-shadow: 0 0 5px rgba(180, 180, 186, 0.8), 0 0 10px rgba(135, 135, 140, 0.6), 0 0 15px rgba(119, 119, 120, 0.4);  padding: 0.5rem;">Login/Register</a>
                @endif

				<form action="{{ route('front.shop') }}" method="get">
					<div class="input-group">
						<input value="{{ Request::get('search') }}" type="text" placeholder="Search For Products" class="form-control" id="search" name="search" style="font-family: 'Bungee', cursive;">
						<button type="submit" class="input-group-text">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>				
			</div>
		</div>
	</div>
</div>

<header style="background-color: #001f3f;">
	<div class="container">
		<nav class="navbar navbar-expand-xl" id="navbar">
			<a href="index.php" class="text-decoration-none mobile-logo">
				<span class="h2 text-uppercase text-primary bg-dark">E-NexGadget</span>
		
			</a>
			<button class="navbar-toggler menu-btn" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      			<!-- <span class="navbar-toggler-icon icon-menu"></span> -->
				  <i class="navbar-toggler-icon fas fa-bars"></i>
    		</button>
    		<div class="collapse navbar-collapse" id="navbarSupportedContent">
      			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
        			<!-- <li class="nav-item">
          				<a class="nav-link active" aria-current="page" href="index.php" title="Products">Home</a>
        			</li> -->

                    @if (getCategories()->isNotEmpty())
                        @foreach (getCategories() as $category )
                            <li class="nav-item dropdown">
                                <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    {{$category->name}}
                                </button>

                                @if ($category->subCategory->isNotEmpty())
                                <ul class="dropdown-menu dropdown-menu-dark">
                                    @foreach ($category->subCategory->sortBy('name') as $sub_category)
                                        <li>
                                            <a class="dropdown-item nav-link" href="{{route('front.shop', [$category->slug, $sub_category->slug])}}">
                                                {{$sub_category->name}}
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                            @endif

                            </li>
                        @endforeach
                    @endif
      			</ul>
      		</div>
			<div class="right-nav py-0">
				<a href="{{route('front.cart')}}" class="ml-3 d-flex pt-2">
					<i class="fas fa-shopping-cart text-primary"></i>
				</a>
			</div>
      	</nav>
  	</div>
</header>


<main>
    @yield('content')
</main>


<footer class="mt-5" style="background-color: #001f3f;">
	<div class="container pb-5 pt-3">
		<div class="row">
			<div class="col-md-4">
				<div class="footer-card" style= "font-family: 'Bungee', cursive;">
					<h3>Get In Touch</h3>
					<p>E-NexGadget <br>
					12/3 Hazari Lane ,Chattogram <br>
					enexgadget4@gmail.com <br>
					123 456 0000</p>
				</div>
			</div>

			<div class="col-md-4" style= "font-family: 'Bungee', cursive;">
				<div class="footer-card" >
					<h3>Important Links</h3>
					<ul>

                        @if (staticPages()->isNotEmpty())
                        @foreach (staticPages() as $page )
                           <li><a href="{{route('front.page',$page->slug)}}" title="{{$page->name}}">{{$page->name}}</a></li>
                        @endforeach
                        @endif

					</ul>
				</div>
			</div>

			<div class="col-md-4" style= "font-family: 'Bungee', cursive;">
				<div class="footer-card" >
					<h3>My Account</h3>
					<ul>
                        @if (auth()->check())
                        <li><a href="{{route('account.profile')}}" title="Contact Us">My Profile</a></li>
                        <li><a href="{{route('account.orders')}}" title="Contact Us">My Orders</a></li>
                        <li><a href="{{route('account.wishlist')}}" title="Privacy">My Wishlist</a></li>

                        @else
						<li><a href="{{route('account.login')}}" title="Sell">Login</a></li>
						<li><a href="{{route('account.register')}}" title="Advertise">Register</a></li>
                        @endif
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="copyright-area" style="background-color: #d6dbe0;">
		<div class="container">
			<div class="row">
				<div class="col-12 mt-3">
					<div class="copy-right text-center"  >
						<p style="color: black;">© Copyright
                        @php
                         echo date('Y');
                        @endphp E-NexGadget. All Rights Reserved</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>

  <!-- Wishlist Modal -->
  <div class="modal fade" id="wishlistModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Success</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          ...
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

<script src="{{asset('front_assets/js/jquery-3.6.0.min.js')}}"></script>
<script src="{{asset('front_assets/js/bootstrap.bundle.5.1.3.min.js')}}"></script>
<script src="{{asset('front_assets/js/instantpages.5.1.0.min.js')}}"></script>
<script src="{{asset('front_assets/js/lazyload.17.6.0.min.js')}}"></script>
<script src="{{asset('front_assets/js/slick.min.js')}}"></script>
<script src="{{asset('front_assets/js/ion.rangeSlider.min.js')}}"></script>
<script src="{asset('front_assets/js/custom.js')}}"></script>
<script>
window.onscroll = function() {myFunction()};

    var navbar = document.getElementById("navbar");
    var sticky = navbar.offsetTop;

    function myFunction() {
    if (window.pageYOffset >= sticky) {
        navbar.classList.add("sticky")
    } else {
        navbar.classList.remove("sticky");
    }
    }

    $.ajaxSetup({
        headers:{
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    function addToCart(id){

    $.ajax({
    url:'{{route('front.add_to_cart')}}',
    type:'post',
    data:{id:id},
    dataType:'json',
    success:function(response){
        if(response.status==true){
            window.location.href="{{route('front.cart')}}"
        }else{
            alert(response.message)
        }
    },error:function(){

    }

})
}

function addToWishlist(id){
    $.ajax({
    url:'{{route("front.add_to_wishlist")}}',
    type:'post',
    data:{id:id},
    dataType:'json',
    success:function(response){
        if(response.status==true){

            $("#wishlistModel .modal-body").html(response.message)
            $("#wishlistModel").modal('show');
        }else{
            window.location.href="{{route('account.login')}}"
        }
    }

  })
}
</script>

@yield('customjs')
</body>
</html>
