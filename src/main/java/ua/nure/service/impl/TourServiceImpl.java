package ua.nure.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import ua.nure.model.*;
import ua.nure.repository.TourRepository;
import ua.nure.service.TourService;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@Service
public class TourServiceImpl implements TourService {

    @Autowired
    private TourRepository tourRepository;


    @Override
    public void Save(Tour tour) {
        tourRepository.save(tour);

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

    @Override
    public void updateHot(String tourId) {
        Tour tour = tourRepository.findById(tourId);
        tour.setHot(!tour.getHot());
        tourRepository.save(tour);

    }
    @Override
    public void addTour(Tour tour) {
        tour.setId(UUID.randomUUID().toString());
        tour.setImg("default.png");
        tour.setHot(Boolean.TRUE);
        tourRepository.insert(tour);

    }


    }

