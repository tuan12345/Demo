<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from auto-dealer-dot-my-experiments-163718.appspot.com/car-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 20 Apr 2017 02:57:07 GMT -->
    <head>
        <title>Auto Car Dealer - Car Dealer HTML Template</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">

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

<!-- Option Panel -->
<div class="option-panel option-panel-collased">
    <h2>Change Color</h2>
    <div class="color-plate default-plate" data-color="default"></div>
    <div class="color-plate blue-plate" data-color="blue"></div>
    <div class="color-plate yellow-plate" data-color="yellow"></div>
    <div class="color-plate blue-light-plate" data-color="blue-light"></div>
    <div class="color-plate green-light-plate" data-color="green-light"></div>
    <div class="color-plate green-plate" data-color="green"></div>
    <div class="color-plate yellow-light-plate" data-color="yellow-light"></div>
    <div class="color-plate green-light-2-plate" data-color="green-light-2"></div>
    <div class="color-plate olive-plate" data-color="olive"></div>
    <div class="color-plate purple-plate" data-color="purple"></div>
    <div class="color-plate midnight-blue-plate" data-color="midnight-blue"></div>
    <div class="color-plate brown-plate" data-color="brown"></div>
    <div class="setting-button">
        <i class="fa fa-gear"></i>
    </div>
</div>
<!-- /Option Panel -->



<!-- Sub banner start -->
<div class="sub-banner">
    <div class="overlay">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-area">
                        <h2>Chi tiet san pham</h2>
                        <p>Whether you're looking to sell or let your home or want to buy or rent a home, we really are the people for you to come to.</p>
                        <a href="<%=request.getContextPath()%>/FrontEnd/Home.htm" class="btn btn-details btn-index">Trang chu</a>
                        <a href="<%=request.getContextPath()%>/FrontEnd/getAllProduct.htm" class="btn btn-default">San pham</a>
                        <a href="<%=request.getContextPath()%>/FrontEnd/addCart.htm?productID=${product.productID}" class="overlap-btn"><i class="glyphicon glyphicon-shopping-cart"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Sub banner end -->

