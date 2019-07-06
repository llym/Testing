package com.test.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.test.entity.Borrow;

public interface BorrowService {
	public List<Borrow> getBorrowService(String bookname);
	
	public List<Borrow> findBorrowService(String bookname);

	public int getRecordNum();

	public List<Borrow> getCurrPageBorrow(Map<String, Object> map);
	
	public void insertBorrowService(Borrow borrow);
}
