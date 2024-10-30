<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Ecomus - Ultimate HTML</title>

        <meta name="author" content="themesflat.com">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <!-- font -->
        <link rel="stylesheet" href="fonts/fonts.css">
        <!-- Icons -->
        <link rel="stylesheet" href="assets/fonts/font-icons.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/drift-basic.min.css">
        <link rel="stylesheet" href="assets/css/photoswipe.css">
        <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="assets/ss/animate.css">
        <link rel="stylesheet "type="text/css" href="assets/css/styles.css"/>
        <link rel="stylesheet" href="assets/css/header.css"/>
        <link rel="stylesheet" href="assets/css/Style_N.css"/>


        <!-- Favicon and Touch Icons  -->
        <link rel="shortcut icon" href="assets/images/logo/favicon.png">
        <link rel="apple-touch-icon-precomposed" href="assets/images/logo/favicon.png">

    </head>

    <body>


        <%@include file="./inc/header.jsp" %>


        <section id="prodetails" class="section-p1">
            <div class="container">
                <div class="row">
                    <!-- Product Image Section -->
                    <div class="col-md-6">
                        <div class="single-pro-img">
                            <img src="${product.thumbnail}" alt="${product.name}" id="MainImg" width="100%">
                        </div>
                    </div>

                    <!-- Product Details Form Section -->
                    <div class="col-md-6">
                        <form action="CartServlet" method="post" class="single-pro-details">
                            <input type="hidden" name="action" value="create"/>
                            <input type="hidden" name="productId" value="${product.id}"/>
                            <input type="hidden" name="price" value="${product.price}"/>

                            <!-- Product Name and Price -->
                            <h6>Home / T-Shirt</h6>
                            <h4>${product.name}</h4>
                            <h2>${product.price}</h2>

                            <!-- Quantity Selector -->
                            <label for="quantity">Quantity:</label>
                            <input name="quantity" type="number" value="1" min="1" required>

                            <!-- Add to Cart Button -->
                            <button class="normal" type="submit">Add To Cart</button>

                            <!-- Product Details Section -->
                            <h4>Product Details</h4>
                            <span>${product.description}</span>

                            <!-- QR Code Section -->
                            <div class="qr-code" style="margin-top: 20px;">
                                <c:set var="thumbnailUrl" value="${product.thumbnail}" />
                                <c:set var="nameUrl" value="${product.name}" />
                                <c:set var="priceUrl" value="${product.price}" />


                                <c:set var="qrCodeUrl" value="${thumbnailUrl} ${nameUrl} ${priceUrl}" />


                                <!-- QR Code Image -->
                                <img src="https://api.qrserver.com/v1/create-qr-code/?data=${qrCodeUrl}&size=100x100" alt="QR Code for ${product.name}" class="img-qr" />

                                <span class="tooltip">Scan for details</span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>



        <section id="product1" class="section-p1">
            <h2>New Arrivals</h2>
            <p>Summer Collection New Modern Design</p>
            <div class="prod-cont">
                <c:forEach items="${newsProductList}" var="product">
                    <div class="prod">
                        <a href="ProductServlet?productId=${product.id}">
                            <img src="${product.thumbnail}" alt="">
                        </a>
                        <div class="des">
                            <span>adidas</span>
                            <h5>${product.name}</h5>
                            <div class="star">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <h4>${product.price}</h4>
                        </div>
                        <a href="#"><i class="fa-solid fa-cart-shopping cart"></i></a>
                    </div>
                </c:forEach>
            </div>
        </section>




        <%@include file="./inc/forter.jsp" %>


    </body>

</html>
