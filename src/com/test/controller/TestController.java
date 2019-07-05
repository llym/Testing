package com.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	
	//登录指令
		@ResponseBody
		@RequestMapping(value="/login.do",produces="html/text;charset=utf-8")
		public String login(String username,String password,String status,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
			System.out.println(username+"++++"+password+"+++"+status);
			session.setAttribute("username",username);
			return "1";
		}
	
}
