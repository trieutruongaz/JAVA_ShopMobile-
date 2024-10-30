<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jstl/fmt"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">


<!-- Mirrored from themesflat.co/html/ecomus/home-glasses.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 02 Sep 2024 12:30:13 GMT -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cara</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
            <!-- Swiper CSS -->
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

        <!-- Swiper JS -->
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- font -->
   <link rel="stylesheet" href="assets/fonts/fonts.css">
   <!-- Icons -->
   <link rel="stylesheet" href="assets/fonts/font-icons.css">
   <link rel="stylesheet" href="assets/css/bootstrap.min.css">
   <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
   <link rel="stylesheet" href="assets/css/animate.css">
   <link rel="stylesheet"type="text/css" href="assets/css/styles.css"/>
   <link rel="stylesheet" href="assets/css/header.css"/>
   <link rel="stylesheet" href="assets/css/slider.css"/>

    <!-- Favicon and Touch Icons  -->
    <link rel="shortcut icon" href="assets/images/logo/favicon.png">
<link rel="apple-touch-icon-precomposed" href="assets/images/logo/favicon.png">


</head>

<body>

    <%@include file="./inc/header.jsp" %>
    
    
    
    
    
    
     <!-- Slider -->
        <div class="tf-slideshow slider-effect-fade position-relative">
            <div class="swiper tf-sw-slideshow" data-preview="1" data-tablet="1" data-mobile="1" data-centered="false" data-space="0" data-loop="true" data-auto-play="false" data-delay="0" data-speed="1000">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="wrap-slider">
                            <img src="assets/images/slider/sneaker-1.jpg" alt="fashion-slideshow">
                            <div class="box-content">
                                <div class="container">
                                    <p class="fade-item fade-item-1 fw-8 mb_15">MUST HAVES</p>
                                    <h1 class="fade-item fade-item-2 fw-8">SUMMER SHOES</h1>
                                    <a href="ShopServlet" class="fade-item fade-item-3 tf-btn btn-fill animate-hover-btn btn-xl radius-3"><span>Shop collection <i class="icon icon-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="wrap-slider">
                            <img src="assets/images/slider/sneaker-2.jpg" alt="fashion-slideshow">
                            <div class="box-content">
                                <div class="container">
                                    <p class="fade-item fade-item-1 fw-8 mb_15">FREE SHIPPING</p>
                                    <h1 class="fade-item fade-item-2 fw-8">NIKE AIR MAX 1</h1>
                                    <a href="ShopServlet" class="fade-item fade-item-3 tf-btn btn-fill animate-hover-btn btn-xl radius-3"><span>Shop collection <i class="icon icon-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="wrap-slider">
                            <img src="assets/images/slider/sneaker-3.jpg" alt="fashion-slideshow">
                            <div class="box-content">
                                <div class="container">
                                    <p class="fade-item fade-item-1 fw-8 mb_15">10% OFF TODAY</p>
                                    <h1 class="fade-item fade-item-2 fw-8">STAN SMITH</h1>
                                    <a href="ShopServlet" class="fade-item fade-item-3 tf-btn btn-fill animate-hover-btn btn-xl radius-3"><span>Shop collection <i class="icon icon-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wrap-pagination">
                <div class="container">
                    <div class="sw-dots sw-pagination-slider rectangle-pagination"></div>
                </div>
            </div>
        </div>
        <!-- /Slider -->
        
         <!-- category -->
         <section class="flat-spacing-9">
             <div class="container">
                 <div class="position-relative">
                     <div class="sw-pagination-wrapper">
                         <div class="swiper tf-sw-collection" 
                              data-preview="4" 
                              data-tablet="3" 
                              data-mobile="1" 
                              data-space-lg="30" 
                              data-space-md="30" 
                              data-space="15" 
                              data-loop="true"
                              data-auto-play="true" 
                              data-autoplay-delay="3000">
                             <div class="swiper-wrapper">
                                 <c:forEach items="${categoryList}" var="category">
                                     <div class="swiper-slide" lazy="true">
                                         <div class="collection-item hover-img style-2">
                                             <div class="collection-inner">
                                                 <a href="CategoryServlet?categoryId=${category.id}" class="collection-image img-style radius-10">
                                                     <img class="lazyload" data-src="${category.thumbnail}" src="${category.thumbnail}" alt="${category.name} Collection">
                                                 </a>
                                                 <div class="collection-content justify-content-end align-items-center">
                                                     <div class="bottom">
                                                         <a href="CategoryServlet?categoryId=${category.id}" class="tf-btn collection-title hover-icon btn-light fs-14 fw-7 rounded-0">
                                                             <span>${category.name}</span>
                                                             <i class="icon icon-arrow1-top-left"></i>
                                                         </a>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </c:forEach>
                             </div>
                         </div>
                         <div class="box-sw-navigation">
                             <div class="sw-dots style-2 small sw-pagination-collection justify-content-center"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </section>




        <!-- /category -->
        
         <!-- brand -->
        <section class="flat-spacing-9 pt_0">
            <div class="container">
                <div class="swiper tf-sw-brand" data-loop="false" data-play="false" data-preview="6" data-tablet="3" data-mobile="2" data-space-lg="0" data-space-md="0">
                    <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="brand-item">
                                    <img class="lazyload" data-src="assets/images/brand/brand-01.png" src="assets/images/brand/brand-01.png" alt="image-brand">
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="brand-item">
                                    <img class="lazyload" data-src="assets/images/brand/brand-02.png" src="assets/images/brand/brand-02.png" alt="image-brand">
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="brand-item">
                                    <img class="lazyload" data-src="assets/images/brand/brand-03.png" src="assets/images/brand/brand-03.png" alt="image-brand">
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="brand-item">
                                    <img class="lazyload" data-src="assets/images/brand/brand-04.png" src="assets/images/brand/brand-04.png" alt="image-brand">
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="brand-item">
                                    <img class="lazyload" data-src="assets/images/brand/brand-05.png" src="assets/images/brand/brand-05.png" alt="image-brand">
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="brand-item">
                                    <img class="lazyload" data-src="assets/images/brand/brand-06.png" src="assets/images/brand/brand-06.png" alt="image-brand">
                                </div>
                            </div>
                    </div>
                </div>
                <div class="sw-dots style-2 sw-pagination-brand justify-content-center"></div>
            </div>
        </section>
        <!-- /brand -->

        
        <!-- Collection -->
        <section class="flat-spacing-14 pt_0">
            <div class="container">
                <div class="masonry-layout-v4 wow fadeInUp" data-wow-delay="0s">
                    <div class="item-1 collection-item-v2 hover-img">
                        <a href="shop-collection-sub.html" class="collection-inner">
                            <div class="collection-image img-style">
                                <img class="lazyload" data-src="assets/images/collections/sneaker-5.jpg" src="assets/images/collections/sneaker-5.jpg" alt="collection-img">
                            </div>
                            <div class="collection-content">
                                <div class="top wow fadeInUp" data-wow-delay="0s">
                                    <h5 class="heading text-white fw-7">MEN COLLECTION</h5>
                                    <p class="subheading text-white">Every piece is made to last beyond the season</p>
                                    <button class="tf-btn btn-line btn-line-light collection-other-link fw-6"><span>SHOP COLLECTION</span><i class="icon icon-arrow1-top-left"></i></button>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="item-2 collection-item-v2 hover-img">
                        <a href="shop-collection-sub.html" class="collection-inner">
                            <div class="collection-image img-style">
                                <img class="lazyload" data-src="assets/images/collections/sneaker-6.jpg" src="assets/images/collections/sneaker-6.jpg" alt="collection-img">
                            </div>
                            <div class="collection-content justify-content-end">
                                <div class="bottom wow fadeInUp" data-wow-delay="0s">
                                    <h5 class="heading text-white fw-7">WOMEN COLLECTION</h5>
                                    <button class="tf-btn btn-line btn-line-light collection-other-link fw-6"><span>SHOP COLLECTION</span><i class="icon icon-arrow1-top-left"></i></button>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="item-3 collection-item-v2 hover-img">
                        <a href="shop-collection-sub.html" class="collection-inner">
                            <div class="collection-image img-style">
                                <img class="lazyload" data-src="assets/images/collections/sneaker-7.jpg" src="assets/images/collections/sneaker-7.jpg" alt="collection-img">
                            </div>
                            <div class="collection-content justify-content-end">
                                <div class="bottom wow fadeInUp" data-wow-delay="0s">
                                    <h5 class="heading text-white fw-7">KID COLLECTION</h5>
                                    <button class="tf-btn btn-line btn-line-light collection-other-link fw-6"><span>SHOP COLLECTION</span><i class="icon icon-arrow1-top-left"></i></button>
                                </div>
                            </div>
                        </a>
                    </div> 
                </div>
            </div>
        </section>
        <!-- /Collection -->
        
        
  <section class="flat-spacing-12 pt_0">
            <div class="container">
                <div class="row align-items-center flex-md-row-reverse">
                    <div class="col-md-6">
                        <div class="collection-item-v2 hover-img">
                            <a href="shop-collection-sub.html" class="collection-inner">
                                <div class="collection-image img-style">
                                    <img class="lazyload" src="assets/images/collections/sneaker-8.jpg" alt="collection-img">
                                </div>
                                <div class="collection-content justify-content-end">
                                    <div class="bottom wow fadeInUp" data-wow-delay="0s">
                                        <h5 class="heading text-white fw-7">SEASON COLLECTION</h5>
                                        <p class="subheading text-white">Every piece is made to last beyond the season</p>
                                        <button class="tf-btn btn-line btn-line-light collection-other-link fw-6"><span>SHOP COLLECTION</span><i class="icon icon-arrow1-top-left"></i></button>
                                    </div>
                                </div>
                            </a>
                        </div> 
                    </div>
                    <div class="col-md-6">
                        
                    <div class="tf-grid-layout tf-col-2 gap30 row-gap-10">
                        <c:forEach items="${newsProductList}" var="product" varStatus="status">
                            <c:if test="${status.index < 4}"> <!-- Limit to first 4 products -->
                                <div class="card-product">
                                    <div class="card-product-wrapper rounded-0">
                                        <a href="ProductServlet?productId=${product.id}">
                                            <img class="lazyload img-product" data-src="${product.thumbnail}" alt="image-product">
                                            <img class="lazyload img-hover" data-src="${product.thumbnail}" alt="image-product">
                                        </a>
                                        <div class="list-product-btn absolute-2">
                                            <!-- Product Item -->
                                            <form action="CartServlet" method="post" class="single-pro-details add-to-cart-form">
                                                <input type="hidden" name="action" value="create" />
                                                <input type="hidden" name="productId" value="${product.id}" />
                                                <input type="hidden" name="price" value="${product.price}" />
                                                <input type="hidden" name="quantity" value="1" /> <!-- Default quantity -->

                                                <!-- Add to Cart Button -->
                                                <button class="box-icon quick-add tf-btn-loading" type="submit" aria-label="Add to cart">
                                                    <span class="icon icon-bag"></span>
                                                    <span class="tooltip">Add to cart</span>
                                                </button>
                                            </form>



                                            <a href="javascript:void(0);" class="box-icon wishlist btn-icon-action">
                                                <span class="icon icon-heart"></span>
                                                <span class="tooltip">Add to Wishlist</span>
                                                <span class="icon icon-delete"></span>
                                            </a>
                                            
                                            <a href="#quick_view" data-bs-toggle="modal" class="box-icon quickview tf-btn-loading">
                                                <span class="icon icon-view"></span>
                                                <span class="tooltip">Quick View</span>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="card-product-info">
                                        <a href="product-detail.html" class="title link fw-8">${product.name}</a>
                                        <span class="price fw-6">${product.price}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                         
                    </div>
                </div>
            </div>
        </section>
        
        
         <!-- lookbook -->
        <section>
            <div class="container">
                <div class="wrap-lookbook lookbook-sneaker">
                    <div class="image radius-10 o-hidden">
                        <img class="lazyload" data-src="assets/images/collections/sneaker-lb.jpg" src="assets/images/collections/sneaker-lb.jpg" alt="image-lookbook">
                    </div>
                    <div class="lookbook-item item-1">
                        <div class="inner">
                            <div class="btn-group dropdown dropup dropdown-center">
                                <button class="tf-pin-btn pin-black" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span></span>
                                </button>
                                <ul class="dropdown-menu p-0 border-0">
                                    <li>
                                        <div class="lookbook-product">
                                            <a href="product-detail.html" class="image">
                                                <img class="lazyload" data-src="assets/images/products/sneaker-2.jpg" src="assets/images/products/sneaker-2.jpg" alt="lookbook-item">
                                            </a>
                                            <div class="content-wrap">
                                                <div class="product-title">
                                                    <a href="product-detail.html" class="fw-8">REGULAR FIT WINDBREAKER</a>
                                                </div>
                                                <div class="price">$130.00</div>
                                            </div>
                                            <a href="#quick_view" data-bs-toggle="modal" class=""><i class="icon-view"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="lookbook-item item-2">
                        <div class="inner">
                            <div class="btn-group dropdown dropup dropdown-center">
                                <button class="tf-pin-btn pin-black" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span></span>
                                </button>
                                <ul class="dropdown-menu p-0 border-0">
                                    <li>
                                        <div class="lookbook-product">
                                            <a href="product-detail.html" class="image">
                                                <img class="lazyload" data-src="assets/images/products/sneaker-1.png" src="assets/images/products/sneaker-1.png" alt="">
                                            </a>
                                            <div class="content-wrap">
                                                <div class="product-title">
                                                    <a href="product-detail.html" class="fw-8">POLAR NIGHT PACK 2 FUSION 2.0</a>
                                                </div>
                                                <div class="price">$99.00</div>
                                            </div>
                                            <a href="#quick_view" data-bs-toggle="modal" class=""><i class="icon-view"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- lookbook -->


         <!-- Banner Collection -->
        <section class="flat-spacing-18">
            <div class="container">
                <div class="tf-grid-layout md-col-2 tf-img-with-text style-5">
                    <div class="d-flex gap-30">
                        <div class="tf-image-wrap wow fadeInUp" data-wow-delay="0s">
                            <img class="lazyload" data-src="assets/images/collections/banner-sneaker-1.jpg" src="assets/images/collections/banner-sneaker-1.jpg" alt="collection-img">
                        </div> <div class="tf-image-wrap wow fadeInUp" data-wow-delay="0s">
                            <img class="lazyload" data-src="assets/images/collections/banner-sneaker-2.jpg" src="assets/images/collections/banner-sneaker-2.jpg" alt="collection-img">
                        </div>
                    </div>
                    <div class="tf-content-wrap wow fadeInUp" data-wow-delay="0s">
                        <div class="sub-heading fw-7">ABOUT US</div>
                        <div class="heading fw-7 fs-42">A SERVICE-FIRST HOME FOR CONTEMPORARY STYLE</div>
                        <p class="description text_black-2 fs-16">Rooted in Amsterdam street culture we?ve always supported local initiatives, creatives and athletes from day one. Working on unique collaborations with both local and international brands and hosting regular events and parties in our shops for our community. Something we?ll continue doing wherever we go.</p>
                        <a href="shop-collection-list.html" class="tf-btn btn-line collection-other-link fw-6"><span>SHOP COLLECTION</span><i class="icon icon-arrow1-top-left"></i></a>
                    </div>
                </div>
            </div>
        </section>
        <!-- /Banner Collection -->
        
        
        <!-- Subscribe -->
        <section class="flat-spacing-24 pb_0 tf-slideshow tf-form-sneaker">
            <div class="banner-wrapper">
                <img class="lazyload" data-src="assets/images/slider/bg-sneaker.jpg" src="assets/images/slider/bg-sneaker.jpg" alt="collection-img">
                <div class="container-full">
                    <div class="box-content bg_white">
                        <div class="flat-title text-center mb_1 wow fadeInUp" data-wow-delay="0s">
                            <span class="title text_black fw-7">BECOME PART <br> OF THE ECOMUS DISTRICT </span>
                            <p class="sub-title text_black">Promotions, new products and sales. Directly to your inbox.</p>
                        </div>
                        <div class="flat-subscrite-wrap">
                            <form class="form-newsletter" id="subscribe-form" action="#" method="post" accept-charset="utf-8" data-mailchimp="true">
                                <div id="subscribe-content" class="subscribe-content">
                                    <fieldset class="email">
                                        <input type="email" name="email-form" id="subscribe-email" placeholder="Enter email address" tabindex="0" aria-required="true">
                                    </fieldset>
                                    <div class="button-submit">
                                        <button id="subscribe-button" class="tf-btn mt-0 bg-yellow-9 text_black btn-sm animate-hover-btn text-uppercase letter-2 fw-6" type="button">Subscribe</button>
                                    </div>
                                </div>
                                <div id="subscribe-msg"></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /Subscribe -->
        
        
        
        <!-- iconbox -->
        <section class="flat-spacing-27">

            <div class="container">
                <div class="flat-iconbox-v3">
                    <div class="wrap-carousel wrap-mobile">
                        <div class="swiper tf-sw-mobile" data-preview="1" data-space="15">
                            <div class="swiper-wrapper wrap-iconbox">
                                <div class="swiper-slide">
                                    <div class="tf-icon-box small text-center">
                                        <div class="icon w-50 no-border">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40" fill="none">
                                                <path d="M2.65596 18.3125C2.24256 21.7473 2.92967 25.3467 4.43932 28.2915C-3.3167 39.5079 1.30657 43.6922 12.3244 36.1638C16.92 38.5861 23.1848 38.6619 27.8457 36.3432C31.2954 38.5939 34.3735 40 36.4923 40C40.2207 39.7958 39.8817 36.3737 37.78 32.1603C37.9339 32.1979 39.111 32.6404 39.2506 32.6127C40.0314 32.6255 40.2313 31.4718 39.4747 31.2307L36.6384 30.2855C36.5501 30.2557 36.4567 30.2437 36.3638 30.2502C36.2708 30.2566 36.18 30.2814 36.0967 30.323C36.0133 30.3647 35.939 30.4224 35.878 30.4928C35.817 30.5633 35.7706 30.6451 35.7414 30.7336L34.7962 33.57C34.5168 34.4556 35.8272 34.9009 36.1413 34.0188L36.5341 32.8389C40.3519 40.6616 35.7563 39.4739 29.2872 35.5732C37.0284 31.2342 40.3972 20.4504 36.1073 12.3803C39.4003 7.40316 40.9815 3.16209 39.2031 1.3837C37.9736 0.154135 35.5861 0.42288 32.1037 2.17504L32.5193 0.927043C32.8001 0.0399718 31.4826 -0.401791 31.1748 0.480316L30.2296 3.31667C30.1703 3.49496 30.1842 3.68949 30.2682 3.85754C30.3523 4.02559 30.4996 4.15342 30.6778 4.21296C30.665 4.21225 33.8828 5.30212 33.7382 5.19434C34.5196 5.2064 34.7196 4.05554 33.9623 3.81233L32.783 3.41949C40.7319 -0.466318 39.3797 4.3718 35.3216 10.9784C30.7423 3.23584 19.8173 0.16548 11.7997 4.74974C1.59162 -3.11122 -4.55193 0.639861 4.15923 12.9312C3.37443 14.6336 2.86694 16.4498 2.65596 18.3125ZM3.98763 21.2751C5.25619 23.1925 7.46713 24.7922 9.23986 25.9388C9.74331 26.2621 10.2652 26.5961 10.512 27.023C11.0282 27.9171 10.3134 29.1736 9.98298 29.6714C9.52491 30.35 9.00799 30.9882 8.61444 31.7178C5.94401 28.9878 4.22234 25.3289 3.98763 21.2751ZM2.3312 38.2563C1.57957 37.5047 1.90716 34.7974 5.20088 29.6508C6.64318 31.9732 8.60069 33.9324 10.9218 35.3767C6.41768 38.2386 3.24876 39.1739 2.3312 38.2563ZM20.2662 36.6311C17.997 36.6324 15.7527 36.1572 13.6788 35.2363C15.4605 33.9744 17.1882 32.6377 18.8572 31.23C18.4995 30.9188 18.144 30.6052 17.7908 30.289C15.8067 31.9483 13.9425 33.3523 12.2386 34.5102C11.3359 33.9973 10.484 33.3997 9.69438 32.7255C10.0262 31.9625 10.6758 31.1903 11.1636 30.4571C12.8215 28.0561 12.2003 25.9012 10.0106 24.7489C7.7529 23.3343 4.81727 21.017 4.08123 18.3423C4.25354 16.9305 4.60596 15.574 5.1165 14.2955C10.5269 21.8161 18.931 30.1607 26.4587 35.4065C24.4947 36.2164 22.3906 36.6325 20.2662 36.6311ZM31.6102 32.0235C31.2656 31.213 30.3672 30.1763 30.5324 29.3927C30.8288 28.3809 32.3668 27.681 32.9561 26.7074C34.3771 24.3178 33.1163 22.9017 36.4817 22.0607C36.0668 25.9522 34.2771 29.4367 31.6102 32.0235ZM32.7774 13.3935C33.3985 12.827 33.685 12.0683 33.8197 11.2613C34.0445 11.5974 34.2551 11.9435 34.4558 12.2966C31.7166 16.471 25.9198 23.0428 21.0122 27.4633C21.371 27.7817 21.7283 28.0979 22.08 28.3993C26.838 24.054 31.7591 18.611 35.1826 13.7389C36.1247 15.8588 36.5983 18.157 36.571 20.4766C35.635 20.956 34.5231 21.0779 33.6758 21.7899C32.8093 22.5089 32.5668 23.4938 32.3526 24.3632C32.2108 24.9375 32.0782 25.4793 31.7839 25.9076C31.0082 26.9691 29.4546 27.6264 29.1461 29.0885C28.8015 30.6195 30.0566 31.7533 30.4842 33.0204C29.6922 33.6595 28.8423 34.2233 27.9456 34.7045C21.3582 30.5627 10.19 19.5031 5.79794 12.81C6.48294 11.4966 7.34286 10.2822 8.35421 9.19999C9.06117 11.7428 11.7862 14.4068 14.4056 12.5589C14.7934 12.2576 15.0806 11.8265 15.4338 11.5563C15.7876 11.3081 16.2577 11.2918 16.5789 11.3195C17.5078 11.3492 17.6468 12.1065 17.9546 12.9121C18.5048 14.4281 19.2763 15.5095 20.252 16.1292C21.5319 16.9475 23.3068 16.822 24.2718 15.6272C24.7484 15.0677 24.9207 14.2615 25.3454 13.7339C25.8758 13.1262 26.8465 13.2461 27.138 13.2985C28.9171 13.7651 31.2755 14.838 32.7774 13.3935ZM20.2662 4.01229C25.1419 4.01229 29.5212 6.1658 32.5122 9.56801C32.6044 14.014 30.2417 12.6447 27.3833 11.9009C26.1126 11.6719 24.9788 12.0002 24.2761 12.8015C23.7556 13.3815 23.5918 14.1672 23.1678 14.7351C21.5362 16.1881 19.9088 14.2778 19.2862 12.4263C19.0182 11.696 18.7686 10.8791 18.0609 10.3679C16.9526 9.65452 15.5664 9.77435 14.6148 10.3983C14.173 10.7061 13.8964 11.1358 13.5213 11.4485C12.7584 12.0555 11.5536 11.6329 10.8736 10.8919C10.2163 10.18 9.82769 9.17588 9.48308 8.1009C12.3599 5.55952 16.1343 4.013 20.2662 4.013V4.01229ZM1.69869 2.38777C2.46664 1.61982 5.26541 1.97224 10.6219 5.45954C8.26849 6.99144 6.31024 9.05757 4.90661 11.4896C1.78804 6.71321 0.744967 3.33936 1.69798 2.38635L1.69869 2.38777Z" fill="black"></path>
                                            </svg>
                                        </div>
                                        <div class="content">
                                            <div class="title fs-14 fw-7">FREE SHIPPING</div>
                                            <p>You will love at great low prices</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="tf-icon-box small text-center">
                                        <div class="icon w-50 no-border">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="" width="34" height="40" viewBox="0 0 34 40"><path d="M33.3333 18.6667H32.6667V10C32.6667 9.82319 32.5964 9.65362 32.4714 9.52859C32.3464 9.40357 32.1768 9.33333 32 9.33333H24V3.33333C23.9989 2.4496 23.6474 1.60237 23.0225 0.97748C22.3976 0.352588 21.5504 0.00105857 20.6667 0H3.33333C2.4496 0.00105857 1.60237 0.352588 0.97748 0.97748C0.352588 1.60237 0.00105857 2.4496 0 3.33333V36.6667C0.00105857 37.5504 0.352588 38.3976 0.97748 39.0225C1.60237 39.6474 2.4496 39.9989 3.33333 40H20.6667C21.5504 39.9989 22.3976 39.6474 23.0225 39.0225C23.6474 38.3976 23.9989 37.5504 24 36.6667V30.6667H32C32.1768 30.6667 32.3464 30.5964 32.4714 30.4714C32.5964 30.3464 32.6667 30.1768 32.6667 30V25.3333H33.3333C33.5101 25.3333 33.6797 25.2631 33.8047 25.1381C33.9298 25.013 34 24.8435 34 24.6667V19.3333C34 19.1565 33.9298 18.987 33.8047 18.8619C33.6797 18.7369 33.5101 18.6667 33.3333 18.6667ZM31.3333 13.3333H11.3333C10.9797 13.3333 10.6406 13.1929 10.3905 12.9428C10.1405 12.6928 10 12.3536 10 12C10 11.6464 10.1405 11.3072 10.3905 11.0572C10.6406 10.8071 10.9797 10.6667 11.3333 10.6667H31.3333V13.3333ZM8 1.33333H16V2C16 2.17681 15.9298 2.34638 15.8047 2.4714C15.6797 2.59643 15.5101 2.66667 15.3333 2.66667H8.66667C8.48986 2.66667 8.32029 2.59643 8.19526 2.4714C8.07024 2.34638 8 2.17681 8 2V1.33333ZM22.6667 36.6667C22.6667 37.1971 22.456 37.7058 22.0809 38.0809C21.7058 38.456 21.1971 38.6667 20.6667 38.6667H3.33333C2.8029 38.6667 2.29419 38.456 1.91912 38.0809C1.54405 37.7058 1.33333 37.1971 1.33333 36.6667V3.33333C1.33333 2.8029 1.54405 2.29419 1.91912 1.91912C2.29419 1.54405 2.8029 1.33333 3.33333 1.33333H6.66667V2C6.66667 2.53043 6.87738 3.03914 7.25245 3.41421C7.62753 3.78929 8.13623 4 8.66667 4H15.3333C15.8638 4 16.3725 3.78929 16.7475 3.41421C17.1226 3.03914 17.3333 2.53043 17.3333 2V1.33333H20.6667C21.1971 1.33333 21.7058 1.54405 22.0809 1.91912C22.456 2.29419 22.6667 2.8029 22.6667 3.33333V9.33333H11.3333C10.6261 9.33333 9.94781 9.61429 9.44772 10.1144C8.94762 10.6145 8.66667 11.2928 8.66667 12V27.3333C8.66773 28.2171 9.01925 29.0643 9.64415 29.6892C10.269 30.3141 11.1163 30.6656 12 30.6667H22.6667V36.6667ZM31.3333 29.3333H12C11.4696 29.3333 10.9609 29.1226 10.5858 28.7475C10.2107 28.3725 10 27.8638 10 27.3333V14.296C10.4036 14.5359 10.8638 14.6639 11.3333 14.6667H31.3333V18.6667H28C27.4696 18.6667 26.9609 18.8774 26.5858 19.2525C26.2107 19.6275 26 20.1362 26 20.6667V23.3333C26 23.8638 26.2107 24.3725 26.5858 24.7475C26.9609 25.1226 27.4696 25.3333 28 25.3333H31.3333V29.3333ZM32.6667 24H28C27.8232 24 27.6536 23.9298 27.5286 23.8047C27.4036 23.6797 27.3333 23.5101 27.3333 23.3333V20.6667C27.3333 20.4899 27.4036 20.3203 27.5286 20.1953C27.6536 20.0702 27.8232 20 28 20H32.6667V24Z"></path><path d="M28.6667 21.3333H30V22.6667H28.6667V21.3333ZM18.6667 20H20C20.1768 20 20.3464 20.0702 20.4714 20.1953C20.5964 20.3203 20.6667 20.4899 20.6667 20.6667H22C22 20.1362 21.7893 19.6275 21.4142 19.2525C21.0391 18.8774 20.5304 18.6667 20 18.6667V17.3333H18.6667V18.6667C18.1362 18.6667 17.6275 18.8774 17.2525 19.2525C16.8774 19.6275 16.6667 20.1362 16.6667 20.6667C16.6667 21.1971 16.8774 21.7058 17.2525 22.0809C17.6275 22.456 18.1362 22.6667 18.6667 22.6667H20C20.1768 22.6667 20.3464 22.7369 20.4714 22.8619C20.5964 22.987 20.6667 23.1565 20.6667 23.3333C20.6667 23.5101 20.5964 23.6797 20.4714 23.8047C20.3464 23.9298 20.1768 24 20 24H18.6667C18.4899 24 18.3203 23.9298 18.1953 23.8047C18.0702 23.6797 18 23.5101 18 23.3333H16.6667C16.6667 23.8638 16.8774 24.3725 17.2525 24.7475C17.6275 25.1226 18.1362 25.3333 18.6667 25.3333V26.6667H20V25.3333C20.5304 25.3333 21.0391 25.1226 21.4142 24.7475C21.7893 24.3725 22 23.8638 22 23.3333C22 22.8029 21.7893 22.2942 21.4142 21.9191C21.0391 21.544 20.5304 21.3333 20 21.3333H18.6667C18.4899 21.3333 18.3203 21.2631 18.1953 21.1381C18.0702 21.013 18 20.8435 18 20.6667C18 20.4899 18.0702 20.3203 18.1953 20.1953C18.3203 20.0702 18.4899 20 18.6667 20Z"></path></svg>
                                        </div>
                                        <div class="content">
                                            <div class="title fs-14 fw-7">FLEXIBLE PAYMENT</div>
                                            <p>Pay with Multiple Credit Cards</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="tf-icon-box small text-center">
                                        <div class="icon w-50 no-border">
                                           <svg xmlns="http://www.w3.org/2000/svg" class="" width="37" height="40" viewBox="0 0 37 40"><path d="M35.9785 18.334C35.5959 14.344 33.9017 10.5934 31.1608 7.6687C28.4198 4.74402 24.7869 2.81027 20.8301 2.16992L22.2507 1.13175C22.3178 1.0838 22.3747 1.02302 22.4181 0.952927C22.4616 0.882839 22.4907 0.804832 22.5039 0.723416C22.517 0.642 22.5139 0.55879 22.4946 0.478594C22.4754 0.398398 22.4405 0.322808 22.3919 0.256192C22.3433 0.189576 22.2819 0.133255 22.2114 0.0904861C22.1409 0.0477168 22.0626 0.0193468 21.9811 0.00701582C21.8995 -0.00531517 21.8164 -0.00136257 21.7363 0.0186452C21.6563 0.0386529 21.5811 0.0743189 21.515 0.123582L18.8379 2.0766C18.7714 2.12484 18.7152 2.18569 18.6722 2.25569C18.6293 2.32568 18.6006 2.40345 18.5878 2.48454C18.5749 2.56563 18.5782 2.64846 18.5974 2.72829C18.6166 2.80812 18.6513 2.88339 18.6996 2.9498L20.7909 5.81601C20.8894 5.94785 21.036 6.0355 21.1987 6.05993C21.3615 6.08436 21.5273 6.0436 21.6602 5.94649C21.7931 5.84938 21.8823 5.70377 21.9085 5.54127C21.9346 5.37878 21.8956 5.21253 21.7999 5.07863L20.5734 3.39473C24.2695 3.97923 27.6664 5.77585 30.2298 8.50196C32.7931 11.2281 34.3775 14.729 34.7337 18.454C34.9449 20.6472 34.7221 22.8605 34.078 24.9676C33.4338 27.0746 32.3809 29.0342 30.9794 30.7343C29.578 32.4344 27.8553 33.8419 25.9099 34.8762C23.9644 35.9106 21.8343 36.5516 19.6411 36.7627C19.559 36.7666 19.4785 36.7866 19.4042 36.8216C19.3299 36.8566 19.2632 36.9059 19.2079 36.9667C19.1526 37.0275 19.1098 37.0985 19.082 37.1758C19.0542 37.2531 19.0419 37.3352 19.0458 37.4172C19.0497 37.4993 19.0697 37.5798 19.1047 37.6541C19.1397 37.7284 19.1889 37.7952 19.2497 37.8504C19.3105 37.9057 19.3816 37.9485 19.4589 37.9763C19.5362 38.0041 19.6182 38.0164 19.7003 38.0125C19.7205 38.0138 19.7408 38.0138 19.7611 38.0125C22.1182 37.7857 24.4075 37.0967 26.4983 35.9849C28.5891 34.8731 30.4404 33.3603 31.9464 31.5329C33.4524 29.7055 34.5836 27.5993 35.2755 25.3346C35.9673 23.0699 36.2062 20.6911 35.9785 18.334ZM17.3765 37.051L15.2851 34.1848C15.1873 34.0509 15.0404 33.9613 14.8765 33.9358C14.7127 33.9102 14.5454 33.9508 14.4115 34.0486C14.2776 34.1464 14.188 34.2934 14.1625 34.4572C14.1369 34.621 14.1775 34.7883 14.2753 34.9222L15.5251 36.6286C11.4806 36.0169 7.79916 33.9478 5.17393 30.8108C2.5487 27.6739 1.16073 23.6855 1.27133 19.5965C1.38193 15.5074 2.98347 11.5999 5.77443 8.60944C8.5654 5.61898 12.3533 3.75192 16.4249 3.35973C16.5899 3.34391 16.7418 3.26323 16.8473 3.13541C16.9527 3.0076 17.0031 2.84313 16.9873 2.67818C16.9805 2.59608 16.9573 2.51618 16.919 2.44321C16.8808 2.37024 16.8283 2.30568 16.7647 2.25333C16.7011 2.20098 16.6276 2.16191 16.5487 2.13842C16.4697 2.11494 16.3868 2.10752 16.305 2.1166C11.9371 2.53301 7.87129 4.52924 4.87076 7.7306C1.87023 10.932 0.141231 15.1184 0.00827872 19.5041C-0.124674 23.8897 1.34756 28.1732 4.14866 31.5504C6.94976 34.9277 10.8871 37.1665 15.2218 37.8467L13.8237 38.8682C13.7566 38.9162 13.6997 38.977 13.6562 39.0471C13.6128 39.1172 13.5836 39.1952 13.5705 39.2766C13.5574 39.358 13.5605 39.4412 13.5797 39.5214C13.599 39.6016 13.6339 39.6772 13.6825 39.7438C13.7311 39.8104 13.7924 39.8667 13.863 39.9095C13.9335 39.9523 14.0118 39.9807 14.0933 39.993C14.1748 40.0053 14.258 40.0014 14.338 39.9814C14.418 39.9613 14.4933 39.9257 14.5594 39.8764L17.2365 37.9242C17.3028 37.8759 17.3589 37.8149 17.4017 37.7449C17.4444 37.6748 17.473 37.597 17.4857 37.5159C17.4984 37.4348 17.4949 37.3521 17.4756 37.2723C17.4563 37.1925 17.4215 37.1173 17.3731 37.051H17.3765Z"></path><path d="M27.2482 10.1603H8.81781C8.65208 10.1603 8.49314 10.2262 8.37594 10.3433C8.25875 10.4605 8.19291 10.6195 8.19291 10.7852V29.2156C8.19291 29.3814 8.25875 29.5403 8.37594 29.6575C8.49314 29.7747 8.65208 29.8405 8.81781 29.8405H27.2482C27.414 29.8405 27.5729 29.7747 27.6901 29.6575C27.8073 29.5403 27.8731 29.3814 27.8731 29.2156V10.7852C27.8731 10.6195 27.8073 10.4605 27.6901 10.3433C27.5729 10.2262 27.414 10.1603 27.2482 10.1603ZM16.1167 11.4101H19.9494V15.6486H16.1167V11.4101ZM26.6233 28.5907H9.44272V11.4101H14.8669V16.2735C14.8669 16.4392 14.9327 16.5982 15.0499 16.7154C15.1671 16.8326 15.326 16.8984 15.4918 16.8984H20.5743C20.74 16.8984 20.899 16.8326 21.0161 16.7154C21.1333 16.5982 21.1992 16.4392 21.1992 16.2735V11.4101H26.6233V28.5907Z"></path></svg>
                                        </div>
                                        <div class="content">
                                            <div class="title fs-14 fw-7">14 DAY RETURNS</div>
                                            <p>Within 30 days for an exchange</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sw-dots style-2 sw-pagination-mb justify-content-center"></div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /iconbox -->



   

    <%@include file="./inc/forter.jsp" %>




