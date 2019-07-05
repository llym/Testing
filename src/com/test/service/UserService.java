package com.test.service;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.test.entity.User;

public interface UserService {
	
	public String findUserService(String username,String password, HttpSession session);
	
	public String insertUserService(User user);

	public String checkTelnumService(User user);
}
