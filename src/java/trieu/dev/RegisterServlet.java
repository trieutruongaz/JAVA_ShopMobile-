package trieu.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.UserDao;
import trieu.dev.data.model.User;

public class RegisterServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the registration page
        request.getRequestDispatcher("register.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve the email and password from the form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate email and password input
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("error", "Email and password must not be empty");
            request.getRequestDispatcher("register.jsp").include(request, response);
            return;
        }

        // Get the UserDao instance to interact with the database
        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        User user = userDao.find(email);

        HttpSession session = request.getSession();

        // Check if the user already exists in the database
        if (user != null) {
            // Set error message if the email already exists
            session.setAttribute("error", "Email already exists");
            request.getRequestDispatcher("register.jsp").include(request, response);
        } else {
            // Create a new user if the email does not exist
            user = new User(email, password, "user");  // Create a new user object
            userDao.insert(user);  // Insert the new user into the database

            // Clear error message if any
            session.removeAttribute("error");

            // Redirect to the login page after successful registration
            response.sendRedirect("LoginServlet");
        }
    }
}
