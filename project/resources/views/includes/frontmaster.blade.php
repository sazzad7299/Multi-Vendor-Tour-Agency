<!DOCTYPE html>
<!--[if IE 9]><html class="ie ie9"><![endif]-->
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="BESTOURS - Travel and Tours multipurpose template">
	<meta name="author" content="Ansonika">
	<title>BESTOURS - Travel and Tours multipurpose template</title>

	<!-- Favicons-->
	<link rel="shortcut icon" href="{{ URL::asset('asset/img/favicon.ico') }}" type="image/x-icon">
	<link rel="apple-touch-icon" type="image/x-icon" href="{{ URL::asset('asset/img/apple-touch-icon-57x57-precomposed.png') }}">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="{{ URL::asset('asset/img/apple-touch-icon-72x72-precomposed.png') }}">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="{{ URL::asset('asset/img/apple-touch-icon-114x114-precomposed.png') }}">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="{{ URL::asset('asset/img/apple-touch-icon-144x144-precomposed.png') }}">

	<!-- GOOGLE WEB FONT -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700|Satisfy" rel="stylesheet">

	<!-- BASE CSS -->
	<link href="{{ URL::asset('asset/css/animate.min.css') }}" rel="stylesheet">
	<link href="{{ URL::asset('asset/css/bootstrap.min.css') }}" rel="stylesheet">
	<link href="{{ URL::asset('asset/css/style.css') }}" rel="stylesheet">
	<link href="{{ URL::asset('asset/css/responsive.css') }}" rel="stylesheet">
	<link href="{{ URL::asset('asset/css/menu.css') }}" rel="stylesheet">
	<link href="{{ URL::asset('asset/css/icon_fonts/css/all_icons.min.css') }}" rel="stylesheet">
    
    <!-- SPECIFIC CSS -->
    <link href="{{ URL::asset('asset/layerslider/css/layerslider.css') }}" rel="stylesheet">

	<!-- YOUR CUSTOM CSS -->
	<link href="{{ URL::asset('asset/css/custom.css') }}" rel="stylesheet">

    {{-- fontawesome --}}
    <link href="{{ URL::asset('assets/css/font-awesome.min.css')}}" rel="stylesheet">

	<!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
       
    <![endif]-->

</head>

