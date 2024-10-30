package trieu.dev.data.dao;

import java.util.List;
import trieu.dev.data.model.Product;

public interface ProductDao {
    
    // Thêm một sản phẩm mới vào cơ sở dữ liệu, trả về ID của sản phẩm đã thêm
    public int insert(Product product);

    // Cập nhật thông tin sản phẩm, trả về true nếu cập nhật thành công
    public boolean update(Product product);

    // Xóa sản phẩm theo ID, trả về true nếu xóa thành công
    public boolean delete(int id);

    // Tìm sản phẩm theo ID, trả về đối tượng Product
    public Product find(int id);

    // Lấy danh sách tất cả sản phẩm
    public List<Product> findAll();

    // Lấy danh sách sản phẩm hot, với giới hạn số lượng
    public List<Product> hot(int limit);

    // Lấy danh sách sản phẩm mới nhất, với giới hạn số lượng
    public List<Product> news(int limit);

    // Tìm sản phẩm theo ID danh mục
    public List<Product> findByCategory(int categoryId);

    // Tìm sản phẩm theo tên hoặc từ khóa
    public List<Product> findByName(String key);

    // Tìm sản phẩm theo danh mục và tên/từ khóa
    public List<Product> findByCategoryOfName(int categoryId, String key);
    
    // Lọc sản phẩm theo danh mục và thuộc tính với thứ tự (asc/desc)
    public List<Product> filter(int categoryId, String propertyName, String order);

    // Lấy danh sách sản phẩm liên quan tới sản phẩm đã cho
    public List<Product> relatedProductList(Product product);

    // Lấy danh sách sản phẩm với chỉ số bắt đầu và số lượng cần lấy
    public List<Product> getProducts(int from, int amount);

    // Cập nhật lượt xem của sản phẩm, trả về true nếu thành công
    public boolean updateView(Product product);

    public int getTotalProducts();

    public List<Product> getProductsByPage(int offset, int productsPerPage);
}
