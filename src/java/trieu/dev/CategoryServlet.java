package trieu.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import trieu.dev.data.dao.CategoryDao;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.ProductDao;
import trieu.dev.data.model.Category;
import trieu.dev.data.model.Product;

/**
 * Servlet handling product categories.
 */
public class CategoryServlet extends BaseServlet {

    private static final int PER_PAGE = 12; // Define the number of products per page

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);
        
        // Get the category ID from request
        String categoryIdParam = request.getParameter("categoryId");
        if (categoryIdParam == null || categoryIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Category ID is required.");
            return;
        }

        int categoryId;
        // Handle potential NumberFormatException for categoryId
        try {
            categoryId = Integer.parseInt(categoryIdParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid category ID.");
            return;
        }

        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        List<Product> productList = new ArrayList<>();

        // Get sorting properties if provided
        String property = request.getParameter("property");
        String order = request.getParameter("order");

        // Apply filtering if parameters are provided
        if (property != null && order != null) {
            productList = productDao.filter(categoryId, property, order);
        } else {
            productList = productDao.findByCategory(categoryId);
        }

        // Pagination logic
        int page = 1; // Default page number
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
                if (page < 1) {
                    page = 1; // Reset to 1 if less than 1
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid page number.");
                return;
            }
        }

        int total = productList.size();
        int numberPages = (int) Math.ceil((double) total / PER_PAGE);

        // Ensure the page number does not exceed the total pages
        if (page > numberPages && numberPages > 0) {
            page = numberPages; // Set page to the last page if it exceeds
        }

        int start = (page - 1) * PER_PAGE;
        int end = Math.min(start + PER_PAGE, total);

        // Check if start is out of bounds
        if (start >= total) {
            start = 0; // Reset start to 0 if out of bounds
            page = 1; // Reset to the first page
        }

        // Get the sublist for the current page
        List<Product> paginatedProductList = productList.subList(start, end);

        // Retrieve the category details
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        Category category = categoryDao.find(categoryId);

        if (category == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Category not found.");
            return;
        }

        // Set attributes for JSP
        request.setAttribute("category", category);
        request.setAttribute("productList", paginatedProductList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", numberPages);

        // Forward to the JSP page for rendering
        request.getRequestDispatcher("category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implement logic for POST requests if necessary
    }

    @Override
    public String getServletInfo() {
        return "CategoryServlet handles product categories";
    }
}
