@extends('includes.newmaster')

@section('content')

    <div class="home-wrapper">
        <!-- Starting of login area -->
        <div class="section-padding login-area-wrapper wow fadeInUp">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-lg-offset-3 col-md-offset-3 col-md-6 col-sm-12 col-xs-12">
                        <div class="signIn-area">
                            <h2 class="signIn-title">Customer Sign in</h2>
                            <hr/>
                            <form action="{{ route('user.login.submit') }}" method="POST">
                                {{ csrf_field() }}
                                <div class="form-group">
                                    <label for="email">Email Address <span>*</span></label>
                                    <input class="form-control" value="{{ old('email') }}" type="email" name="email" id="email" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password <span>*</span></label>
                                    <input class="form-control" type="password" name="password" id="password" required>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <a href="{{route('user.reg')}}">Create New Account</a>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 text-right">
                                            <a href="{{route('user.forgotpass')}}">Forgot your Password?</a>
                                        </div>
                                    </div>
                                </div>
                                <div id="resp">
                                    @if ($errors->has('password'))
                                        <div class="alert alert-danger alert-dismissable">
                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                            <strong>{{ $errors->first('password') }}</strong>
                                        </div>
                                    @endif
                                    @if ($errors->has('email'))
                                            <div class="alert alert-danger alert-dismissable">
                                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                <strong>{{ $errors->first('email') }}</strong>
                                            </div>
                                    @endif
                                </div>
                                <div class="form-group">
                                    <input class="btn btn-md login-btn" type="submit" value="LOGIN">
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Ending of login area -->
    </div>
@stop

@section('footer')

@stop