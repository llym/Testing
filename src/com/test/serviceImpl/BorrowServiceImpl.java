package com.test.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.BookDao;
import com.test.dao.BorrowDao;
import com.test.dao.UserDao;
import com.test.entity.Book;
import com.test.entity.Borrow;
import com.test.entity.User;
import com.test.service.BorrowService;

@Service("BorrowService")
public class BorrowServiceImpl implements BorrowService{
	@Autowired
	BorrowDao borrowdao;
	@Autowired
	UserDao userDao;
	@Autowired
	BookDao bookdao;
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

	@Override
	public int getRecordNum() {
		
		return borrowdao.getRecordNum();
	}

	@Override
	public List<Borrow> getCurrPageBorrow(Map<String, Object> map) {
		
		return borrowdao.getCurrPageBorrow(map);
	}

	@Override
	public void insertBorrowService(Borrow borrow) {
		// TODO Auto-generated method stub
		borrowdao.insertBorrow(borrow);
	}

	@Override
	public List<Borrow> getsBorrowService(String name) {
		// TODO Auto-generated method stub
		return borrowdao.getsBorrow(name);
	}

	@Override
	public List<Borrow> findsBorrow(Borrow borrow) {
		// TODO Auto-generated method stub
		return borrowdao.findsBorrow(borrow);
	}

	@Override
	public void returnBook(Borrow borrow) {
		// TODO Auto-generated method stub
		borrowdao.returnBook(borrow);
	}

}
