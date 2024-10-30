package trieu.dev.data.dao;

import trieu.dev.data.impl.CategoryImpl;
import trieu.dev.data.impl.OrderImpl;
import trieu.dev.data.impl.OrderItemImpl;
import trieu.dev.data.impl.ProductImpl;
import trieu.dev.data.impl.UserImpl;

public class Database extends DatabaseDao{
	@Override
    public ProductDao getProductDao()  {
        // TODO Auto-generated method stub
        return new ProductImpl();
    }

    @Override
    public CategoryDao getCategoryDao() {
        // TODO Auto-generated method stub
        return new CategoryImpl();
    }

    @Override
    public OrderItemDao getOrderItemDao() {
        // TODO Auto-generated method stub
        return new OrderItemImpl();
    }

    @Override
    public OrderDao getOrderDao() {
        // TODO Auto-generated method stub
        return new OrderImpl();
    }

    @Override
    public UserDao getUserDao() {
        // TODO Auto-generated method stub
        return new UserImpl();
    }

}
