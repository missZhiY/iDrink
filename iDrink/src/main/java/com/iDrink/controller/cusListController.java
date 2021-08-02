package com.iDrink.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.iDrink.utils.Page;
import com.iDrink.pojo.BaseDict;
import com.iDrink.pojo.Customer;
import com.iDrink.service.BaseDictService;
import com.iDrink.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * �ͻ������������
 */
@Controller
public class cusListController {
	// ����ע��
	@Autowired
	private CustomerService customerService;
	@Autowired
	private BaseDictService baseDictService;

	//��Ʒ�ֵ�����
	@Value("${product.type}")
	private String PRO_TYPE;
	//�ͻ���ַ�ֵ�����
	@Value("${customer.from.type}")
	private String CUS_FROM;

	/**
	 * ��ӡ�ͻ��б�
	 * @param page
	 * ҳ����Ĭ��ֵ defaultValue = 1
	 * @param size
	 * ÿҳ����������Ĭ��ֵ defaultValue = 10
	 * @param c_name
	 * ǰ̨����
	 * @param c_product
	 * ǰ̨����
	 * @param c_address
	 * ǰ̨����
	 * @param model
	 * ����
	 * @return
	 */
	@RequestMapping(value = "/customer/list.action")
	public String cusList (@RequestParam(defaultValue = "1") Integer page,
						   @RequestParam(defaultValue = "8") Integer size,
						   String c_name, String c_product, String c_address,
						   Model model) {

		//��ҳ
		Page<Customer> customerPage = customerService.findCusList(page, size, c_name, c_product, c_address);
		model.addAttribute("page", customerPage);

		//ģ����ѯѡ������ݻ���
		List<BaseDict> proType = baseDictService.findBaseDictByType(PRO_TYPE);
		List<BaseDict> cusFrom = baseDictService.findBaseDictByType(CUS_FROM);
		model.addAttribute("proType", proType);
		model.addAttribute("cusFrom", cusFrom);
		return "customer";
	}

	/**
	 * ��Ӳ���
	 * @return
	 */
	@RequestMapping("/customer/add")
	public String add (){
		return "customer";
	}

	/**
	 * ��ӿͻ�
	 * @param customer
	 * @return
	 */
	@RequestMapping(value="/customer/doAdd", method= RequestMethod.POST)
	public String doAdd (Customer customer) {
		System.out.println("=====doAdd====");
		customerService.AddCus(customer);
		return "customer";
	}

	/**
	 * �õ������¿ͻ�����
	 * @param id
	 * @return
	 */
	@RequestMapping("/customer/getCusById.action")
	@ResponseBody
	public Customer getCusById (Integer id) {
		Customer customer = customerService.getCustomerById(id);
		return customer;
	}

	/**
	 * ���¿ͻ���Ϣ
	 * @param customer
	 * @return
	 */
	@RequestMapping("/customer/update.action")
	@ResponseBody
	public String customerUpdate (Customer customer) {
		if (customerService.UpdateCus(customer)) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * ɾ���ͻ���Ϣ
	 * @param id
	 * @return
	 */
	@RequestMapping("/customer/delete.action")
	@ResponseBody
	public String customerDelete (Integer id) {
		if (customerService.DeleteCus(id)) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
}
