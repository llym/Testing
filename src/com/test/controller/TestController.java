package com.test.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
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
import com.test.entity.User;

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
			System.out.println("图书管理页");
			int currentPage = 1;
			System.out.println(currentPage);
			int recordNum=bookService.getRecordNum();
			System.out.println("共"+recordNum);
			int pageSize = 8;
			int pages;
			List<Book> list = new ArrayList<Book>();
			if(recordNum%pageSize !=0) {
				pages = recordNum/pageSize +1;
			}else 
				pages = recordNum/pageSize;
			if(currentPage<=pages) {
				int currIndex = (currentPage -1) *pageSize;
				Map<String,Object> map = new HashedMap();
				map.put("currIndex", currIndex);
				map.put("pageSize", pageSize);
				list = bookService.getCurrPageBook(map);
			}
			
			ModelAndView mav =new ModelAndView("firstPage");
			mav.addObject("recordNum",recordNum);
			mav.addObject("currentPage",currentPage);
			mav.addObject("books",list);
			mav.addObject("pages",pages);
			return mav;
		}
		//显示学生图书列表
				@RequestMapping("/student.do")
				public ModelAndView student() {
					System.out.println("图书借阅");
					int currentPage = 1;
					System.out.println(currentPage);
					int recordNum=bookService.getRecordNum();
					System.out.println("共"+recordNum);
					int pageSize = 8;
					int pages;
					List<Book> list = new ArrayList<Book>();
					if(recordNum%pageSize !=0) {
						pages = recordNum/pageSize +1;
					}else 
						pages = recordNum/pageSize;
					if(currentPage<=pages) {
						int currIndex = (currentPage -1) *pageSize;
						Map<String,Object> map = new HashedMap();
						map.put("currIndex", currIndex);
						map.put("pageSize", pageSize);
						list = bookService.getCurrPageBook(map);
					}
					
					ModelAndView mav =new ModelAndView("studentfirst");
					mav.addObject("recordNum",recordNum);
					mav.addObject("currentPage",currentPage);
					mav.addObject("books",list);
					mav.addObject("pages",pages);
					return mav;
				}
		
		@RequestMapping("/changePage")
		public ModelAndView changePage(int pageAdd,int currentPage) {
			System.out.println("图书管理换页");
			currentPage+=pageAdd;
			System.out.println(currentPage);
			int recordNum=bookService.getRecordNum();
			System.out.println("共"+recordNum);
			int pageSize = 8;
			int pages;
			List<Book> list = new ArrayList<Book>();
			if(recordNum%pageSize !=0) {
				pages = recordNum/pageSize +1;
			}else 
				pages = recordNum/pageSize;
			if(currentPage<=pages) {
				int currIndex = (currentPage -1) *pageSize;
				Map<String,Object> map = new HashedMap();
				map.put("currIndex", currIndex);
				map.put("pageSize", pageSize);
				list = bookService.getCurrPageBook(map);
			}
			
			ModelAndView mav =new ModelAndView("firstPage");
			mav.addObject("recordNum",recordNum);
			mav.addObject("currentPage",currentPage);
			mav.addObject("pages",pages);
			mav.addObject("books",list);
			return mav;
		}
		
		//显示借阅列表
		@RequestMapping("/borrow.do")
		public ModelAndView borrow() {
			System.out.println("管理借阅");
			int currentPage=1;
			int recordNum = borrowService.getRecordNum();
			int pageSize = 3;
			int pages;
			List<Borrow> list = new ArrayList<Borrow>();
			if(recordNum%pageSize !=0) {
				pages = recordNum/pageSize +1;
			}else 
				pages = recordNum/pageSize;
			if(currentPage<=pages) {
				int currIndex = (currentPage -1) *pageSize;
				Map<String,Object> map = new HashedMap();
				map.put("currIndex", currIndex);
				map.put("pageSize", pageSize);
				list = borrowService.getCurrPageBorrow(map);
			}
			System.out.println(list);
			ModelAndView mav =new ModelAndView("adminHistory");
			mav.addObject("recordNum",recordNum);
			mav.addObject("currentPage",currentPage);
			mav.addObject("pages",pages);
			mav.addObject("historys",list);
			return mav;
		}
		
		
		//显示借阅列表
		@RequestMapping("/sborrow.do")//我的借阅
		   public ModelAndView find(HttpServletRequest request){
		    String name=(String) request.getSession().getAttribute("username");
		    User user = userService.findUseridService(name);
	    	String a=user.getName();
	    	List<Borrow> alllist = borrowService.getsBorrowService(a);
	    	List<Borrow> pagelist = new ArrayList<Borrow>();
	    	int recordNum= alllist.size();
	    	System.out.println("共"+recordNum);
	    	int currentPage=1;
			int pageSize = 3;
			int pages;
			if(recordNum%pageSize !=0) {
				pages = recordNum/pageSize +1;
			}else 
				pages = recordNum/pageSize;
			if(currentPage<=pages) {
				int currIndex = (currentPage -1) *pageSize;
				for(int i = currIndex; i < pageSize;i++) {
					pagelist.add(alllist.get(i));
				}
				
			}
	    	System.out.println(pagelist);
	    	
	    	
		    
			ModelAndView mav =new ModelAndView("myBorrow");
			mav.addObject("recordNum",recordNum);
			mav.addObject("currentPage",currentPage);
			mav.addObject("pages",pages);
			mav.addObject("historys",pagelist);
			return mav;
		}

}
