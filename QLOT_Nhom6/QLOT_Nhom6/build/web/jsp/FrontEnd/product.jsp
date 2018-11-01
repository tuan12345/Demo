<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from auto-dealer-dot-my-experiments-163718.appspot.com/car-grid-2.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 20 Apr 2017 02:57:06 GMT -->
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

        <!-- Header start -->
        <header class="main-header">
            <jsp:include page="Header.jsp"></jsp:include>
            </header>
            <!-- Header end -->

            <!-- Sub banner start -->
            <div class="sub-banner">
                <div class="overlay">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="breadcrumb-area">
                                    <h2>Car Grid</h2>
                                    <p>Whether you're looking to sell or let your home or want to buy or rent a home, we really are the people for you to come to.</p>
                                    <a href="#" class="btn btn-details btn-index">Home</a>
                                    <a href="#" class="btn btn-default">Car Grid</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sub banner end -->

            <!-- Car grid start-->
            <div class="car-grid content-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-xs-12">
                            <!-- Sidebar start-->
                        <jsp:include page="SideBar.jsp"></jsp:include>
                            <!-- Sidebar End-->
                        </div>
                        <div class="col-lg-8 col-md-8 col-xs-12">
                            <!-- Block heading Start-->
                            <div class="block-heading">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-5 cod-pad">
                                        <h4>
                                            <span class="heading-icon">
                                                <i class="fa fa-caret-right icon-design"></i>
                                                <i class="fa fa-th-large"></i>
                                            </span>
                                            Car Grid
                                        </h4>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-7 cod-pad">
                                        <div class="sorting-options">
                                            <select class="sorting">
                                                <option>Price: High to low</option>
                                                <option>Price: Low to high</option>
                                                <option>Sells: High to low</option>
                                                <option>Sells: Low to high</option>
                                            </select>
                                            <a href="#" class="change-view-btn"><i class="fa fa-th-list"></i></a>
                                            <a href="#" class="change-view-btn active-view-btn"><i class="fa fa-th-large"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Block heading end -->

                            <!-- Car grid start -->
                            <div class="row">
                            <c:forEach var="product" items="${listAllProduct}">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <!-- Car box start-->
                                    <div class="thumbnail car-box clearfix wow fadeInUp delay-03s">
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
                                                    <span>$${product.priceExport}</span>
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
                                                <h4>$${product.priceExport}</h4>

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
                        <!-- Car grid end-->
                        <!-- Page navigation start-->
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">«</span>
                                    </a>
                                </li>
                                <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">»</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <!-- Page navigation end-->
                    </div>
                </div>
            </div>
        </div>
        <!-- Car grid end-->

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

        <!-- Car Viedo Modal -->
        <div class="modal fade" id="carVideo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Vencer Sarthe Supercar</h4>
                    </div>
                    <div class="modal-body">
                        <iframe src="https://www.youtube.com/embed/m5_AKjDdqaU"></iframe>
                    </div>
                </div>
            </div>
        </div>

        <!-- Car Gallary Modal -->
        <div class="modal fade" id="carGallary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel1">Vencer Sarthe Supercar</h4>
                    </div>
                    <div class="modal-body">
                        <div id="carGallaryCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <img src="../js/FrontEnd/img/grid/vencer-sarthe-supercar.jpg" alt="Vencer-Sarthe-Supercar">
                                </div>

                                <div class="item">
                                    <img src="../js/FrontEnd/img/grid/bmw_emw_m3_diski_serie.jpg" alt="Vencer-Sarthe-Supercar">
                                </div>

                                <div class="item">
                                    <img src="../js/FrontEnd/img/grid/gridmclaren_650S.jpg" alt="Vencer-Sarthe-Supercar">
                                </div>

                                <div class="item">
                                    <img src="../js/FrontEnd/img/grid/vencer-sarthe-supercar.jpg" alt="Vencer-Sarthe-Supercar">
                                </div>
                            </div>
                            <!-- Left and right controls -->

                            <a class="left carousel-control" href="#carGallaryCarousel" role="button" data-slide="prev">
                                <span class="slider-mover-left" aria-hidden="true">
                                    <img src="../js/FrontEnd/img/png/chevron-left.png" alt="left-chevron">
                                </span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carGallaryCarousel" role="button" data-slide="next">
                                <span class="slider-mover-right" aria-hidden="true">
                                    <img src="../js/FrontEnd/img/png/chevron-right.png" alt="right-chevron">
                                </span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="../jsp/FrontEnd/js/jquery-2.2.0.min.js"></script>
        <script type="text/javascript" src="../jsp/FrontEnd/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../jsp/FrontEnd/js/bootstrap-slider.js"></script>
        <script type="text/javascript" src="../jsp/FrontEnd/js/wow.min.js"></script>
        <script type="text/javascript" src="../jsp/FrontEnd/js/jquery.scrollUp.js"></script>
        <script type="text/javascript" src="../jsp/FrontEnd/js/bootstrap-select.min.js"></script>

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script type="text/javascript" src="../jsp/FrontEnd/jsp/FrontEnd/js/ie10-viewport-bug-workaround.js"></script>

        <!-- Custom javascript -->
        <script type="text/javascript" src="../jsp/FrontEnd/js/app.js"></script>
        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '../www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-89110077-2', 'auto');
            ga('send', 'pageview');

        </script>
        <a id="page_scroller" href="#top" style="position: fixed; z-index: 2147483647;"><i class="fa fa-chevron-up"></i></a>
    </body>

    <!-- Mirrored from auto-dealer-dot-my-experiments-163718.appspot.com/car-grid-2.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 20 Apr 2017 02:57:07 GMT -->
</html>