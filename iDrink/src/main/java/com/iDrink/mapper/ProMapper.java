package com.iDrink.mapper;

import com.iDrink.pojo.Product;

import java.util.List;

public interface ProMapper {

    List<Product> selectPro ();

    List<Product> proPage (Product product);

    boolean updatePro (Product product);

    boolean deletePro (int p_id);

    boolean addPro (Product product);

    Product getProById (Integer id);

    Integer proCount (Product product);
}
