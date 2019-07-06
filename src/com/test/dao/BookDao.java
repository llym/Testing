package com.test.dao;

import java.util.List;
import java.util.Map;

import com.test.entity.Book;

public interface BookDao {
	public List<Book> getBook(String bookname);
	
	public List<Book> findBook(String bookname);
	
	public void insertBook(Book book);
	
	public void delBook(Book book);
	
	public void updateBook(Book book);

	public List<Book> getAllBook(Map<String, Object> map);

	public int getRecordNum();
}
