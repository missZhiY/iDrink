package com.iDrink.mapper;

import com.iDrink.pojo.Administrator;
import java.util.List;

public interface AdMapper {

    Administrator findAd(Administrator administrator);

    List<Administrator> adPage(Administrator administrator);

    boolean addAd(Administrator administrator);

    Integer adCount ();

}
