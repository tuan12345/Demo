<%-- 
    Document   : EmailForm
    Created on : May 9, 2017, 11:08:12 PM
    Author     : Sinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>To customer</title>
    </head>
    <body>
        <h1>Qúy khách đã thanh toán thành công</h1>
        <h1>Send SMS</h1>
        <form method="post" action="<%=request.getContextPath()%>/show/sendSms.htm">
            <table border="0" width="80%">
                <tr>
                    <td>Phone:</td>
                    <td><input type="text" name="phone" size="65" /></td>
                </tr>               
                <tr>
                    <td>Message:</td>
                    <td><textarea cols="50" rows="10" name="message"></textarea></td>
                </tr>               
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Send SMS"/>
                    </td>
                </tr>
            </table>
        </form>
        <h1>Send e-mail</h1>
        <form method="post" action="<%=request.getContextPath()%>/show/sendEmail.htm" commandName="email">
            <table border="0" width="80%">
                <tr>
                    <td>To:</td>
                    <td><input type="text" name="recipient" size="65" /></td>
                </tr>
                <tr>
                    <td>Subject:</td>
                    <td><input type="text" name="subject" value ="Thanh toan hoa don" size="65" /></td>
                </tr>
                <tr>
                    <td>Message:</td>
                    <td><input type="text" name="message" value ="Qúy khách đã thanh toán thành công cho giao dịch số:" path ="TransactionId" size = "65"/></td>
                </tr>               
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Send E-mail" />
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>