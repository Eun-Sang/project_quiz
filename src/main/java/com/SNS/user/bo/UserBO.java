package com.SNS.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.SNS.user.dao.UserDAO;
import com.SNS.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	public boolean existUserByLoginId(String userId) {
		return userDAO.existUserByLoginId(userId);
	}
	
	public User getUserByLoginIdAndPassword(String userId, String password) {
		return userDAO.selectUserByLoginIdAndPassword(userId, password);
	}
	
	public int insertUser(String userId, String password, String name, String email) {
		return userDAO.insertUser(userId, password, name, email);
	}
}
