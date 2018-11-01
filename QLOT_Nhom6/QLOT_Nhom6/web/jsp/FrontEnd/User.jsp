<%@page import="entity.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        User u = (User)session.getAttribute("user");
        %>
        <h1>Hello <%=u.getUserName() %></h1>
        <h1>Hello <%=u.getUserID()%></h1>
        <h1>Hello <%=u.getAddress()%></h1>
        <h1>Hello <%=u.getPhone()%></h1>
        <h1>Hello <%=u.getPassword()%></h1>
        <h1>Hello <%=u.getBirthday()%></h1>
        <br>
        <a href="Logout.htm"><p>thoat</p></a>
        <br>
    </body>
</html>
