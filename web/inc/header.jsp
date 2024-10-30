<%-- 
    Document   : header
    Created on : Sep 13, 2024, 2:13:48 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header">
    <div class="col-xl-3 col-md-4 col-6">
        <a href="HomeServlet" class="logo-header">
            <img src="assets/images/logo/logo.svg" alt="logo" class="logo">
        </a>
    </div>
    <a href="HomeServlet"><img src="./assets/img/logo.png" class="logo" alt=""></a>
    <ul id="navbar">
        <li><a class="active" href="HomeServlet">Home</a></li>
        <ul class="main-menu">
            <li>
                <a href="ShopServlet">Shop</a>
                <ul class="sub-name">
                    <c:forEach items="${categoryList}" var="category">
                        <li class="menu-item">
                            <a href="CategoryServlet?categoryId=${category.id}">${category.name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </li>
        </ul>


        <li><a href="BlogServlet">Blog</a></li>
        <li><a href="AboutServlet">About</a></li>
        <li><a href="ContactServlet">Contact</a></li>
       <ul class="navbar">
            <li>
                <a href="CartServlet" aria-label="View cart">
                    <i class="fa-solid fa-bag-shopping"></i>
                    <span id="cart-count">${cartCount}</span> <!-- Displaying the cart item count -->
                </a>
            </li>
        </ul>



        <li>
            <c:if test="${sessionScope.user == null}">
                <a href="UserServlet">Login</a> 
            </c:if>
            <c:if test="${sessionScope.user != null}">
                <a href="LogoutServlet">Logout</a>
            </c:if>
        </li>
    </ul>
</header>
