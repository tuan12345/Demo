<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Charge</title>
        <link rel="stylesheet" href="../css/reset.css"/>
        <link rel="stylesheet" href="../css/style.css"/>
        <script src="../js/jquery.min.js"></script>
    </head>
    <body>
        <div class="main">
            <h1>NẠP TIỀN VÀO TÀI KHOẢN</h1>
            <div class="content">
                <script src="../js/easyResponsiveTabs.js" type="text/javascript"></script>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('#horizontalTab').easyResponsiveTabs({
                            type: 'default', //Types: default, vertical, accordion           
                            width: 'auto', //auto or any width like 600px
                            fit: true   // 100% fit in a container
                        });
                    });
                </script>
                <div class="resp-tabs-container">
                        <f:form action="payment.htm" method="GET" commandName="payment">
                            <div class="tab-for">
                                <h5>SỐ TÀI KHOẢN</h5>				
                                <f:input type="text" path="accNo"/>
                                <h5>TÊN TÀI KHOẢN</h5>
                                <f:input type="text" path="accName"/>
                                <h5>SỐ TIỀN</h5>
                                <f:input type="text" path="paymentAmount"/>
                            </div>	
                            <input type="submit" value="ĐỒNG Ý"/>
                        </f:form>
                </div>
            </div>
        </div>
    </body>
</html>
