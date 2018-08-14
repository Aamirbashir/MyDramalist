<body>
<div class="spinner-wrapper">
            <div class="spinner">
                <div class="sk-folding-cube">
                    <div class="sk-cube1 sk-cube"></div>
                    <div class="sk-cube2 sk-cube"></div>
                    <div class="sk-cube4 sk-cube"></div>
                    <div class="sk-cube3 sk-cube"></div>
                </div>
            </div>
        </div>
        <div id="xp-wrapper">
            <header id="xp-header">
                <div class="xp-top-header">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-2">
                                <div class="xp-logo">
                                    <a href="index.html"><img src="images/logo.png" alt="" /> </a>
                                </div>
                            </div>
                            <div class="col-md-10">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6">
                                <div class="xp-header-about hidden-xs">
                                    <div class="xp-about">
                                        <ul>
                                            <li><a href="about.html">Explore</a></li>
                                            <li><a href="contacts.html">Community</a></li>
                                            <li><a href="#">More   <i class="fa fa-caret-down"></i></a>
                                                <ul class="xp-sub-menu">
                                                    <li><a href="#">singleproduct</a></li>
                                                    <li><a href="#">singleproduct</a></li>
                                                    <li><a href="#">singleproduct</a></li>
                                                    <li><a href="#">singleproduct</a></li>
                                                    <li><a href="#">singleproduct</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                 </div>
                            </div>
                            
                                    <!-- <div class="col-md-1 col-sm-12 col-xs-12">
                                    </div> -->
                                    <div class="col-xs-12 col-sm-6">
                                     <div class="xp-header-about">
                                    <div class="xp-about right-side hidden-xs">
                                        <ul>
                                            <li style="margin-right: 10px;">
                                            <form action="" class="search-form">
                <div class="form-group has-feedback">
                    <label for="search" class="sr-only">Search</label>
                    <input type="text" class="form-control" name="search" id="search" placeholder="search">
                    <span class="fa fa-search form-control-feedback"></span>
                </div>
            </form></li>
                                           <!--  <li><a href="#" class="get-pass">GET PASS</a></li> -->
            <li>
                
                @auth
                <a href="#" class="user-login"> <i class="fa fa-user"></i>{{Auth::user()->name}}</a>
                @else
                <a href="#" class="user-login"> <i class="fa fa-user"></i>    LOG IN</a>
             @endauth
                <ul class="xp-sub-menu">

                    <li><a class="remove-border" href="/messages"><i class="fa fa-envelope"></i> Messages</a></li>
                    <li><a class="remove-border" href="/friends"><i class="fa fa-users"></i> Following</a></li>
                    <li><a class="remove-border" href="/profile/7384899"><i class="fa fa-user"></i> Profile</a></li>
                    <li><a class="remove-border" href="/dramalist/7384899"><i class="fa fa-list-alt"></i> My Watchlist</a></li>
                    <li><a class="remove-border" href="/profile/7384899/lists"><i class="fa fa-list-ol"></i> Custom Lists</a></li>
                    <li><a class="remove-border " href="/account/profile"><i class="fa fa-cog"></i> Settings</a></li>
                    <li><a class="remove-border" href="/faq"><i class="fa fa-question-circle"></i> Need Help?</a></li>
                    <li  class="remove-border"> 
                        <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i class="fa fa-power-off"></i> Logout</a>

                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            {{ csrf_field() }}
                        </form>
                    </li>
                </ul>
            </li>                                   
        </ul>
    </div>

</div>
</div>
</div>
</div>
                    </div>
                </div>
             </div>
                <div class="xp-last-header">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="xp-navigation l">
                                    <div class="navbar navbar-default" role="navigation">
                                        <div class="navbar-header">
                                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                                                <span class="sr-only">Toggle navigation</span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                            </button>
                                        </div>
                                        <div class="navbar-collapse collapse">
                                            <ul class="nav navbar-nav">
                                                <li class="active"><a href="index.html">Home&nbsp;&nbsp;<i class="fa fa-caret-down"></i></a>
                                                    <ul class="sub-menu">
                                                        <li><a href="#">Feeds</a></li>
                                                        <li><a href="#">Trailers</a></li>
                                                        <li><a href="#">Watch Online</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">About Us</a></li>
                                                <li><a href="#">Forum</a></li>
                                                <li><a href="#">Video</a></li>
                                                <li><a href="#">Gallery</a></li>
                                                <li><a href="#">contacts</a></li>
                                                <li><a href="#">Pages&nbsp;&nbsp;<i class="fa fa-caret-down"></i></a>
                                                    <ul class="sub-menu">
                                                        <li><a href="#">about</a></li>
                                                        <li><a href="#">shop</a></li>
                                                        <li><a href="#">singleproduct</a></li>
                                                        <li><a href="#">singlepost</a></li>
                                                        <li><a href="#">reviewpost</a></li>
                                                        
                                                    </ul>
                                                </li>
                                               
                                            </ul>
                                        </div><!--/.nav-collapse -->
                                    </div>  
                                 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                @auth
                @if(Auth::user()->is_verified==false)
                <div class="alert alert-danger">
  <strong>Verify Email!</strong> Please verify your email to avail full option.
</div>
@endif
@endauth

            </header>