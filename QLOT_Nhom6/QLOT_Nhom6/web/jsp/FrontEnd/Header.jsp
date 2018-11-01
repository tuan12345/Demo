<div class="container">
    <nav class="navbar navbar-default">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="index-2.html" class="logo">
                <img src="../jsp/FrontEnd/img/logos/logo.png" alt="LOGO">
            </a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="<%=request.getContextPath()%>/FrontEnd/Home.htm">Trang chu</a>
                </li>
                <li class="dropdown">
                    <a href="<%=request.getContextPath()%>/FrontEnd/getAllProduct.htm">San pham</a>
                </li>
                <li class="dropdown">
                    <a href="#">Dich vu</a>
                </li>
                <li class="dropdown">
                    <a href="#">Lien he</a>
                </li>
                <li class="dropdown">
                    <a href="<%=request.getContextPath()%>/FrontEnd/InitSearch.htm">Search</a>

                </li>
                <li class="dropdown">
                    <a href="<%=request.getContextPath()%>/FrontEnd/InitLogin.htm">Dang nhap</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
        <!-- /.container -->
    </nav>
</div>