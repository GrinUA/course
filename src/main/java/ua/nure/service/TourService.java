package ua.nure.service;

import org.springframework.ui.Model;
import ua.nure.model.Tour;

import java.util.List;

public interface TourService {
    void Save (Tour tour);

    List<Tour> getAllTours();

    Tour getById(String id);

    List<Tour> findAllTours();

    List<Tour>  searchTours(Tour tour);
    void updateHot(String tourId);
    void addTour(Tour tour);
}

