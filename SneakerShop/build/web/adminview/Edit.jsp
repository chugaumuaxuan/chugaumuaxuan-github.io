<%-- 
    Document   : Update
    Created on : Mar 20, 2020, 2:49:48 PM
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
        <style>

            input[type=text], [type=email], [type=password]{
                height:30px;
                width:300px;
                background:#fff;
                border:1px solid #f2f2f2;
                border-radius:20px;
                color: slategrey;
                font-family: 'Ubuntu', sans-serif;
                cursor:pointer;
            }           
          
            body {
                background-image: url("img/adminbackground.jpg");
                background-size:     cover; 
                background-repeat: no-repeat;
            }
            
            td,th {
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
            Shoe s = (Shoe) request.getAttribute("shoes");
            ArrayList<Brand> brands = (ArrayList<Brand>) request.getAttribute("brands");
        %>
    <center>
        
        <form action="edit" method="POST"> 
            <table border="2px" class = responstable>
                <input type="hidden" value="<%=s.getSid()%>" name="sid"/>
                <tr>
                    <td style="font-weight:bold" >Shoe Name </td>
                    <td><input type="text" value="<%=s.getSname()%>" name="sname"/> </td>
                </tr>
                
                <tr>
                    <td style="font-weight:bold">Brand </td>
                    <td>
                        <select name="brandname">
                            <%for (Brand b : brands) {
                            %>
                            <option value="<%=b.getBid()%>" 
                                    <%=(s.getBr().getBid()== b.getBid()) ? "selected='selected'" : ""%>

                                    ><%=b.getBname()%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td style="font-weight:bold">Release Date</td>
                    <td><input type="date" value="<%=s.getRedate()
                    %>" name="redate"/> </td>
                </tr>
                
                <tr>
                    <td style="font-weight:bold">Is Trend</td>
                    <td>
                        <input type="radio" value="true" 
                               <%=(s.isTrend()) ? "checked='checked'" : ""%> 
                               name="trend"/> Yes
                        <input type="radio" value="false" 
                               <%=(!s.isTrend()) ? "checked='checked'" : ""%> 
                               name="trend"/> No
                    </td>
                </tr>
                
                <tr>
                    <td style="font-weight:bold">Size</td>
                    <td><input type="text" value="<%=s.getSize()%>" name="size"/> </td>
                </tr>
                
                <tr>
                    <td style="font-weight:bold" >Retail</td>
                    <td><input type="text" value="<%=s.getRetail()%>" name="retail"/> </td>
                </tr> 
                
                <tr>
                    <td style="font-weight:bold" >Price</td>
                    <td><input type="text" value="<%=s.getPrice()%>" name="price"/> </td>
                </tr> 
                
                <tr>
                    <td style="font-weight:bold">Status</td>
                    <td>
                        <input type="radio" value="true" 
                               <%=(s.isSale()) ? "checked='checked'" : ""%> 
                               name="status"/> Sale
                        <input type="radio" value="false" 
                               <%=(!s.isSale()) ? "checked='checked'" : ""%> 
                               name="status"/> New
                    </td>
                </tr>

            </table>

            <input type="submit" value="Save" onclick="window.location.href = 'AdminHome.jsp'"/>
        </form>
        
    </center>    
    </body>
</html>
