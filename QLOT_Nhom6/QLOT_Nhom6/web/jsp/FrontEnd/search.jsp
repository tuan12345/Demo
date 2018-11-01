<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from auto-dealer-dot-my-experiments-163718.appspot.com/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 20 Apr 2017 02:57:19 GMT -->
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
    <body style="background-color: #fff;">
        <header class="main-header" >
            <jsp:include page="Header.jsp"></jsp:include>
            </header>
            <!-- Latest offers-2 two start-->
            <div class="content-area latest-offers-2">
                <div class="container">
                    <!-- Main title -->
                    <div class="main-title">
                        <h1>Search</h1>
                        <div class="border">
                            <div class="border-inner"></div>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ac tortor at tellus feugiat congue quis ut nunc. Semper ac dolor vitae accumsan. interdum hendrerit lacinia.</p>
                    </div>
                    <div class="row wow animated">
                        <div class="sub-footer">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="logo">
                                        <a href="#">
                                            <img src="../jsp/FrontEnd/img/logos/footer-logo.png" alt="footer-logo">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-lg-offset-2 col-md-4 col-sm-6 col-xs-12">
                                <f:form action="byName.htm" method="post"  modelAttribute="pro" >
                                    <div class="form-group">
                                        <f:input type="text" class="form-control" path="productName" placeholder="Nhap ten san pham" />
                                        <button type="submit" name="submitNewsletter" class="btn btn-default button-small">
                                            <i class="fa fa-paper-plane"></i>
                                        </button>
                                    </div>
                                </f:form>
                            </div>
                        </div>
                        <div class="row wow animated">
                        </div>
                    </div>
                </div>
            </div>
            <!-- Latest offers-2 end-->

            <body class="bg-color">
                <div class="container">
                    <div class="row">
                        <c:forEach var="product" items="${listProductSearch}">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <!--Car box start-->
                                <div class="thumbnail car-box clearfix wow fadeInUp">
                                    <img src="../images/${product.image}" alt="${product.productName}">
                                    <!--detail--> 
                                    <div class="caption detail">
                                        <!--Header--> 
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
                                            <!--Price--> 
                                            <div class="price">
                                                <span>${product.priceExport}</span>
                                            </div>
                                        </header>
                                        <!--Paragraph--> 
                                        <p>
                                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer
                                        </p>
                                        <!--Facilities List--> 
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
                                            </div>
                                        </div>
                                    </div>

                                    <div class="featured-ribon">
                                        <h2>Featured Car</h2>
                                    </div>

                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
        </div>  

        <!-- Footer start-->
        <footer class="main-footer clearfix">
            <div class="container">
                <!-- Sub footer-->
                <div class="sub-footer">
                    <div class="row">

                    </div>
                </div>
                <!-- Footer info-->
                <div class="footer-info">
                    <div class="row">
                        <!-- About us -->
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="footer-item">
                                <h2 class="title">Contact Us</h2>
                                <p>
                                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's printing and typesetting
                                </p>
                                <ul class="personal-info">
                                    <li>
                                        <i class="fa fa-map-marker"></i>
                                        Address: 44 New Design Street, Melbourne
                                    </li>
                                    <li>
                                        <i class="fa fa-envelope"></i>
                                        Email:<a href="mailto:sales@hotelempire.com">sales@autocardealer.com</a>
                                    </li>
                                    <li>
                                        <i class="fa fa-phone"></i>
                                        Phone: <a href="tel:+55-417-634-7071">+55 417-634-7071</a>
                                    </li>
                                    <li>
                                        <i class="fa fa-fax"></i>
                                        Fax: +55 417-634-7071
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Links -->
                        <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
                            <div class="footer-item">
                                <h2 class="title">Links</h2>
                                <ul class="links">
                                    <li>
                                        <a href="<%=request.getContextPath()%>/FrontEnd/Home.htm">Trang chu</a>
                                    </li>
                                    <li>
                                        <a href="<%=request.getContextPath()%>/FrontEnd/getAllProduct.htm">San pham</a>
                                    </li>
                                    <li>
                                        <a href="#">Dich vu</a>
                                    </li>
                                    <li>
                                        <a href="#">Lien he</a>
                                    </li>
                                    <li>
                                        <a href="<%=request.getContextPath()%>/FrontEnd/InitSearch.htm">Tim kiem</a>
                                    </li>
                                    <li>
                                        <a href="<%=request.getContextPath()%>/FrontEnd/InitLogin.htm">Dang nhap</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Tags -->
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-item">
                                <h2 class="title">Tags</h2>
                                <div class="tags">
                                    <a href="#">Cars</a>
                                    <a href="#">Cars Dealer</a>
                                    <a href="#">Car Template</a>
                                    <a href="#">Dealer</a>
                                    <a href="#">Auto Car Dealer</a>
                                    <a href="#">Automobile</a>
                                    <a href="#">Vehicles</a>
                                    <a href="#">Journey</a>
                                    <a href="#">Car Selling</a>
                                    <a href="#">Car Dealing</a>
                                    <a href="#">Car Website</a>
                                    <a href="#">Car Template</a>
                                    <a href="#">HTML Template</a>
                                </div>
                            </div>
                        </div>
                        <!-- Recent cars -->
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-item recent-car">
                                <h2 class="title">Recent Cars</h2>
                                <div class="media">
                                    <div class="media-left">
                                        <a href="#">
                                            <img class="media-object" src="../jsp/FrontEnd/img/recent/recent-1.jpg" alt="recent-1">
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h3>
                                            <a href="#">Porsche Cayen Last</a>
                                        </h3>
                                        <span>October 18, 2016</span>
                                        <p>$36.000</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer end-->

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


</html>





