<%-- 
    Document   : UserInfor
    Created on : Dec 18, 2019, 10:36:39 AM
    Author     : nguye
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Information</title>
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
        <%
            User user = (User) request.getSession().getAttribute("user");
        %>
        <center><h2><b>User Information</b></h2></center>
        
        <fieldset>
        <table border="0px" class = "responstable">  
            <tr>
                <td>User Name </td>
                <td><%=user.getUsername()%></td>
            </tr>          
            <tr>
                <td>Login Name </td>              
                <td><%=user.getLoginname()%></td>
            </tr>
            <tr>
                <td>Address </td>              
                <td><%=user.getAddress()%></td>
            </tr>
            <tr>
                <td>Phone Number </td>              
                <td><%=user.getPhone()%></td>
            </tr>
            <tr>
                <td>Email </td>              
                <td><%=user.getMail()%></td>
            </tr>
        </table>
        </fieldset>
            
    </body>
</html>