<!-- Car details body start-->
<div class="car-details-body">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <!-- Option bar start-->
                <div class="option-bar  details-option-bar clearfix">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <div class="section-heading">
                                <div class="media">
                                    <div class="media-left">
                                        <i class="flaticon-sedan-car-front"></i>
                                    </div>
                                    <div class="media-body hidden-xs">
                                        <h4>${product.productName}</h4>
                                        <div class="border"></div>
                                        <p>${product.numberView} views</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <div class="header-price">
                                <h3>$${product.priceExport}</h3>
                                <p>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Option bar end-->
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <div class="car-details sidebar-widget">
                    <!-- Car detail slider start-->
                    <div class="car-detail-slider simple-slider">
                        <div id="carousel-custom" class="carousel slide" data-ride="carousel">
                            <div class="carousel-outer">
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    <div class='item active'>
                                        <img src="../images/${iml.url_before}" class="thumb-preview" alt='${product.productName}' />
                                    </div>
                                    <div class='item'>
                                        <img src="../images/${iml.url_behind}" class="thumb-preview" alt='${product.productName}' />
                                    </div>
                                    <div class='item'>
                                        <img src='../images/${iml.url_left}' class="thumb-preview" alt='${product.productName}' />
                                    </div>
                                    <div class='item'>
                                        <img src='../images/${iml.url_right}' class="thumb-preview" alt='${product.productName}'/>
                                    </div>
                                    
                                </div>
                                <!-- Controls -->
                                <a class="left carousel-control" href="#carousel-custom" role="button" data-slide="prev">
                                    <span class="slider-mover-left no-bg" aria-hidden="true">
                                        <img src="../jsp/FrontEnd/img/png/chevron-left.png" alt="chevron-left">
                                    </span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#carousel-custom" role="button" data-slide="next">
                                    <span class="slider-mover-right no-bg" aria-hidden="true">
                                        <img src="../jsp/FrontEnd/img/png/chevron-right.png" alt="chevron-right">
                                    </span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                            <!-- Indicators -->
                            <ol class="carousel-indicators thumbs visible-lg visible-md">
                                <li data-target="#carousel-custom" data-slide-to="0" class=""><img src="../images/${iml.url_before}" alt="${product.productName}"></li>
                                <li data-target="#carousel-custom" data-slide-to="1" class=""><img src="../images/${iml.url_behind}" alt="${product.productName}"></li>
                                <li data-target="#carousel-custom" data-slide-to="2" class=""><img src="../images/${iml.url_left}" alt="${product.productName}"></li>
                                <li data-target="#carousel-custom" data-slide-to="3" class=""><img src="../images/${iml.url_right}" alt="${product.productName}"></li>
                            </ol>
                        </div>
                    </div>
                    <!-- Car detail slider end-->
                    <br/>
                    <!-- Car Specifications start -->
                    <div class="car-specifications clearfix visible-xs sidebar-widget">
                        <!-- Option bar -->
                        <div class="option-bar clearfix">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="section-heading">
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="flaticon-sedan-car-front"></i>
                                            </div>
                                            <div class="media-body">
                                                <h4>Thông Tin Chi Tiết</h4>
                                                <div class="border"></div>
                                                <p>Check the car specifications</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Reviews Box -->
                        <div class="reviews-box clearfix">
                            <ul class="reviews-star-list">
                                <li>
                                    <i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star-o"></i>
                                </li>
                            </ul>
                            <div class="reviews">${product.numberView} reviews</div>
                            <a href="#" class="add-review">
                                <i class="fa fa-plus-circle"></i>Add Review
                            </a>
                        </div>
                        <p>Voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui voluptatem sequi nesciunt.<br><br>
                            Neque porro quisqua. Sed ut perspiciatis unde omnis ste natus error sit voluptatem.</p>

                        <a href="#" class="wishlist-btn">
                            <span class="wishlist-btn-l">
                                <i class="fa fa-plus"></i>
                            </span>
                            <span class="wishlist-btn-r">Add to favorite list</span>
                            <div class="clear"></div>
                        </a>
                        <a href="#" class="book-btn">
                            <span class="book-btn-l"><i class="fa fa-check"></i></span>
                            <span class="book-btn-r">Add to favorite list</span>
                            <div class="clear"></div>
                        </a>
                    </div>
                    <!-- Car details end -->
                    <!-- Panel box start -->
                    <div class="panel-box">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1default" data-toggle="tab" aria-expanded="true">Gioi thieu chung</a></li>
                            <li class=""><a href="#tab2default" data-toggle="tab" aria-expanded="false">Tinh nang bo sung</a></li>
                            <li class=""><a href="#tab3default" data-toggle="tab" aria-expanded="false">Thong so ky thuat</a></li>
                        </ul>
                        <div class="panel with-nav-tabs panel-default">
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="tab-pane fade active in" id="tab1default">
                                        <p>${product.contentDetail}</p>
                                    </div>
                                    <div class="tab-pane fade features" id="tab2default">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 amenities-box">
                                                <ul class="extra-feature">
                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        Security System
                                                    </li>

                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        Air Conditioning
                                                    </li>
                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        Alloy Wheels
                                                    </li>

                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        Anti-Lock Brakes (ABS)
                                                    </li>
                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        Anti-Starter
                                                    </li>
                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        Dual Airbag
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 amenities-box">
                                                <ul class="extra-feature">
                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        Intermittent Wipers
                                                    </li>
                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        Keyless Entry
                                                    </li>
                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        power Mirrors
                                                    </li>

                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        Power Seat
                                                    </li>

                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        Power Steering
                                                    </li>

                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        CD Player
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 amenities-box">
                                                <ul class="extra-feature">
                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        Driver Side Airbag
                                                    </li>
                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        Power Windows
                                                    </li>
                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        Remote Start
                                                    </li>
                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        CD/DVD Autochanger
                                                    </li>
                                                    <li>
                                                        <i class="fa fa-check"></i>
                                                        Anti-theft Protection
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade technical" id="tab3default">
                                        <p>Vivamus sit amet leo at arcu placerat hendrerit. Suspendisse scelerisque, metus quis iaculis placerat, elit neque lacinia tellus, in mollis nunc sem quis ante. Mauris tincidunt libero sit amet egestas lobortis. Etiam id vulputate elit. Pellentesque commodo, nulla ac mollis interdum,
                                            eros nibh porttitor ex, fringilla suscipit urna velit sed elit. Vivamus tincidunt accumsan odio, porttitor congue felis.
                                        </p>
                                        <p>Cras lacinia diam neque, non iaculis ex elementum ac. Phasellus a varius libero. Nulla ut vestibulum quam. Curabitur posuere, felis sed pulvinar elementum, metus eros eleifend urna, eu volutpat lectus sem in felis. In mattis urna justo, nec cursus mauris consectetur at. Vestibulum nec fringilla erat. Pellentesque cursus fermentum nunc vitae mattis. Fusce leo diamfelis sed pulvinar elementum, metus eros eleifend urna, eu volutpat lectus sem in felis. In mattis urna justo, nec cursus mauris consectetur at.
                                            Vestibulum nec fringilla erat. Pellentesque cursus fermentum nunc vitae mattis.</p>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Panel box end -->
                    <!-- Amenities start-->
                    <div class="amenities">
                        
                        
                    </div>
                    <!-- About end-->
                </div>
                <!-- Content div end-->
                <!-- Comments thread start-->
                <div class="comments-thread sidebar-widget clearfix">
                    <h2 class="title">
                        <span>
                            Comments Section
                        </span>
                    </h2>
                    <ul>
                        <li>
                            <div class="comment">
                                <div class="avatar">
                                    <img src="../images/profile/profile-01.jpg" alt="profile-01" />
                                </div>
                                <div class="comment-info">
                                    <h4>Silva Naymar Doe</h4>
                                    <span>
                                        <i>October</i> 20, 2016  at  1:09 <i>pm</i>
                                    </span>
                                </div>
                                <p>Praesent rhoncus nunc vitae metus condi tum viverra. Fusce sed estorci condime felis. Ndisse ullamcorper vulputate sagittis. Quisque ullamcorper euismod.</p>
                                <a href="#" title="">Reply</a>
                            </div>
                            <!-- Comment -->
                            <div class="comment">
                                <div class="avatar">
                                    <img src="../images/profile/profile-02.jpg" alt="profile-02" />
                                </div>
                                <div class="comment-info">
                                    <h4>Silva Naymar Doe</h4>
                                    <span>
                                        <i>October</i> 20, 2016  at  1:09 <i>pm</i>
                                    </span>
                                </div>
                                <p>Praesent rhoncus nunc vitae metus condi tum viverra. Fusce sed estorci condime felis. Ndisse ullamcorper vulputate sagittis. Quisque ullamcorper euismod.</p>
                                <a href="#" title="">Reply</a>
                            </div>
                            <!-- Comment -->
                            <ul>
                                <li>
                                    <div class="comment">
                                        <div class="avatar">
                                            <img src="../images/profile/profile-03.jpg" alt="profile-03">
                                        </div>
                                        <div class="comment-info">
                                            <h4>Alina Maikel</h4>
                                            <span>
                                                <i>januaryr</i> 4, 2016  at  2:05 <i>pm</i>
                                            </span>
                                        </div>
                                        <p>Praesent rhoncus nunc vitae metus condi tum viverra. Fusce sed estorci condime felis. Ndisse ullamcorper vulputate sagittis. Quisque ullamcorper euismod.</p>
                                        <a href="#" title="">Reply</a>
                                    </div><!-- Comment -->
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>
                <!-- Comments thread end-->

                <!-- Comments form start -->
                <div class="contact-form sidebar-widget">
                    <h1 class="title">Contact with us</h1>
                    <form action="https://auto-dealer-dot-my-experiments-163718.appspot.com/index.html">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group fullname">
                                    <input type="text" name="fullname" class="input-text" id="full-name" placeholder="Full Name">
                                </div>
                                <div class="form-group enter-email">
                                    <input type="email" name="email" class="input-text" id="enter-email" placeholder="Enter email">
                                </div>
                                <div class="form-group phone-number">
                                    <input type="email" name="email" class="input-text" id="phone-number" placeholder="Phone Number">
                                </div>
                                <div class="form-group Btn">
                                    <button type="submit" class="btn btn-submit">Send Message</button>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group Btn">
                                    <textarea class="input-text" name="message" placeholder="Write Message"></textarea>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- Comments form end -->
            </div>
            <div class="col-ld-4 col-md-4 col-sm-12 col-xs-12">
                <div class="details-sidebar pad-div">
                    <!-- Car details sidebar start -->
                    <div class="sidebar-widget car-details-sidebar">
                        <div class="section-heading option-bar">
                            <div class="media">
                                <div class="media-left">
                                    <i class="flaticon-sedan-car-front"></i>
                                </div>
                                <div class="media-body">
                                    <h4>Chi tiet xe</h4>
                                    <div class="border"></div>
                                    <p>Check the car specifications</p>
                                </div>
                            </div>
                        </div>

                        <ul>
                            <li>
                                <span>Kiểu Xe</span>${product.carType}
                            </li>
                            <li>
                                <span>Số Ghế</span>${product.numberOfSeat}
                            </li>
                            <li>
                                <span>Năm Sản Xuất</span>${product.yearOfManufacture}
                            </li>
                            <li>
                                <span>Dung Tích Bình Xăng</span>${product.petrolTankCapacity}
                            </li>
                            <li>
                                <span>TG Đạt 100km/h </span>${product.timeSpeed100}s
                            </li>
                            <li>
                                <span>Giảm Giá</span>${product.discount}%
                            </li>
                            <li>
                                <span>Ngày Bắt Đầu</span>${product.fromDate}
                            </li>
                            <li>
                                <span>Ngày Kết Thúc</span>${product.toDate}
                            </li>
                        </ul>
                    </div>
                    <!-- Car details end -->

                    <!-- Help center start -->
                    <div class="helping-Center sidebar-widget grae-color">
                        <h2 class="title">Helping Center</h2>
                        <ul class="contact-link">
                            <li>
                                <i class="fa fa-map-marker"></i>
                                Aenean vulputate porttitor
                            </li>
                            <li>
                                <i class="fa fa-phone"></i>
                                <a href="tel:+55-417-634-7071">
                                    +55 417 634 7071
                                </a>
                            </li>
                            <li>
                                <i class="fa fa-envelope-o"></i>
                                <a href="mailto:sales@autocardealer.com">
                                    sales@autocardealer.com
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- Help center end -->

                    <!-- Social list start -->
                    <div class="social-box clearfix">
                        <h2 class="title">Social Media</h2>
                        <ul class="social-list-2">
                            <li>
                                <a href="#" class="facebook-bg">
                                    <i class="fa fa-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="twitter-bg">
                                    <i class="fa fa-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="google-bg">
                                    <i class="fa fa-google"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="linkedin-bg">
                                    <i class="fa fa-linkedin"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="pinterest-bg">
                                    <i class="fa fa-pinterest"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- Social list end -->

                    <!-- Recent car start -->
                    <div class="recent-car recent-cars sidebar-widget grae-color">
                        <!-- Title-->
                        <h2 class="title">Recent Car</h2>
                        <div class="media">
                            <div class="media-left">
                                <a href="#">
                                    <img class="media-object" src="../jsp/FrontEnd/img/recent/recent-1.jpg" alt="recent-1">
                                </a>
                            </div>
                            <div class="media-body">
                                <h3>
                                    <a href="car-details.html">Porsche Cayen Last</a>
                                </h3>
                                <span>October 18, 2016</span>
                                <p>$36.000</p>
                            </div>
                        </div>
                    </div>
                    <!-- Recent-car start -->

                    <!-- Google map location start -->
                    <div class="map_sidebar">
                        <h2 class="title">Location</h2>
                        <div class="section">
                            <div class="map">
                                <div id="map" class="contact-map"></div>
                            </div>
                        </div>
                    </div>
                    <!-- Google map location end -->

                    <!-- Private message to dealer start -->
                    <div class="private-message-to-dealer sidebar-widget grae-color">
                        <h2 class="title">Private Message To Dealer</h2>
                        <div class=" contact-form">
                            <form action="https://auto-dealer-dot-my-experiments-163718.appspot.com/index.html" >
                                <div class="row">
                                    <div class="form-group  col-xs-12 col-sm-12 col-md-12">
                                        <label for="name">Name</label>
                                        <input type="text" name="fullname" class="input-text" id="name" placeholder="Enter Name">
                                    </div>
                                    <div class="form-group  col-xs-12 col-sm-12 col-md-12">
                                        <label for="email">E-mail</label>
                                        <input type="email" name="email" class="input-text" id="email" placeholder="Enter email">
                                    </div>
                                    <div class="form-group  col-xs-12 col-sm-12 col-md-12">
                                        <label for="message">Message</label>
                                        <textarea class="input-text" name="message" id="message" placeholder="Write Message"></textarea>
                                    </div>
                                    <div class="form-group  col-xs-12 col-sm-12 col-md-12">
                                        <button type="submit" class="btn btn-submit btn-block">Send Message</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Private message to dealer end -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Car details body end-->

