package com.test.dao;

import com.test.entity.User;

public interface UserDao {
	public User findUser(String username);
	
	public void insertUser(User user);

	public User checkTelnum(User user);
	
	public User findUserid(Integer id);
	
}