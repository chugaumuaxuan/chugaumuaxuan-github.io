<%-- 
    Document   : Insert
    Created on : Mar 4, 2020, 11:42:39 AM
    Author     : nguye
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dal.DBContext"%>
<%@page import="model.Brand"%>
<%@page import="model.Shoe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
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
            
            td,th,input,option {
                text-align: center!important
            }
            
        </style>
        <script>            
            function submitForm() {
                document.getElementById("select").submit();
            }
        </script>
    </head>
    <body>
        <jsp:include flush="true" page="../Banner/AdminHeadBanner.jsp"></jsp:include>
        <%
            ArrayList<Brand> brands = (ArrayList<Brand>) request.getAttribute("brands");
            ArrayList<Shoe> shoes = (ArrayList<Shoe>) request.getAttribute("shoes");
        %>
    <center>
        
        <form action="insert" method="POST">
            <table boder = "2px" class=responstable>
                <tr>
                    <td style="font-weight:bold">Shoe ID </td>
                    <td><input class="form-control" type="text" name="sid" required="required"/></td>
                </tr>
                
                <tr>
                    <td style="font-weight:bold">Shoe Name </td>
                    <td><input class="form-control" type="text" name="sname" required="required"/></td>
                </tr>
                
                <tr>
                    <td style="font-weight:bold">Brand </td>
                    <td>
                        <select name="brandname" class="custom-select mb-3">
                            <% for (Brand b : brands) {
                            %>
                            <option value="<%=b.getBid()%>"><%=b.getBname()%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td style="font-weight:bold">Is Trend </td>
                    <td> 
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" class="custom-control-input" id="yesRadio" name="trend" value="yes"/>
                        <label class="custom-control-label" for="yesRadio">Yes</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">                        
                        <input type="radio" class="custom-control-input" id="noRadio" name="trend" value="no"/>
                        <label class="custom-control-label" for="noRadio">No</label>
                    </div>
                    </td>                    
                </tr>
                
                <tr>
                    <td style="font-weight:bold">Size </td>
                    <td><input class="form-control" type="text" name="size" required="required"/></td>
                </tr>
                
                <tr>
                    <td style="font-weight:bold">Retail </td>
                    <td><input class="form-control" type="text" name="retail" required="required"/></td>
                </tr>
                
                <tr>
                    <td style="font-weight:bold">Price </td>
                    <td><input class="form-control" type="text" name="price" required="required"/></td>
                </tr>
                
                <tr>
                    <td style="font-weight:bold">Status </td>
                    <td> 
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" class="custom-control-input" id="saleRadio" name="status" value="sale"/>
                        <label class="custom-control-label" for="saleRadio">Sale</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">                        
                        <input type="radio" class="custom-control-input" id="newRadio" name="status" value="new"/>
                        <label class="custom-control-label" for="newRadio">New</label>
                    </div>
                    </td>
                </tr>                
                
            </table>
            <br>
            <td><input type="submit" class="btn btn-success" value="Save"/></td>
        </form>
                        
    </center>
    </body>
</html>