<!-- Footer start-->
    <jsp:include page="Footer.jsp"></jsp:include>
<!-- Footer end-->

<!-- Copy right start-->
        <div class="copy-right">
            <div class="container">
                <p>Copyright 2016. All rights reserved by: Auto Car Dealer</p>
            </div>
        </div>
        <!-- Copy right end-->

        <script type="text/javascript" src="../jsp/FrontEnd/js/jquery-2.2.0.min.js"></script>
        <script type="text/javascript" src="../jsp/FrontEnd/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../jsp/FrontEnd/js/bootstrap-slider.js"></script>
        <script type="text/javascript" src="../jsp/FrontEnd/js/wow.min.js"></script>
        <script type="text/javascript" src="../jsp/FrontEnd/js/jquery.scrollUp.js"></script>
        <script type="text/javascript" src="../jsp/FrontEnd/js/bootstrap-select.min.js"></script>

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script type="text/javascript" src="../jsp/FrontEnd/js/ie10-viewport-bug-workaround.js"></script>

        <!-- Custom javascript -->
        <script type="text/javascript" src="../jsp/FrontEnd/js/app.js"></script>
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','../www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-89110077-2', 'auto');
    ga('send', 'pageview');

</script>

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0N5pbJN10Y1oYFRd0MJ_v2g8W2QT74JE"></script>
<script>
    function LoadMap(propertes) {
        var defaultLat = 40.7110411;
        var defaultLng = -74.0110326;
        var mapOptions = {
            center: new google.maps.LatLng(defaultLat, defaultLng),
            zoom: 15,
            scrollwheel: false,
            styles: [
                {
                    featureType: "administrative",
                    elementType: "labels",
                    stylers: [
                        {visibility: "off"}
                    ]
                },
                {
                    featureType: "water",
                    elementType: "labels",
                    stylers: [
                        {visibility: "off"}
                    ]
                },
                {
                    featureType: 'poi.business',
                    stylers: [{visibility: 'off'}]
                },
                {
                    featureType: 'transit',
                    elementType: 'labels.icon',
                    stylers: [{visibility: 'off'}]
                },
            ]
        };
        var map = new google.maps.Map(document.getElementById("map"), mapOptions);
        var infoWindow = new google.maps.InfoWindow();
        var myLatlng = new google.maps.LatLng(40.7110411, -74.0110326);

        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map
        });
        (function (marker) {
            google.maps.event.addListener(marker, "click", function (e) {
                infoWindow.setContent("" +
                        "<div class='map-properties contact-map-content'>" +
                        "<div class='map-content'>" +
                        "<p class='address'>20-21 Kathal St. Tampa City, FL</p>" +
                        "<ul class='map-properties-list'> " +
                        "<li><i class='fa fa-phone'></i>  +0477 8556 552</li> " +
                        "<li><i class='fa fa-envelope'></i>  sales@realhouse.com</li> " +
                        "<li><a href='index.html'><i class='fa fa-globe'></i>  http://www.example.com</li></a> " +
                        "</ul>" +
                        "</div>" +
                        "</div>");
                infoWindow.open(map, marker);
            });
        })(marker);
    }
    LoadMap();
</script>
<a id="page_scroller" href="#top" style="position: fixed; z-index: 2147483647;"><i class="fa fa-chevron-up"></i></a>
</body>

<!-- Mirrored from auto-dealer-dot-my-experiments-163718.appspot.com/car-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 20 Apr 2017 02:57:16 GMT -->
</html>