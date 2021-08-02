package com.iDrink.service;

import com.iDrink.utils.Page;
import com.iDrink.pojo.Product;

public interface ProductService {

    boolean UpdatePro (Product product);

    boolean DeletePro (int pid);

    boolean AddPro (Product product);

    Product getProById (Integer id);

    Page<Product> findProList (Integer page, Integer size,
                               String p_name, String s_name, String s_address);
}
