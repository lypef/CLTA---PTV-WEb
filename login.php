<?php
  include 'func/db.php';
  db_sessionValidarYES();
  $departamentos = mysqli_query(db_conectar(),"SELECT id, nombre FROM departamentos");
  $departamentos_ = mysqli_query(db_conectar(),"SELECT id, nombre FROM departamentos");
?>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">

    <!-- All css files are included here -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- User style -->
    <link rel="stylesheet" href="css/custom.css">

    <!-- Style customizer (Remove these two lines please) -->
    <link rel="stylesheet" href="css/color/skin-default.css">


    <!-- Modernizr JS -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <div class="wrapper">

        <!-- Start of header area -->
        <!-- Start of header area -->
        <header>
            <div id="sticky-header" class="header-area header-wrapper transparent-header">
                <div class="header-middle-area black-bg">
                    <div class="container">
                        <div class="full-width-mega-dropdown">
                            <div class="row">
                                <div class="col-md-12">
                                    <nav id="primary-menu">
                                        <ul class="main-menu text-center">
                                            <li><a href="index.php">Home</a></li>
                                            <li class="mega-parent"><a href="#"><i class="zmdi zmdi-equalizer"></i> Ofertas</a>
                                                <div class="mega-menu-area header-top-hover p-30">
                                                    <?php
                                                        echo ReturnProductsOferta();
                                                    ?>

                                                </div>
                                            </li>
                                            <li class="mega-parent"><a href="#"><i class="zmdi zmdi-plus"></i> Lo mas nuevo</a>
                                                <div class="mega-menu-area header-top-hover p-30">
                                                    
                                                <?php
                                                    while($row = mysqli_fetch_array($departamentos_))
                                                    {
                                                        echo '
                                                        <ul class="single-mega-item">
                                                        <li>
                                                        <a href="departamento.php/?id='.$row[0].'"><h2 class="mega-menu-title mb-15">'.$row[1].'</h2></a>
                                                        </li>
                                                        '.returnproducts($row[0]).'
                                                        </ul>';
                                                    }
                                                ?>
                                                    
                                                </div>
                                            </li>
                                            <li><a href="index.php">Productos</a></li>
                                            <li class="mega-parent"><a href="#">Mision</a>
                                                <div class="mega-menu-area header-top-hover p-30">
                                                    <ul class="single-mega-item">
                                                        <li><h2 class="mega-menu-title mb-15">Men’s</h2></li>
                                                        <li><a href="shop-full.html">Blazers</a></li>
                                                        <li><a href="shop-full.html">Jackets</a></li>
                                                        <li><a href="shop-full.html">Collections</a></li>
                                                        <li><a href="shop-full.html">T-Shirts</a></li>
                                                        <li><a href="shop-full.html">jens pant’s</a></li>
                                                        <li><a href="shop-full.html">sports shoes</a></li>
                                                    </ul>
                                                    <ul class="single-mega-item">
                                                        <li><h2 class="mega-menu-title mb-15">Women’s</h2></li>
                                                        <li><a href="shop-full.html">Cocktail</a></li>
                                                        <li><a href="shop-full.html">Sunglass</a></li>
                                                        <li><a href="shop-full.html">Evening</a></li>
                                                        <li><a href="shop-full.html">Footwear</a></li>
                                                        <li><a href="shop-full.html">Bootees Bags</a></li>
                                                        <li><a href="shop-full.html">Furniture</a></li>
                                                    </ul>
                                                    <ul class="single-mega-item">
                                                        <li><h2 class="mega-menu-title mb-15">Accessaories</h2></li>
                                                        <li><a href="shop-full.html">Gagets</a></li>
                                                        <li><a href="shop-full.html">Laptop</a></li>
                                                        <li><a href="shop-full.html">Mobile</a></li>
                                                        <li><a href="shop-full.html">Lifestyle</a></li>
                                                        <li><a href="shop-full.html">Gens pant’s</a></li>
                                                        <li><a href="shop-full.html">Sports items</a></li>
                                                    </ul>
                                                    <div class="single-mega-item aside-img">
                                                        <a href="shop-full.html" class="b-img widget-img text-uppercase">
                                                            <img src="images/widget/1.jpg" alt="">
                                                            <div class="best">best</div>
                                                            <div class="brand">brand</div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="mega-parent"><a href="#">Vision</a>
                                                <div class="mega-menu-area header-top-hover p-30">
                                                    <ul class="single-mega-item">
                                                        <li><h2 class="mega-menu-title mb-15">Elements 1</h2></li>
                                                        <li><a href="elements-header-1-sticky.html">Header 1 Sticky</a></li>
                                                        <li><a href="elements-header-1-no-sticky.html">Header 1 No Sticky</a></li>
                                                        <li><a href="elements-header-2-sticky.html">Header 2 Sticky</a></li>
                                                        <li><a href="elements-header-2-no-sticky.html">Header 2 No Sticky</a></li>
                                                        <li><a href="elements-footer-1.html">Footer One</a></li>
                                                        <li><a href="elements-footer-2.html">Footer Two</a></li>
                                                    </ul>
                                                    <ul class="single-mega-item">
                                                        <li><h2 class="mega-menu-title mb-15">Elements 2</h2></li>
                                                        <li><a href="elements-accordion.html">Accordion</a></li>
                                                        <li><a href="elements-alerts.html">Alerts</a></li>
                                                        <li><a href="elements-audio.html">Audio</a></li>
                                                        <li><a href="elements-banner.html">Banner</a></li>
                                                        <li><a href="elements-breadcrumbs.html">Breadcrumbs</a></li>
                                                        <li><a href="elements-buttons.html">Buttons</a></li>
                                                    </ul>
                                                    <ul class="single-mega-item">
                                                        <li><h2 class="mega-menu-title mb-15">Elements 3</h2></li>
                                                        <li><a href="elements-call-to-action.html">Call To Action</a></li>
                                                        <li><a href="elements-contact-form.html">Dynamic Contact Form</a></li>
                                                        <li><a href="elements-map.html">Map</a></li>
                                                        <li><a href="elements-pagination.html">Pagination</a></li>
                                                        <li><a href="elements-progress-bars.html">Progress Bars</a></li>
                                                        <li><a href="elements-section-title.html">section Title</a></li>
                                                    </ul>
                                                    <ul class="single-mega-item">
                                                        <li><h2 class="mega-menu-title mb-15">Elements 4</h2></li>
                                                        <li><a href="elements-tab.html">Tab</a></li>
                                                        <li><a href="elements-typography.html">Typography</a></li>
                                                        <li><a href="elements-up-comming-product-1.html">Up Comming Product 1</a></li>
                                                        <li><a href="elements-up-comming-product-2.html">Up Comming Product 2</a></li>
                                                        <li><a href="elements-video.html">Video</a></li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li><a href="#">Equipo</a>
                                                <ul class="dropdown header-top-hover ptb-10">
                                                    <li><a href="blog.html">Blog</a></li>
                                                    <li><a href="blog-2.html">Blog 2</a></li>
                                                    <li><a href="blog-details.html">Blog Details</a></li>
                                                    <li><a href="blog-left-sidebar.html">Blog Left Sidebar</a></li>
                                                    <li><a href="blog-right-sidebar.html">Blog Right Sidebar</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">Contacto</a>
                                                <div class="mega-menu-area-2 header-top-hover p-30">
                                                    <ul class="single-mega-item">
                                                        <li><h2 class="mega-menu-title mb-15">Page List</h2></li>
                                                        <li><a href="404.html">404 page</a></li>
                                                        <li><a href="about.html">About Us</a></li>
                                                        <li><a href="cart.html">Cart</a></li>
                                                        <li><a href="checkout.html">Checkout</a></li>
                                                        <li><a href="compare.html">Compare</a></li>
                                                        <li><a href="contact.html">Contact</a></li>
                                                        <li><a href="login.html">Login</a></li>
                                                    </ul>
                                                    <ul class="single-mega-item">
                                                        <li><h2 class="mega-menu-title mb-15">Page List</h2></li>
                                                        <li><a href="my-account.html">My Account</a></li>
                                                        <li><a href="shop-full.html">Shop Full Wide</a></li>
                                                        <li><a href="shop-grid-left.html">Shop Grid Left</a></li>
                                                        <li><a href="shop-grid-right.html">Shop Grid Right</a></li>
                                                        <li><a href="product-details.html">Product Details</a></li>
                                                        <li><a href="wishlist.html">Wishlist</a></li>
                                                    </ul>
                                                </div>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu Start -->
            <div class="mobile-menu-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="mobile-menu">
                                <nav id="dropdown">
                                    <ul>
                                        <li><a href="index.php">Home</a></li>
                                        <li><a href="index.html">men</a></li>
                                        <li><a href="shop.html">women</a></li>
                                        <li><a href="shop.html">Features</a>
                                            <ul>
                                                <li><a href="#">Elements 1</a>
                                                    <ul>
                                                        <li><a href="elements-header-1-sticky.html">Header 1 Sticky</a></li>
                                                        <li><a href="elements-header-1-no-sticky.html">Header 1 No Sticky</a></li>
                                                        <li><a href="elements-header-2-sticky.html">Header 2 Sticky</a></li>
                                                        <li><a href="elements-header-2-no-sticky.html">Header 2 No Sticky</a></li>
                                                        <li><a href="elements-footer-1.html">Footer One</a></li>
                                                        <li><a href="elements-footer-2.html">Footer Two</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">Elements 2</a>
                                                    <ul>
                                                        <li><a href="elements-accordion.html">Accordion</a></li>
                                                        <li><a href="elements-alerts.html">Alerts</a></li>
                                                        <li><a href="elements-audio.html">Audio</a></li>
                                                        <li><a href="elements-banner.html">Banner</a></li>
                                                        <li><a href="elements-breadcrumbs.html">Breadcrumbs</a></li>
                                                        <li><a href="elements-buttons.html">Buttons</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">Elements 3</a>
                                                    <ul>
                                                        <li><a href="elements-call-to-action.html">Call To Action</a></li>
                                                        <li><a href="elements-contact-form.html">Dynamic Contact Form</a></li>
                                                        <li><a href="elements-map.html">Map</a></li>
                                                        <li><a href="elements-pagination.html">Pagination</a></li>
                                                        <li><a href="elements-progress-bars.html">Progress Bars</a></li>
                                                        <li><a href="elements-section-title.html">section Title</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">Elements 4</a>
                                                    <ul>
                                                        <li><a href="elements-tab.html">Tab</a></li>
                                                        <li><a href="elements-typography.html">Typography</a></li>
                                                        <li><a href="elements-up-comming-product-1.html">Up Comming Product 1</a></li>
                                                        <li><a href="elements-up-comming-product-2.html">Up Comming Product 2</a></li>
                                                        <li><a href="elements-video.html">Video</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a href="shop.html">blog</a>
                                            <ul>
                                                <li><a href="#">Men’s</a>
                                                    <ul>
                                                        <li><a href="shop-full.html">Blazers</a></li>
                                                        <li><a href="shop-full.html">Jackets</a></li>
                                                        <li><a href="shop-full.html">Collections</a></li>
                                                        <li><a href="shop-full.html">T-Shirts</a></li>
                                                        <li><a href="shop-full.html">jens pant’s</a></li>
                                                        <li><a href="shop-full.html">sports shoes</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">Women’s</a>
                                                    <ul>
                                                        <li><a href="shop-full.html">Cocktail</a></li>
                                                        <li><a href="shop-full.html">Sunglass</a></li>
                                                        <li><a href="shop-full.html">Evening</a></li>
                                                        <li><a href="shop-full.html">Footwear</a></li>
                                                        <li><a href="shop-full.html">Bootees Bags</a></li>
                                                        <li><a href="shop-full.html">Furniture</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">Accessaories</a>
                                                    <ul>
                                                        <li><a href="shop-full.html">Gagets</a></li>
                                                        <li><a href="shop-full.html">Laptop</a></li>
                                                        <li><a href="shop-full.html">Mobile</a></li>
                                                        <li><a href="shop-full.html">Lifestyle</a></li>
                                                        <li><a href="shop-full.html">Gens pant’s</a></li>
                                                        <li><a href="shop-full.html">Sports items</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Pages</a>
                                            <ul>
                                                <li><a href="404.html">404 page</a></li>
                                                <li><a href="about.html">About Us</a></li>
                                                <li><a href="cart.html">Cart</a></li>
                                                <li><a href="checkout.html">Checkout</a></li>
                                                <li><a href="contact.html">Contact</a></li>
                                                <li><a href="shop-full.html">Shop Full Wide</a></li>
                                                <li><a href="shop-grid-left.html">Shop Grid Left</a></li>
                                                <li><a href="shop-grid-right.html">Shop Grid Right</a></li>
                                                <li><a href="product-details.html">Product Details</a></li>
                                                <li><a href="wishlist.html">Wishlist</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="contact.html">Contact Us</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu End -->
        </header>
        <!-- End of header area -->
        <!-- Start page content -->
        <script>
        function Validar(username, password)
        {
            document.getElementById("loader").innerHTML = "<img src= 'images/loader.gif' height = '60' > ";
            $.ajax({
                url: "func/login.php",
                type: "POST",
                data: "username="+username+"&password="+password,
                success: function(resp){
                    $('#resultado').html(resp)
                }
            });
        }
        </script>
        <div id="resultado"></div>
        <div id="message"></div>
        <script>

          if (getUrlVars()["no_session"])
          {
              var body = "<div class='alert alert-warning alert-dismissible show' role='alert'>";
              body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
              body +="<span aria-hidden='true'>&times;</span>";
              body +="</button>";
              body +="<strong>ADVERTENCIA!</strong> El usuario o contraseña son incorrectos.";
              body +="</div>";
              document.getElementById("message").innerHTML = body;
          }

          if (getUrlVars()["db_noconect"])
          {
              var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
              body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
              body +="<span aria-hidden='true'>&times;</span>";
              body +="</button>";
              body +="<strong>ERROR!</strong> La base de datos no esta disponible.";
              body +="</div>";
              document.getElementById("message").innerHTML = body;
          }

          if (getUrlVars()["db_empty"])
          {
              var body = "<div class='alert alert-info alert-dismissible show' role='alert'>";
              body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
              body +="<span aria-hidden='true'>&times;</span>";
              body +="</button>";
              body +="<strong>Incompleto!</strong> Debe ingresar usuario y contraseña.";
              body +="</div>";
              document.getElementById("message").innerHTML = body;
          }

          function getUrlVars() {
            var vars = {};
            var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
            vars[key] = value;
            });
            return vars;
          }
        </script>
        <section id="page-content" class="page-wrapper">
            <!-- Start Wishlist Area -->
            <div class="login-section section-padding">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="registered-customers">
                                <div class="section-title text-uppercase mb-40">
                                    <h4>INICIAR SESSION</h4>
                                </div>
                                <form method="POST"
                                    data-role="validator"
                                    action="javascript:"
                                    data-clear-invalid="2000"
                                    data-on-error-form="invalidForm"
                                    data-on-validate-form="validateForm">
                                    <div class="login-account p-30 box-shadow">
                                        <p>Ingrese usuario y contraseña</p>
                                        <input type="text" placeholder="Username" name="username" id="username">
                                        <input type="password" placeholder="Password" name="password" id="password">
                                        <button class="submit-btn" onclick="Validar(document.getElementById('username').value, document.getElementById('password').value);">Iniciar</button> <span id="loader"></span>

                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="registered-customers">
                                <div class="section-title text-uppercase mb-40">
                                    <h4>Productos agregados reciente</h4>
                                </div>
                                <form method="POST"
                                    data-role="validator"
                                    action="javascript:"
                                    data-clear-invalid="2000"
                                    data-on-error-form="invalidForm"
                                    data-on-validate-form="validateForm">
                                    <div class="login-account p-30 box-shadow">
                                      <ul >
                                        <?php
                                            echo ReturnNewsProductsList();    
                                        ?>
                                      </ul>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- End Of Wishlist Area -->

        </section>
        <!-- End page content -->
        <!-- Start footer area -->
        <footer id="footer" class="footer-area">
            <div class="footer-top-area gray-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="footer-widget">
                                <div class="footer-widget-img pb-30">
                                    <a href="#">
                                        <img src="images/logo/logo-2.png" alt="">
                                    </a>
                                </div>
                                <ul class="toggle-footer text-white">
                                    <li class="mb-30 pl-45">
                                        <i class="zmdi zmdi-pin"></i>
                                        <p>House No 08, Road No 08, <br>
                                        Din Bari, Dhaka, Bangladesh</p>
                                    </li>
                                    <li class="mb-30 pl-45">
                                        <i class="zmdi zmdi-email"></i>
                                        <p>Username@gmail.com <br>
                                        Damo@gmail.com</p>
                                    </li>
                                    <li class="pl-45">
                                        <i class="zmdi zmdi-phone"></i>
                                        <p>+660 256 24857<br>
                                        +660 256 24857</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="text-white footer-information">
                                <h4 class="pb-40 m-0 text-uppercase">information</h4>
                                <ul class="footer-menu">
                                    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i>Hot Sale</a></li>
                                    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i>best Seller</a></li>
                                    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i>Suppliers</a></li>
                                    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i>Our Store</a></li>
                                    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i>Deal of The Day</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="text-white footer-account">
                                <h4 class="pb-40 m-0 text-uppercase">MY ACCOUNT</h4>
                                <ul class="footer-menu">
                                    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i>My Account</a></li>
                                    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i>Personal Information</a></li>
                                    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i>Discount</a></li>
                                    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i>Orders History</a></li>
                                    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i>Payment</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="text-white footer-about-us">
                                <h4 class="pb-40 m-0 text-uppercase">about us</h4>
                                <p>Lorem ipsum dolor sit amet, consecteir our adipisicing elit, sed do eiusmod tempor the incididunt ut labore et dolore magnaa liqua. Ut enim minimn.</p>
                                <ul class="footer-social-icon">
                                    <li><a href="#"><i class="zmdi zmdi-facebook"></i></a></li>
                                    <li><a href="#"><i class="zmdi zmdi-instagram"></i></a></li>
                                    <li><a href="#"><i class="zmdi zmdi-rss"></i></a></li>
                                    <li><a href="#"><i class="zmdi zmdi-twitter"></i></a></li>
                                    <li><a href="#"><i class="zmdi zmdi-pinterest"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom black-bg ptb-15">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="copyright text-white">
                                <p>Copyright &copy; 2016 <a href="#">Freaktheme.</a> All Right Reserved.</p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="footer-img">
                                <img src="images/payment.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End footer area -->
    </div>
    <!-- Body main wrapper end -->


    <!-- Placed js at the end of the document so the pages load faster -->

    <!-- jquery latest version -->
    <script src="js/vendor/jquery-3.1.1.min.js"></script>
    <!-- Bootstrap framework js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- All js plugins included in this file. -->
    <script src="js/plugins.js"></script>
    <!-- Main js file that contents all jQuery plugins activation. -->
    <script src="js/main.js"></script>

</body>

</html>
