package com.iDrink.service.impl;

import com.iDrink.utils.Page;
import com.iDrink.mapper.CusMapper;
import com.iDrink.pojo.Customer;
import com.iDrink.service.CustomerService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CusServiceImpl implements CustomerService {

    @Autowired
    private CusMapper cusMapper;

    @Override
    public boolean UpdateCus(Customer customer) {
        //根据单价和订单量自动计算总金额
        if (customer.getC_ordercount() != null && customer.getC_price() != null) {
            double total = Double.parseDouble(customer.getC_price()) * customer.getC_ordercount();
            customer.setC_totalpay(String.valueOf(total));
        }
        return cusMapper.updateCus(customer);
    }

    @Override
    public boolean DeleteCus(Integer c_id) {
        return cusMapper.deleteCus(c_id);
    }

    @Override
    public boolean AddCus(Customer customer) {
        //根据单价和订单量自动计算总金额
        double total = Double.parseDouble(customer.getC_price()) * customer.getC_ordercount();
        customer.setC_totalpay(String.valueOf(total));
        return cusMapper.addCus(customer);
    }

    @Override
    public Customer getCustomerById(Integer id) {
        return cusMapper.getCustomerById(id);
    }

    @Override
    public Page<Customer> findCusList(Integer page, Integer size,
                                      String c_name, String c_product, String c_address) {

        Customer customer = new Customer();
        if (StringUtils.isNotBlank(c_name)) {
            customer.setC_name(c_name);
        }
        if (StringUtils.isNotBlank(c_product)) {
            customer.setC_product(c_product);
        }
        if (StringUtils.isNotBlank(c_address)) {
            customer.setC_address(c_address);
        }
        customer.setStart((page -1) * size);
        customer.setSize(size);

        //获取customer内容列表
        List<Customer> list = cusMapper.cusPage(customer);
        //查询表中有多少数据
        Integer count = cusMapper.cusCount(customer);

        Page<Customer> customerPage = new Page<>();
        customerPage.setPage(page);
        customerPage.setRows(list);
        customerPage.setSize(size);
        customerPage.setTotal(count);
        return customerPage;
    }
}
