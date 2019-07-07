package com.test.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.entity.Book;
import com.test.entity.Borrow;
import com.test.entity.User;
import com.test.service.BookService;
import com.test.service.BorrowService;
import com.test.service.UserService;

@Controller
public class BorrowController {
	@Autowired
	private UserService userService;
	@Autowired
	private BookService bookService;
	@Autowired
	private BorrowService borrowService;
	@RequestMapping("/changePage2")
	public ModelAndView changePage2(int pageAdd,int currentPage) {
		System.out.println("借阅历史换页");
		currentPage+=pageAdd;
		System.out.println(currentPage);
		int recordNum=borrowService.getRecordNum();
		System.out.println("共"+recordNum);
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
		
		ModelAndView mav =new ModelAndView("adminHistory");
		mav.addObject("recordNum",recordNum);
		mav.addObject("currentPage",currentPage);
		mav.addObject("pages",pages);
		mav.addObject("historys",list);
		return mav;
	}
	
	@RequestMapping("/changePage3")//图书借阅翻页
	public ModelAndView changePage3(int pageAdd,int currentPage) {
		System.out.println("图书借阅换页");
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
		System.out.println(list);
		ModelAndView mav =new ModelAndView("studentfirst");
		mav.addObject("recordNum",recordNum);
		mav.addObject("currentPage",currentPage);
		mav.addObject("pages",pages);
		mav.addObject("books",list);
		return mav;
	}
	@RequestMapping("/changePage4")//我的借阅翻页
	public ModelAndView changePage4(int pageAdd,int currentPage,HttpServletRequest request) {
		System.out.println("我的借阅换页");
		String name=(String) request.getSession().getAttribute("username");
	    User user = userService.findUseridService(name);
    	String a=user.getName();
    	List<Borrow> alllist = borrowService.getsBorrowService(a);
    	System.out.println(alllist);
    	List<Borrow> pagelist = new ArrayList<Borrow>();
    	int recordNum= alllist.size();
    	currentPage+=pageAdd;
    	System.out.println("第"+currentPage);
		int pageSize = 3;
		int pages;
		if(recordNum%pageSize != 0) {
			pages = recordNum/pageSize +1;
		}else 
			pages = recordNum/pageSize;
		
		
		for(int i = (currentPage -1) *pageSize; i<recordNum&&i<currentPage*pageSize;i++) {
			System.out.println(i);
			pagelist.add(alllist.get(i));
		}
		
    	
    	
	    
		ModelAndView mav =new ModelAndView("myBorrow");
		mav.addObject("recordNum",recordNum);
		mav.addObject("currentPage",currentPage);
		mav.addObject("pages",pages);
		mav.addObject("historys",pagelist);
		return mav;
	}
}
