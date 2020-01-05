package com.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.admin.AdminOrderService;

/**
 * 订单类
 * @author 清越
 */
@Controller
@RequestMapping("/adminOrder")
public class AdminOrderController extends BaseController{
	//自动装配 service层中的方法
	@Autowired
	private AdminOrderService adminOrderService;
	//显示订单管理
	@RequestMapping("/orderInfo")
	public String orderInfo(Model model) {
		return adminOrderService.orderInfo(model);
	}
	@RequestMapping("/deleteorderManager")
	public String deleteorderManager(Integer id) {
		return adminOrderService.deleteorderManager(id);
	}

}
