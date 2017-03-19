package ua.nure.service;

import ua.nure.model.Discount;

public interface DiscountService {

    Discount findByUser(String idUser);
}
