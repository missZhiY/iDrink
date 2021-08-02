package com.iDrink.service;

import com.iDrink.pojo.Supplier;
import com.iDrink.utils.Page;

public interface SupplierService {

    boolean UpdateSup (Supplier supplier);

    boolean DeleteSup (Integer s_id);

    boolean AddSup (Supplier supplier);

    Supplier getSupById (Integer id);

    Page<Supplier> findSupList (Integer page, Integer size,
                                String s_name, String s_product, String s_address);

}
