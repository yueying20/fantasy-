package com.controller.before;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.exception.UserException;
@Controller
public class BaseBeforeController {
	/**
	 * 登录验证
	 */
	@ModelAttribute  
    public void isLogin(HttpSession session, HttpServletRequest request) throws UserException {
       if(session.getAttribute("bruser") == null){  
            throw new UserException("用户没登录");
       }  
    } 
}
