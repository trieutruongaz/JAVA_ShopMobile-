package trieu.dev.admin.category;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.UserDao;
import trieu.dev.data.model.User;
import java.util.Optional;
import trieu.dev.data.dao.CategoryDao;
import trieu.dev.data.model.Category;

/**
 * Servlet for editing a user's details in the admin panel. Handles both GET
 * (fetch user details for editing) and POST (update user information).
 */
public class EditCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Corrected parameter name
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));

            // Fetch the CategoryDao instance
            CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();

            // Find the category by its ID
            Optional<Category> categoryOptional = Optional.ofNullable(categoryDao.find(categoryId));

            // If the category is found, set it as an attribute and forward to the JSP
            if (categoryOptional.isPresent()) {
                Category category = categoryOptional.get();
                request.setAttribute("category", category);
                request.getRequestDispatcher("/admin/category/edit.jsp").forward(request, response);  // Corrected path
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Category not found");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Category ID format");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while fetching the category");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        Category category = categoryDao.find(categoryId);

        String name = request.getParameter("name");
        String thumbnail = request.getParameter("thumbnail");
        category.setName(name);
        category.setThumbnail(thumbnail);
         
        categoryDao.update(category);
        response.sendRedirect("IndexCategoryServlet");

    }
}
