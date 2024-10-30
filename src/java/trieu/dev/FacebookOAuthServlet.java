package trieu.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/oauth2/facebook")
public class FacebookOAuthServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Đường dẫn callback của bạn
        String redirectUri = "http://localhost:8080/yourapp/oauth2/callback/facebook"; // Thay đổi thành đường dẫn thực tế của bạn
        String clientId = "YOUR_FACEBOOK_APP_ID"; // Thay thế bằng Client ID của bạn
        
        // Tạo URL xác thực OAuth2
        String fbAuthUrl = "https://www.facebook.com/v10.0/dialog/oauth?" +
                "client_id=" + clientId + "&" +
                "redirect_uri=" + redirectUri + "&" +
                "scope=email";

        // Chuyển hướng đến Facebook OAuth2
        response.sendRedirect(fbAuthUrl);
    }
}
