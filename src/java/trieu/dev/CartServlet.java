package trieu.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import trieu.dev.data.model.OrderItem;
import trieu.dev.util.Helper;

public class CartServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);
        HttpSession session = request.getSession();
        List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");

        // Initialize cart if it's null
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Set attributes for JSP
        request.setAttribute("cart", cart);
        request.setAttribute("total", Helper.total(cart));

        // Calculate the total number of items in the cart
        int cartCount = cart.stream().mapToInt(OrderItem::getQuantity).sum();
        request.setAttribute("cartCount", cartCount); // Set the cart count

        // Forward to cart.jsp (or any other relevant JSP page)
        request.getRequestDispatcher("cart.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // Check if action parameter is present
        if (action == null || action.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action parameter is missing.");
            return;
        }

        try {
            // Perform actions based on the specified action parameter
            switch (action) {
                case "create":
                    createOrder(request);
                    break;

                case "update":
                    updateOrder(request);
                    break;

                case "delete":
                    deleteOrder(request);
                    break;

                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
                    return;
            }
        } catch (RuntimeException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
            return;
        }

        // Check if the request is an AJAX request
        String ajaxHeader = request.getHeader("X-Requested-With");
        if ("XMLHttpRequest".equals(ajaxHeader)) {
            // Return the updated cart count as JSON for AJAX requests
            HttpSession session = request.getSession();
            List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");
            int cartCount = cart != null ? cart.stream().mapToInt(OrderItem::getQuantity).sum() : 0;

            // Set content type and write response as JSON
            response.setContentType("application/json");
            response.getWriter().write("{\"cartCount\": " + cartCount + "}");
        } else {
            // Redirect back to the cart page after processing the action for standard requests
            response.sendRedirect("CartServlet");
        }
    }

    private void createOrder(HttpServletRequest request) {
        try {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int productId = Integer.parseInt(request.getParameter("productId"));
            double price = Double.parseDouble(request.getParameter("price"));

            OrderItem orderItem = new OrderItem(quantity, price, 0, productId);

            HttpSession session = request.getSession();
            List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");

            if (cart == null) {
                cart = new ArrayList<>();
            }

            boolean isExistInCart = cart.stream().anyMatch(ord -> ord.getProductId() == productId);
            if (isExistInCart) {
                cart.stream().filter(ord -> ord.getProductId() == productId).findFirst().ifPresent(ord -> {
                    ord.setQuantity(ord.getQuantity() + quantity); // Update quantity
                });
            } else {
                cart.add(orderItem); // Add new item
            }

            session.setAttribute("cart", cart);

        } catch (NumberFormatException e) {
            throw new RuntimeException("Invalid input data. Failed to create order.");
        }
    }

    private void updateOrder(HttpServletRequest request) {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int newQuantity = Integer.parseInt(request.getParameter("quantity"));

            HttpSession session = request.getSession();
            List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");

            if (cart != null) {
                cart.stream().filter(ord -> ord.getProductId() == productId).findFirst().ifPresent(ord -> {
                    ord.setQuantity(newQuantity);
                });
                session.setAttribute("cart", cart);
            }
        } catch (NumberFormatException e) {
            throw new RuntimeException("Invalid input data. Failed to update order.");
        }
    }

    private void deleteOrder(HttpServletRequest request) {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));

            HttpSession session = request.getSession();
            List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");

            if (cart != null) {
                boolean removed = cart.removeIf(orderItem -> orderItem.getProductId() == productId);
                if (removed) {
                    System.out.println("Removed product with ID: " + productId);
                } else {
                    System.out.println("No product found with ID: " + productId);
                }
                session.setAttribute("cart", cart);
            }
        } catch (NumberFormatException e) {
            throw new RuntimeException("Invalid input data. Failed to delete order.");
        }
    }
}
