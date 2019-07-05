package com.test.service;

import java.util.List;

import com.test.entity.Book;

public interface BookService {
	public List<Book> getBookService(String bookname);
	
	public List<Book> findBookService(String bookname);
}
