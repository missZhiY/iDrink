package com.iDrink.controller;

import com.iDrink.pojo.Administrator;
import com.iDrink.service.AdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * 登录控制器类
 */
@Controller
public class LoginController {
	// 依赖注入
	@Autowired
	private AdService adService;

	/**
	 * 管理员登录
	 * @param a_phone
	 * 前台属性
	 * @param a_password
	 * 前台属性
	 * @param model
	 * 传参
	 * @param session
	 * 存储会话所需属性，这里用来存放 administrator 对象
	 * @return
	 * 返回值为对应页面
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String a_phone, String a_password, Model model, HttpSession session) {

		Administrator administrator = new Administrator();
		administrator.setA_phone(a_phone);
		administrator.setA_password(a_password);
		// 通过账号和密码查询用户
		Administrator ad = adService.FindAd(administrator);

		if(ad != null) {
			// 说明在数据库中查到了，将管理员对象添加到Session
			session.setAttribute("USER_SESSION", administrator);
			// 跳转到主页面
			return "redirect:administrator/list.action";
		} else {
			// 验证失败，返回登录页面
			model.addAttribute("msg", "账号或密码错误，请重新输入！");
			return "login";
		}
	}

	/**
	 * 退出登录
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法
	    return "login";
	}

	/**
	 * 管理员账户注册
	 * @return
	 */
	@RequestMapping("/login/add")
	public String add(){
		return "login";
	}

	/**
	 * 注册操作
	 * @param administrator
	 * @return
	 */
	@RequestMapping(value="/login/doAdd", method= RequestMethod.POST)
	public String doAdd(Administrator administrator) {
		adService.registAd(administrator);
		return "login";
	}

}
