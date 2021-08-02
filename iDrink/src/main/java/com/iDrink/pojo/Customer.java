package com.iDrink.pojo;

public class Customer {

    private Integer c_id;
    private String c_name;
    private Integer c_priority;
    private String c_phone;
    private String c_address;
    private String c_product;
    private String c_price;
    private Integer c_ordercount;
    private String c_totalpay;
    private Integer start;
    private Integer size;

    public Integer getC_id() {
        return c_id;
    }

    public void setC_id(Integer c_id) {
        this.c_id = c_id;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public Integer getC_priority() {
        return c_priority;
    }

    public void setC_priority(int c_priority) {
        this.c_priority = c_priority;
    }

    public String getC_phone() {
        return c_phone;
    }

    public void setC_phone(String c_phone) {
        this.c_phone = c_phone;
    }

    public String getC_address() {
        return c_address;
    }

    public void setC_address(String c_address) {
        this.c_address = c_address;
    }

    public String getC_product() {
        return c_product;
    }

    public void setC_product(String c_product) {
        this.c_product = c_product;
    }

    public String getC_price() {
        return c_price;
    }

    public void setC_price(String c_price) {
        this.c_price = c_price;
    }

    public Integer getC_ordercount() {
        return c_ordercount;
    }

    public void setC_ordercount(Integer c_ordercount) {
        this.c_ordercount = c_ordercount;
    }

    public String getC_totalpay() {
        return c_totalpay;
    }

    public void setC_totalpay(String c_totalpay) {
        this.c_totalpay = c_totalpay;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }
}
