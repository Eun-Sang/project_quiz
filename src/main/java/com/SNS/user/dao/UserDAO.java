package com.SNS.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

	public boolean existUserByLoginId(String userId);
	
	public int insertUser(
			@Param("userId") String userId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("email") String email);
}
