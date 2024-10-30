/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package trieu.dev.admin.user;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import trieu.dev.admin.BaseAdminServlet;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.UserDao;
import trieu.dev.data.model.User;

/**
 *
 * @author Admin
 */
public class CreateUserServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/user/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String role = request.getParameter("role");
        HttpSession session = request.getSession();
        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        User user = userDao.find(email);

        if (email.isEmpty() || password.isEmpty() || repassword.isEmpty() || role.isEmpty()) {
            session.setAttribute("error", "Vui Long Dien Day Du Thong Tin");
            request.getRequestDispatcher("/admin/user/create.jsp").forward(request, response);
            return; // Ajouté pour éviter d'exécuter le code en dessous
        } else if (user != null) {
            session.setAttribute("error", "Email Da Ton Tai");
            request.getRequestDispatcher("/admin/user/create.jsp").forward(request, response);
            return; // Ajouté pour éviter d'exécuter le code en dessous
        } else if (!password.equals(repassword)) {
            session.setAttribute("error", "Mat Khau Khong Khop");
            request.getRequestDispatcher("/admin/user/create.jsp").forward(request, response);
            return; // Ajouté pour éviter d'exécuter le code en dessous
        } else {
            user = new User(email, password, role);
            userDao.insert(user);
            response.sendRedirect("IndexUserServlet");
        }
    }

}
