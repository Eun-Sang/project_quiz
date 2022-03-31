package com.SNS.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.SNS.post.dao.PostDAO;
import com.SNS.post.model.Post;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public List<Post> getPostListByUserId(int userId) {
		return postDAO.selectPostListByUserId(userId);
	}
	
	public int deletePost(int postId, int userId) {
		// select post 
		
		// post null 검사 => null 이면 logger, 0 return
		
		// 이미지 삭제
		
		// 글 삭제
		
		// 댓글들 삭제
		
		// 좋아요들 삭제 by postId
		
		
	}
}
