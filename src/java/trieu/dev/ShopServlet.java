package trieu.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.ProductDao;
import trieu.dev.data.model.Product;

/**
 * Servlet to handle product listing and pagination.
 */
public class ShopServlet extends BaseServlet {

    private static final int PER_PAGE = 10; // Define items per page

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        List<Product> productList = productDao.findAll();
        
        int page = 1; // Default page number
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
                if (page < 1) { // Ensure the page is not less than 1
                    page = 1;
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
            page = numberPages;
        }

        int start = (page - 1) * PER_PAGE;
        int end = Math.min(start + PER_PAGE, total);

        // Check if start is out of bounds
        if (start >= total) {
            start = 0; // Reset start to 0 if out of bounds
            page = 1; // Reset to first page
        }

        // Paginate the product list
        List<Product> paginatedProductList = productList.subList(start, end);

        // Set attributes for JSP
        request.setAttribute("productList", paginatedProductList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", numberPages);

        // Forward to the JSP page for rendering
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implement logic for POST requests if necessary
    }

    @Override
    public String getServletInfo() {
        return "ShopServlet handles product listing and pagination";
    }
}
