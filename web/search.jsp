<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cara</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
              integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- font -->
        <link rel="stylesheet" href="assets/fonts/fonts.css">
        <!-- Icons -->
        <link rel="stylesheet" href="assets/fonts/font-icons.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet"type="text/css" href="assets/css/styles.css"/>
        <link rel="stylesheet" href="assets/css/header.css"/>
        <link rel="stylesheet" href="assets/css/Style_new.css"/>

        <!-- Favicon and Touch Icons  -->
        <link rel="shortcut icon" href="assets/images/logo/favicon.png">
        <link rel="apple-touch-icon-precomposed" href="assets/images/logo/favicon.png">
    </head>

    <body>

        <%@include file="./inc/header.jsp" %>

        <section id="page-header">
            <h2>${keyword}</h2>
            <p>Save more with coupons & up to 70% off!</p>
        </section>

        <section class="flat-spacing-1">
            <div class="container">
                <div class="grid-layout wrapper-shop" data-grid="grid-4">
                    <!-- card product 1 -->
                    <c:forEach items="${productList}" var="product">
                        <div class="card-product style-7">
                            <div class="card-product-wrapper">
                                <a href="ProductServlet?productId=${product.id}" class="product-img">
                                    <img class="lazyload img-product" data-src="${product.thumbnail}" src="${product.thumbnail}" alt="image-product">
                                    <img class="lazyload img-hover" data-src="${product.thumbnail}" src="${product.thumbnail}" alt="image-product">
                                </a>
                                <div class="list-product-btn">
                                    <a href="javascript:void(0);" class="box-icon wishlist bg_white round btn-icon-action">
                                        <span class="icon icon-heart"></span>
                                        <span class="tooltip">Add to Wishlist</span>
                                        <span class="icon icon-delete"></span>
                                    </a>
                                    <a href="#compare" data-bs-toggle="offcanvas" aria-controls="offcanvasLeft" class="box-icon compare bg_white round btn-icon-action">
                                        <span class="icon icon-compare"></span>
                                        <span class="tooltip">Add to Compare</span>
                                        <span class="icon icon-check"></span>
                                    </a>
                                    <a href="#quick_view" data-bs-toggle="modal" class="box-icon quickview bg_white round tf-btn-loading">
                                        <span class="icon icon-view"></span>
                                        <span class="tooltip">Quick View</span>
                                    </a>
                                </div>
                                <!--                            <div class="size-list">
                                                                <span>S</span>
                                                                <span>M</span>
                                                                <span>L</span>
                                                                <span>XL</span>
                                                            </div>-->

                            </div>
                            <div class="card-product-info">
                                <a href="#quick_add" data-bs-toggle="modal" class="btn-quick-add quick-add">QUICK ADD</a>
                                <a href="#" class="title link">${product.name}</a>
                                <span class="price">${product.price}</span>

                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        <section id="pagination" class="section-p1">
            <a href="#"><i class="fa-solid fa-arrow-left"></i></a> <!-- Previous arrow -->
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#"><i class="fa-solid fa-arrow-right"></i></a> <!-- Next arrow -->
        </section>


        <%@include file="./inc/forter.jsp" %>

    </body>

</html>
