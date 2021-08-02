package com.iDrink.controller;

import com.iDrink.utils.Page;
import com.iDrink.pojo.BaseDict;
import com.iDrink.pojo.Product;
import com.iDrink.service.BaseDictService;
import com.iDrink.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 商品管理控制器类
 */
@Controller
public class ProController {

    // 依赖注入
    @Autowired
    private ProductService productService;
    @Autowired
    private BaseDictService baseDictService;

    //供应商字典索引
    @Value("${supplier.name.type}")
    private String SUP_NAME;
    //供应商地址字典索引
    @Value("${supplier.from.type}")
    private String SUP_FROM;

    /**
     * 打印商品列表
     * @param page
     * @param size
     * @param p_name
     * @param s_name
     * @param s_address
     * @param model
     * @return
     */
    @RequestMapping(value = "/product/list.action")
    public String proList (@RequestParam(defaultValue = "1") Integer page,
                           @RequestParam(defaultValue = "8") Integer size,
                           String p_name, String s_name, String s_address,
                           Model model) {

        //分页
        Page<Product> productPage = productService.findProList(page, size, p_name, s_name, s_address);
        model.addAttribute("page", productPage);

        //模糊查询选择框数据回显
        List<BaseDict> supName = baseDictService.findBaseDictByType(SUP_NAME);
        List<BaseDict> supFrom = baseDictService.findBaseDictByType(SUP_FROM);
        model.addAttribute("supName", supName);
        model.addAttribute("supFrom", supFrom);
        return "product";
    }

    /**
     * 增加商品
     * @return
     */
    @RequestMapping("/product/add")
    public String add(){
        return "product";
    }

    /**
     * 增加操作
     * @param product
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/product/doAdd", method= RequestMethod.POST)
    public String doAdd(Product product) throws Exception {

        System.out.println("=====doAdd====");
        productService.AddPro(product);
        return "product";
    }

    /**
     * 拿到待更新商品对象
     * @param id
     * @return
     */
    @RequestMapping("/product/getProById.action")
    @ResponseBody
    public Product getProById(Integer id) {
        Product product = productService.getProById(id);
        return product;
    }

    /**
     * 更新商品信息
     * @param product
     * @return
     */
    @RequestMapping("/product/update.action")
    @ResponseBody
    public String proUpdate (Product product) {
        if (productService.UpdatePro(product)) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

    /**
     * 删除商品
     * @param id
     * @return
     */
    @RequestMapping("/product/delete.action")
    @ResponseBody
    public String proDelete(Integer id) {
        if (productService.DeletePro(id)) {
            return "OK";
        } else {
            return "FAIL";
        }
    }
}
