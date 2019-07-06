package com.test.dao;

import java.util.List;
import java.util.Map;

import com.test.entity.Book;
import com.test.entity.Borrow;

public interface BorrowDao {
public List<Borrow> getBorrow(String bookname);
	
public List<Borrow> findBorrow(String bookname);

public int getRecordNum();

public List<Borrow> getCurrPageBorrow(Map<String, Object> map);

public void insertBorrow(Borrow borrow);
}
