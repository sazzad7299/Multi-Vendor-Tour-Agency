@extends('includes.newmaster')

@section('content')


    <div class="home-wrapper">
        <!-- Starting of product filter breadcroumb area -->
        
    <section  @if(is_object($category)) style="background: url({{url('/assets')}}/images/categories/banner/{{$category->feature_image}}) no-repeat center center; background-size: cover;"  @else style="background: url({{url('/')}}/assets/images/{{$settings[0]->background}}) no-repeat center center; background-size: cover;" @endif>
        <div class="row" style="background-color:rgba(0,0,0,0.7);">

            <div style="margin: 3% 0px 3% 0px;">
                <div class="text-center" style="color: #FFF;padding: 20px;">
                    @if(is_object($category))
                        <h1>{{$category->name}}</h1>
                    @else
                        <h1>No Category Found</h1>
                    @endif
                </div>
            </div>
        </div>
    </section>
        <!-- Ending of product filter breadcroumb area -->

        <!-- Starting of product filter area -->
        <div class="section-padding product-filter-wrapper wow fadeInUp">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                        <div class="product-filter-leftDiv">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="product-filter-option">
                                        <h2 class="filter-title">Filter Option</h2>
                                            <div class="form-group">
                                                <select id="sortby" class="form-control">
                                                    @if($sort == "new")
                                                        <option value="new" selected>{{$language->sort_by_latest}}</option>
                                                    @else
                                                        <option value="new">{{$language->sort_by_latest}}</option>
                                                    @endif
                                                    @if($sort == "old")
                                                        <option value="old" selected>{{$language->sort_by_oldest}}</option>
                                                    @else
                                                        <option value="old">{{$language->sort_by_oldest}}</option>
                                                    @endif
                                                    @if($sort == "low")
                                                        <option value="low" selected>{{$language->sort_by_lowest}}</option>
                                                    @else
                                                        <option value="low">{{$language->sort_by_lowest}}</option>
                                                    @endif
                                                    @if($sort == "high")
                                                        <option value="high" selected>{{$language->sort_by_highest}}</option>
                                                    @else
                                                        <option value="high">{{$language->sort_by_highest}}</option>
                                                    @endif

                                                </select>
                                            </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="product-filter-option">
                                        <h2 class="filter-title">All Categories</h2>
                                        <ul>
                                            @foreach($menus as $menu)
                                                <li>
                                                <span href="#{{$menu->slug}}-1" aria-expanded="false" data-toggle="collapse">
                                                    <i class="fa fa-plus"></i><i class="fa fa-minus"></i>
                                                </span>
                                                    <a href="{{url('/category')}}/{{$menu->slug}}">{{$menu->name}}</a>
                                                    <ul id="{{$menu->slug}}-1" class="collapse">
                                                        @foreach(\App\Category::where('mainid',$menu->id)->where('role','sub')->get() as $submenu)
                                                            <li>
                                                        <span href="#{{$submenu->slug}}-1" aria-expanded="false" data-toggle="collapse">
                                                        <i class="fa fa-plus"></i><i class="fa fa-minus"></i>
                                                        </span>
                                                                <a href="{{url('/category')}}/{{$submenu->slug}}">{{$submenu->name}}</a>
                                                                <ul id="{{$submenu->slug}}-1" class="collapse">
                                                                    @foreach(\App\Category::where('subid',$submenu->id)->where('role','child')->get() as $childmenu)
                                                                        <li><i class="fa fa-angle-right"></i><a href="{{url('/category')}}/{{$childmenu->slug}}">{{$childmenu->name}}</a></li>
                                                                    @endforeach
                                                                </ul>
                                                            </li>
                                                        @endforeach
                                                    </ul>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="product-filter-option">
                                        <h2 class="filter-title">price</h2>
                                        <form action="" method="GET">
                                            <div class="form-group padding-bottom-10">
                                                <input id="ex2" type="text" class="form-control" value="" data-slider-min="0" data-slider-max="{{$maxvalue}}" data-slider-step="5" data-slider-value="[{{$mins}},{{$maxs}}]"/>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" id="price-min" class="price-input" value="{{$mins}}" name="min">
                                                <i class="fa fa-minus"></i>
                                                <input type="text" id="price-max" class="price-input" value="{{$maxs}}" name="max">
                                                <input type="submit" class="price-search-btn" value="SEARCH">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="product-filter-option">
                                        <h2 class="filter-title">Tags</h2>
                                        <div class="product-filter-content tags">
                                            @foreach(explode(',',$settings[0]->popular_tags) as $tag)
                                                <a href="{{url('/tags')}}/{{$tag}}">{{$tag}}</a>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-8 col-sm-12 col-xs-12">
                        <div class="product-filter-rightDiv">
                            <div class="row" id="products" style="padding-bottom: 30px">
                                @forelse($products as $product)
                                    
                                    <div class="col-md-4 col-sm-6 wow fadeIn animated" data-wow-delay="0.2s">
        
                                        <div class="img_wrapper">
                                            <div class="ribbon">
                                                <span>{{$category->name}}</span>
                                            </div>
                                            <div class="price_grid">
                                                @if($product->previous_price != "")
                                                <span class="original-price">{{$settings[0]->currency_sign}}{{ $product->price }} <br>
                                                <del class="offer-price">{{$settings[0]->currency_sign}}{{$product->previous_price}}</del>
                                                @else
                                                <span class="original-price">{{$settings[0]->currency_sign}}{{ $product->price }}
                                                @endif
                                            </div>
                                            <div class="img_container">
                                                <a href="{{url('/product')}}/{{$product->id}}/{{str_replace(' ','-',strtolower($product->title))}}">
                                                    <img src="{{url('/assets/images/products/medium')}}/{{$product->feature_image}}" width="800" height="533" class="img-responsive" alt="">
                                                    <div class="short_info">
                                                        <h3>{{$product->title}}</h3>
                                                            <em>Duration 45 mins</em>
                                                        <div class="ratings">
                                                            <div class="empty-stars"></div>
                                                            <div class="full-stars" style="width:{{\App\Review::ratings($product->id)}}%"></div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <!-- End img_wrapper -->
                                        <div class="product-meta-area" >
                                            <form class="addtocart-form">
                                                {{csrf_field()}}
                                                @if(Session::has('uniqueid'))
                                                    <input type="hidden" name="uniqueid" value="{{Session::get('uniqueid')}}">
                                                @else
                                                    <input type="hidden" name="uniqueid" value="{{str_random(7)}}">
                                                @endif
                                                <input type="hidden" name="title" value="{{$product->title}}">
                                                <input type="hidden" name="product" value="{{$product->id}}">
                                                <input type="hidden" id="cost" name="cost" value="{{\App\Product::Cost($product->id)}}">
                                                <input type="hidden" id="quantity" name="quantity" value="1">
                                                @if($product->stock != 0 || $product->stock === null )
                                                    <button type="button" class="addTo-cart to-cart"><i class="fa fa-cart-plus"></i><span>{{$language->add_to_cart}}</span></button>
                                                @else
                                                    <button type="button" class="addTo-cart  to-cart" disabled><i class="fa fa-cart-plus"></i>{{$language->out_of_stock}}</button>
                                                @endif
                                            </form>
                                            <a  href="javascript:;" class="wish-list" onclick="getQuickView({{$product->id}})" data-toggle="modal" data-target="#myModal">
                                                <i class="fa fa-eye"></i>
                                            </a>
                                         </div>
                                    </div>
                                @empty
                                    <div class="row" style="margin-left: 0">
                                        <div class="col-md-12">
                                            <h3>{{$language->no_result}}</h3>
                                        </div>
                                    </div>
                                @endforelse
                            </div>
                            @if(count($products) > 0)
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <img id="load" src="{{url('/assets/images/default.gif')}}" style="display: none;width: 80px;">
                                </div>
                                <div class="col-md-12 text-center">
                                    <input type="hidden" id="page" value="2">
                                    <a href="javascript:;" id="load-more" class="product-filter-loadMore-btn">load more</a>
                                </div>
                            </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Ending of product filter area -->

    </div>


@stop

@section('footer')
<script>

    $("#sortby").change(function () {
        var sort = $("#sortby").val();
        window.location = "{{url('/category')}}/{{$category->slug}}?sort="+sort;
    });

    $("#load-more").click(function () {
        $("#load").show();
        var slug = "{{$category->slug}}";
        var page = $("#page").val();
        var sort = $("#sortby").val();
        $.get("{{url('/')}}/loadcategory/"+slug+"/"+page+"?sort="+sort, function(data, status){
            $("#load").fadeOut();
            $("#products").append(data);
            //alert("Data: " + data + "\nStatus: " + status);
            $("#page").val(parseInt($("#page").val())+1);
            if ($.trim(data) == ""){
                $("#load-more").fadeOut();
            }

        });
    });
</script>
@stop