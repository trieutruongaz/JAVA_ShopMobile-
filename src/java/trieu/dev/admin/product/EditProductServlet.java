/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package trieu.dev.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import trieu.dev.admin.BaseAdminServlet;
import trieu.dev.data.dao.CategoryDao;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.ProductDao;
import trieu.dev.data.model.Category;
import trieu.dev.data.model.Product;

/**
 *
 * @author Admin
 */
public class EditProductServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Corrected productId retrieval
        int productId = Integer.parseInt(request.getParameter("productId"));
        
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        
        // Fetch the product by its ID
        Product product = productDao.find(productId);
        
        List<Category> categoryList = categoryDao.findAll();
        request.setAttribute("categoryList", categoryList);
        
        // Set product attribute for the request
        request.setAttribute("product", product);
        
        // Forward the request to the JSP page
        request.getRequestDispatcher("admin/product/edit.jsp").forward(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Retrieve product details from the form
    int productId = Integer.parseInt(request.getParameter("productId"));
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    String thumbnail = request.getParameter("thumbnail");
    double price = Double.parseDouble(request.getParameter("price"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    int categoryId = Integer.parseInt(request.getParameter("categoryId"));

    // Get the ProductDao to update the product
    ProductDao productDao = DatabaseDao.getInstance().getProductDao();
    Product product = productDao.find(productId);

    // Update the product details
    product.setName(name);
    product.setDescription(description);
    product.setThumbnail(thumbnail);
    product.setPrice(price);
    product.setQuantity(quantity);
    product.setCategoryId(categoryId);

    // Save the updated product in the database
    productDao.update(product);

    // Redirect to the product listing page (adjust the URL as needed)
    response.sendRedirect("IndexProductServlet");  // Redirect to the product list or another appropriate page
}



}
