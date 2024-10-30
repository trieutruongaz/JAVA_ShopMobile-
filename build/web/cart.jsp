<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
        <link rel="stylesheet" href="assets/css/cart.css"/>

        <!-- Favicon and Touch Icons  -->
        <link rel="shortcut icon" href="assets/images/logo/favicon.png">
        <link rel="apple-touch-icon-precomposed" href="assets/images/logo/favicon.png">

    </head>

    <body>

        <%@ include file="./inc/header.jsp" %>

        <section id="page-header" class="about-header">
            <h2>#let's_talk</h2>
            <p>LEAVE A MESSAGE, We love to hear from you!</p>
        </section>

        <section id="cart" class="section-p1">
            <table class="table table-striped" width="100%">
                <thead>
                    <tr>
                        <th>Remove</th>
                        <th>Image</th>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cart}" var="orderItem">
                        <tr>
                            <td>
                                <form action="CartServlet" method="post" class="form-inline">
                                    <input type="hidden" name="action" value="delete"/>
                                    <input type="hidden" name="productId" value="${orderItem.productId}"/>
                                    <button type="submit" class="btn btn-link text-danger" aria-label="Remove item">
                                        <i class="fa fa-trash" aria-hidden="true"></i> <!-- Trash icon -->
                                        <span class="remove-icon"></span> <!-- Text for clarity -->
                                    </button>
                                </form>
                            </td>
                            <td>
                                <img src="${orderItem.product.thumbnail}" alt="${orderItem.product.name}" style="max-width: 100px;"/>
                            </td>
                            <td>${orderItem.product.name}</td>
                            <td>$${orderItem.price}</td>
                            <td>
                                <form action="CartServlet" method="post" class="form-inline">
                                    <input type="hidden" name="action" value="update"/>
                                    <input type="hidden" name="productId" value="${orderItem.productId}"/>
                                    <input onchange="this.form.submit()" name="quantity" type="number" value="${orderItem.quantity}" min="1" class="form-control" aria-label="Quantity"/>
                                </form>
                            </td>
                            <td>$${orderItem.price * orderItem.quantity}</td>
                            <td>
                                <!-- QR Code Section -->
                                <c:set var="qrCodeUrl" value="ProductServlet?productId=${orderItem.productId}" />
                                <img src="https://api.qrserver.com/v1/create-qr-code/?data=${qrCodeUrl}&size=50x50" alt="QR Code for ${orderItem.product.name}" class="img-qr" />
                                <span class="tooltip">Scan for details</span>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </section>




        <section id="cart-add" class="section-p1">
            <div class="coupon">
                <h3>Apply Coupon</h3>
                <div>
                    <input type="text" placeholder="Enter Your Coupon" aria-label="Coupon Code">
                    <button class="normal">Apply</button>
                </div>
            </div>

            <div class="subtotal">
                <h3>Cart Total</h3>
                <table>
                    <tr>
                        <td>Cart Subtotal</td>
                        <td>$<span id="cartSubtotal">${total}</span></td>
                    </tr>
                    <tr>
                        <td>Shipping</td>
                        <td>Free</td>
                    </tr>
                    <tr>
                        <td><strong>Total</strong></td>
                        <td><strong>$<span id="cartTotal">${total}</span></strong></td>
                    </tr>
                </table>

                <!-- QR Code for Payment -->
                <div class="payment-qr">
                    <h4>Pay with QR Code</h4>
                    <c:set var="paymentUrl" value="PaymentServlet?total=${total}" />
                    <img src="https://api.qrserver.com/v1/create-qr-code/?data=${paymentUrl}&size=150x150" alt="Payment QR Code" class="img-qr" />
                    <span class="tooltip">Scan to pay</span>
                </div>

                <a href="CheckoutServlet" class="normal btn btn-success">Proceed to checkout</a>
            </div>
        </section>





        <%@ include file="./inc/forter.jsp" %>

    </body>

</html>
