package ua.nure.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.nure.model.Discount;
import ua.nure.repository.DiscountRepository;
import ua.nure.service.DiscountService;

@Service
public class DiscountServiceImpl implements DiscountService {

    @Autowired private DiscountRepository discountRepository;

    @Override
    public Discount findByUser(String idUser) {
        return discountRepository.findByUserId(idUser);
    }
}
