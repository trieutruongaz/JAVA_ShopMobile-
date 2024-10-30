
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jstl/fmt"%><!DOCTYPE html>
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
        
        
        <section id="wrapper">
            <div class="form-box login">
                <form action="LoginServlet" method="post" onsubmit="hashPassword()">  
                    <h1>Login</h1>

                    <!-- Display error message if exists -->
                    <span class="error">${error}</span>
                    <c:remove var="error" scope="session"/>
                    <div class="input-box">
                        <input name="email" type="email" placeholder="Email" required>
                        <i class="fa-solid fa-user"></i>
                    </div>
                    <div class="input-box">
                        <input name="password" type="password" placeholder="Password" required id="passwordInput">
                        <i class="fa-solid fa-lock"></i>
                    </div>
                    <div class="remember-forgot">
                        <label><input type="checkbox">Remember Me</label>
                        <a href="#">Forgot Password</a>
                    </div>
                    <button type="submit" class="normal">Login</button>
                    <div class="register-link">
                        <p>Don't have an Account? <a href="RegisterServlet">Register</a></p>
                    </div>
                </form>

                <!-- OAuth 2.0 Login Buttons -->
                <div class="oauth-buttons">
                    <h2>Or Login With</h2>
                    <a href=" GoogleOAuthServlet" class="btn btn-danger">Login with Google</a>
                    <a href="FacebookOAuthServlet" class="btn btn-primary">Login with Facebook</a>
                </div>
            </div>
        </section>


       


        <%@include file="./inc/forter.jsp" %>
        
        
        
        <script>
            function hashPassword() {
                var passwordInput = document.getElementById('passwordInput');
                var hashedPassword = CryptoJS.MD5(passwordInput.value).toString();
                passwordInput.value = hashedPassword; // Set the hashed password back to the input
            }
        </script>

</body>
