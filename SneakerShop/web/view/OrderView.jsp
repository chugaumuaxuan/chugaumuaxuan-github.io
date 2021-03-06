<%-- 
    Document   : OrderView
    Created on : Dec 20, 2019, 1:35:54 AM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbContext" class="dal.DBContext"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
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
        
        <center><h2><b>Order History</b></h2></center>
        
        <fieldset>
        <table border="1px" class = "responstable">  
            <tr>
                <th>Shoe Name</th>
                <th>Size</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>User Name</th>
                <th>Order Date</th>
            </tr>
            <c:forEach var="s" items="${shoes}">
                <tr>
                    <td>${s.sname}</td>

                    <td>${s.size}</td>

                    <td>${s.retail * s.orderlines.quantity} $</td>

                    <td>${s.orderlines.quantity}</td>
                    
                    <td>${s.users.username}</td>
                    
                    <td>${s.orders.date}</td>
                </tr>

            </c:forEach>
        </table>
        </fieldset>
        
    </body>
</html>
