package ua.nure.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.nure.model.Tour;
import ua.nure.service.TourService;
import ua.nure.service.UserService;

import java.util.List;

@Controller
public class TourController {

    @Autowired private UserService userService;

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
}
