<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="f" uri="http://www.springframework.org/tags/form" %>
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
        <link rel="shortcut icon" href="../images/img/favicon.ico" type="image/x-icon" >

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
            </header>
            <!-- Header end -->

            <!-- Sub banner start -->
            <div class="sub-banner">
                <div class="overlay">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="breadcrumb-area">
                                    <h2 >Shopping Cart</h2>
                                    <p >Whether you're looking to sell or let your home or want to buy or rent a home, we really are the people for you to come to.</p>
                                    <a href="<%=request.getContextPath()%>/FrontEnd/Home.htm" class="btn btn-details btn-index">Trang chu</a>
                                    <a href="<%=request.getContextPath()%>/FrontEnd/getAllProduct.htm" class="btn btn-details btn-index">San pham</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sub banner end -->
            <!-- table start -->
            <div class="featured-car content-area clearfix">
                <div class="container">
                        <div class="col-sm-12 col-md-8">
                            <br>
                            <form method="post" action="<%=request.getContextPath()%>/FrontEnd/update.htm"> 
                            <table class="table table-striped" style="color:#111;" width="100%">
                                <tbody>
                                    <%-- Lay danh sach san pham trong session khach hang --%>
                                    <c:forEach items="<%=request.getSession().getAttribute("listCart")%>" var="c">
                                        <tr>
                                            <td>
                                                <img class="img-responsive" src="../images/${c.product.image}" alt="">
                                            </td>
                                            <td>
                                                <p>${c.product.productName}</p>
                                                <p>${c.product.priceExport}</p>
                                            </td>
                                            <td style="width: 200px;">
                                                <div>${c.product.priceExport} *</div>
                                                <div>
                                                    
                                                        <table>
                                                            <tbody>
                                                                <tr>
                                                                    <td><input type="text" class="form-control" name="quantity" value="${c.quantity}"></td>
                                                                    <td><input type="submit" class="btn btn-default" value="update"></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                   
                                                </div>

                                                = <span>$</span> <b>${c.quantity*c.product.priceExport}</b>
                                            </td>
                                            <td>
                                                
                                                    <a href="remove.htm?productID=${c.product.productID}" onclick="return confirm('Are you sure?')">
                                                        <i class="fa fa-remove"></i>
                                                    </a>
                                                
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    <tr>
                                        <td colspan="2" align="right">Total:</td>
                                        <%-- Lay param co ten la total trong session cua khach hang --%>
                                        <td colspan="2" align="left">$<%=request.getSession().getAttribute("total")%></td>
                                    </tr>
                                </tbody>

                            </table> 
                        </form>
                        <%-- goi phuong thuc productForm trong CartController --%>
                        <hr>
                        
                            <a href="<%=request.getContextPath()%>/FrontEnd/InitLogin.htm" class="btn btn-details btn-index">Đặt hàng</a>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Table end -->

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
                                    <img src="../jsp/FrontEnd/img/grid/vencer-sarthe-supercar.jpg" alt="Vencer-Sarthe-Supercar">
                                </div>

                                <div class="item">
                                    <img src="../jsp/FrontEnd/img/grid/bmw_emw_m3_diski_serie.jpg" alt="Vencer-Sarthe-Supercar">
                                </div>

                                <div class="item">
                                    <img src="../jsp/FrontEnd/img/grid/gridmclaren_650S.jpg" alt="Vencer-Sarthe-Supercar">
                                </div>

                                <div class="item">
                                    <img src="../img/grid/vencer-sarthe-supercar.jpg" alt="Vencer-Sarthe-Supercar">
                                </div>
                            </div>
                            <!-- Left and right controls -->

                            <a class="left carousel-control" href="#carGallaryCarousel" role="button" data-slide="prev">
                                <span class="slider-mover-left" aria-hidden="true">
                                    <img src="../jsp/FrontEnd/img/png/chevron-left.png" alt="left-chevron">
                                </span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carGallaryCarousel" role="button" data-slide="next">
                                <span class="slider-mover-right" aria-hidden="true">
                                    <img src="../jsp/FrontEnd/img/png/chevron-right.png" alt="right-chevron">
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
        <script type="text/javascript" src="../jsp/FrontEnd/js/ie10-viewport-bug-workaround.js"></script>

        <!-- Custom javascript -->
        <script type="text/javascript" src="../jsp/FrontEnd/js/app.js"></script>
        <script>


        </script>
        <a id="page_scroller" href="#top" style="position: fixed; z-index: 2147483647;"><i class="fa fa-chevron-up"></i></a>
    </body>
