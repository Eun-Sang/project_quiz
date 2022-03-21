package com.SNS.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.SNS.common.EncryptUtils;
import com.SNS.user.bo.UserBO;

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	@RequestMapping("/is_duplication_id")
	public Map<String, Boolean> isDuplicatedId(
			@RequestParam("userId") String userId) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("result", userBO.existUserByLoginId(userId));
		
		return result;
	}
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("userId") String userId,
			@RequestParam("passwored") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email) {
		
		// password hashing
		String encryptPassword = EncryptUtils.md5(password);
		
		// DB insert
		int row = userBO.addUser(userId, encryptPassword, name, email);
		
		// response
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		if (row < 1) {
			result.put("result", "error");
		}
		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("userId") String userId,
			@RequestParam("password") String password) {
		
		Map<String, Object> result = new HashMap<>();
		return result;
	}
}
