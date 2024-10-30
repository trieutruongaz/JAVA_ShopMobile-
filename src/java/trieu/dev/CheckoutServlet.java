package trieu.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.OrderDao;
import trieu.dev.data.dao.OrderItemDao;
import trieu.dev.data.model.Order;
import trieu.dev.data.model.OrderItem;
import trieu.dev.data.model.User;
import trieu.dev.util.StringHelper;

public class CheckoutServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Redirect to login if the user is not logged in
        if (user == null) {
            response.sendRedirect("LoginServlet");
            return; // Ensure the method exits after redirection
        }

        // Process the checkout
        processCheckout(request, user);
        response.sendRedirect("CartServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST request logic here if needed
    }

    /**
     * Processes the checkout for the given user.
     *
     * @param request The HTTP request
     * @param user The logged-in user
     */
    private void processCheckout(HttpServletRequest request, User user) {
        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
        String code = StringHelper.randomString(10);
        
        // Create a new order with the generated code and user's ID
        Order order = new Order(code, "pending", user.getId());
        orderDao.insert(order);
        
        // Optionally retrieve the order (if needed)
        order = orderDao.findByCode(code);
        HttpSession session = request.getSession();
        List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");
        // You can add any additional logic for processing the order here (e.g., updating the cart)
    
        OrderItemDao orderItemDao = DatabaseDao.getInstance().getOrderItemDao();
        
        if(cart != null){
            for(OrderItem orderItem : cart){
                orderItem.setOrderId(order.getId());
                orderItemDao.insert(orderItem);
            } 
        }
        session.setAttribute("message", "Checkout Success");
        session.removeAttribute("cart");
    }
    
}
