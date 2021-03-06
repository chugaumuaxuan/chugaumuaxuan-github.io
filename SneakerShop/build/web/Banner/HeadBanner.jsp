<%--
    Document   : HeadBanner
    Created on : Aug 27, 2019, 9:39:27 AM
    Author     : DELL
--%>

<%@page import="helper.NotificationInterface"%>
<%@page import="helper.SMSSubscriber"%>
<%@page import="helper.NotificationObject"%>
<%@page import="helper.AdminInterface"%>
<%@page import="helper.SubscriberInterface"%>
<%@page import="model.Subscriber"%>
<%@page import="dal.DAOFactory"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="help" class="helper.Helper" />
<!DOCTYPE html>
<html>
    <%
        ArrayList<Subscriber> subscribers = DAOFactory.getAdminDAO().getAllSubscribers();
    %>
    <body>        
        <div class="btn-group">
            <ul>
                <c:if test="${sessionScope.user eq null}">
                    <li><button type="button" class="btn btn-outline-danger" onclick="window.location.href='/PRJ321FA19B5_Assignment/login'">Log In</button></li>
                </c:if>
                <c:if test="${sessionScope.user ne null}">
                    <li><button type="button" class="btn btn-outline-success" onclick="window.location.href='/PRJ321FA19B5_Assignment/userinfor'">Welcome ${sessionScope.user.username}</button></li>
                </c:if>
            </ul>
        </div>
        
    <center>
        <h1>Sneaker Shop</h1>
    </center>
        <br>
        
        <nav class="navbar navbar-expand-xl navbar-light bg-light">
            <a class="navbar-brand" href="/PRJ321FA19B5_Assignment/home">
                <img src=img/stockX.jpg" alt="logo" style="width:40px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContentXL" aria-controls="navbarSupportedContentXL" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContentXL">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/PRJ321FA19B5_Assignment/home">Home<span class="sr-only">(current)</span></a>
                </li>
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownXL" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Browse
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownXL">
                        <a class="dropdown-item" href="/PRJ321FA19B5_Assignment/trending">Trending</a>
                        <a class="dropdown-item" href="/PRJ321FA19B5_Assignment/sale">Sale</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/PRJ321FA19B5_Assignment/calendar">Release Calendar</a>
                    </div>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="/PRJ321FA19B5_Assignment/cart">My Cart
                        <c:if test="${sessionScope.order ne null}">(${sessionScope.order.lines.size()})</c:if>
                        <c:if test="${sessionScope.order eq null}">(0)</c:if>                    
                    </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="/PRJ321FA19B5_Assignment/view">My Order History</a>
                </li>
                
                <c:if test="${sessionScope.user ne null}">
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#noticeModal">Notification (0)</a>
                    <div class="modal fade" id="noticeModal">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">${sessionScope.user.mail}</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    
                                <% for (Subscriber s : subscribers) {
                                %>
                                <c:if test="${sessionScope.user.mail eq s.submail}">
                                    
                                    <p>Welcome ${s.submail}! Thanks for subscribe Sneaker Shop</p>
                                    
                                </c:if>
                                <%}%>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </li>
                </c:if>
                
                <li class="nav-item">
                    <a class="nav-link" href="/PRJ321FA19B5_Assignment/register">Register</a>
                </li>
            </ul>
            
<!--            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>                
            </form>-->

        <form class="form-inline ml-3">

            <div class="input-group">
                <input type="text" class="form-control " placeholder="Search" required="required">
                <button type="submit">
                    <svg class="bi bi-search" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
                        <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                    </svg>
                </button>
            </div>  

        </form>

        <c:if test="${sessionScope.user ne null}">
            <li class="form-inline my-2 my-lg-0"><a class="nav-link text-danger" href="/PRJ321FA19B5_Assignment/logout">Log Out</a></li>        
        </c:if>
            
        </div>
        </nav>
                    
        <br>
    
    <p></p>
    </body>
</html>
