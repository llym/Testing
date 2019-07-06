package com.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.entity.Book;
import com.test.service.BookService;
import com.test.service.BorrowService;
import com.test.service.UserService;


@Controller
public class FunctionController {
		@Autowired
		private UserService userService;
		@Autowired
		private BookService bookService;
		@Autowired
		private BorrowService borrowService;
		
		//查询指令
	    @RequestMapping("/search.do")
	    public ModelAndView sear(String nameForQuery){
			List<Book> list = bookService.findBookService(nameForQuery);
			ModelAndView mav =new ModelAndView("firstPage");
			mav.addObject("books",list);
			return mav;
	    }
	    
	  //删除指令
	    @RequestMapping("/delete.do")
	    public ModelAndView del(Model model,@RequestParam("del") String id){
	    	Book book = new Book();
	    	book.setId(Integer.decode(id));
	    	bookService.delBookService(book);
			List<Book> list = bookService.getBookService("");
			ModelAndView mav =new ModelAndView("firstPage");
			mav.addObject("books",list);
			return mav;
	    }
	    
}
