package ua.nure.service;

import ua.nure.model.Order;
import ua.nure.model.Status;

import java.util.List;

public interface OrderService {

    String createOrder(Order order);

    List<Order> getAllOrders(String Id);

    List<Order> findAllOrders();

    List<Order> findOrdersByStatus(Status status);

    void updateStatus(String orderId, Status status);
}
