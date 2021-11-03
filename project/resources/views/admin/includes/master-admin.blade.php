<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
    <meta name="description" content="GeniusOcean Admin Panel.">
    <meta name="author" content="GeniusOcean">
    <link rel="icon" type="image/png" href="{{url('/')}}/assets/images/{{$settings[0]->favicon}}" />

    <title>{{$settings[0]->title}} - Admin Panel</title>

    <!-- Bootstrap Core CSS -->
    <link href="{{ URL::asset('assets/css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{ URL::asset('assets/css/font-awesome.min.css')}}" rel="stylesheet">
    <link href="{{ URL::asset('assets/css/dataTables.bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{ URL::asset('assets/css/bootstrap-toggle.min.css')}}" rel="stylesheet">
    <link href="{{ URL::asset('assets/css/bootstrap-tagsinput.css')}}" rel="stylesheet">
    <link href="//cdnjs.cloudflare.com/ajax/libs/octicons/3.5.0/octicons.min.css" rel="stylesheet">
    <link href="{{ URL::asset('assets/css/bootstrap-colorpicker.css')}}" rel="stylesheet">
 {{-- datepicker --}}
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!-- Custom CSS -->
    <link href="{{ URL::asset('assets/css/genius-admin.css')}}" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<div id="wrapper"><!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="{!! url('admin/dashboard') !!}">
            <img class="logo" src="{!! url('assets/images/logo') !!}/{{$settings[0]->logo}}" alt="LOGO">
        </a>
    </div>
    <!-- Top Menu Items -->
    <ul class="nav navbar-right top-nav">

        <li class="dropdown">
            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">{{ Auth::user()->name }} <b class="fa fa-angle-down"></b></a>
            <ul class="dropdown-menu">
                <li><a href="{!! url('admin/adminprofile') !!}"><i class="fa fa-fw fa-user"></i> Edit Profile</a></li>
                <li><a href="{!! url('admin/adminpassword') !!}"><i class="fa fa-fw fa-cog"></i> Change Password</a></li>
                <li class="divider"></li>
                <li>
                    <a href="{{ route('logout') }}"
                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                        <i class="fa fa-fw fa-power-off"></i> Logout
                    </a>

                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        {{ csrf_field() }}
                    </form>
                </li>
            </ul>
        </li>
    </ul>
    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav side-nav">
            <li>
                <a href="{!! url('admin/dashboard') !!}"><i class="fa fa-fw fa-home"></i>  Dashboard</a>
            </li>
            <li>
                <a href="{!! url('admin/orders') !!}"><i class="fa fa-fw fa-usd"></i> Orders</a>
            </li>
            <li>
                <a href="{!! url('admin/products') !!}"><i class="fa fa-fw fa-shopping-cart"></i> Products</a>
            </li>

            <li>
                <a href="{!! url('admin/withdraws') !!}"><i class="fa fa-fw fa-bank"></i> Withdraws</a>
            </li>
            <li>
                <a href="{!! url('admin/vendors') !!}"><i class="fa fa-fw fa-group"></i> Vendors</a>
            </li>
            <li>
                <a href="{!! url('admin/customers') !!}"><i class="fa fa-fw fa-user"></i> Customers</a>
            </li>
            <li>
                <a href="{!! url('admin/categories') !!}"><i class="fa fa-fw fa-sitemap"></i> Manage Category</a>
            </li>
            <li>
                <a href="{!! url('admin/blog') !!}"><i class="fa fa-fw fa-file-text"></i> Blog</a>
            </li>
            <li>
                <a href="{!! url('admin/sliders') !!}"><i class="fa fa-fw fa-photo"></i> Slider Settings</a>
            </li>
            <li>
                <a href="{!! url('admin/language-settings') !!}"><i class="fa fa-fw fa-language"></i> Language Settings</a>
            </li>
            <li>
                <a href="{!! url('admin/testimonial') !!}"><i class="fa fa-fw fa-quote-right"></i> Testimonial Section</a>
            </li>
            <li>
                <a href="{!! url('admin/themecolor') !!}"><i class="fa fa-fw fa-paint-brush"></i> Theme Color Settings</a>
            </li>
            <li>
                <a href="{!! url('admin/pagesettings') !!}"><i class="fa fa-fw fa-file-code-o"></i> Page Settings</a>
            </li>
            <li>
                <a href="{!! url('admin/social') !!}"><i class="fa fa-fw fa-paper-plane"></i> Social Settings</a>
            </li>
            <li>
                <a href="{!! url('admin/tools') !!}"><i class="fa fa-fw fa-wrench"></i> Seo Tools</a>
            </li>
            <li>
                <a href="{!! url('admin/settings') !!}"><i class="fa fa-fw fa-cogs"></i> General Settings</a>
            </li>
            <li>
                <a href="{!! url('admin/subscribers') !!}"><i class="fa fa-fw fa-group"></i> Subscribers</a>
            </li>

        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>

