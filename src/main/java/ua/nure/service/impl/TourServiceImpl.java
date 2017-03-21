package ua.nure.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;
import ua.nure.model.Tour;
import ua.nure.repository.TourRepository;
import ua.nure.service.TourService;

import java.util.List;

@Service
public class TourServiceImpl implements TourService {

    @Autowired
    private TourRepository tourRepository;


    @Override
    public void Save(Tour tour) {

    }

    @Override
    public List<Tour> getAllTours() {

        return tourRepository.findAll();
    }

    @Override
    public Tour getById(String id) {
        return tourRepository.findById(id);
    }
    @Override
    public List<Tour> findAllTours() {
        return tourRepository.findAll();
    }

    @Override
    public List<Tour> searchTours(Tour tour) {
        return tourRepository.findByCondition(tour);

    }
}
