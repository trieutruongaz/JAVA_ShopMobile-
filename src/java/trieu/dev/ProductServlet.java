package trieu.dev;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import trieu.dev.data.dao.DatabaseDao;
import trieu.dev.data.dao.ProductDao;
import trieu.dev.data.model.Product;
import trieu.dev.util.Constants;

public class ProductServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);

        ProductDao productDao = DatabaseDao.getInstance().getProductDao();

        // Kiểm tra nếu có productId trong request để hiển thị chi tiết sản phẩm
        String productIdParam = request.getParameter("productId");
        if (productIdParam != null && !productIdParam.isEmpty()) {
            try {
                // Hiển thị chi tiết sản phẩm
                int productId = Integer.parseInt(productIdParam);
                Product product = productDao.find(productId);
                if (product != null) {
                    request.setAttribute("product", product);

                    // Lấy danh sách sản phẩm mới nhất cho phần gợi ý
                    List<Product> newsProductList = productDao.news(Constants.NUMBER_LIMIT);
                    request.setAttribute("newsProductList", newsProductList);

                    request.getRequestDispatcher("product.jsp").include(request, response);
                } else {
                    // Nếu không tìm thấy sản phẩm, chuyển hướng đến trang lỗi hoặc danh sách sản phẩm
                    response.sendRedirect("product_list.jsp");
                }
            } catch (NumberFormatException e) {
                // Xử lý nếu productId không hợp lệ
                response.sendRedirect("product_list.jsp");
            }
        } else {
            // Xử lý phân trang cho danh sách sản phẩm
            int productsPerPage = 12; // Số sản phẩm trên mỗi trang

            // Lấy giá trị trang hiện tại từ tham số, nếu không có thì mặc định là 1
            String pageParam = request.getParameter("page");
            int currentPage;
            try {
                currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
                if (currentPage < 1) currentPage = 1; // Đảm bảo trang không nhỏ hơn 1
            } catch (NumberFormatException e) {
                currentPage = 1; // Mặc định trang 1 nếu không hợp lệ
            }

            // Tính tổng số sản phẩm và tổng số trang
            int totalProducts = productDao.getTotalProducts();
            int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

            // Tính toán offset cho truy vấn SQL
            int offset = (currentPage - 1) * productsPerPage;

            // Lấy danh sách sản phẩm cho trang hiện tại
            List<Product> productList = productDao.getProductsByPage(offset, productsPerPage);
            request.setAttribute("productList", productList);

            // Thiết lập các tham số phân trang cho JSP
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);

            // Chuyển tiếp đến trang danh sách sản phẩm
            request.getRequestDispatcher("product_list.jsp").include(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Thực hiện logic cho các yêu cầu POST ở đây (nếu cần)
    }
}
