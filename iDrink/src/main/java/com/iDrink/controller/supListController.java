package com.iDrink.controller;

import com.iDrink.pojo.BaseDict;
import com.iDrink.pojo.Supplier;
import com.iDrink.service.BaseDictService;
import com.iDrink.service.SupplierService;
import com.iDrink.utils.Page;
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
 * ��Ӧ�̹����������
 */
@Controller
public class supListController {
    // ����ע��
    @Autowired
    private SupplierService supplierService;
    @Autowired
    private BaseDictService baseDictService;

    //��Ʒ�ֵ�����
    @Value("${product.type}")
    private String PRO_TYPE;
    //��Ӧ�̵�ַ�ֵ�����
    @Value("${supplier.from.type}")
    private String SUP_FROM;


    /**
     * ��ӡ��Ӧ���б�
     * @param page
     * @param size
     * @param s_name
     * @param s_product
     * @param s_address
     * @param model
     * @return
     */
    @RequestMapping(value = "/supplier/list.action")
    public String supList (@RequestParam(defaultValue="1")Integer page,
                           @RequestParam(defaultValue="8")Integer size,
                           String s_name, String s_product, String s_address,
                           Model model) {

        //��ҳ
        Page<Supplier> supplierPage = supplierService.findSupList(page, size, s_name, s_product, s_address);
        model.addAttribute("page", supplierPage);

        //ģ����ѯѡ������ݻ���
        List<BaseDict> proType = baseDictService.findBaseDictByType(PRO_TYPE);
        List<BaseDict> supFrom = baseDictService.findBaseDictByType(SUP_FROM);
        model.addAttribute("proType", proType);
        model.addAttribute("supFrom", supFrom);
        return "supplier";
    }


    /**
     * ���ӹ�Ӧ��
     * @return
     */
    @RequestMapping("/supplier/add")
    public String add(){
        return "supplier";
    }

    /**
     * ���Ӳ���
     * @param supplier
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/supplier/doAdd", method= RequestMethod.POST)
    public String doAdd(Supplier supplier) throws Exception {

        System.out.println("=====doAdd====");
        supplierService.AddSup(supplier);
        return "supplier";
    }

    /**
     * �õ������¹�Ӧ�̶���
     * @param id
     * @return
     */
    @RequestMapping("/supplier/getSupById.action")
    @ResponseBody
    public Supplier getSupById(Integer id) {
        Supplier supplier = supplierService.getSupById(id);
        return supplier;
    }

    /**
     * ���¹�Ӧ��
     * @param supplier
     * @return
     */
    @RequestMapping("/supplier/update.action")
    @ResponseBody
    public String supUpdate(Supplier supplier) {
        if (supplierService.UpdateSup(supplier)) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

    /**
     * ɾ����Ӧ��
     * @param id
     * @return
     */
    @RequestMapping("/supplier/delete.action")
    @ResponseBody
    public String supDelete (Integer id) {
        if (supplierService.DeleteSup(id)) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

}
