(function($) {
    "use strict";

    jQuery(document).ready(function($) {

        $('.shippingCheck').click(function() {
            $('.shipping-details-area').toggle();

            if ($('.shipping-details-area').is(':hidden')) {
                $('.shipping-details-area').find('input').prop('required', false);
            } else {
                $('.shipping-details-area').find('input').prop('required', true);
            }
        });
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $(".product-carousel-list").owlCarousel({
            items: 4,
            autoplay: true,
            margin: 60,
            loop: true,
            nav: true,
            navText: false,
            smartSpeed: 1000,
            responsive: {
                0: {
                    items: 1,
                },
                768: {
                    items: 2,
                },
                992: {
                    items: 3,
                },
                1200: {
                    items: 4
                }
            }

        });

        $(".product-review-owl-carousel").owlCarousel({
            items: 4,
            nav: true,
            navText:false,
            dots: false,
            loop: true,
            autoplay: true,
            smartSpeed: 800

        });

        $('.product-zoom').zoom({
            on: 'click',
            magnify: 2,
            onZoomIn: function() {
                $(this).css('cursor', 'zoom-out');
            },
            onZoomOut: function() {
                $(this).css('cursor', 'zoom-in');
            }
        });


        $(".blog-area-slider").owlCarousel({
            items: 3,
            autoplay: true,
            margin: 60,
            loop: true,
            nav: true,
            navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
            smartSpeed: 800,
            responsive: {
                0: {
                    items: 1,
                },
                768: {
                    items: 2,
                },
                992: {
                    items: 3
                }
            }
        });

        $(".logo-carousel").owlCarousel({
            loop: true,
            autoWidth: true,
            items: 7,
            nav: true,
            dots: false,
            margin: 30,
            autoplay: true,
            navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
            smartSpeed: 300,
            responsive: {
                0: {
                    items: 3,
                },
                768: {
                    items: 5,
                },
                992: {
                    items: 7
                }
            }
        });

        $(".testimonial-section").owlCarousel({
            items: 1,
            autoplay: 3000,
            margin: 60,
            loop: true,
            nav: true,
            navText: ["<i class='fa fa-chevron-left'></i>", "<i class='fa fa-chevron-right'></i>"],
            smartSpeed: 800
        });

        new WOW().init();
        getCart();

    });

    $("#searchbtn").click(function() {
        if ($("#searchdata").val() != "") {
            window.location = mainurl + "/search/" + $("#searchdata").val();
        } else {
            window.location = mainurl + "/search/none";
        }
    });

    $("#searchdata").keypress(function(event) {
        if (event.which == 13) {
            event.preventDefault();
            if ($("#searchdata").val() != "") {
                window.location = mainurl + "/search/" + $("#searchdata").val();
            } else {
                window.location = mainurl + "/search/none";
            }

        }
    });

    $('#product-size span').click(function() {
        $('#product-size span').removeClass('selected-size');
        $(this).addClass('selected-size');
        var size = $(this).html();
        $('#size').val(size);
    });

    $("#ex2").slider({});
    $("#ex2").on("slide", function(slideRange) {
        var totals = slideRange.value;
        var value = totals.toString().split(',');
        $("#price-min").val(value[0]);
        $("#price-max").val(value[1]);
    });

    jQuery(window).load(function() {
        setTimeout(function() {
            $('#cover').fadeOut(500);
        }, 500);
    });


}(jQuery));

function productGallery(file) {
    var image = $("#" + file).attr('src');
    $('#imageDiv').attr('src', image);
    $('.zoomImg').attr('src', image);
}

function getQuickView(id) {
    var product = id.toString();
    $.get(mainurl + '/quick-view/' + product, function(response) {
        $('#viewProduct').html(response);
    });
}

//Cart System By ShaOn//

function getCart() {
    $.get(mainurl + '/cartupdate', function(response) {
        var total = 0;
        $("#goCart").html('');
        $.each(response, function(i, cart) {
            $.each(cart, function(index, data) {
                //for (var i = 0; i <= index; i++){
                var title = data.title.toLowerCase();
                title = title.split(' ').join('-');
                url = mainurl + '/product/' + data.product + '/' + title;
                total = parseFloat(total) + parseFloat(data.cost);
                $("#goCart").append('<div class="cart-entry"> <div class="content"> <a class="title" href="' + url + '">' + data.title + '</a> <div class="quantity">' + language.quantity + ': ' + data.quantity + '</div><div class="price">' + currency + data.cost + '</div></div><div class="button-x"><i class="fa fa-close" onclick=" getDelete(' + data.product + ')"></i></div></div>');
                $('#grandttl').html(currency + total.toFixed(2));
                $('#carttotal').html(currency + total.toFixed(2));
                $('#emptycart').html('');
                //console.log('index', data);
                //}
            })
        })
    });
}

function getDelete(id) {
    $.get(mainurl + '/cartdelete/' + id, function(response) {
        $('#grandttl').html(currency + '0.00');
        $('#carttotal').html(currency + '0.00');
        $('#grandtotal').html('0.00');
        $('#emptycart').html(language.empty_cart);
        $('#cartempty').html('<td><h3>' + language.empty_cart + '</h3></td>');
        $('#item' + id).remove();
        var total = 0;
        var url = '';
        $("#goCart").html('');
        $.each(response, function(i, cart) {
            $.each(cart, function(index, data) {
                //for (var i = 0; i <= index; i++){
                var title = data.title.toLowerCase();
                title = title.split(' ').join('-');
                url = mainurl + '/product/' + data.product + '/' + title;
                total = parseFloat(total) + parseFloat(data.cost);
                $("#goCart").append('<div class="cart-entry"> <div class="content"> <a class="title" href="' + url + '">' + data.title + '</a> <div class="quantity">' + language.quantity + ': ' + data.quantity + '</div><div class="price">' + currency + data.cost + ' FCFA</div></div><div class="button-x"><i class="fa fa-close" onclick=" getDelete(' + data.product + ')"></i></div></div>');
                $('#grandttl').html(currency + total.toFixed(2));
                $('#carttotal').html(currency + total.toFixed(2));
                $('#grandtotal').html(currency + total.toFixed(2));
                $('#emptycart').html('');
                $('#cartempty').html('');
                //console.log('index', data);
                //}
            })
        })
    });
}

