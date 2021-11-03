@extends('includes.newmaster')

@section('content')

    <div class="home-wrapper">
        <section class="wrapper wow fadeInUp" >
            <div class="divider_border" style="background: url('{{ URL::asset('asset/img/divider.png') }}') center top no-repeat;"></div>
            <div class="breadcrumb-box">
                <a href="{{url('/')}}">{{$language->home}}</a>
                <a href="{{url('/category')}}/{{\App\Category::where('id',$productdata->category[0])->first()->slug}}">{{\App\Category::where('id',$productdata->category[0])->first()->name}}</a>
                @if($productdata->category[1] != "")
                    <a href="{{url('/category')}}/{{\App\Category::where('id',$productdata->category[1])->first()->slug}}">{{\App\Category::where('id',$productdata->category[1])->first()->name}}</a>
                @endif
                @if($productdata->category[2] != "")
                    <a href="{{url('/category')}}/{{\App\Category::where('id',$productdata->category[2])->first()->slug}}">{{\App\Category::where('id',$productdata->category[2])->first()->name}}</a>
                @endif
                <a href="{{url('/product')}}/{{$productdata->id}}/{{str_replace(' ','-',strtolower($productdata->title))}}">{{$productdata->title}}</a>
            </div>
    
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
    
                        <div class="product-review-carousel-img product-zoom">
                            <img id="imageDiv" src="{{url('/assets/images/products/large')}}/{{$productdata->feature_image}}" alt="">
                            
                        </div>
                        <div class="product-review-owl-carousel">
                            <div class="single-product-item">
                                <img id="iconOne" onclick="productGallery(this.id)" src="{{url('/assets/images/products/large')}}/{{$productdata->feature_image}}" alt="" style="withd:250px;height:110px; padding:5px 5px">
                            </div>
                            @forelse($gallery as $galdta)
                                <div class="single-product-item">
                                    <img id="galleryimg{{$galdta->id}}" onclick="productGallery(this.id)" src="{{url('/assets/images/gallery/small')}}/{{$galdta->image}}" alt="" style="withd:250px;height:110px;padding:5px 5px ">
                                </div>
                            @empty
                            @endforelse
                        </div>
                        <h2 class="product-header">{{$productdata->title}}</h2>
                        @if($productdata->owner != "admin")
                            @if(\App\Vendors::where('id',$productdata->vendorid)->count() != 0)
                                 <strong class="">{{$language->vendor}}: <a href="{{url('/shop')}}/{{$productdata->vendorid}}/{{str_replace(' ','-',strtolower(\App\Vendors::findOrFail($productdata->vendorid)->shop_name))}}" target="_blank">{{\App\Vendors::findOrFail($productdata->vendorid)->shop_name}}</a></strong>
                            @endif
                            @else
                                
                        @endif
                        @if(Session::has('message'))
                            <div class="alert alert-success alert-dismissable">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                {{ Session::get('message') }}
                            </div>
                        @endif
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab_1" data-toggle="tab">{{$language->description}}</a></li></a>
                            </li>
                            <li><a href="#tab_2" data-toggle="tab">{{$language->reviews}}({{\App\Review::where('productid',$productdata->id)->count()}})</a>
                            </li>
                            <li><a href="#tab_3" data-toggle="tab">{{$language->return_policy}}</a>
                            </li>
                        </ul>
    
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="tab_1">
                                {!! $productdata->description !!}
    
                                <hr>
    
                                <h3>Program <span>(60 minutes)</span></h3>
                                <p>
                                    Iudico omnesque vis at, ius an laboramus adversarium. An eirmod doctus admodum est, vero numquam et mel, an duo modo error. No affert timeam mea, legimus ceteros his in. Aperiri honestatis sit at. Eos aeque fuisset ei, case denique eam ne. Augue invidunt has ad, ullum debitis mea ei, ne aliquip dignissim nec.
                                </p>
                                <ul class="cbp_tmtimeline">
                                    <li>
                                        <time class="cbp_tmtime" datetime="09:30"><span>30 min.</span><span>09:30</span>
                                        </time>
                                        <div class="cbp_tmicon">
                                            1
                                        </div>
                                        <div class="cbp_tmlabel">
                                            <h4>Vero numquam et mel</h4>
                                            <p>
                                                Vero consequat cotidieque ad eam. Ea duis errem qui, impedit blandit sed eu. Ius diam vivendo ne.
                                            </p>
                                        </div>
                                    </li>
                                    <li>
                                        <time class="cbp_tmtime" datetime="11:30"><span>2 hours</span><span>11:30</span>
                                        </time>
                                        <div class="cbp_tmicon">
                                            2
                                        </div>
                                        <div class="cbp_tmlabel">
                                            
                                            <h4>Ullum debitis mea</h4>
                                            <p>
                                                Vero consequat cotidieque ad eam. Ea duis errem qui, impedit blandit sed eu. Ius diam vivendo ne.
                                            </p>
                                        </div>
                                    </li>
                                    <li>
                                        <time class="cbp_tmtime" datetime="13:30"><span>1 hour</span><span>13:30</span>
                                        </time>
                                        <div class="cbp_tmicon">
                                            3
                                        </div>
                                        <div class="cbp_tmlabel">
                                            <h4>Augue invidunt</h4>
                                            <p>
                                                Vero consequat cotidieque ad eam. Ea duis errem qui, impedit blandit sed eu. Ius diam vivendo ne.
                                            </p>
                                        </div>
                                    </li>
                                    <li>
                                        <time class="cbp_tmtime" datetime="14:30"><span>2 hours</span><span>14:30</span>
                                        </time>
                                        <div class="cbp_tmicon">
                                            4
                                        </div>
                                        <div class="cbp_tmlabel">
                                            
                                            <h4>Ne aliquip dignissim</h4>
                                            <p>
                                                Vero consequat cotidieque ad eam. Ea duis errem qui, impedit blandit sed eu. Ius diam vivendo ne.
                                            </p>
                                        </div>
                                    </li>
                                </ul>
    
                            </div>
                            <!-- End tab_1 -->
    
                            <div class="tab-pane fade" id="tab_2">
    
                                <div id="summary_review">
                                    <div class="review_score">
                                        <div class="ratings">
                                            <div class="empty-stars"></div>
                                            <div class="full-stars" style="width:{{\App\Review::ratings($productdata->id)}}%"></div>
                                        </div>
                                    </span>
                                    </div>
                                    <div class="review_score_2">
                                        <h4>Fabulous  <span>(Based on @if(\App\Review::reviewCount($productdata->id) > 1)
                                            <span>{{\App\Review::reviewCount($productdata->id)}} Reviews</span>
                                        @else
                                            <span>{{\App\Review::reviewCount($productdata->id)}} Review</span>
                                        @endif )</span></h4>
                                        <p>
                                            Vero consequat cotidieque ad eam. Ea duis errem qui, impedit blandit sed eu. Ius diam vivendo ne.
                                        </p>
                                    </div>
                                </div>
                                <!-- End review summary -->
    
                                <div class="reviews-container">
                                    @forelse($reviews as $review)
                                    <div class="review-box clearfix">
                                        <figure class="rev-thumb"><img src="{{ URL::asset('assets/images/cusavatar.png')}}" alt="" style="border-radius: 50%">
                                        </figure>
                                        <div class="rev-content">
                                            <div class="rating">
                                                <div class="ratings">
                                                    <div class="empty-stars"></div>
                                                    <div class="full-stars" style="width:{{$review->rating*20}}%"></div>
                                                </div>
                                            </div>
                                            <div class="rev-info">
                                               <strong>{{$review->name}}</strong>   {{ \Carbon\Carbon::parse($review->review_date)->diffForHumans() }}
                                            </div>
                                            <div class="rev-text">
                                                <p>
                                                    {{$review->review}}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    @empty
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h4>{{$language->no_review}}</h4>
                                        </div>
                                    </div>
                                    @endforelse
                                    <!-- End review-box -->
    
                                </div>
                                <!-- End review-container -->
    
                                <hr>
    
                                <div class="add-review">
                                    <h4>Leave a Review</h4>
                                    <div id="message-review"></div>
                                    <div class="review-star">
                                        <div class='starrr' id='star1'></div>
                                        <div>
                                            <span class='your-choice-was' style='display: none;'>
                                                Your rating is: <span class='choice'></span>.
                                            </span>
                                        </div>
                                    </div>
                                    <form class="product-review-form" method="POST" action="{{route('review.submit')}}">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="rating" id="rate" value="5">
                                        <input type="hidden" name="productid" value="{{$productdata->id}}">
                                        <div class="form-group">
                                            <input name="name" type="text" class="form-control" placeholder="{{$language->name}}" required>
                                        </div>
                                        <div class="form-group">
                                            <input name="email" type="email" class="form-control" placeholder="{{$language->email}}" required>
                                        </div>
                                        <div class="form-group">
                                            <textarea name="review" id="" rows="5" placeholder="{{$language->review_details}}" class="form-control" style="resize: vertical;" required></textarea>
                                        </div>
                                        @if ($errors->has('error'))
                                            <span class="help-block">
                                                <strong>{{ $errors->first('password') }}</strong>
                                            </span>
                                        @endif
                                        <div class="form-group text-center">
                                            <input name="btn" type="submit" class="btn-review" value="{{$language->submit}}">
                                        </div>
                                    </form>
                                </div>
    
                            </div>
                            <!-- End tab_2 -->
    
                            <div class="tab-pane fade" id="tab_3">
                                <div id="map"></div>
                                <!-- end map-->
    
                                <div class="box_map">
                                    <i class="icon_set_1_icon-25"></i>
                                    <h4>By Train/tube</h4>
                                    <p>Per cu esse assentior delicatissimi, qui adipiscing dissentiunt mediocritatem in, dicat voluptaria no eam. No est alia eloquentiam. Has rebum vulputate adversarium no. Pro cibo delenit scripserit id.</p>
                                </div>
    
    
                                <div class="box_map">
                                    <i class="icon_set_1_icon-26"></i>
                                    <h4>By bus</h4>
                                    <p>Per cu esse assentior delicatissimi, qui adipiscing dissentiunt mediocritatem in, dicat voluptaria no eam. No est alia eloquentiam. Has rebum vulputate adversarium no. Pro cibo delenit scripserit id.</p>
                                </div>
    
                                <div class="box_map">
                                    <i class="icon_set_1_icon-21"></i>
                                    <h4>By Taxi/cabs</h4>
                                    <p>Per cu esse assentior delicatissimi, qui adipiscing dissentiunt mediocritatem in, dicat voluptaria no eam. No est alia eloquentiam. Has rebum vulputate adversarium no. Pro cibo delenit scripserit id.</p>
                                </div>
    
                            </div>
                            <!-- End tab_3 -->
                        </div>
                        <!-- End tabs -->
                    </div>
                    <!-- End Col -->
    
                    <aside class="col-md-4">
                        <div class="box_style_1">
                            <div class="price">
                                <strong>${{ $productdata->price }}</strong><small>per person</small>
                            </div>
                            <ul class="list_ok">
                                <li>
                                    @if($productdata->stock != 0 || $productdata->stock === null )
                                    <span class="available">
                                        <i class="fa fa-check-square-o"></i>
                                        <span>{{$language->available}}</span>
                                    </span>
                                @else
                                    <span class="not-available">
                                    <i class="fa fa-times-circle-o"></i>
                                    <span>{{$language->out_of_stock}}</span>
                                    </span>
                                @endif
                                </li>
                                <li>@if(!empty($productdata->startDate))
                                    Package Start at: {{$productdata->startDate}}
                                    @endif</li>
                                <li>@if($productdata->endDate !=null)
                                    Package End at {{$productdata->endDate}}
                                    @endif</li>
                            </ul>
                            <small>*Free for childs under 8 years old</small>
                        </div>
                        <div class="box_style_2">
                            <h3>Book Your Tour<span>Free service - Confirmed immediately</span></h3>
                            <div id="message-booking"></div>
                            
                            <form class="addtocart-form">
                                {{csrf_field()}}
                                @if(Session::has('uniqueid'))
                                    <input type="hidden" name="uniqueid" value="{{Session::get('uniqueid')}}">
                                @else
                                    <input type="hidden" name="uniqueid" value="{{str_random(7)}}">
                                @endif
                                <input type="hidden" id="price" name="price" value="{{\App\Product::Cost($productdata->id)}}">
                                <input type="hidden" name="title" value="{{$productdata->title}}">
                                <input type="hidden" name="product" value="{{$productdata->id}}">
                                <input type="hidden" id="cost" name="cost" value="{{ $productdata->price }}">
                                <input type="hidden" id="quantity" name="quantity" value="1">
                                <input type="hidden" id="chQuantity" name="children" value="0">
                                <input type="hidden" id="inQuantity" name="infant" value="0">
                                <input type="hidden" id="size" name="size" value="">

                                <table id="tickets" class="table">
                                    <thead>
                                        <tr>
                                            <th>Tickets</th>
    
                                            <th>Quantity</th>
                                            <th class="text-center"><span class="subtotal">Subtotal</span>
    
                                            </th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr class="total_row">
                                            <td colspan="2"><strong>TOTAL</strong>
                                            </td>
                                            <td class="text-center">
                                                <input name="total" id="total" value="">
                                            </td>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td><strong>Adult</strong><a href="#" class="tooltip-1" data-placement="top" title="" data-original-title="16 - 65 years old"><sup class="icon-info-4"></sup></a>
                                                <span class="price">{{ $productdata->price }}</span>
                                            </td>
                                            <td>
                                                <div class="styled-select">
                                                    <select class="form-control"  id="adults">
                                                        <option value="">Select</option>
                                    
                                                        <option selected value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                        <option value="6">6</option>
                                                        <option value="7">7</option>
                                                        <option value="8">8</option>
                                                        <option value="9">9</option>
                                                    </select>
                                                </div>
                                            </td>
                                            <td class="text-center"><span class="subtotal">0</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><strong>Children</strong><a href="#" class="tooltip-1" data-placement="top" title="" data-original-title="Over 65 years old"><sup class="icon-info-4"></sup></a><span class="price">6.75</span>
                                            </td>
                                            <td>
                                                <div class="styled-select">
                                                    <select class="form-control"  id="children">
                                                        <option value="">Select</option>
                                                        <option value="0">0</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                        <option value="6">6</option>
                                                        <option value="7">7</option>
                                                        <option value="8">8</option>
                                                        <option value="9">9</option>
                                                    </select>
                                                </div>
                                            </td>
                                            <td class="text-center"><span class="subtotal">0</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><strong>Infant</strong> <span class="price">6.75</span> </td>
                                            <td>
                                                <div class="styled-select">
                                                    <select class="form-control"  id="infant">
                                                        <option value="">Select</option>
                                                        <option  value="0">0</option>
                                                        <option  value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                        <option value="6">6</option>
                                                        <option value="7">7</option>
                                                        <option value="8">8</option>
                                                        <option value="9">9</option>
                                                    </select>
                                                </div>
                                            </td>
                                            <td class="text-center"><span class="subtotal">0</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                                @if($productdata->stock != 0 || $productdata->stock === null )
                                    <button type="button" class="product-addCart-btn to-cart"><i class="fa fa-cart-plus"></i><span>{{$language->add_to_cart}}</span></button>
                                @else
                                    <button type="button" class="product-addCart-btn  to-cart" disabled><i class="fa fa-cart-plus"></i>{{$language->out_of_stock}}</button>
                                @endif
                            </form>
                            <hr>
                        </div>
                    </aside>
                </div>
                <!-- End row -->
            </div>
            <!-- End container -->
        </section>
        <!-- End section -->
        <section class="wrapper">
            <div class="divider_border"style="background: url('{{ URL::asset('asset/img/divider.png') }}') center top no-repeat;"></div>
            <div class="container">
                <div class="section-padding product-description-wrapper padding-bottom-0 padding-top-0 wow fadeInUp">
                    <div class="section-padding product-carousel-wrapper wow fadeInUp">
                    <div class="container">
                        <div class="product-carousel-full-div">
                            <div class="row margin-bottom-0">
                                <div class="col-md-12">
                                    <div class="section-title">
                                        <h2>{{$language->related_products}}</h2>
                                        <hr>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="product-carousel-list">
                                        @foreach($relateds as $product)
                                            <div class="single-product-carousel-item text-center">
                                                <div class="img_wrapper">
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
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
         
    </div>
@stop

@section('footer')
<script>
    $('#star1').starrr({
        rating: 5,
        change: function(e, value){
            if (value) {
                $('.your-choice-was').show();
                $('.choice').text(value);
                $('#rate').val(value);
            } else {
                $('.your-choice-was').hide();
            }
        }
    });

    $("#showmore").click(function() {
        $('html, body').animate({
            scrollTop: $("#description").offset().top - 200
        }, 1000);
    });


    $('#star1').starrr({
        rating: 5,
        change: function(e, value){
            if (value) {
                $('.your-choice-was').show();
                $('.choice').text(value);
                $('#rate').val(value);
            } else {
                $('.your-choice-was').hide();
            }
        }
    });
</script>
@stop