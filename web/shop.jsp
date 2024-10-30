<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cara</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
              integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Custom Fonts -->
        <link rel="stylesheet" href="fonts/fonts.css">

        <!-- Custom Styles -->
        <link rel="stylesheet" href="assets/fonts/font-icons.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" type="text/css" href="assets/css/styles.css"/>
        <link rel="stylesheet" href="assets/css/header.css"/>
        <link rel="stylesheet" href="assets/css/Style_new.css"/>

        <!-- Favicon and Touch Icons  -->
        <link rel="shortcut icon" href="assets/images/logo/favicon.png">
        <link rel="apple-touch-icon-precomposed" href="assets/images/logo/favicon.png">
    </head>

    <body>
        <%@ include file="./inc/header.jsp" %>

        <div class="tf-page-title">
            <div class="container-full">
                <div class="row">
                    <div class="col-12">
                        <div class="heading text-center">New Arrival</div>
                        <p class="text-center text-2 text_black-2 mt_5">Shop through our latest selection of Fashion</p> 
                    </div>
                </div>
            </div>
        </div>


        <section class="flat-spacing-1">
            <div class="container">
                <div class="tf-shop-control grid-3 align-items-center"></div>

                <div class="grid-layout wrapper-shop" data-grid="grid-4">
                    <!-- card product 1 -->
                    <c:forEach items="${productList}" var="product" varStatus="status">
                        <!-- Gi?i h?n hi?n th? 12 s?n ph?m trên m?i trang -->
                        <c:if test="${status.index < 12}">
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
                                </div>
                                <div class="card-product-info">
                                    <!-- Tên danh m?c s?n ph?m s? ???c ?n ?i cho ??n khi hover -->
                                    <span class="category-name">${product.category.name}</span>
                                    <a href="javascript:void(0);" class="btn-quick-add quick-add" 
                                       data-product-id="${product.id}" 
                                       data-product-name="${product.name}" 
                                       data-product-price="${product.price}">
                                        QUICK ADD
                                    </a>

                                    <a href="ProductServlet?productId=${product.id}" class="title link">${product.name}</a>
                                    <span class="price">${product.price}</span>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <!-- Pagination -->
                <div id="pagination" class="section-p1">
                    <c:if test="${currentPage > 1}">
                        <a href="?categoryId=${category.id}&page=1" aria-label="First page">« First</a>
                        <a href="?categoryId=${category.id}&page=${currentPage - 1}" aria-label="Previous page">? Previous</a>
                    </c:if>

                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <a href="?categoryId=${category.id}&page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                    </c:forEach>

                    <c:if test="${currentPage < totalPages}">
                        <a href="?categoryId=${category.id}&page=${currentPage + 1}" aria-label="Next page">Next ?</a>
                        <a href="?categoryId=${category.id}&page=${totalPages}" aria-label="Last page">Last »</a>
                    </c:if>
                </div>
        </section>




        <%@ include file="./inc/forter.jsp" %>

        <!-- JavaScript Files -->
        <script type="text/javascript" src="assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="assets/js/carousel.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap-select.min.js"></script>
        <script type="text/javascript" src="assets/js/lazysize.min.js"></script>
        <script type="text/javascript" src="assets/js/count-down.js"></script>
        <script type="text/javascript" src="assets/js/wow.min.js"></script>
        <script type="text/javascript" src="assets/js/multiple-modal.js"></script>
        <script type="text/javascript" src="assets/js/main.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const quickAddButtons = document.querySelectorAll(".btn-quick-add");

                quickAddButtons.forEach(button => {
                    button.addEventListener("click", function (event) {
                        event.preventDefault(); // Prevent default anchor behavior

                        // Get product data from the button attributes
                        const productId = this.getAttribute("data-product-id");
                        const productName = this.getAttribute("data-product-name");
                        const productPrice = this.getAttribute("data-product-price");

                        // Populate the modal fields
                        document.getElementById("modal-productId").value = productId;
                        document.getElementById("modal-price").value = productPrice;

                        // Reset the quantity to 1
                        document.getElementById("quantity").value = 1;

                        // Show the modal
                        const modal = new bootstrap.Modal(document.getElementById("quickAddModal"));
                        modal.show();
                    });
                });

                // Handle the form submission for adding to the cart
                const form = document.getElementById("add-to-cart-form");
                form.addEventListener("submit", function (event) {
                    event.preventDefault(); // Prevent default form submission

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
                                document.getElementById("cart-count").innerText = data.cartCount;
                                alert("Item added to cart!"); // Feedback to user

                                // Reset the quantity to 1
                                document.getElementById("quantity").value = 1;

                                // Close the modal after adding to cart
                                const modal = bootstrap.Modal.getInstance(document.getElementById("quickAddModal"));
                                modal.hide();
                            })
                            .catch(error => {
                                console.error("There was a problem with the fetch operation:", error);
                            });
                });
            });
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.btn-quick-add').forEach(button => {
        button.addEventListener('click', function(event) {
             let quantity = 1; // Track the quantity of the product
            event.preventDefault(); // Prevent any default action (in case href exists)

            // Get product details from data attributes
            const productId = this.getAttribute('data-product-id');
            const productName = this.getAttribute('data-product-name');
            const productPrice = this.getAttribute('data-product-price');

            // Prepare data for the AJAX request
            const data = new URLSearchParams();
            data.append('action', 'create');
            data.append('productId', productId);
            data.append('name', productName);
            data.append('price', productPrice);
            data.append('quantity', 1); // Default quantity to 1

            // Send the AJAX POST request
            fetch('CartServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: data.toString()
            })
            .then(response => response.json())
            .then(data => {
                if (data.cartCount !== undefined) {
                    alert(`${productName} added to cart. Total items: ${data.cartCount}`);
                } else {
                    alert('Failed to add product to cart.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred while adding the product to the cart.');
            });
        });
    });
});

        </script>

    </body>
</html>
