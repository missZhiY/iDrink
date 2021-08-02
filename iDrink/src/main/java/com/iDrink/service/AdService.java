package com.iDrink.service;

import com.iDrink.pojo.Administrator;
import com.iDrink.utils.Page;

public interface AdService {

    Administrator FindAd (Administrator administrator);

    boolean registAd (Administrator administrator);

    Page<Administrator> findSupList(Integer page, Integer rows);
}
