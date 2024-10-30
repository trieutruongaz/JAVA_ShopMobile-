package trieu.dev; // Đảm bảo package này khớp với cấu hình trong web.xml

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/oauth2/google")
public class GoogleOAuthServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Đường dẫn callback của bạn
        String redirectUri = "http://localhost:8080/yourapp/oauth2/callback/google"; // Thay đổi thành đường dẫn thực tế của bạn
        String clientId = "YOUR_GOOGLE_CLIENT_ID"; // Thay thế bằng Client ID của bạn
        String state = "some_random_state_value"; // Tạo giá trị ngẫu nhiên cho state

        // Tạo URL xác thực OAuth2
        String googleAuthUrl = "https://accounts.google.com/o/oauth2/v2/auth?" +
                "scope=email profile&" +
                "redirect_uri=" + redirectUri + "&" +
                "response_type=code&" +
                "client_id=" + clientId + "&" +
                "state=" + state;

        // Chuyển hướng đến Google OAuth2
        response.sendRedirect(googleAuthUrl);
    }
}
