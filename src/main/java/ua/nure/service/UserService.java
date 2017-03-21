package ua.nure.service;

import org.springframework.ui.Model;
import ua.nure.model.User;

import java.util.List;

public interface UserService {
    void save(User user);

    User findByUsername(String username);

    String addUser(Model model);

   User getById(String id);


    List<User> findAllUsers();




}

