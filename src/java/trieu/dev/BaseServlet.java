package trieu.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import trieu.dev.data.dao.CategoryDao;
import trieu.dev.data.dao.Database;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.model.Category;
import trieu.dev.data.model.OrderItem; // Ensure you import OrderItem

public class BaseServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        DatabaseDao.init(new Database());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Set categories in request
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categoryList = categoryDao.findAll();
        req.setAttribute("categoryList", categoryList);

        // Set cart count
        setCartCount(req);
    }

    protected void setCartCount(HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");

        // Initialize cart if it's null
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Calculate the total number of items in the cart
        int cartCount = 0;
        for (OrderItem item : cart) {
            cartCount += item.getQuantity(); // Sum up quantities of items in the cart
        }
        request.setAttribute("cartCount", cartCount); // Set the cart count
    }
}
