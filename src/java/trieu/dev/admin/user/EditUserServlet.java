package trieu.dev.admin.user;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.UserDao;
import trieu.dev.data.model.User;
import java.util.Optional;

/**
 * Servlet for editing a user's details in the admin panel. Handles both GET
 * (fetch user details for editing) and POST (update user information).
 */
public class EditUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            UserDao userDao = DatabaseDao.getInstance().getUserDao();
            Optional<User> userOptional = Optional.ofNullable(userDao.find(userId));

            if (userOptional.isPresent()) {
                request.setAttribute("user", userOptional.get());
                request.getRequestDispatcher("/admin/user/edit.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid User ID format");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while fetching the user");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            UserDao userDao = DatabaseDao.getInstance().getUserDao();
            Optional<User> userOptional = Optional.ofNullable(userDao.find(userId));

            if (userOptional.isPresent()) {
                User user = userOptional.get();

                // Validate input
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
                    request.setAttribute("error", "Email and password are required.");
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("/admin/user/edit.jsp").forward(request, response);
                    return;
                }

                // Ideally, password should be hashed here
                user.setEmail(email);
                user.setPassword(password);

                userDao.update(user);
                response.sendRedirect("IndexUserServlet");
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid User ID format");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating the user");
        }
    }
}
