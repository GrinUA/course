package ua.nure.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import ua.nure.model.Tour;

import java.util.List;

public interface TourRepository extends MongoRepository<Tour, String>,TourRepositoryCustom {
    Tour findById(String id);


}
