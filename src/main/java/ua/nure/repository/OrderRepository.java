package ua.nure.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import ua.nure.model.Order;

public interface OrderRepository extends MongoRepository<Order,String> {
}
