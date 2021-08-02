package com.iDrink.interceptor;
//自定义拦截器

import com.iDrink.pojo.Administrator;
import com.iDrink.pojo.Customer;
import com.iDrink.pojo.Product;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.function.Supplier;

/**
 * 登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 获取请求的URL
		String url = request.getRequestURI();
		// URL:除了登录请求外，其他的URL都进行拦截控制
		if (url.indexOf("/login.action") >= 0) {
			return true;
		}
		// 获取Session
		HttpSession session = request.getSession();
		Administrator administrator = (Administrator) session.getAttribute("USER_SESSION");
		Supplier supplier = (Supplier) session.getAttribute("SUP_SESSION");
		Customer customer = (Customer) session.getAttribute("CUS_SESSION");
		Product product = (Product) session.getAttribute("PRO_SESSION");
		// 判断Session中是否有用户数据，如果有，则返回true,继续向下执行
		if (administrator != null || supplier != null || customer != null || product != null) {
			return true;
		}
		// 不符合条件的给出提示信息，并转发到登录页面
		request.setAttribute("msg", "您还没有登录，请先登录！");
		request.getRequestDispatcher("/WEB-INF/jsp/login.html").forward(request, response);
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request,
                           HttpServletResponse response,
						   Object handler,
                           ModelAndView modelAndView) throws Exception {
	}
	@Override
	public void afterCompletion(HttpServletRequest request,
								HttpServletResponse response,
								Object handler, Exception ex)
			throws Exception {
	}
}
