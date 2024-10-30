/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package trieu.dev.admin.category;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import trieu.dev.admin.BaseAdminServlet;
import trieu.dev.data.dao.CategoryDao;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.model.Category;

/**
 *
 * @author Admin
 */
public class IndexCategoryServlet extends BaseAdminServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the list of users from the database using UserDao
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categoryList = categoryDao.findAll();

        // Set the user list as a request attribute
        request.setAttribute("categoryList", categoryList);

        // Forward the request to the JSP page to display the user list
        request.getRequestDispatcher("/admin/category/index.jsp").forward(request, response);
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
