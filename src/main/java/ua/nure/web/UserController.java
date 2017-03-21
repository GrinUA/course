package ua.nure.web;

import ua.nure.model.Order;
import ua.nure.model.Role;
import ua.nure.model.User;
import ua.nure.service.OrderService;
import ua.nure.service.SecurityService;
import ua.nure.service.TourService;
import ua.nure.service.UserService;
import ua.nure.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Arrays;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
    @Autowired
    private OrderService orderService;

    @Autowired
    private TourService tourService;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = "/personalCabinet", method = RequestMethod.GET)
    public String personalCabinet(Model model) {
        String id = userService.addUser(model);
        List<Order> orderList = orderService.getAllOrders(id);
        


        model.addAttribute("listOrders",orderList);

        return "jsp/user/personalCabinet";
    }
    @RequestMapping(value = {"/listUsers"}, method = RequestMethod.GET)
    public String listUsers(Model model) {
        List<User> allUsers = userService.findAllUsers();

        System.out.print(allUsers);
        model.addAttribute("listUsers", allUsers);
        model.addAttribute("roles", Arrays.asList(Role.values()));
        userService.addUser(model);
        return "jsp/admin/listUsers";}
    }