$(".to-cart").click(function() {

    var formData = $(this).parents('form:first').serializeArray();
    $.ajax({
        url: mainurl + '/cartupdate',
        method: "POST",
        data: formData,
        success: function(data) {
            getCart();
            $.notify(language.added_to_cart, "success");
        },
        error: function(data) {
            //console.log('Error:', data);
        }
    });
});

function toCart(btn) {
    var formData = $(btn).parents('form:first').serializeArray();
    $.ajax({
        type: "POST",
        url: mainurl + '/cartupdate',
        data: formData,
        success: function(data) {
            getCart();
            // alert("Added to Cart: " + data.product);
            $.notify(language.added_to_cart, "success");
        },
        error: function(data) {
            //console.log('Error:', data);
        }
    });
}

//claculation
update_amounts();
$('select').change(update_amounts);

function update_amounts() {
    var sum=0.0;
    $('#tickets > tbody  > tr').each(function () {
        var qty = $(this).find('option:selected').val();
        var price = $(this).find('.price').text().replace(/[^\d.]/, '');
        var amount = (qty * price);
        sum += amount;
        $(this).find('.subtotal').text('$' + amount);
    });
    $('#total').val(sum);
    $('#tickets > tbody  > tr').change(function(){
        var tot = $('#total').val();
       $('#cost').val(tot);
    });
    $('#adults').change(function(){
      
         var qan = $('#adults').val();
         $('#quantity').val(qan);
     });
     $('#children').change(function(){

         var qan = $('#children').val();
         $('#chQuantity').val(qan);
      });
      $('#infant').change(function(){
          var qan = $('#infant').val();
         $('#inQuantity').val(qan);
      });
}

//Subscription Button
$("#subs").click(function() {
    var datas = $('#subform').serializeArray();
    var action = $('#subform').attr('action');
    $.post(action, datas, function(data, textStatus, xhr) {
        setTimeout(function() {
            $("#resp").html(data);
        }, 1000);
    });
    return false;
});

$(function() {

    var current = location.pathname;
    $('.dashboard-mainmenu li a').each(function() {
        var $this = $(this);
        // if the current path is like this link, make it active
        if ($this.attr('href').indexOf(current) !== -1) {
            $this.parents('li').addClass('active');
        }
    });
});

//Start Review Scripts Start
var slice = [].slice;

(function($, window) {
    var Starrr;
    window.Starrr = Starrr = (function() {
        Starrr.prototype.defaults = {
            rating: void 0,
            max: 5,
            readOnly: false,
            emptyClass: 'fa fa-star-o',
            fullClass: 'fa fa-star',
            change: function(e, value) {}
        };

        function Starrr($el, options) {
            this.options = $.extend({}, this.defaults, options);
            this.$el = $el;
            this.createStars();
            this.syncRating();
            if (this.options.readOnly) {
                return;
            }
            this.$el.on('mouseover.starrr', 'a', (function(_this) {
                return function(e) {
                    return _this.syncRating(_this.getStars().index(e.currentTarget) + 1);
                };
            })(this));
            this.$el.on('mouseout.starrr', (function(_this) {
                return function() {
                    return _this.syncRating();
                };
            })(this));
            this.$el.on('click.starrr', 'a', (function(_this) {
                return function(e) {
                    return _this.setRating(_this.getStars().index(e.currentTarget) + 1);
                };
            })(this));
            this.$el.on('starrr:change', this.options.change);
        }

        Starrr.prototype.getStars = function() {
            return this.$el.find('a');
        };

        Starrr.prototype.createStars = function() {
            var j, ref, results;
            results = [];
            for (j = 1, ref = this.options.max; 1 <= ref ? j <= ref : j >= ref; 1 <= ref ? j++ : j--) {
                results.push(this.$el.append("<a href='javascript:;' />"));
            }
            return results;
        };

        Starrr.prototype.setRating = function(rating) {
            if (this.options.rating === rating) {
                rating = void 0;
            }
            this.options.rating = rating;
            this.syncRating();
            return this.$el.trigger('starrr:change', rating);
        };

        Starrr.prototype.getRating = function() {
            return this.options.rating;
        };

        Starrr.prototype.syncRating = function(rating) {
            var $stars, i, j, ref, results;
            rating || (rating = this.options.rating);
            $stars = this.getStars();
            results = [];
            for (i = j = 1, ref = this.options.max; 1 <= ref ? j <= ref : j >= ref; i = 1 <= ref ? ++j : --j) {
                results.push($stars.eq(i - 1).removeClass(rating >= i ? this.options.emptyClass : this.options.fullClass).addClass(rating >= i ? this.options.fullClass : this.options.emptyClass));
            }
            return results;
        };

        return Starrr;

    })();
    return $.fn.extend({
        starrr: function() {
            var args, option;
            option = arguments[0], args = 2 <= arguments.length ? slice.call(arguments, 1) : [];
            return this.each(function() {
                var data;
                data = $(this).data('starrr');
                if (!data) {
                    $(this).data('starrr', (data = new Starrr($(this), option)));
                }
                if (typeof option === 'string') {
                    return data[option].apply(data, args);
                }
            });
        }
    });
})(window.jQuery, window);

/* Booking form calculate */

//Start Review Scripts End