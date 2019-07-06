package com.test.service;

import java.util.List;
import java.util.Map;

import com.test.entity.Book;

public interface BookService {
	public List<Book> getBookService(String bookname);
	
	public List<Book> findBookService(String bookname);
	
	public void insertBookService(Book book);
	
	public void delBookService(Book book);
	
	public void updateBookService(Book book);

	public List<Book> getCurrPageBook(Map<String, Object> map);

	public int getRecordNum();
}
