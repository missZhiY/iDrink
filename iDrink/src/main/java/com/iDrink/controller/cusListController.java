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
 * 客户管理控制器类
 */
@Controller
public class cusListController {
	// 依赖注入
	@Autowired
	private CustomerService customerService;
	@Autowired
	private BaseDictService baseDictService;

	//商品字典索引
	@Value("${product.type}")
	private String PRO_TYPE;
	//客户地址字典索引
	@Value("${customer.from.type}")
	private String CUS_FROM;

	/**
	 * 打印客户列表
	 * @param page
	 * 页数，默认值 defaultValue = 1
	 * @param size
	 * 每页数据条数，默认值 defaultValue = 10
	 * @param c_name
	 * 前台属性
	 * @param c_product
	 * 前台属性
	 * @param c_address
	 * 前台属性
	 * @param model
	 * 传参
	 * @return
	 */
	@RequestMapping(value = "/customer/list.action")
	public String cusList (@RequestParam(defaultValue = "1") Integer page,
						   @RequestParam(defaultValue = "8") Integer size,
						   String c_name, String c_product, String c_address,
						   Model model) {

		//分页
		Page<Customer> customerPage = customerService.findCusList(page, size, c_name, c_product, c_address);
		model.addAttribute("page", customerPage);

		//模糊查询选择框数据回显
		List<BaseDict> proType = baseDictService.findBaseDictByType(PRO_TYPE);
		List<BaseDict> cusFrom = baseDictService.findBaseDictByType(CUS_FROM);
		model.addAttribute("proType", proType);
		model.addAttribute("cusFrom", cusFrom);
		return "customer";
	}

	/**
	 * 添加操作
	 * @return
	 */
	@RequestMapping("/customer/add")
	public String add (){
		return "customer";
	}

	/**
	 * 添加客户
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
	 * 拿到待更新客户对象
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
	 * 更新客户信息
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
	 * 删除客户信息
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
