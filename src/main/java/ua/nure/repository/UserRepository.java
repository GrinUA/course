package ua.nure.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import ua.nure.model.User;

import java.util.List;


public interface UserRepository extends MongoRepository<User, String> {
    User findByUsername(String userName);
    User findById(String userId);


}
