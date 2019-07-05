package com.test.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.BookDao;
import com.test.dao.BorrowDao;
import com.test.entity.Borrow;
import com.test.service.BorrowService;

@Service("BorrowService")
public class BorrowServiceImpl implements BorrowService{
	@Autowired
	BorrowDao borrowdao;
	
	@Override
	public List<Borrow> getBorrowService(String bookname) {
		// TODO Auto-generated method stub
		return borrowdao.getBorrow(bookname);
	}

	@Override
	public List<Borrow> findBorrowService(String bookname) {
		// TODO Auto-generated method stub
		return borrowdao.findBorrow(bookname);
	}

}
