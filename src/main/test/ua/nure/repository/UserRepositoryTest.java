package ua.nure.repository;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;
import ua.nure.model.*;

import java.util.*;


@RunWith(SpringRunner.class)
@SpringBootTest
public class UserRepositoryTest {
    @Autowired
    private DiscountRepository discountRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TourRepository tourRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;


    @Before
    public void setUp() throws Exception {

    }

    @Test
    public void insertUserTest() {
        User user = generateUser();
        System.out.println(user);
        userRepository.insert(user);
        System.out.println(userRepository.findById(user.getId()));

        discountRepository.insert(generateDis(user.getId()));

        User admin = generateAdmin();
        userRepository.insert(admin);
    }

    @Test
    public void insertTourTest() {
        Tour tour = generateTour();
        tourRepository.insert(tour);
        System.out.println(userRepository.findById(tour.getId()));
    }

    private User generateAdmin() {
        User user = new User();
        user.setId(UUID.randomUUID().toString());
        user.setPassword(bCryptPasswordEncoder.encode("admin"));
        user.setUsername("admin");
        user.setFirstName("Ura");
        user.setLastName("Uvarov");
        user.setBlocked(false);
        user.setTelNumber("1234567");
        List<Role> roles = new ArrayList<>();
        roles.add(Role.ADMIN);
        user.setRoles(roles);
        return user;
    }
    private User generateUser() {
        User user = new User();
        user.setId(UUID.randomUUID().toString());
        user.setPassword(bCryptPasswordEncoder.encode("user"));
        user.setUsername("user"+ new Random().nextInt());
        user.setFirstName("UraUser");
        user.setLastName("UvarovUser");
        user.setBlocked(false);
        user.setTelNumber("34324237");
        List<Role> roles = new ArrayList<>();
        roles.add(Role.USER);
        user.setRoles(roles);
        return user;
    }

    private Tour generateTour() {
        Tour tour = new Tour();
        tour.setId(UUID.randomUUID().toString());
        tour.setCountry("Ukraine");
        tour.setHotelType(HotelType.CHAIN);
        tour.setHot(true);
        tour.setImg("bukovel.jpg");
        tour.setName("TestTour");
        tour.setPlace("Kharkov");
        tour.setPeopleCount(5);
        tour.setTourType(TourType.REST);
        tour.setStars(4);
        tour.setPrice(100500);
        return tour;
    }

    private Discount generateDis(String userId){
        Discount discount = new Discount();
        discount.setId(UUID.randomUUID().toString());
        discount.setPercent(20);
        discount.setStep(2);
        discount.setUserId(userId);
        return  discount;
    }

}