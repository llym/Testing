package com.test.dao;

import java.util.List;

import com.test.entity.Book;

public interface BookDao {
	public List<Book> getBook(String bookname);
	
	public List<Book> findBook(String bookname);
}
