package com.SNS.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UsesrController {

	@RequestMapping("/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("viewName", "user/sign_up");
		return "template/layout";
	}
	
	@RequestMapping("/sign_in_view")
	public String signInVIew(Model model) {
		model.addAttribute("viewName", "user/sign_in");
		return "template/layout";
	}
}
