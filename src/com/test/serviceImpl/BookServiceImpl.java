package com.test.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.BookDao;
import com.test.entity.Book;
import com.test.service.BookService;

@Service("BookService")
public class BookServiceImpl implements BookService{

	@Autowired
	BookDao bookdao;
	
	@Override
	public List<Book> getBookService(String bookname) {
		// TODO Auto-generated method stub
		return bookdao.getBook(bookname);
	}

	@Override
	public List<Book> findBookService(String bookname) {
		// TODO Auto-generated method stub
		return bookdao.findBook(bookname);
	}

	@Override
	public void insertBookService(Book book) {
		// TODO Auto-generated method stub
		bookdao.insertBook(book);
	}
	

}
