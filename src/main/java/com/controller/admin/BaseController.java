package com.controller.admin;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.exception.AdminException;
@Controller
public class BaseController {

	@ModelAttribute  //注解
	//没有登录就调用该方法
    public void isLogin(HttpSession session, HttpServletRequest request) throws AdminException {
       if(session.getAttribute("auser") == null){  
            throw new AdminException("没有登录");
       }  
    } 
}
