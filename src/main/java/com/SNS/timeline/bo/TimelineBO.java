package com.SNS.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.SNS.post.bo.PostBO;
import com.SNS.post.model.Post;
import com.SNS.timeline.model.CardView;

@Service
public class TimelineBO {

	@Autowired
	private PostBO postBO;
	
	public List<CardView> generateCardViewList() {
		List<CardView> cardViewList = new ArrayList<>();
		
		// 글 list를 가져온다.
		List<Post> postList = postBO.getPostList();
		for (Post post : postList) {
			// 글 정보
			
			// 댓글들 정보
		}
		return cardViewList;
	}
}
