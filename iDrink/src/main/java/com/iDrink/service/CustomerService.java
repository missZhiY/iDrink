package com.iDrink.service;

import com.iDrink.utils.Page;
import com.iDrink.pojo.Customer;

public interface CustomerService {

    boolean UpdateCus (Customer customer);

    boolean DeleteCus (Integer c_id);

    boolean AddCus (Customer customer);

    Customer getCustomerById (Integer id);

    Page<Customer> findCusList (Integer page, Integer size,
                                String c_name, String c_product, String c_address);
}
