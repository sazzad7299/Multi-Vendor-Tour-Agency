@extends('admin.includes.master-admin')

@section('content')

    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row" id="main">
                <!-- Page Heading -->
                <div class="go-title">

                    <h3>Withdraws <a href="{{url('admin/withdraws/pending')}}" class="btn btn-info"><strong>Pending Withdraws <label class="label label-primary">{{\App\Withdraw::where('status','pending')->count()}}</label></strong></a></h3>
                    <div class="go-line"></div>
                </div>
                <!-- Page Content -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div id="response">
                            @if(Session::has('message'))
                                <div class="alert alert-success alert-dismissable">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    {{ Session::get('message') }}
                                </div>
                            @endif
                        </div>
                        <table class="table table-striped table-bordered" cellspacing="0" id="example" width="100%">
                            <thead>
                            <tr>
                                <th>Company Name</th>
                                <th width="10%">Vendors Email</th>
                                <th>Phone</th>
                                <th width="10%">Method</th>
                                <th width="10%">Status</th>
                                <th>Withdraw Date</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($withdraws as $withdraw)
                                <tr>
                                    <td><a href="{{url('admin/vendors')}}/{{$withdraw->vendorid->id}}" target="_blank">{{$withdraw->vendorid->shop_name}}</a></td>
                                    <td>{{$withdraw->vendorid->email}}</td>
                                    <td>{{$withdraw->vendorid->phone}}</td>
                                    <td>{{$withdraw->method}}</td>
                                    <td>{{ucfirst($withdraw->status)}}</td>
                                    <td>{{$withdraw->created_at}}</td>
                                    <td>
                                        <a href="withdraws/{{$withdraw->id}}" class="btn btn-primary btn-xs"><i class="fa fa-check"></i> View Details </a>
                                        @if($withdraw->status == "pending")
                                        <a href="withdraws/accept/{{$withdraw->id}}" class="btn btn-success btn-xs"><i class="fa fa-check-circle"></i> Accept</a>

                                        <a href="withdraws/reject/{{$withdraw->id}}" class="btn btn-danger btn-xs"><i class="fa fa-times-circle"></i> Reject</a>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

@stop

@section('footer')

@stop