package com.SNS.timeline;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.SNS.post.bo.PostBO;

@RequestMapping("/timeline")
@Controller
public class TimeLineController {
	
	@Autowired
	private PostBO postBO;
	@RequestMapping("/timeline_view")
	public String timeLineView(Model model, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		
//		List<Post> postList = postBO.getPostList();
//		model.addAttribute("postList", postList);
		//List<CardView> cardViewList = timeline;
	
		model.addAttribute("viewName", "timeline/timeline");
		return "template/layout";
	}
}
