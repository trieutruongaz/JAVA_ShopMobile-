package trieu.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutServlet extends BaseServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy session hiện tại và hủy session
        HttpSession session = request.getSession();
        session.removeAttribute("user"); // Loại bỏ thuộc tính "user" khỏi session

        // Chuyển hướng đến trang đăng nhập sau khi đăng xuất
        response.sendRedirect("LoginServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý POST nếu cần thiết, nếu không thì có thể gọi lại doGet
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet xử lý việc đăng xuất người dùng";
    }
}
