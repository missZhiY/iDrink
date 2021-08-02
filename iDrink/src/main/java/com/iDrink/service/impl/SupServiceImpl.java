package com.iDrink.service.impl;

import com.iDrink.utils.Page;
import com.iDrink.mapper.SupMapper;
import com.iDrink.pojo.Supplier;
import com.iDrink.service.SupplierService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class SupServiceImpl implements SupplierService {

    @Autowired
    private SupMapper supMapper;

    @Override
    public boolean UpdateSup(Supplier supplier) {
        return supMapper.updateSup(supplier);
    }

    @Override
    public boolean DeleteSup (Integer s_id) {
        return supMapper.deleteSup(s_id);
    }

    @Override
    public boolean AddSup(Supplier supplier) {
        return supMapper.addSup(supplier);
    }

    @Override
    public Supplier getSupById(Integer id) {
        return supMapper.getSupById(id);
    }

    @Override
    public Page<Supplier> findSupList(Integer page, Integer size,
                                      String s_name, String s_product, String s_address) {

        Supplier supplier = new Supplier();
        if (StringUtils.isNotBlank(s_name)) {
            supplier.setS_name(s_name);
        }
        if (StringUtils.isNotBlank(s_product)) {
            supplier.setS_product(s_product);
        }
        if (StringUtils.isNotBlank(s_address)) {
            supplier.setS_address(s_address);
        }
        //当前页
        supplier.setStart((page -1) * size);
        //每页数
        supplier.setSize(size);

        List<Supplier> list = supMapper.supPage(supplier);
        Integer count = supMapper.supCount(supplier);

        Page<Supplier> supplierPage = new Page<>();
        supplierPage.setPage(page);
        supplierPage.setRows(list);
        supplierPage.setSize(size);
        supplierPage.setTotal(count);
        return supplierPage;
    }
}
