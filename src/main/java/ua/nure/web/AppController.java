package ua.nure.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.nure.model.Role;
import ua.nure.model.Tour;
import ua.nure.model.User;
import ua.nure.repository.UserRepository;
import ua.nure.service.SecurityService;
import ua.nure.service.TourService;
import ua.nure.service.UserService;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

@Controller
public class AppController {


    @Autowired
    private SecurityService securityService;

    @Autowired private UserService userService;

    @Autowired
    private TourService tourService;

    /*@RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    }*/

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        List<Tour> listToursF = tourService.getAllTours();
        System.err.println(listToursF);
        model.addAttribute("count", listToursF.size());
        model.addAttribute("listToursF", listToursF);
        userService.addUser(model);

        return "index";
    }


}
