<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Bootstrap Admin Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="./assets/admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="./assets/admin/css/style.css" rel="stylesheet">
        <link href="./assets/admin/css/New_Style.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Sidebar Start -->
            <%@include file="../inc/sidebar.jsp" %>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file="../inc/navbar.jsp" %>
                <!-- Navbar End -->


                <!-- Table Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-12">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Add New Product</h6>

                                <!-- Display error message if any -->
                                <span class="text-danger">${error}</span>
                                <!-- Remove the error from the session once displayed -->
                                <c:remove var="error" scope="session"/>

                                <!-- Form for creating a new product -->
                                <form action="CreateProductServlet" method="post">
                                    <!-- Name Field -->
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name:</label>
                                        <input name="name" type="text" class="form-control" id="name" placeholder="Enter product name" required>
                                    </div>

                                    <!-- Description Field -->
                                    <div class="mb-3">
                                        <label for="description" class="form-label">Description:</label>
                                        <textarea name="description" class="form-control" id="description" rows="4" placeholder="Enter product description"></textarea>
                                    </div>

                                    <!-- Thumbnail Field -->
                                    <div class="mb-3">
                                        <label for="thumbnail" class="form-label">Thumbnail URL:</label>
                                        <input name="thumbnail" type="text" class="form-control" id="thumbnail" placeholder="Enter image URL for thumbnail" required>
                                    </div>

                                    <!-- Price Field -->
                                    <div class="mb-3">
                                        <label for="price" class="form-label">Price:</label>
                                        <input name="price" type="text" class="form-control" id="price" placeholder="Enter product price" required>
                                    </div>

                                    <!-- Quantity Field -->
                                    <div class="mb-3">
                                        <label for="quantity" class="form-label">Quantity:</label>
                                        <input name="quantity" type="text" class="form-control" id="quantity" placeholder="Enter available quantity" required>
                                    </div>

                                    <!-- Category Field -->
                                    <div class="mb-3">
                                        <label for="category" class="form-label">Category:</label>
                                        <select name="categoryId" class="form-control" id="category" required>
                                            <!-- Loop through the categories and populate the dropdown -->
                                            <c:forEach items="${categoryList}" var="category">
                                                <option value="${category.id}">${category.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <!-- Submit Button -->
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>



                <!-- Table End -->


                <!-- Footer Start -->
                <%@include file="../inc/forter.jsp" %>
                <!-- Footer End -->
            </div>
            <!-- Content End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/admin/lib/chart/chart.min.js"></script>
        <script src="./assets/admin/lib/easing/easing.min.js"></script>
        <script src="./assets/admin/ib/waypoints/waypoints.min.js"></script>
        <script src="./assets/admin/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="./assets/admin/lib/tempusdominus/js/moment.min.js"></script>
        <script src="./assets/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="./assets/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html> 