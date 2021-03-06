<%-- 
    Document   : Register
    Created on : Dec 17, 2019, 1:40:44 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
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
    </head>
    <body>
        <br>
        <center><h2><b>Register</b></h2></center>
        
    <fieldset>
    <center>
        <p>${requestScope.notice}</p>
        <br><br>
        <form action="register" method="POST">
            <table boder = "2px" class=responstable>
                <tr>
                    <td>User Name :</td>
                    <td><input class="form-control" id="1" type="text" name="username" value="${requestScope.username}"  onblur="checkName()" required="required" /></td>
                </tr>
                
                <tr>
                    <td>Login Name :</td>
                    <td><input class="form-control"  type="text" name="loginname" value="${requestScope.loginname}" required="required" /></td>
                </tr>
                
                <tr>
                    <td>Password :</td>
                    <td><input class="form-control" type="password" name="password" value="" required="required" /></td>
                </tr>
                
                <tr>
                    <td>Re-Enter Password :</td>
                    <td><input class="form-control" id="2" type="password" name="password" value="" onblur="checkPass()" required="required" /></td>
                </tr>
                
                <tr>
                    <td>Address :</td>
                    <td><input class="form-control" type="text" name="address" value="${requestScope.address}" required="required" /></td>
                </tr>
                
                <tr>
                    <td>Phone Number :</td>
                    <td><input class="form-control" type="text" name="phone" value="${requestScope.phone}" required="required" /></td>
                </tr>
                
                <tr>
                    <td>Email :</td>
                    <td><input class="form-control" type="email" name="mail" value="${requestScope.mail}" required="required" /></td>                    
                </tr>                
            </table> 
            <br>
            <input class="btn btn-success"
                   type="submit" onclick="checkName()" value="Login"/>
        </form>
    </center>
    </fieldset>
                
    </body>
    <script>
        function checkName(){
             document.getElementById('1').innerHTML="";
            var x= document.getElementsByName("userName")[0].value;
            reg_name = /[^A-Z ]/i;
            if(x == "" || reg_name.test(x)==true)
            document.getElementById('1').innerHTML="Invalid Name"   ;
        }
        function checkPass(){
           document.getElementById('2').innerHTML="";
           var x=document.getElementsByName('password')[0].value;
           var y=document.getElementsByName('password')[1].value;
           if (x!=y)
           document.getElementById('2').innerHTML="Password is not match!";
               
        }
        
    </script>
</html>
