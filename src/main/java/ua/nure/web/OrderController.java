package ua.nure.web;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.nure.model.*;
import ua.nure.service.DiscountService;
import ua.nure.service.OrderService;
import ua.nure.service.TourService;
import ua.nure.service.UserService;
import ua.nure.service.impl.TourServiceImpl;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;

@Controller
public class OrderController {
    private static final Logger LOG = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    @Autowired
    private DiscountService discountService;

    @Autowired
    private TourService tourService;

    @RequestMapping(value = {"/doOrder"}, method = RequestMethod.POST)
    public String viewTour(String idTour, String idUser, Model model) {
        Tour tour = tourService.getById(idTour);
        Discount discount = discountService.findByUser(idUser);
        User user = userService.getById(idUser);
        model.addAttribute("user", user);
        model.addAttribute("discount", discount);
        model.addAttribute("tour", tour);
        userService.addUser(model);
        return "jsp/user/previewOrder";
    }

    @RequestMapping(value = {"/confirm"}, method = RequestMethod.POST)
    public String confirm(String userId, String tourId, Double bill, Model model) {
        Order order = new Order();
        User user = userService.getById(userId);
        order.setUserFullName(user.getFirstName() + " " + user.getLastName());
        order.setUserId(userId);
        Tour tour = tourService.getById(tourId);
        order.setTourId(tourId);
        order.setTourName(tour.getName());
        order.setBill(bill);

        LOG.info("Order {} {}", order, tourId);
        String id = orderService.createOrder(order);
        LOG.info("Order id {}", id);
        userService.addUser(model);
        return "redirect:/index";
    }

    @RequestMapping(value = {"/listOrders"}, method = RequestMethod.GET)
    public String listOrders(Model model) {
        List<Order> allOrders = orderService.findAllOrders();
        model.addAttribute("listOrders", allOrders);
        model.addAttribute("status", Arrays.asList(Status.values()));
        model.addAttribute("users",userService.findAllUsers());
        userService.addUser(model);
        return "jsp/admin/listOrders";
    }

    @RequestMapping(value = {"/buttons"}, method = RequestMethod.GET)
    public String buttons(Model model, String status) {
        if (Objects.equals(status, "all")) {

            model.addAttribute("listOrders", orderService.findAllOrders());

        } else {
            model.addAttribute("listOrders", orderService.findOrdersByStatus(Status.valueOf(status)));

        }
        userService.addUser(model);
        model.addAttribute("status", Arrays.asList(Status.values()));
        model.addAttribute("searchForm", new Tour());
        return "jsp/admin/listOrders";
    }

    @RequestMapping(value = {"/statusChange"}, method = RequestMethod.POST)
    public String statusChange(Model model,String status, String orderId) {
        orderService.updateStatus(orderId, Status.valueOf(status));
        userService.addUser(model);
        return "redirect:/listOrders";
    }
}