--></body>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- Javascript -->
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="assets/js/carousel.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="assets/js/lazysize.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="assets/js/count-down.js"></script>
    <script type="text/javascript" src="assets/js/wow.min.js"></script>
    <script type="text/javascript" src="assets/js/multiple-modal.js"></script>
    <script type="text/javascript" src="assets/js/main.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
    // Select all forms with the class 'add-to-cart-form'
    const forms = document.querySelectorAll(".add-to-cart-form");

    forms.forEach(form => {
        form.addEventListener("submit", function(event) {
            event.preventDefault(); // Prevent the default form submission

            // Use Fetch API to send the form data
            fetch("CartServlet", {
                method: "POST",
                body: new URLSearchParams(new FormData(form)),
                headers: {
                    "X-Requested-With": "XMLHttpRequest" // Indicate it's an AJAX request
                }
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok.");
                }
                return response.json(); // Parse JSON response
            })
            .then(data => {
                // Update the cart count display
                if (data.cartCount !== undefined) {
                    document.getElementById("cart-count").innerText = data.cartCount;
                    alert("Item added to cart!"); // Optional feedback to user
                } else {
                    alert("Failed to update cart. Please try again."); // Error feedback
                }
            })
            .catch(error => {
                console.error("There was a problem with the fetch operation:", error);
                alert("There was an error adding the item to the cart."); // User-friendly error message
            });
        });
    });
});


</script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const swiper = new Swiper('.tf-sw-collection', {
            loop: true, // Cho phép quay tròn
            autoplay: {
                delay: 3000, // Thay ??i th?i gian t? ??ng phát
                disableOnInteraction: false,
            },
            pagination: {
                el: '.sw-pagination-collection',
                clickable: true,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            
        });
    });
</script>
    <script> {
    slidesPerView: 5,   // Hi?n th? 5 slide
    spaceBetween: 1,    // Kho?ng cách gi?a các slide
    
    
            
};
</script>
    <script>
    const swiper = new Swiper('.tf-sw-collection', {
    loop: true,
    
    on: {
        slideChange: function () {
            // ??m b?o hi?u ?ng xu?t hi?n ch? khi slide là active
            const slides = document.querySelectorAll('.swiper-slide');
            slides.forEach(slide => {
                slide.classList.remove('swiper-slide-active');
            });
            slides[this.activeIndex].classList.add('swiper-slide-active');
        }
    }
});
</script>



</html>
