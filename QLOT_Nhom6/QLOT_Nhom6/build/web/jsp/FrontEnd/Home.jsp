
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Auto Car Dealer - Car Dealer HTML Template</title>

        <!-- External CSS libraries -->
        <link rel="stylesheet" type="text/css" href="../jsp/FrontEnd/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../jsp/FrontEnd/css/animate.min.css">
        <link rel="stylesheet" type="text/css" href="../jsp/FrontEnd/css/slider.css">
        <link rel="stylesheet" type="text/css" href="../jsp/FrontEnd/fonts/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../jsp/FrontEnd/fonts/linearicons/style.css">
        <link rel="stylesheet" type="text/css" href="../jsp/FrontEnd/fonts/flaticon/font/flaticon.css">

        <link href="../jsp/FrontEnd/css/bootstrap-select.min.css" type="text/css" rel="stylesheet">

        <!-- Custom stylesheet -->
        <link rel="stylesheet" type="text/css" href="../jsp/FrontEnd/css/style.css">
        <link rel="stylesheet" type="text/css" id="style_sheet" href="../jsp/FrontEnd/css/colors/default.css">

        <!-- Favicon icon -->
        <link rel="shortcut icon" href="../jsp/FrontEnd/img/favicon.ico" type="image/x-icon" >

        <!-- Google fonts -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800%7CPlayfair+Display:400,700%7CRoboto:100,300,400,400i,500,700">

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="../jsp/FrontEnd/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script type="text/javascript" src="js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script type="text/javascript" src="../jsp/FrontEnd/js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script type="text/javascript" src="js/html5shiv.min.js"></script>
        <script type="text/javascript" src="js/respond.min.js"></script>
        <![endif]-->
        
    </head>
    <body>
        
        <header class="main-header">
            <jsp:include page="Header.jsp"></jsp:include>
        </header>
        <!-- Header end -->

        <!-- Banner start-->
        <div class="banner">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item item-1 active">
                        <div class="container">
                            <!-- Banner Slider Inner 1 -->
                            <div class="banner-slider-inner">
                                <!-- Title-->
                                <h1><span>Welcome to</span> Auto Car Dealer</h1>
                                <!-- Paragraph -->
                                <p>Trusted and Secure place for selling and buying cars!</p>
                                <!-- Btn -->
                                <a href="#" class="btn btn-view">View all car</a>
                            </div>
                        </div>
                    </div>
                    <div class="item item-2">
                        <div class="container">
                            <!-- Banner Slider Inner 1 -->
                            <div class="banner-slider-inner">
                                <!-- Title-->
                                <h1><span>Best place to </span> find cars!</h1>
                                <!-- Paragraph -->
                                <p>Trusted and Secure place for selling and buying cars!</p>
                                <!-- Btn -->
                                <a href="#" class="btn btn-view">View all car</a>
                            </div>
                        </div>
                    </div>
                    <div class="item item-3">
                        <div class="container">
                            <!-- Banner Slider Inner 1 -->
                            <div class="banner-slider-inner">
                                <!-- Title-->
                                <h1><span>Best place for </span>sell car!</h1>
                                <!-- Paragraph -->
                                <p>Trusted and Secure place for selling and buying cars!</p>
                                <!-- Btn -->
                                <a href="#" class="btn btn-view">View all car</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="slider-mover-left" aria-hidden="true">
                        <img src="../jsp/FrontEnd/img/png/chevron-left.png" alt="chevron-left">
                    </span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="slider-mover-right" aria-hidden="true">
                        <img src="../jsp/FrontEnd/img/png/chevron-right.png" alt="chevron-right">
                    </span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <!-- Banner end-->

        <!-- Featured car start-->
        <div class="featured-car content-area clearfix">
            <div class="container">
                <div class="main-title">
                    <h1>Featured Car</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ac tortor at tellus feugiat congue quis ut nunc. Semper ac dolor vitae accumsan. interdum hendrerit lacinia.</p>
                </div>

                <div class="row">
                    <c:forEach var="product" items="${listViewProduct}">
                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                            <!-- Car box start-->
                            <div class="thumbnail car-box clearfix wow fadeInUp">
                                <img src="../images/${product.image}" alt="${product.productName}">
                                <!-- detail -->
                                <div class="caption detail">
                                    <!-- Header -->
                                    <header class="clearfix">
                                        <div class="pull-left">
                                            <h5 class="title">
                                                <a href="#">${product.productName}</a>
                                            </h5>
                                            <ul class="custom-list">
                                                <li>
                                                    <a href="#">New Car</a> /
                                                </li>
                                                <li>
                                                    <a href="#">Automatic</a> /
                                                </li>
                                                <li>
                                                    <a href="#">Sports</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- Price -->
                                        <div class="price">
                                            <span>${product.priceExport}</span>
                                        </div>
                                    </header>
                                    <!-- Paragraph -->
                                    <p>
                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer
                                    </p>
                                    <!-- Facilities List -->
                                    <div class="facilities-area">
                                        <ul class="facilities-list clearfix">
                                            <li>
                                                <i class="flaticon-gasoline-pump"></i>
                                                <span>Gasoline</span>
                                            </li>
                                            <li>
                                                <i class="flaticon-automatic-flash-symbol"></i>
                                                <span>Automatic</span>
                                            </li>
                                            <li>
                                                <i class="flaticon-road-with-broken-line"></i>
                                                <span>12000</span>
                                            </li>
                                            <li>
                                                <i class="flaticon-racing-flag"></i>
                                                <span>Sports Car </span>
                                            </li>
                                            <li>
                                                <i class="flaticon-transport"></i>
                                                <span>5 Gears</span>
                                            </li>
                                            <li>
                                                <i class="flaticon-time"></i>
                                                <span>${product.yearOfManufacture}</span>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="carbox-overlap-wrapper">
                                        <h2>${product.productName}</h2>
                                        <h4>${product.priceExport}</h4>

                                        <div class="overlap-btns-area">
                                            <a href="productdetails.htm?IdProduct=${product.productID}" class="overlap-btn"><i class="fa fa-link"></i></a>
                                            <a href="<%=request.getContextPath()%>/FrontEnd/addCart.htm?productID=${product.productID}" class="overlap-btn"><i class="glyphicon glyphicon-shopping-cart"></i></a>
                                            <!--<a href="#" class="overlap-btn" data-toggle="modal" data-target="#carGallary"><i class="fa fa-image"></i></a>-->
                                        </div>
                                    </div>
                                </div>

                                <div class="featured-ribon">
                                    <h2>Featured Car</h2>
                                </div>

                            </div>
                            <!-- Car box end-->
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Featured car end-->

        <!-- Latest offers-2 two start-->
        <div class="content-area latest-offers-2">
            <div class="container">
                <!-- Main title -->
                <div class="main-title">
                    <h1>Latest Offers</h1>
                    <div class="border">
                        <div class="border-inner"></div>
                    </div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ac tortor at tellus feugiat congue quis ut nunc. Semper ac dolor vitae accumsan. interdum hendrerit lacinia.</p>
                </div>
                <div class="row wow animated">
                    <div class="col-lg-12 col-md-6 col-sm-12">
                        <div class="row">
                            <c:forEach var="product" items="${listNewProduct}">
                                <div class="col-sm-3 col-pad wow fadeInRight">
                                    <div class="category">
                                        <div class="category_bg_box" style="background-image: url(../images/${product.image});">
                                            <div class="category-overlay">
                                                <span class="category-content">
                                                    <span class="category-title">${product.productName}</span><br>
                                                    <span class="category-subtitle">${product.priceExport}</span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="category-view-more">
                                            <a href="productdetails.htm?IdProduct=${product.productID}" class="overlap-btn"><i class="fa fa-link"></i></a>
                                            <a href="<%=request.getContextPath()%>/FrontEnd/addCart.htm?productID=${product.productID}" class="overlap-btn"><i class="glyphicon glyphicon-shopping-cart"></i></a>
                                            <!--<a href="#" class="overlap-btn" data-toggle="modal" data-target="#carGallary"><i class="fa fa-image"></i></a>-->
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Latest offers-2 end-->

        <!-- Partners block start -->
        <div class="partners-block">
            <div class="container">
                <h3>Brands $ Partners</h3>
                <div class="container">
                    <div class="col-md-12">
                        <div class="carousel our-partners slide" id="ourPartners">
                            <div class="carousel-inner">
                                <div class="item active">
                                    <div class="col-xs-12 col-sm-6 col-md-3">
                                        <a href="#">
                                            <img src="../jsp/FrontEnd/img/brand/brand-1.png" alt="brand-1">
                                        </a>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col-xs-12 col-sm-6 col-md-3">
                                        <a href="#">
                                            <img src="../jsp/FrontEnd/img/brand/brand-2.png" alt="brand-2">
                                        </a>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col-xs-12 col-sm-6 col-md-3">
                                        <a href="#">
                                            <img src="../jsp/FrontEnd/img/brand/brand-3.png" alt="brand-3">
                                        </a>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col-xs-12 col-sm-6 col-md-3">
                                        <a href="#">
                                            <img src="../jsp/FrontEnd/img/brand/brand-4.png" alt="brand-4">
                                        </a>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col-xs-12 col-sm-6 col-md-3">
                                        <a href="#">
                                            <img src="../jsp/FrontEnd/img/brand/brand-5.png" alt="brand-5">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#ourPartners" data-slide="prev"><i class="fa fa-chevron-left icon-prev"></i></a>
                            <a class="right carousel-control" href="#ourPartners" data-slide="next"><i class="fa fa-chevron-right icon-next"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Partners block end -->

        <!-- Footer start-->
            <jsp:include page="Footer.jsp"></jsp:include>
        <!-- Footer end-->


        <!-- jQuery Bootstrap JavaScript -->
        <script type="text/javascript" src="../jsp/FrontEnd/js/jquery-2.2.0.min.js"></script>
        <script type="text/javascript" src="../jsp/FrontEnd/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="..jsp/FrontEnd/js/bootstrap-slider.js"></script>
        <script type="text/javascript" src="../jsp/FrontEnd/js/wow.min.js"></script>
        <script type="text/javascript" src="../jsp/FrontEnd/js/jquery.scrollUp.js"></script>
        <script type="text/javascript" src="../jsp/FrontEnd/js/bootstrap-select.min.js"></script>

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script type="text/javascript" src="../jsp/FrontEnd/js/ie10-viewport-bug-workaround.js"></script>

        <!-- Custom javascript -->
        <script type="text/javascript" src="../jsp/FrontEnd/js/app.js"></script>
        <a id="page_scroller" href="#top" style="position: fixed; z-index: 2147483647;"><i class="fa fa-chevron-up"></i></a>
    </body>
</html>
