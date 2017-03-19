package ua.nure.service;

import ua.nure.model.Tour;

import java.util.List;

public interface TourService {

    List<Tour> getAllTours();

    Tour getById(String id);
}
