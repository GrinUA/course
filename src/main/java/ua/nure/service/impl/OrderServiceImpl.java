package ua.nure.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.nure.model.Order;
import ua.nure.model.Status;
import ua.nure.repository.OrderRepository;
import ua.nure.service.OrderService;

import java.util.*;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Override
    public String createOrder(Order order) {
        order.setId(UUID.randomUUID().toString());
        order.setStatus(Status.REGISTERED);
        order.setOrderDate(new Date());
        return orderRepository.save(order).getId();
    }

    @Override
    public List<Order> getAllOrders(String Id) {
        return orderRepository.findByUserId(Id);
    }

    @Override
    public List<Order> findAllOrders() {
        return orderRepository.findAll();
    }

    @Override
    public List<Order> findOrdersByStatus(Status status) {
        return  orderRepository.findByStatus(status);
    }

    @Override
    public void updateStatus(String orderId, Status status) {
        Order order = orderRepository.findById(orderId);
        order.setStatus(status);
        orderRepository.save(order);
    }

    }