@yield('content')

</div><!-- /#wrapper -->
<!-- /#wrapper -->
<script>
    var baseUrl = '{!! url('/') !!}';
</script>
<!-- jQuery -->
<script src="{{ URL::asset('assets/js/jquery.min.js')}}"></script>
<script src="{{ URL::asset('assets/js/jquery.smooth-scroll.js')}}"></script>
<!-- Bootstrap Core JavaScript -->
<script src="{{ URL::asset('assets/js/bootstrap.min.js')}}"></script>
<script src="{{ URL::asset('assets/js/jquery.dataTables.min.js')}}"></script>
<script src="{{ URL::asset('assets/js/dataTables.bootstrap.min.js')}}"></script>
<script src="{{ URL::asset('assets/js/bootstrap-tagsinput.js')}}"></script>
<script src="{{ URL::asset('assets/js/bootstrap-colorpicker.js')}}"></script>
<!-- Switchery -->
<script src="{{ URL::asset('assets/js/bootstrap-toggle.min.js')}}"></script>
<script type="text/javascript" src="{{ URL::asset('assets/js/plugin/nicEdit.js')}}"></script>
<script type="text/javascript" src="{{ URL::asset('assets/js/admin-genius.js')}}"></script>
<script type="text/javascript" src="{{ URL::asset('assets/js/Chart.min.js')}}"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
    $("#maincats").change(function () {
        $("#subs").html('<option value="">Select Sub Category</option>');
        $("#subs").attr('disabled',true);
        $("#childs").html('<option value="">Select Sub Category</option>');
        $("#childs").attr('disabled',true);
        var mainid = $(this).val();
        $.get('{{url('/')}}/subcats/'+mainid, function(response){
            $("#subs").attr('disabled',false);
            $.each(response, function(i, cart){
                $.each(cart, function (index, data) {
                    $("#subs").append('<option value="'+data.id+'">'+data.name+'</option>');
                    //console.log('index', data)
                })
            })
        });
    });
    $("#subs").change(function () {
        $("#childs").html('<option value="">Select Sub Category</option>');
        $("#childs").attr('disabled',true);
        var mainid = $(this).val();
        $.get('{{url('/')}}/childcats/'+mainid, function(response){
            $("#childs").attr('disabled',false);
            $.each(response, function(i, cart){
                $.each(cart, function (index, data) {
                    $("#childs").append('<option value="'+data.id+'">'+data.name+'</option>');
                    //console.log('index', data)
                })
            })
        });
    });
   

$(document).ready(function () {

    $("#dt1").datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 0,
        onSelect: function (date) {
            var dt2 = $('#dt2');
            var startDate = $(this).datepicker('getDate');
            var minDate = $(this).datepicker('getDate');
            dt2.datepicker('setDate', minDate);
            startDate.setDate(startDate.getDate() + 30);
            //sets dt2 maxDate to the last day of 30 days window
            dt2.datepicker('option', 'maxDate', startDate);
            dt2.datepicker('option', 'minDate', minDate);
            $(this).datepicker('option', 'minDate', minDate);
        }
    });
    $('#dt2').datepicker({
        dateFormat: 'yy-mm-dd'
    });

});
$(document).ready(function () {

    $("#dt1").datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 0,
        onSelect: function (date) {
            var dt2 = $('#dt2');
            var startDate = $(this).datepicker('getDate');
            var endDate = $(this).datepicker('getDate');
            dt2.datepicker('setDate', endDate);
            startDate.setDate(startDate.getDate() + 30);
            //sets dt2 maxDate to the last day of 30 days window
            dt2.datepicker('option', 'maxDate', startDate);
            dt2.datepicker('option', 'minDate', endDate);
            $(this).datepicker('option', 'minDate', endDate);
        }
    });
    $('#dt2').datepicker({
        dateFormat: 'yy-mm-dd'
    });

});
$(document).ready(function () {

    $("#dt1").datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 0,
        onSelect: function (date) {
            var dt2 = $('#dt2');
            var startDate = $(this).datepicker('getDate');
            var endDate = $(this).datepicker('getDate');
            dt2.datepicker('setDate', endDate);
            startDate.setDate(startDate.getDate() + 30);
            //sets dt2 maxDate to the last day of 30 days window
            dt2.datepicker('option', 'maxDate', startDate);
            dt2.datepicker('option', 'minDate', endDate);
            $(this).datepicker('option', 'minDate', endDate);
        }
    });
    $('#dt2').datepicker({
        dateFormat: 'yy-mm-dd'
    });
});


</script>
@yield('footer')
</body>
</html>

