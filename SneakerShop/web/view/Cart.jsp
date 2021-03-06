<%-- 
    Document   : Cart
    Created on : Dec 19, 2019, 3:33:24 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
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
        
        <center><h2><b>Cart</b></h2></center>
        
        <c:if test="${sessionScope.order eq null}">
            <center>You did not buy anything!!!!</center>
        </c:if>
        <c:if test="${sessionScope.order ne null}">
            
            <fieldset>
            <table border="1px" class=responstable>
                <tr>
                    <th>Shoe ID</th>
                    <th>Shoe Name</th>
                    <th>Size</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
                <c:forEach items="${sessionScope.order.lines}" var="l">
                    <tr> 
                        <td>${l.shoe.sid}</td>
                        <td>${l.shoe.sname}</td>
                        <td>${l.shoe.size}</td>
                        <td>${l.price}</td>
                        <td>${l.quantity}</td>
                        <td>${l.quantity * l.price} </td>
                    </tr>
                </c:forEach>
                    <tr>
                        <td colspan="5"><b>TOTAL</b></td>
                        <td>${sessionScope.order.total} </td>
                    </tr>
            </table>
            </fieldset>
                    
            <c:if test="${sessionScope.user eq null}">
                <br><br><center>Click <a href="login"> here </a> to login and check out your Shoe !</center>                
            </c:if>
            <c:if test="${sessionScope.user ne null}">
                <br><br><center><button class="btn btn-success" 
                                    action="checkout" method="POST" onclick="window.location.href='checkout'"> Check out </button></center>  
            </c:if>    
                    
        </c:if>
    </body>
</html>
