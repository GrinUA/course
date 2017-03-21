package ua.nure.service;

import ua.nure.model.Order;

import java.util.List;

public interface OrderService {

    String createOrder(Order order);

    List<Order> getAllOrders(String Id);

    List<Order> findAllOrders();

}
