package trieu.dev.admin.user;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import trieu.dev.admin.BaseAdminServlet;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.UserDao;
import trieu.dev.data.model.User;

/**
 * Servlet for handling user listing in the admin dashboard.
 *
 * @author Admin
 */
public class IndexUserServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the list of users from the database using UserDao
        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        List<User> userList = userDao.findAll();

        // Set the user list as a request attribute
        request.setAttribute("userList", userList);

        // Forward the request to the JSP page to display the user list
        request.getRequestDispatcher("/admin/user/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Optionally handle POST requests (e.g., form submissions)
        doGet(request, response);  // For now, we can forward POST to doGet
    }

    @Override
    public String getServletInfo() {
        return "Servlet handling the admin user dashboard";
    }
}
