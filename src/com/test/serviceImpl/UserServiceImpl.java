package com.test.serviceImpl;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.service.UserService;
import com.test.dao.UserDao;
import com.test.entity.User;


@Service("UserService")
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao userDao;
	
	@Override
	public String findUserService(String username, String password,String status,HttpSession session) {
		
		try {
			User user=userDao.findUser(username);
			String a=user.getUsername();
			String b=user.getPassword();
			String c=user.getLevel();
			System.out.println(a);
			System.out.println(b);
		if (user!=null) {
			if (a.equals(username)&&b.equals(password)) {
				if(c.equals(status)) {
					if(c.equals("1")) {
						session.setAttribute("username", username);
						return "success.do";
					}
					else {
						return "login.jsp";
					}
					
					
				}
				else
					return "login.jsp";
			}
			else {
				return "login.jsp";
			}
		}
		return "login.jsp";
		}
		catch(Exception e){
		return "账号错误";	
		}
	}

	@Override
	public String insertUserService(User user) {
		try {
			userDao.insertUser(user);
			return "注册成功";
		}
		catch(Exception e){
			System.out.println(e.getMessage());
			return "注册失败";
		}
	}

	@Override
	public String checkTelnumService(User user) {
		
		try {
			User user2 = userDao.checkTelnum(user);
			if(user2==null)
				return "";
			else
				return "该手机号已注册";
		}
		catch(Exception e){
			System.out.println(e.getMessage());
			return "";
		}
	}	
}
