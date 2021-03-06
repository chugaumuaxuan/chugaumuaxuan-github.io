<%-- 
    Document   : Home
    Created on : Jul 23, 2019, 3:35:02 PM
    Author     : DELL
--%>

<%@page import="model.Brand"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sneaker Shop</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            
            td,th {
                text-align: center!important
            }
            
        </style>
    </head>
    <body>
        <jsp:include flush="true" page="../Banner/HeadBanner.jsp"></jsp:include>
    <center>
        
        <fieldset>
        <table border="1px" class = "responstable">
            <legend><h2><b>Buy Now</b></h2></legend>
        <tr>
            <th>Brand ID</th>
            <th>Brand Name</th>
            <th></th>
        </tr>  
        <c:forEach items="${requestScope.brands}" var="b">
        <tr>                   
            <td>${b.bid}</td>
            <td>${b.bname}</td>
            <td><button class="btn btn-outline-primary" onclick="window.location.href='brand?brand=${b.bid}'"> Choose </button></td>
        </tr>
        </c:forEach>      
        </table>
        </fieldset>
        <br>
        <div class="container">            
        <c:if test="${sessionScope.user eq null}">
            <br>
            <h5 class="text-info">Please log in and subscribe us to get notifications about all products and coupon!</h5>
            <br>        
        </c:if>
        <c:if test="${sessionScope.user ne null}">
            <h2 class="text-success">Subscribe now!</h2>
            <p class="text-info">To get notifications about all products and coupon.</p>
            <br>
            <form class="form-inline justify-content-center" action="addsub" method="POST">
              <input type="email" class="form-control mb-2 mr-sm-2" id="sub_email" value="${sessionScope.user.mail}" name="sub_email" readonly required>

              <button type="submit" class="btn btn-primary mb-2">Subscribe</button>
            </form>            
        </c:if>
        </div>
        
    <br>
    </center>
    </body>
</html>
