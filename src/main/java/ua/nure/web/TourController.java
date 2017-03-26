package ua.nure.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.nure.model.HotelType;
import ua.nure.model.Tour;
import ua.nure.model.TourType;
import ua.nure.model.User;
import ua.nure.service.TourService;
import ua.nure.service.UserService;

import java.util.Arrays;
import java.util.List;

@Controller
public class TourController {
    private static final Logger LOG = LoggerFactory.getLogger(TourController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private TourService tourService;

    @RequestMapping(value = {"/viewTour"}, method = RequestMethod.GET)
    public String viewTour(String idTour, Model model) {
        Tour tour = tourService.getById(idTour);
        LOG.info("IdTour {}", idTour);
        model.addAttribute("tour", tour);
        userService.addUser(model);
        return "jsp/user/viewTour";
    }

    @RequestMapping(value = {"/listTours"}, method = RequestMethod.GET)
    public String listTours(Model model) {
        List<Tour> allTours = tourService.findAllTours();
        model.addAttribute("listTours", allTours);
        model.addAttribute("tourType", Arrays.asList(TourType.values()));
        model.addAttribute("hotelType", Arrays.asList(HotelType.values()));
        userService.addUser(model);
        return "jsp/admin/listTours";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searching(@ModelAttribute("searchForm") Tour searchForm, BindingResult bindingResult, Model model) {
        LOG.info("searchForm {}", searchForm);
        List<Tour> listToursF = tourService.searchTours(searchForm);
        LOG.info("ress {}", listToursF);
        model.addAttribute("count", listToursF.size());
        model.addAttribute("listToursF", listToursF);
        model.addAttribute("tourTypes", Arrays.asList(TourType.values()));
        model.addAttribute("hotelTypes", Arrays.asList(HotelType.values()));
        userService.addUser(model);
        model.addAttribute("searchForm", new Tour());
        return "index";
    }

    @RequestMapping(value = {"/hotChange"}, method = RequestMethod.GET)
    public String hotChange(Tour tour, String idTour) {
        List<Tour> allTours = tourService.findAllTours();
        tourService.updateHot(idTour);
        return "redirect:/listTours";
    }


    @RequestMapping(value = "/addTour", method = RequestMethod.POST)
    public String adding(Model model, Tour tour) {


        model.addAttribute("tourType", Arrays.asList(TourType.values()));
        model.addAttribute("hotelType", Arrays.asList(HotelType.values()));
        tourService.addTour(tour);
        return "redirect:/listTours";

    }
}