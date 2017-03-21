package ua.nure.web;

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

    @Autowired
    private UserService userService;

    @Autowired
    private TourService tourService;

    @RequestMapping(value = {"/viewTour"}, method = RequestMethod.GET)
    public String viewTour(String idTour, Model model) {
        Tour tour = tourService.getById(idTour);
        System.err.println(idTour);
        model.addAttribute("tour", tour);
        userService.addUser(model);
        return "jsp/user/viewTour";
    }

    @RequestMapping(value = {"/listTours"}, method = RequestMethod.GET)
    public String listTours(Model model) {
        List<Tour> allTours = tourService.findAllTours();
        model.addAttribute("listTours", allTours);
        userService.addUser(model);
        return "jsp/admin/listTours";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searching(@ModelAttribute("searchForm") Tour searchForm, BindingResult bindingResult, Model model) {
        System.err.println(searchForm);
        List<Tour> listToursF = tourService.searchTours(searchForm);
        System.err.println(listToursF);
        model.addAttribute("count", listToursF.size());
        model.addAttribute("listToursF", listToursF);
        model.addAttribute("tourTypes", Arrays.asList(TourType.values()));
        model.addAttribute("hotelTypes", Arrays.asList(HotelType.values()));
        userService.addUser(model);
        model.addAttribute("searchForm",new Tour());
        return "index";
    }
}
