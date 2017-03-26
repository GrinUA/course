package ua.nure.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import ua.nure.model.Order;
import ua.nure.model.Status;

import java.util.List;

public interface OrderRepository extends MongoRepository<Order,String> {
    List<Order> findByUserId(String userId);
    Order findById(String Id);
    List<Order> findByStatus(Status status);
}
