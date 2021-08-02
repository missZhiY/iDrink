package com.iDrink.service.impl;

import com.iDrink.utils.Page;
import com.iDrink.mapper.AdMapper;
import com.iDrink.pojo.Administrator;
import com.iDrink.service.AdService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class AdServiceImpl implements AdService {

    @Autowired
    private AdMapper adMapper;

    @Override
    public Administrator FindAd(Administrator administrator) {
        return adMapper.findAd(administrator);
    }

    @Override
    public boolean registAd (Administrator administrator) {
        return adMapper.addAd(administrator);
    }

    @Override
    public com.iDrink.utils.Page<Administrator> findSupList(Integer page, Integer size) {

        Administrator administrator = new Administrator();
        administrator.setSize(size);
        administrator.setStart((page -1) * size);
        administrator.setSize(size);

        //获取supplier内容列表
        List<Administrator> list = adMapper.adPage(administrator);
        //查询表中有多少数据
        Integer count = adMapper.adCount();

        Page<Administrator> administratorPage = new Page<>();
        administratorPage.setPage(page);
        administratorPage.setRows(list);
        administratorPage.setSize(size);
        administratorPage.setTotal(count);
        return administratorPage;
    }
}
