package com.test.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.test.entity.Borrow;
import com.test.entity.User;
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
		
		//图书查询指令
	    @RequestMapping("/search.do")
	    public ModelAndView sear(String nameForQuery){
			List<Book> list = bookService.findBookService(nameForQuery);
			ModelAndView mav =new ModelAndView("firstPage");
			mav.addObject("books",list);
			return mav;
	    }
	   //学生图书查询指令
	    @RequestMapping("/ssearch.do")
	    public ModelAndView ssear(String nameForQuery){
			List<Book> list = bookService.findBookService(nameForQuery);
			ModelAndView mav =new ModelAndView("studentfirst");
			mav.addObject("books",list);
			return mav;
	    }
	    
	    //借阅查询指令
	    @RequestMapping("/find.do")
	    public ModelAndView find(String nameForQuery){
	    	System.out.println(nameForQuery);
	    	List<Borrow> list = borrowService.findBorrowService(nameForQuery);
			ModelAndView mav =new ModelAndView("adminHistory");
			mav.addObject("historys",list);
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
		public String inert(String name,String press,String author,String num) {
	    	System.out.println(name+press+author+num);
	    	Book book = new Book();
	    	book.setBookname(name);
        	book.setInventory(Integer.decode(num));
	    	book.setPress(press);
	    	book.setAuthor(author);
	    	bookService.insertBookService(book);
			return "1";
		}
	    
	    //借阅指令
	    @RequestMapping("/borrowbook.do")
	    public ModelAndView bor(Model model,@RequestParam("bor") String id,HttpServletRequest request){
	    	String name=(String) request.getSession().getAttribute("username");
	    	User user = userService.findUseridService(name);
	    	String a=user.getName();
	    	String b=user.getStudynumb();
	    	Book book = bookService.findBookidService(Integer.decode(id));
	    	String c=book.getBookname();
	    	String d=book.getAuthor();
	    	String e=book.getPress();
	    	Date date = new Date();
	    	Borrow borrow = new Borrow();
	    	borrow.setBookname(c);
	    	borrow.setBorrowtime(date);
	    	borrow.setAuthor(d);
	    	borrow.setPress(e);
	    	borrow.setStudynumb(b);
	    	borrow.setName(a);
	    	borrow.setBorrowtime(date);
	    	borrowService.insertBorrowService(borrow);
			List<Book> list = bookService.getBookService("");
			ModelAndView mav =new ModelAndView("redirect:/student.do");
			mav.addObject("books",list);
			return mav;
	    }
	    
	    
}
