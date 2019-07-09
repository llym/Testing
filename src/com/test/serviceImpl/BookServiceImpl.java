package com.test.serviceImpl;

import java.util.List;
import java.util.Map;

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

	@Override
	public void delBookService(Book book) {
		// TODO Auto-generated method stub
		bookdao.delBook(book);
	}

	@Override
	public void updateBookService(Book book) {
		// TODO Auto-generated method stub
		bookdao.updateBook(book);
	}

	@Override
	public List<Book> getCurrPageBook(Map<String, Object> map) {
		
		return bookdao.getAllBook(map);
	}

	@Override
	public int getRecordNum() {
		
		return bookdao.getRecordNum();
	}

	@Override
	public Book findBookidService(Integer id) {
		// TODO Auto-generated method stub
		return bookdao.findBookid(id);
	}

	@Override
	public void reduceBookService(Integer id) {
		// TODO Auto-generated method stub
		bookdao.reduceBook(id);
	}

	@Override
	public void addBookService(Integer id) {
		// TODO Auto-generated method stub
		bookdao.addBook(id);
	}
	

}
