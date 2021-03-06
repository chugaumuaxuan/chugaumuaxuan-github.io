<%-- 
    Document   : AdminHeadBanner
    Created on : Mar 3, 2020, 3:06:09 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <ul>
                <c:if test="${sessionScope.admin eq null}">
                    <li><button type="button" class="btn btn-outline-success" onclick="window.location.href='/PRJ321FA19B5_Assignment/adminlogin'">Log In</button></li>
                </c:if>
                <c:if test="${sessionScope.admin ne null}">
                    <li><button type="button" class="btn btn-outline-danger" onclick="window.location.href='/PRJ321FA19B5_Assignment/adminlogout'">Log Out</button></li>
                </c:if>
            </ul>
        </div>
    <center>
        <a href="/PRJ321FA19B5_Assignment/adminhome"><h1>Sneaker Shop</h1></a>
        
        <br>
    </center>
    <p></p>
    </body>
</html>
