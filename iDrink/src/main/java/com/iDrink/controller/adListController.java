package com.iDrink.controller;

import com.iDrink.utils.Page;
import com.iDrink.pojo.Administrator;
import com.iDrink.service.AdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
/**
 * 管理员控制器类
 */
@Controller
public class adListController {
	// 依赖注入
	@Autowired
	private AdService adService;

	/**
	 * 打印管理员列表
	 * @param page
	 * 页数，默认值 defaultValue = 1
	 * @param size
	 * 每页数据条数，默认值 defaultValue = 10
	 * @param model
	 * 传参
	 * @return
	 */
	@RequestMapping(value = "/administrator/list.action")
	public String supList (@RequestParam(defaultValue = "1") Integer page,
						   @RequestParam(defaultValue = "10") Integer size,
						   Model model) {

		//分页
		Page<Administrator> administratorPage = adService.findSupList(page, size);
		model.addAttribute("page", administratorPage);
		return "administrator";
	}

	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping(value = "administrator/exit.action")
	public String exit () {
		return "login";
	}

}
