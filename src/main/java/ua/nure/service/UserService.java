package ua.nure.service;

import org.springframework.ui.Model;
import ua.nure.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);

    void addUser(Model model);

    User getById(String id);
}
