/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package trieu.dev;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
//import trieu.dev.data.dao.CategoryDao;
import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.ProductDao;
//import trieu.dev.data.model.Category;
import trieu.dev.data.model.Product;
import trieu.dev.util.Constants;


/**
 *
 * @author Admin
 */
public class HomeServlet extends BaseServlet {

  @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);
         ProductDao productDao = DatabaseDao.getInstance().getProductDao();
         List<Product> hotProductList = productDao.hot(Constants.NUMBER_LIMIT);
         List<Product> newsProductList = productDao.news(Constants.NUMBER_LIMIT);
        
       // CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
       //List<Category> categoryList = categoryDao.findAll();
        
        
       // request.setAttribute("categoryList", categoryList);
        request.setAttribute("hotProductList", hotProductList);
        request.setAttribute("newsProductList", newsProductList);
        
        
        
        
        
        request.getRequestDispatcher("home.jsp").include(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implémenter la logique de gestion des requêtes POST ici
    }
}

