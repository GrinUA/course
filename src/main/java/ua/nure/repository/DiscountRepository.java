package ua.nure.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import ua.nure.model.Discount;

public interface DiscountRepository extends MongoRepository<Discount,String>{

    Discount findByUserId(String userId);
}