<body>

	<!--[if lte IE 8]>
        <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a>.</p>
    <![endif]-->

	<div class="layer"></div>
	<!-- Mobile menu overlay mask -->

	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>
	<!-- End Preload -->

	<!-- Header================================================== -->
	<div id="header_1" class="layer_slider">
		<header>
			<div id="top_line">
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<a href="tel://004542344599" id="phone_top">0045 043204434</a><span id="opening">Mon - Sat 8.00/18.00</span>
						</div>
						<div class="col-md-6 col-sm-6 hidden-xs">
							<ul id="top_links">
								<li><a href="wishlist.html" id="wishlist_link">Wishlist</a>
								</li>
								<li>
                                    <div class="header-top-entry increase-icon-responsive login">
                                        <a href="{{url('/vendor')}}" class="title"><i class="fa fa-group"></i> <span>{{$language->vendor}}</span></a>
                                    </div>
								</li>
                                <li>
                                    <div class="header-top-entry increase-icon-responsive login">
                                        @if(Auth::guard('profile')->guest())
                                            <a href="{{url('user/login')}}" class="title"><i class="fa fa-user"></i> <span>{{$language->sign_in}}</span></a>
                                        @else
                                            <a href="{{route('user.account')}}" class="title"><i class="fa fa-user"></i> <span>{{$language->my_account}}</span></a>
                                        @endif
                                    </div>
                                </li>
                                <li>
                                    <a href="{{url('/cart')}}" class="header-top-entry open-cart-popup" id="notify"><div class="title"><i class="fa fa-shopping-cart"></i><span>{{$language->my_cart}}</span> <b id="carttotal">{{$settings[0]->currency_sign}}0.00</b></div></a>
                                </li>
							</ul>
						</div>
					</div>
					<!-- End row -->
				</div>
				<!-- End container-->
			</div>
			<!-- End top line-->

			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-3 col-xs-3">
						<div id="logo_home">
							<a href="{{url('/')}}" id="logo">
                                <img alt="" src="{{ URL::asset('assets/images/logo')}}/{{$settings[0]->logo}}">
                            </a>
						</div>
					</div>
					<nav class="col-md-9 col-sm-9 col-xs-9">
						<ul id="tools_top">
							<li><a href="#" class="search-overlay-menu-btn"><i class="icon-search-6"></i></a>
							</li>
						</ul>
						<a class="cmn-toggle-switch cmn-toggle-switch__htx open_close" href="javascript:void(0);"><span>Menu mobile</span></a>
						<div class="main-menu">
							<div id="header_menu">
								<img src="img/logo_menu.png" width="145" height="34" alt="Bestours" data-retina="true">
							</div>
							<a href="#" class="open_close" id="close_in"><i class="icon_set_1_icon-77"></i></a>
							<ul>
								<li class="submenu">
									<a href="javascript:void(0);" class="show-submenu">Home</a>
									<ul>
										<li><a href="index.html">Home Video background</a>
										</li>
										<li><a href="index_2.html">Home Layer Slider</a>
										</li>
										<li><a href="index_3.html">Home Full Header</a>
										</li>
										<li><a href="index_4.html">Home Popup</a>
										</li>
										<li><a href="index_5.html">Home Cookie bar</a>
										</li>
									</ul>
								</li>
								{{-- <li class="submenu">
									<a href="javascript:void(0);" class="show-submenu">Tours</a>
									<ul>
										<li><a href="grid.html">Grid view</a>
										</li>
										<li><a href="list.html">List view</a>
										</li>
									</ul>
								</li> --}}
								@if($pagesettings[0]->a_status == 1)
                                    <li class="simple-list"><a href="{{url('/about')}}" class="">{{$language->about_us}}</a></li>
                                @endif
                                @if($pagesettings[0]->f_status == 1)
                                    <li class="simple-list"><a href="{{url('/faq')}}" class="">{{$language->faq}}</a></li>
                                @endif
                                @if($pagesettings[0]->blogs_status == 1)
                                    <li class="simple-list"><a href="{{url('/blogs')}}" class="">{{$language->blog}}</a></li>
                                @endif
                                @if($pagesettings[0]->c_status == 1)
                                    <li class="simple-list"><a href="{{url('/contact')}}" class="">{{$language->contact_us}}</a></li>
                                @endif
                                @foreach($menus as $menu)
								<li class="megamenu submenu">
                                    <a href="{{url('/category')}}/{{$menu->slug}}">{{$menu->name}}</a>
                                    @if(\App\Category::where('mainid',$menu->id)->where('role','sub')->count() >0)
									{{-- <a href="javascript:void(0);" class="show-submenu-mega">More demos</a> --}}
									<div class="menu-wrapper">
                                        
										<div class="row">
                                            @foreach(\App\Category::where('mainid',$menu->id)->where('role','sub')->get() as $submenu)
											<div class="col-md-4">
												<h3><a href="{{url('/category')}}/{{$submenu->slug}}">{{$submenu->name}}</a></h3>
                                                    <ul>
                                                        @foreach(\App\Category::where('subid',$submenu->id)->where('role','child')->get() as $childmenu)
                                                                    <li><a href="{{url('/category')}}/{{$childmenu->slug}}"><i class="fa fa-angle-right"></i>{{$childmenu->name}}</a></li>
                                                                @endforeach
                                                    </ul>
											</div>
                                            @endforeach
										</div>
                                        
										<hr class="hidden-xs">
										<p class="text-center hidden-xs">
											<a href="#" class="btn_outline">More Adventure</a>
									</div>
									<!-- End menu-wrapper -->
                                    @endif
								</li>
                                @endforeach
							</ul>
						</div>
						<!-- End main-menu -->
					</nav>
				</div>
			</div>
			<!-- container -->
		</header>
		<!-- End Header -->
	</div>
	<!-- End Header 1-->

    @yield('content')

	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-3">
					<h3>Need help?</h3>
					<a href="tel://004542344599" id="phone">+45 423 445 99</a>
					<a href="mailto:help@citytours.com" id="email_footer">help@bestours.com</a>
				</div>
				<div class="col-md-2 col-sm-3">
					<h3>About</h3>
					<ul>
						<li><a href="#">About us</a>
						</li>
						<li><a href="#">FAQ</a>
						</li>
						<li><a href="#">Login</a>
						</li>
						<li><a href="#">Register</a>
						</li>
						<li><a href="#">Terms and condition</a>
						</li>
					</ul>
				</div>
				<div class="col-md-4 col-sm-6">
					<h3>Twitter feed</h3>
					<div class="latest-tweets" data-number="10" data-username="ansonika" data-mode="fade" data-pager="false" data-nextselector=".tweets-next" data-prevselector=".tweets-prev" data-adaptiveheight="true"><!-- data-username="your twitter username" -->
					</div>
					<div class="tweet-control">
						<div class="tweets-prev"></div>
						<div class="tweets-next"></div>
					</div>
					<!-- End .tweet-control -->
				</div>
				@if($pagesettings[0]->subscribe_status)
				<div class="col-md-3 col-sm-12">
					<h3>{{$language->subscription}}</h3>
					<div id="message-newsletter_2">
					</div>
					
					<form method="post" action="{{action('FrontEndController@subscribe')}}" name="newsletter_2" id="subform">
						{{csrf_field()}}
						<div class="form-group">
							<input class="form-control" type="email" id="email" placeholder="Enter Email" name="email" required>
						</div>
						{{-- <input id="submit-newsletter_2" type="button" class="btn-1 subscribe-btn" value="{{$language->subscribe}}"> --}}
						<input type="submit" value="{{$language->subscribe}}" class="btn_1" id="submit-newsletter_2">
					</form>
					
				</div>
				@endif
			</div>
			<!-- End row -->
			<hr>
			<div class="row">
				<div class="col-sm-8">
					<div class="styled-select">
						<select class="form-control" name="lang" id="lang">
							<option value="English" selected>English</option>
							<option value="French">French</option>
							<option value="Spanish">Spanish</option>
							<option value="Russian">Russian</option>
						</select>
					</div>
					<span id="copy">© BestTours 2016 - All rights reserved</span>
				</div>
				<div class="col-sm-4" id="social_footer">
					<ul>
						<li><a href="#"><i class="icon-facebook"></i></a>
						</li>
						<li><a href="#"><i class="icon-twitter"></i></a>
						</li>
						<li><a href="#"><i class="icon-google"></i></a>
						</li>
						<li><a href="#"><i class="icon-instagram"></i></a>
						</li>
					</ul>
				</div>
			</div>
			<!-- End row -->
		</div>
		<!-- End container -->
	</footer>
	<!-- End footer -->

	<div id="toTop"></div>
	<!-- Back to top button -->
    {{-- card Box popup --}}
    <div class="cart-box popup">
        <div class="popup-container">
            <div id="emptycart">
                {{$language->empty_cart}}
            </div>
            <div id="goCart">

            </div>
            <div class="summary">
                <div class="grandtotal">{{$language->total}} <span id="grandttl">{{$settings[0]->currency_sign}}0.00</span></div>
            </div>
            <div class="cart-buttons">
                <div class="column">
                    <a href="{{url('/cart')}}" class="button style-3">{{$language->view_cart}}</a>
                    <div class="clear"></div>
                </div>
                <div class="column">
                    <a href="{{route('user.checkout')}}" class="button style-4">{{$language->checkout}}</a>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
	<!-- Search Menu -->
	<div class="search-overlay-menu">
		<span class="search-overlay-close"><i class="icon_close"></i></span>
		<form role="search" id="searchform" method="get">
			<input value="" name="q" type="search" placeholder="Search..." />
			<button type="submit"><i class="icon-search-6"></i>
			</button>
		</form>
	</div>
	<!-- End Search Menu -->

	<!-- COMMON SCRIPTS -->
	<script src="{{ URL::asset('assets/js/main.js')}}"></script>
    
	<script src="{{ URL::asset('asset/js/jquery-2.2.4.min.js') }}"></script>
	<script src="{{ URL::asset('asset/js/common_scripts_min.js') }}"></script>
	<script src="{{ URL::asset('asset/assets/validate.js') }}"></script>
	<script src="{{ URL::asset('asset/js/jquery.tweet.min.js') }}"></script>
	<script src="{{ URL::asset('asset/js/functions.js') }}"></script>

	 <!-- SPECIFIC SCRIPTS -->
    <script src="{{ URL::asset('asset/layerslider/js/greensock.js') }}"></script>
    <script src="{{ URL::asset('asset/layerslider/js/layerslider.transitions.js') }}"></script>
    <script src="{{ URL::asset('asset/layerslider/js/layerslider.kreaturamedia.jquery.js') }}"></script>
    <script type="text/javascript">
        var mainurl = '{{url('/')}}';
        var currency = '{{$settings[0]->currency_sign}}';
        var language = {!! json_encode($language) !!};
        'use strict';
        $('#layerslider').layerSlider({
            autoStart: true,
            navButtons: false,
            navStartStop: false,
            showCircleTimer: false,
            responsive: true,
            responsiveUnder: 1280,
            layersContainer: 1200,
            skinsPath: 'layerslider/skins/'
                // Please make sure that you didn't forget to add a comma to the line endings
                // except the last line!
        });
    </script>
    @yield('footer')

</body>

</html>