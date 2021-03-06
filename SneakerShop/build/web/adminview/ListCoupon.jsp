<%-- 
    Document   : ListCoupon
    Created on : May 26, 2020, 9:18:03 AM
    Author     : nguye
--%>

<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Coupon</title>
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
        <jsp:include flush="true" page="../Banner/AdminHeadBanner.jsp"></jsp:include>
    <center>
        
        <fieldset>
        <table border="1px" class = "responstable">
            <legend><h2><b>All Coupons</b></h2></legend>
            <tr>
                <th>Code</th>
                <th>Description</th>
                <th>Percent</th>
                <th>From</th>
                <th>To</th>
            </tr>
            <c:forEach var="c" items="${coupons}">
            <tr>
                <td>${c.code}</td>
                <td>${c.desc}</td>
                <td>${c.percent} %</td>
                <td>${c.from}</td>
                <td>${c.to}</td>
            </tr>
            </c:forEach>
        </table>
        </fieldset>
        <br>
        <td><button type="button" class="btn btn-info" 
                    onclick="window.location.href='addcoupon'">Add New Coupon</button></td>
        
    </center>  
    <br>
    <br>
    </body>
</html>
