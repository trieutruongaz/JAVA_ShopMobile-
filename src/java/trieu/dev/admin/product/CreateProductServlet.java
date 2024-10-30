/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package trieu.dev.admin.product;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
public class CreateProductServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categoryList = categoryDao.findAll();
        
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("/admin/product/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String thumbnail = request.getParameter("thumbnail");
        String priceString = request.getParameter("price"); // Get price as string
        String quantityString = request.getParameter("quantity"); // Get quantity as string
        String categoryIdString = request.getParameter("categoryId"); // Get categoryId as string

        double price = 0.0;
        int quantity = 0;
        int categoryId = 0;

        // Validate and parse price
        if (priceString != null) {
            priceString = priceString.replace("$", "").trim(); // Remove dollar sign and trim
            try {
                price = Double.parseDouble(priceString);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid price format. Please enter a valid number.");
                request.getRequestDispatcher("/admin/product/create.jsp").forward(request, response);
                return;
            }
        } else {
            request.setAttribute("error", "Price cannot be null.");
            request.getRequestDispatcher("/admin/product/create.jsp").forward(request, response);
            return;
        }

        // Validate and parse quantity
        if (quantityString != null) {
            try {
                quantity = Integer.parseInt(quantityString);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid quantity format. Please enter a valid integer.");
                request.getRequestDispatcher("/admin/product/create.jsp").forward(request, response);
                return;
            }
        } else {
            request.setAttribute("error", "Quantity cannot be null.");
            request.getRequestDispatcher("/admin/product/create.jsp").forward(request, response);
            return;
        }

        // Validate and parse categoryId
        if (categoryIdString != null) {
            try {
                categoryId = Integer.parseInt(categoryIdString);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid category ID format. Please enter a valid integer.");
                request.getRequestDispatcher("/admin/product/create.jsp").forward(request, response);
                return;
            }
        } else {
            request.setAttribute("error", "Category ID cannot be null.");
            request.getRequestDispatcher("/admin/product/create.jsp").forward(request, response);
            return;
        }

        // Create and insert product
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        Product product = new Product(name, description, thumbnail, price, quantity, categoryId);
        productDao.insert(product);

        // Redirect to the product list page after successful creation
        response.sendRedirect("IndexProductServlet");
    }
}
