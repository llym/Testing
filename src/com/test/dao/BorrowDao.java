package com.test.dao;

import java.util.List;

import com.test.entity.Borrow;

public interface BorrowDao {
public List<Borrow> getBorrow(String bookname);
	
public List<Borrow> findBorrow(String bookname);
}
