package ua.nure.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import ua.nure.model.Order;

import java.util.List;

public interface OrderRepository extends MongoRepository<Order,String> {
    List<Order> findByUserId(String userId);
}
