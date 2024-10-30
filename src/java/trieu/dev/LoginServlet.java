/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package trieu.dev;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.UserDao;
import trieu.dev.data.model.User;

/**
 *
 * @author Admin
 */
public class LoginServlet  extends BaseServlet {
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                super.doGet(request, response);
            HttpSession session = request.getSession();
            if(session.getAttribute("user") !=null){
                response.sendRedirect("HomeServlet");
            }else{
                       
        request.getRequestDispatcher("user.jsp").include(request, response); 
            }

    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    // Get or create the session
    HttpSession session = request.getSession();
    
    // Retrieve email and password from the login form
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    
    // Get the UserDao instance for database operations
    UserDao userDao = DatabaseDao.getInstance().getUserDao();
    User user = userDao.find(email, password);  // Assuming find method checks email and password
    
    // Check if the user exists in the database
    if (user == null) {
        // If user is not found, set an error message and redirect to the login page
        session.setAttribute("error", "Login failed");
        response.sendRedirect("LoginServlet");
    } else {
        // If the user is found, store the user in the session
        session.setAttribute("user", user);
        
        // Check the user's role and redirect accordingly
        if ("admin".equals(user.getRole())) {
            response.sendRedirect("DashboardServlet");  // Redirect admin to the dashboard
        } else {
            response.sendRedirect("HomeServlet");  // Redirect regular users to the home page
        }
    }
}

}
