package ua.nure.repository.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import ua.nure.model.Tour;
import ua.nure.repository.TourRepositoryCustom;

import javax.annotation.Resource;
import java.util.List;

@Repository
public class TourRepositoryImpl implements TourRepositoryCustom {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public List<Tour> findByCondition(Tour tour) {
        Query query = new Query();
        if (tour.getName() != null && !tour.getName().isEmpty()) {
            query.addCriteria(Criteria.where("country").is(tour.getCountry()));
        }
        if(tour.getCountry() != null && !tour.getCountry().isEmpty()){
            query.addCriteria(Criteria.where("name").is(tour.getName()));
        }
        if(tour.getTourType() != null){
            query.addCriteria(Criteria.where("tourType").is(tour.getTourType()));
        }
        if(tour.getHotelType() != null){
            query.addCriteria(Criteria.where("hotelType").is(tour.getHotelType()));
        }
        if(tour.getPeopleCount() != null){
            query.addCriteria(Criteria.where("peopleCount").is(tour.getPeopleCount()));
        }
        if(tour.getPrice() != null){
            query.addCriteria(Criteria.where("price").is(tour.getPrice()));
        }
        return mongoTemplate.find(query, Tour.class);

    }
}
