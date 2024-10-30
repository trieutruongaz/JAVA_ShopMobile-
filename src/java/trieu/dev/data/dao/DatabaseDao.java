package trieu.dev.data.dao;

import trieu.dev.data.dao.CategoryDao;
import trieu.dev.data.dao.OrderDao;
import trieu.dev.data.dao.OrderItemDao;
import trieu.dev.data.dao.ProductDao;
import trieu.dev.data.dao.UserDao;



public abstract class DatabaseDao {

    private static DatabaseDao instance;

    public static void init(DatabaseDao inst) {
        instance = inst;
    }

    public static DatabaseDao getInstance() {
        return instance;
    }

    public abstract ProductDao getProductDao();

    public abstract CategoryDao getCategoryDao();

    public abstract OrderItemDao getOrderItemDao();

    public abstract OrderDao getOrderDao();

    public abstract UserDao getUserDao();

}