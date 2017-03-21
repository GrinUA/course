package ua.nure.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import ua.nure.model.Tour;

import java.util.List;

public interface TourRepositoryCustom{
    List<Tour> findByCondition(Tour tour);

}
