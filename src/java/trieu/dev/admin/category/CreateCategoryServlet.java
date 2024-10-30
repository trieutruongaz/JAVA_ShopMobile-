/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package trieu.dev.admin.category;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import trieu.dev.admin.BaseAdminServlet;
import trieu.dev.data.dao.CategoryDao;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.UserDao;
import trieu.dev.data.model.Category;
import trieu.dev.data.model.User;

/**
 *
 * @author Admin
 */
public class CreateCategoryServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/category/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String thumbnail = request.getParameter("thumbnail");
        HttpSession session = request.getSession();
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();


        if (name.isEmpty() || thumbnail.isEmpty()) {
            session.setAttribute("error", "Vui Long Dien Day Du Thong Tin");
            request.getRequestDispatcher("/admin/category/create.jsp").forward(request, response);
            return; // Ajouté pour éviter d'exécuter le code en dessous
          
        } else {
            Category category = new Category(name, thumbnail);
            categoryDao.insert(category);
            
            
            
            
            response.sendRedirect("IndexCategoryServlet");
        }
    }

}
