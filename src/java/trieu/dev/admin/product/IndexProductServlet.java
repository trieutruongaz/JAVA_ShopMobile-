    package trieu.dev.admin.product;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import trieu.dev.admin.BaseAdminServlet;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.ProductDao;
import trieu.dev.data.model.Product;

/**
 * Servlet handling the admin product dashboard.
 */
public class IndexProductServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the list of products from the database using ProductDao
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        List<Product> products = productDao.findAll();

        // Set the product list as a request attribute
        request.setAttribute("productList", products);

        // Forward the request to the JSP page to display the product list
        request.getRequestDispatcher("/admin/product/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward POST to doGet for now
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet handling the admin product dashboard";
    }
}
