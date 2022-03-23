package com.SNS.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.SNS.user.model.User;

@Repository
public interface UserDAO {

	public boolean existUserByLoginId(String userId);
	
	public User selectUserByLoginIdAndPassword(
			@Param("userId") String userId, 
			@Param("password") String password);
	
	public int insertUser(
			@Param("userId") String userId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("email") String email);
}
