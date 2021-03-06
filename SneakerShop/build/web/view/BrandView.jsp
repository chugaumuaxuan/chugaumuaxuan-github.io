<%-- 
    Document   : BrandView
    Created on : Sep 26, 2019, 9:46:51 PM
    Author     : DELL
--%>

<%@page import="model.Brand"%>
<%@page import="model.Shoe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.brand.bname}</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            
            td,th,input {
                text-align: center!important
            }

        </style>
        <script>
            function buy(id)
            {
                var quantity =  document.getElementById("quantity"+id).value;
                if(quantity == "0")
                {
                    window.alert("You cannot buy 0 product");
                }
                else
                    document.getElementById("frm"+id).submit();
            }
        </script>
    </head>
    <body>
        <jsp:include flush="true" page="../Banner/HeadBanner.jsp"></jsp:include>
    <center>
        
        <fieldset>
        <table border="1px" class = "responstable">
            <legend><b>${requestScope.brand.bname}</b></legend>
        <tr>
            <th>Shoe ID</th>
            <th>Shoe Name</th>
            <th>Size</th>
            <th>Retail</th>
            <th>Status</th>
            <th>Quantity</th>
            <th>Add To Cart</th>
        </tr>
        <c:forEach items="${requestScope.shoes}" var="s">
        <tr>                   
            <td>${s.sid}</td>
            <td>${s.sname}</td>
            <td>${s.size}</td>
            <td>${s.retail} $</td>
            <td>
                <c:if test="${s.sale}">
                    <img src="img/icon_sale.png" alt=""/>
                </c:if>
                <c:if test="${!s.sale}">
                    <img src="img/icon_new.png" alt=""/>
                </c:if>
            </td>
                <form action="cart" id="frm${s.sid}" method="POST">
                    <td>
                    <input class="form-control" id="quantity${s.sid}" type="number" name="quantity" min="1" value="1" /> 
                    <input type="hidden" name="id" value="${s.sid}"/> 
                    </td>
                    
                    <td><input type="image" src="img/icon_cart.png" alt="Submit" width="48" height="48" onclick="buy(${s.sid});"/> </td>
                </form>
        </tr>
        </c:forEach>
        </table>
        </fieldset>
        
    </center>
    </body>
</html>
