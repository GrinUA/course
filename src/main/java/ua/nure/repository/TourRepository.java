package ua.nure.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import ua.nure.model.Tour;

public interface TourRepository extends MongoRepository<Tour, String> {
    Tour findById(String id);
}
