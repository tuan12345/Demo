<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Payment</title>
        <link rel="stylesheet" href="../jsp/payment/css/reset.css"/>
        <link rel="stylesheet" href="../jsp/payment/css/style.css"/>
        <script src="../jsp/payment/js/jquery.min.js"></script>
    </head>
    <body>
        <div class="main">
            <p>Xin chào Quý khách</p>
            <div class="content">
                <script src="../jsp/payment/js/easyResponsiveTabs.js" type="text/javascript"></script>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('#horizontalTab').easyResponsiveTabs({
                            type: 'default', //Types: default, vertical, accordion           
                            width: 'auto', //auto or any width like 600px
                            fit: true   // 100% fit in a container
                        });
                    });
                </script>
                <div class="sap_tabs">
                    <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                        <div class="pay-tabs">
                            <h2>Vui lòng chọn hình thức thanh toán</h2>
                            <ul class="resp-tabs-list">
                                <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span><label class="pic1"></label>Thẻ VISA</span></li>
                                <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span><label class="pic2"></label>ATM Internet Banking</span></li>
                                <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span><label  class="pic3"></label>Tiền mặt</span></li> 
                            </ul>	
                        </div>
                        <div class="resp-tabs-container">
                            <div class="payment-info">
                                <h3>Nhập thông tin thẻ VISA</h3>
                                <f:form action="PaymentVisa.htm" method="GET" commandName="visa">
                                    <div class="tab-for">				
                                        <h5>TÊN IN TRÊN THẺ</h5>
                                        <f:input type="text" path="accName"/>
                                        <h5>SỐ THẺ</h5>													
                                        <f:input class="pay-logo" type="text" value="0000-0000-0000-0000" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                 this.value = '0000-0000-0000-0000';
                                                 }" required="" path="accNo"/>
                                        <h5>SỐ TIỀN</h5>
                                        <f:input type="text" path="paymentAmount"/>
                                    </div>	
                                    <input type="submit" value="THANH TOÁN"/>
                                </f:form>
                            </div>
                            <div class="payment-info">
                                <h3>Nhập thông tin tài khoản</h3>
                                <f:form action="PaymentBank.htm" method="GET" commandName="bank">
                                    <div class="tab-for">				
                                        <h5>SỐ TÀI KHOẢN</h5>
                                        <f:input type="text" path="accNo"/>
                                        <h5>TÊN TÀI KHOẢN</h5>
                                        <f:input type="text" path="accName"/>
                                        <h5>SỐ TIỀN</h5>
                                        <f:input type="text" path="paymentAmount"/>
                                    </div>	
                                    <input type="submit" value="THANH TOÁN"/>
                                </f:form>
                            </div>
                            <div class="payment-info">
                                <f:form action="PaymentMoney.htm" method="GET">
                                    <h3>Thanh toán bằng tiền mặt</h3>
                                    <input type="submit" value="ĐỒNG Ý"/>
                                </f:form>
                            </div>
                        </div>
                    </div>
                </div>
                <p class="footer">Copyright©2017 PaymentMethod. All Rights Reserved by <a href="https://stulo.com/" target="_blank" style="color: black">STuLo Corp</a></p>
            </div>
        </div>
    </body>
</html>



