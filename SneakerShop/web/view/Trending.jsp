<%-- 
    Document   : Trending
    Created on : Dec 15, 2019, 9:09:17 PM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dal.DAOFactory"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trending</title>
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
        
        <center><h2><b>Trending</b></h2></center>
        
        <fieldset>
        <table border="1px" class = "responstable">  
            <tr>
                <th>Shoe Name</th>
                <th>Brand Name</th>
                <th>Retail</th>
                <th>Status</th>
            </tr>
            <c:forEach var="s" items="${shoes}">
                <tr>
                    <td>${s.sname}</td>
                    
                    <td>${dao.getBrandDAO().getBrandName(s.brands)}</td>

                    <td>${s.retail} $</td>

                    <td>
                        <c:if test="${s.sale}">
                            <img src="img/icon_sale.png" alt=""/>
                        </c:if>
                        <c:if test="${!s.sale}">
                            <img src="img/icon_new.png" alt=""/>
                        </c:if>
                    </td>
                </tr>

            </c:forEach>
        </table>
        </fieldset>

    </body>
</html>
