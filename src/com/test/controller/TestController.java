package com.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.service.BookService;
import com.test.service.BorrowService;
import com.test.service.UserService;
import com.test.entity.Book;
import com.test.entity.Borrow;

@Controller
public class TestController {
	@Autowired
	private UserService userService;
	@Autowired
	private BookService bookService;
	@Autowired
	private BorrowService borrowService;

	//登录指令
	@ResponseBody
	@RequestMapping(value="/login.do",produces="html/text;charset=utf-8")
	public String login(String username,String password,String status,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		System.out.println(username+"++++"+password+"+++"+status);
		String a=userService.findUserService(username, password,status,session);
		return a;
	}	
	//显示图书列表
		@RequestMapping("/success.do")
		public ModelAndView play() {
			System.out.println("play");
			List<Book> list = bookService.getBookService("");
			System.out.println(list);
			ModelAndView mav =new ModelAndView("firstPage");
			mav.addObject("books",list);
			return mav;
		}
		//显示借阅列表
		@RequestMapping("/borrow.do")
		public ModelAndView borrow() {
			List<Borrow> list = borrowService.getBorrowService("");
			
			System.out.println(list);
			ModelAndView mav =new ModelAndView("adminHistory");
			mav.addObject("historys",list);
			return mav;
		}

		//查询指令
	    @RequestMapping("/search.do")
	    public ModelAndView s(String nameForQuery){
			String a=nameForQuery;
			System.out.println(a);
			List<Book> list = bookService.findBookService(a);
			System.out.println(list);
			ModelAndView mav =new ModelAndView("firstPage");
			mav.addObject("books",list);
			System.out.println("2");
			return mav;
	    }
}
