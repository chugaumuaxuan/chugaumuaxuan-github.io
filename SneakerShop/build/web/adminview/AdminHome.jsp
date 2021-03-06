<%-- 
    Document   : AdminHome
    Created on : Mar 3, 2020, 2:44:50 PM
    Author     : nguye
--%>

<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dao" class="dal.DAOFactory"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sneaker Shop | Admin</title>
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
        <%
            Admin admin = (Admin) request.getSession().getAttribute("admin");
        %>
    <center>
        
        <fieldset>
        <table border="1px" class = "responstable">
            <legend><h2><b>All Products</b></h2></legend>
        <tr>
            <th>Brand Name</th>
            <th>Shoe ID</th>
            <th>Shoe Name</th>
            <th>Size</th>
            <th>Price</th>
            <th>Status</th>
            <th></th>
            <th></th>
        </tr>  
        <c:forEach var="s" items="${shoes}">
        <tr>
            <td>${dao.getBrandDAO().getBrandName(s.brands)}</td>
            
            <td>${s.sid}</td>
            
            <td>${s.sname}</td>
            
            <td>${s.size}</td>
            
            <td>${s.price} $</td>
            
            <td>
                <c:if test="${s.sale}">
                    <img src="img/icon_sale.png" alt=""/>
                </c:if>
                <c:if test="${!s.sale}">
                    <img src="img/icon_new.png" alt=""/>
                </c:if>
            </td>
            
            <td><button type="button" class="btn btn-outline-warning" 
                        onclick="window.location.href='edit'"> Edit </button></td>
                        
            <td><button type="button" class="btn btn-outline-danger" 
                        onclick="window.location.href='delete'"> Delete </button></td>
        </tr>
        </c:forEach>      
        </table>
        </fieldset>
        <br>
<!--        <td><button type="button" class="btn btn-info" 
                        onclick="window.location.href='insert'"> Insert Product </button></td>-->
        
    <h1>
        <div class="btn-group btn-group-justified" role="group" aria-label="...">
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-outline-info" onclick="window.location.href='listsubscriber'">Manage Subscribers</button>
            </div>
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-outline-info" onclick="window.location.href='insert'">Insert Product</button>
            </div>
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-outline-info" onclick="window.location.href='listcoupon'">Manage Coupons</button>
            </div>
        </div>
    </h1>                
    </center>
    <br>
    <br>
    </body>
</html>
