package com.test.service;

import java.util.List;

import com.test.entity.Borrow;

public interface BorrowService {
	public List<Borrow> getBorrowService(String bookname);
	
	public List<Borrow> findBorrowService(String bookname);
}
