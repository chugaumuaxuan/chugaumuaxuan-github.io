<%-- 
    Document   : AddCoupon
    Created on : May 26, 2020, 1:36:06 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
            function submitDataToInsert()
            {
                document.getElementById("frm").submit();
            }
        </script>
    </head>
    
    <body>
        <jsp:include flush="true" page="../Banner/AdminHeadBanner.jsp"></jsp:include>
    <center>
        <fieldset>
        <form id="frm" method="POST" action="addcoupon">
            <table boder = "2px" class=responstable>
                <legend><h2><b>New Coupon</b></h2></legend>
                <br>
                <tr>
                    <td>Code</td>
                    <td><input class="form-control" type="text" name="code" required="required"/></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input class="form-control" type="text" name="desc" required="required"/></td>
                </tr>
                <tr>
                    <td>Percent</td>
                    <td><input class="form-control" type="text" name="percent" required="required"/></td>
                </tr>
            </table>            
        </form>
        </fieldset>            
        <br>
        <input type="button" class="btn btn-success" value="Add" onclick="submitDataToInsert();">
    </center>
    </body>
</html>
