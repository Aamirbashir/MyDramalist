{{-- @extends('adminlte::register') --}}
@extends('layouts.landingPage')
@section('content')
 <main class="xp-main-section l">
                <section class="section-padding">
                    <div class="container">
                        <div class="xp-contact-us">
                            <div class="row">
                            <div class="col-md-3">
                                    
                                </div>
                                <div class="col-md-6">
                                    <div class="xp-contact-form  bg-color">
                                        <div class="xp-lifestyle">
                                            <h3>Sign Up Form</h3>
                                        </div>
                                        <div class="form-content">
                                       
                   
                                          <form class="form-signin" method="post" action="{{ url(config('adminlte.register_url', 'register')) }}">
                                        {!! csrf_field() !!}

                                            <div class="form-group has-feedback {{ $errors->has('name') ? 'has-error' : '' }}">
                    <input type="text" name="name"  value="{{ old('name') }}"
                           placeholder="Name">
                    
                    @if ($errors->has('name'))
                        <span class="error">
                           {{ $errors->first('name') }}
                        </span>
                    @endif
                </div>
                <div class="form-group has-feedback {{ $errors->has('email') ? 'has-error' : '' }}">
                    <input type="email" name="email"  value="{{ old('email') }}"
                           placeholder="{{ trans('adminlte::adminlte.email') }}">
                   
                    @if ($errors->has('email'))
                        <span class="error">
                           {{ $errors->first('email') }}
                        </span>
                    @endif
                </div>
                <div class="form-group has-feedback {{ $errors->has('password') ? 'has-error' : '' }}">
                    <input type="password" name="password" 
                           placeholder="{{ trans('adminlte::adminlte.password') }}">
                    
                    @if ($errors->has('password'))
                        <span class="error">
                           {{ $errors->first('password') }}
                        </span>
                    @endif
                </div>
                <div class="form-group has-feedback {{ $errors->has('password_confirmation') ? 'has-error' : '' }}">
                    <input type="password" name="password_confirmation" 
                           placeholder="{{ trans('adminlte::adminlte.retype_password') }}">
                   
                    @if ($errors->has('password_confirmation'))
                        <span class="error">
                           {{ $errors->first('password_confirmation') }}
                        </span>
                    @endif
                </div>
                  <div class="form-group">
                                          {!! NoCaptcha::renderJs() !!}
          {!! NoCaptcha::display() !!}
          @if ($errors->has('g-recaptcha-response'))
    <span class="error">
       {{ $errors->first('g-recaptcha-response') }}
    </span>
@endif
                     </div>
                                <div class="form-group">
                                            <div class="pull-left">
                                                    <p><input type="checkbox" name="terms" >&nbsp;&nbsp;I agree to the&nbsp;<a href="#">Terms of services</a>&nbsp;and&nbsp;<a href="#">Privacy Policy.</a></p>
                                                    @if ($errors->has('terms'))
                                                        <span class="error">
                                                           {{ $errors->first('terms') }}
                                                        </span>
                                                    @endif
                                                </div>
                                                
                                            </div>
              
                                            <div class="form-group">
                                                <input type="submit" value="Sign Up" />
                            </div>
                                        
                                        
                                                <div class="text-center">
                                                    <p>Or do you already have an account? Let's<a href="login.html">Log In</a></p>
                                                    <p class="center-align">OR</p><br>
                                         
                                                </div>
                                                  <div class="form-group">
                                           <div class="btn-group ">
                            <button type="button" class="btn btn-primary"><i class="fa fa-facebook"></i></button>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-danger"><i class="fa fa-google"></i></button>
                        </div>
                        <div class="btn-group">
                            <button type="button" type="submit" class="btn btn-info"><i class="fa fa-twitter"></i></button>
                        </div>
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