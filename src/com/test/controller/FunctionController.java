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
			ModelAndView mav =new ModelAndView("redirect:/success.do");
			mav.addObject("books",list);
			return mav;
	    }
	    //修改指令
	    @RequestMapping("/update.do")
		public String  update(String name,String press,String author,String num,String id) {
	    	
	    	System.out.println(name+press+author+num);
	    	Book book = new Book();
	    	book.setBookname(name);
        	book.setInventory(Integer.decode(num));
	    	book.setPress(press);
	    	book.setAuthor(author);
	    	book.setId(Integer.decode(id));
	    	bookService.updateBookService(book);
	    	
			return "1";
		}
	    //插入指令
	    @RequestMapping("/insert.do")
		public ModelAndView inert() {
	    	Book book = new Book();
	    	book.setBookname("明天你好");
	    	book.setAuthor("李明");
	    	book.setInventory(134);
	    	book.setPress("早安出版社");
	    	
	    	bookService.insertBookService(book);
	    	List<Book> list = bookService.getBookService("");
			ModelAndView mav =new ModelAndView("firstPage");
			mav.addObject("books",list);
			return mav;
		}
}
