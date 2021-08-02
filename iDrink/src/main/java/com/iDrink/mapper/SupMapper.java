package com.iDrink.mapper;

import com.iDrink.pojo.Supplier;

import java.util.List;

public interface SupMapper {

    List<Supplier> supPage(Supplier supplier);

    boolean updateSup (Supplier supplier);

    boolean deleteSup (Integer s_id);

    boolean addSup (Supplier supplier);

    Supplier getSupById (Integer id);

    Integer supCount (Supplier supplier);

}
