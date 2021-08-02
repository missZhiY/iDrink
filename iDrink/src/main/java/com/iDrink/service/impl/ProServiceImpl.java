package com.iDrink.service.impl;

import com.iDrink.utils.Page;
import com.iDrink.mapper.ProMapper;
import com.iDrink.pojo.Product;
import com.iDrink.service.ProductService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ProServiceImpl implements ProductService {

    @Autowired
    private ProMapper proMapper;

    @Override
    public boolean UpdatePro(Product product) {
        return proMapper.updatePro(product);
    }

    @Override
    public boolean DeletePro(int pid) {
        return proMapper.deletePro(pid);
    }

    @Override
    public boolean AddPro(Product product) {
        return proMapper.addPro(product);
    }

    @Override
    public Product getProById(Integer id) {
        return proMapper.getProById(id);
    }

    @Override
    public Page<Product> findProList(Integer page, Integer size,
                                     String p_name, String s_name, String s_address) {

        Product product = new Product();
        if (StringUtils.isNotBlank(p_name)) {
            product.setP_name(p_name);
        }
        if (StringUtils.isNotBlank(s_name)) {
            product.setS_name(s_name);
        }
        if (StringUtils.isNotBlank(s_address)) {
            product.setS_address(s_address);
        }

        product.setStart((page -1) * size);
        product.setSize(size);

        //获取supplier内容列表
        List<Product> list = proMapper.proPage(product);
        //查询表中有多少数据
        Integer count = proMapper.proCount(product);

        Page<Product> productPage = new Page<>();
        productPage.setPage(page);
        productPage.setRows(list);
        productPage.setSize(size);
        productPage.setTotal(count);
        return productPage;
    }
}
