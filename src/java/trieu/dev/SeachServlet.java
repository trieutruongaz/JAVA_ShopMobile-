package trieu.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.ProductDao;
import trieu.dev.data.model.Product;
import jakarta.servlet.annotation.WebServlet;

/**
 * SearchServlet to handle search requests
 */
@WebServlet("/SearchServlet")
public class SeachServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);
        handleSearch(request, response); // Use the same logic for both GET and POST
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleSearch(request, response); // Use the same logic for both GET and POST
    }

    private void handleSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the search keyword from the form
        String keyword = request.getParameter("keyword");
        System.out.println("Search keyword: " + keyword); // Debugging log

        if (keyword != null && !keyword.trim().isEmpty()) {
            // Fetch products matching the search keyword
            ProductDao productDao = DatabaseDao.getInstance().getProductDao();
            List<Product> productList = productDao.findByName(keyword);
            
            // Set attributes to pass to JSP
            request.setAttribute("productList", productList);
        } else {
            request.setAttribute("productList", null);
        }

        // Set the keyword (even if it's empty) so it displays on the search page
        request.setAttribute("keyword", keyword);

        // Forward to the search results page
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet that handles search requests";
    }
}
