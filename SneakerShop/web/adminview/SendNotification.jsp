<%-- 
    Document   : SendNotification
    Created on : Jun 1, 2020, 1:59:35 PM
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
        <form id="frm" method="POST" action="/PRJ321FA19B5_Assignment/sendnotification">
            <table boder = "2px" class=responstable>
                <legend><h2><b>New Notification</b></h2></legend>
                <br>
                <tr>
                    <td>Notification ID</td>
                    <td><input class="form-control" type="text" name="noid" required="required"/></td>
                </tr>
                <tr>
                    <td>Title</td>
                    <td><input class="form-control" type="text" name="title" required="required"/></td>
                </tr>
                <tr>
                    <td>Content</td>
                    <td><input class="form-control" type="text" name="content" required="required"/></td>
                </tr>
            </table>            
        </form>
        </fieldset>            
        <br>
        <input type="button" class="btn btn-success" value="Send" onclick="submitDataToInsert();">
    </center>
    </body>
</html>
