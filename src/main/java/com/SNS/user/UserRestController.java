package com.SNS.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.SNS.common.EncryptUtils;
import com.SNS.user.bo.UserBO;
import com.SNS.user.model.User;

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/is_duplicated_id")
	public Map<String, Boolean> isDuplicatedId(
			@RequestParam("userId") String userId) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("result", userBO.existUserByLoginId(userId));
		
		return result;
	}
	
	
	@RequestMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("userId") String userId,
			@RequestParam("password") String password,
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
			@RequestParam("password") String password,
			HttpServletRequest request) {
		
		// password hashing
		String encryptPassword = EncryptUtils.md5(password);
		
		// db에서 userId, hashing된 password 셀렉트
		User user = userBO.getUserByLoginIdAndPassword(userId, encryptPassword);
		Map<String, Object> result = new HashMap<>();
		
		if (user != null) {
			result.put("result", "success");
			
			// 세션에 로그인정보 저장(로그인 상태 유지)
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userLoginId", user.getLoginId());
		} else {
			// 결과가 없으면 에러
			result.put("result", "error");
			result.put("error_message", "로그인에 실패 했습니다.");
		}
		return result;
	}
}
