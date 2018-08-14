{{-- @extends('adminlte::login') --}}

@extends('layouts.landingPage')
@section('content')
<main class="xp-main-section l">
    <section class="section-padding">
        <div class="container">

            <div class="xp-contact-us ">
                <div class="row">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-6">
                        <div class="xp-contact-form bg-color">
                            <div class="xp-lifestyle">
                                <h3>Login Form</h3>
                            </div>
                            <div class="form-content">
                              <form class="form-signin" action="login" method="post">
                               {!! csrf_field() !!}
                               <div class="form-group">
                                <input type="text" placeholder="Email ..." name="email" value="{{old('email')}}" />
                                @if ($errors->has('email'))
                                <span class="error">
                                    {{ $errors->first('email') }}
                                </span>
                                @endif
                            </div>
                            <div class="form-group">
                                <input type="password" placeholder="Password ..." name="password" />
                                @if ($errors->has('password'))
                                <span class="error">
                                    {{ $errors->first('password') }}
                                </span>
                                @endif
                            </div>
                            <div class="form-group">
                                <div class="pull-left">
                                    <p><input type="checkbox" name="remember">&nbsp;&nbsp;<a href="#">Remember me</a></p>
                                </div>
                                <div class="pull-right">
                                    <p><i class="fa fa-lock"></i>&nbsp;&nbsp;<a href="#">Forgot password?</a></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Login" />
                            </div>
                            <div class="form-group">
                             <div class="btn-group ">
                                <a type="button" href="{{ url('/auth/facebook') }}" class="btn btn-primary"><i class="fa fa-facebook"></i></a>
                            </div>
                            <div class="btn-group">
                                <a type="button" href="{{ url('/auth/google') }}" class="btn btn-danger"><i class="fa fa-google"></i></a>
                            </div>
                            <div class="btn-group">
                                <button type="button" class="btn btn-info"><i class="fa fa-twitter"></i></button>
                            </div>
                        </div>
                        <div class="form-group text-center">
                          <p>Don't have an account? <a href="{{url('/register')}}">Signup</a></p>

                      </div>
                  </form>
              </div>
          </div>
      </div>
      <div class="col-md-3">
      </div>

  </div>
</div>
</div>
</section>
</main>
@endsection
