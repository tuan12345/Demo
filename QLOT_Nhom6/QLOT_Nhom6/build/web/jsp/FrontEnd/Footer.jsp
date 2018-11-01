<footer class="main-footer clearfix">
    <div class="container">
        <!-- Sub footer-->
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
                    <form action="#" method="post">
                        <div class="form-group">
                            <input type="text" class="form-contact" name="email" placeholder="Enter your email">
                            <button type="submit" name="submitNewsletter" class="btn btn-default button-small">
                                <i class="fa fa-paper-plane"></i>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                    <div class="social-list clearfix">
                        <a href="#" class="bg-facebook">
                            <i class="fa fa-facebook"></i>
                        </a>
                        <a href="#" class="bg-twitter">
                            <i class="fa fa-twitter"></i>
                        </a>
                        <a href="#" class="bg-google">
                            <i class="fa fa-google-plus"></i>
                        </a>
                        <a href="#" class="bg-linkedin">
                            <i class="fa fa-linkedin"></i>
                        </a>
                        <a href="#" class="bg-pinterest">
                            <i class="fa fa-pinterest"></i>
                        </a>
                    </div>
                </div>
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