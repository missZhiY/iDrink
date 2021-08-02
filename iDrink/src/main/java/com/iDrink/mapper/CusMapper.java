package com.iDrink.mapper;

import com.iDrink.pojo.Customer;

import java.util.List;

public interface CusMapper {

    List<Customer> cusPage(Customer customer);

    boolean updateCus(Customer customer);

    boolean deleteCus(Integer c_id);

    boolean addCus(Customer customer);

    Customer getCustomerById(Integer id);

    Integer cusCount (Customer customer);
}
