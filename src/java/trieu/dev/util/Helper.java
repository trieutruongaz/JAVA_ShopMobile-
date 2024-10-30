package trieu.dev.util;

import java.util.List;

import trieu.dev.data.model.OrderItem;

public class Helper {

    public static double total(List<OrderItem> orderItemList) {
        double total = 0;
        for (int i = 0; i < orderItemList.size(); i++) {
            OrderItem ord = orderItemList.get(i);
            total += ord.getPrice() * ord.getQuantity();
        }

        return total;
    }
}
