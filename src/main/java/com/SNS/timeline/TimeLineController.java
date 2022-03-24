package com.SNS.timeline;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.SNS.post.bo.PostBO;
import com.SNS.timeline.model.CardView;

@RequestMapping("/timeline")
@Controller
public class TimeLineController {
	
	@Autowired
	private PostBO postBO;
	@RequestMapping("/timeline_view")
	public String timeLineView(Model model) {
//		List<Post> postList = postBO.getPostList();
//		model.addAttribute("postList", postList);
		//List<CardView> cardViewList = timeline;
	
		model.addAttribute("viewName", "timeline/timeline");
		return "template/layout";
	}
}
