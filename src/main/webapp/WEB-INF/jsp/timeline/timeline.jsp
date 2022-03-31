<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--글쓴이와 로그인된 사용자가 일치할 경우 버튼 노출 --%>
<c:if test="${card.user.id eq userId}">
<a href="#" class="more-btn" data-toggle="modal" data-target="#moreModal" data-post-id="${card.post.id}">
	<img src="">
</a>
</c:if>


<!-- Modal -->
<div class="modal fade" id="moreModal">
  <div class="modal-dialog modal-small modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="text-center ">
      	<div class="my-3">
      		<a href="#" class="d-block" id="postDeleteBtn">삭제하기</a>
      	</div>
      	<hr>
      	<div class="my-3">
      		<a href="#" class="d-block" data-dismiss="modal">취소</a>
      	</div>
      </div>
    </div>
  </div>
</div>

<script>


	// 카드에서 더보기[...] 클릭할 때 삭제될 글번호를 모달에 넣어준다.
	$('.more-btn').on('click', function() {
		let postId = $(this).data('post-id');
		//alert(postId);
		
		$('#moreModal').data('post-id', postId);	// data-post-id="1"
	});
	
	// modal창 안에 있는 삭제하기 글자 클릭
	$('#moreModal #postDeleteBtn').on('click', function(e) {
		e.preventDefault();
		
		let postId = $('moreModal').data('post-id');
		
		$.ajax({
			type:"DELETE"
			, url:"/post/delete"
			, data: {"postId" : postId}
			, success: function(data) {
				if (data.result == "success") {
					location.reload(true);
				} else {
					alert(data.error_message);
				} 
			}
			, error:function(e) {
				alert("삭제하는데 실패 했습니다.");
			}
		});
	});
</script>