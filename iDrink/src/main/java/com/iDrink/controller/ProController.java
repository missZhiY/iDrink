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
 * ��Ʒ�����������
 */
@Controller
public class ProController {

    // ����ע��
    @Autowired
    private ProductService productService;
    @Autowired
    private BaseDictService baseDictService;

    //��Ӧ���ֵ�����
    @Value("${supplier.name.type}")
    private String SUP_NAME;
    //��Ӧ�̵�ַ�ֵ�����
    @Value("${supplier.from.type}")
    private String SUP_FROM;

    /**
     * ��ӡ��Ʒ�б�
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

        //��ҳ
        Page<Product> productPage = productService.findProList(page, size, p_name, s_name, s_address);
        model.addAttribute("page", productPage);

        //ģ����ѯѡ������ݻ���
        List<BaseDict> supName = baseDictService.findBaseDictByType(SUP_NAME);
        List<BaseDict> supFrom = baseDictService.findBaseDictByType(SUP_FROM);
        model.addAttribute("supName", supName);
        model.addAttribute("supFrom", supFrom);
        return "product";
    }

    /**
     * ������Ʒ
     * @return
     */
    @RequestMapping("/product/add")
    public String add(){
        return "product";
    }

    /**
     * ���Ӳ���
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
     * �õ���������Ʒ����
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
     * ������Ʒ��Ϣ
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
     * ɾ����Ʒ
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
