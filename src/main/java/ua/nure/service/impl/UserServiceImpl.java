package ua.nure.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import ua.nure.model.Role;
import ua.nure.model.User;
import ua.nure.repository.UserRepository;
import ua.nure.service.UserService;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {
    private static final Logger log = Logger.getLogger(UserServiceImpl.class);

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
       user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        List<Role> roles = new ArrayList<>();
        roles.add(Role.USER);
        user.setRoles(roles);
        user.setId(UUID.randomUUID().toString());
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        User user = userRepository.findByUsername(username);
        System.err.println(user);
        return user;
    }

    @Override
    public void addUser(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName = auth.getName();

        User user = userRepository.findByUsername(userName);
        if (user != null) {
            user.setPassword("");
            System.err.println(user);
            model.addAttribute("user", user);
            model.addAttribute("userRole", user.getRoles().get(0));
        }

    }

    @Override
    public User getById(String id) {
        return userRepository.findById(id);
    }
}
