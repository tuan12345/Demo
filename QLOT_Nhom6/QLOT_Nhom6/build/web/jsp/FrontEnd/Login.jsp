
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
    <link rel="shortcut icon" href="../jsp/FrontEnd/favicon.ico" type="image/x-icon" >

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


<body class="bg-color">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <!-- form content box Start -->
                <div class="form-content-box">
                    <!-- header -->
                    <div class="header">
                        <h3>Login</h3>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>
                    </div>
                    <!-- Details -->
                    <div class="Details">
                        <!-- form -->
                        <f:form  action="Login.htm" method="post" commandName="user">
                            <div class="form-group">
                                <label>User Name</label>
                                <f:input type="text" name="email" class="input-text" id="email-eddress" placeholder="UserName" path="userName"/>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <f:input type="password" name="Password" class="input-text" id="password" placeholder="Password" path="password"/>
                            </div>
                            <div class="checkbox">
                                <div class="ez-checkbox pull-left">
                                    <label>
                                        <input type="checkbox" class="ez-hide">
                                        Remember me
                                    </label>
                                </div>
                                <a href="#" class="link-not-important pull-right">Forgot Password</a>
                                <div class="clearfix"></div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-submit">login</button>
                            </div>
                       </f:form>
                       <hr>
                       <!-- Social list 2 -->
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
                    <!-- Footer -->
                    <div class="footer">
                        <span>
                            New to Tempo? <a href="InitSignup.htm">Sign up now</a>
                        </span>
                    </div>
                </div>
                <!-- Form content box End -->
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
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','../www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-89110077-2', 'auto');
        ga('send', 'pageview');

    </script>
</body>


</html>





