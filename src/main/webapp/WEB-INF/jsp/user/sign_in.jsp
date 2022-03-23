<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<h1>로그인</h1>
	<div class="sign-in-box bg-light d-flex justify-content-center align-items-center">
	<form id="signinForm" method="post" action="/user/sign_in">
		<label>ID</label>
		<br>
		<input type="text" id="userId" name="userId" placeholder="ID">
		<br>
		<label>Password</label>
		<br>
		<input type="password" id="password" name="password" placeholder="●●●●">
		<br>
		<input type="submit" class="btn btn-primary mt-3" value="로그인">
		<br>
		<button type="button" class="btn-dark mt-3">가입하기</button>
	</form>
	</div>
</div>

<script>
$(document).ready(function() {
	$('#signinForm').on('#submit', function() {
		e.preventDefault(); 
		
		let userId = $('#userId').val.trim();
		
		if (userId == '') {
			alert("아이디를 입력 해 주세요.");
			return false;
		}
		let password = $('#password').val().trim();
		if (password == '') {
			alert("비밀번호를 입력 해 주세요.");
			return false;
		}
		
		let url = $('#signinForm').attr('action');
		let params = $(this).serialize();
		
		//console.log("url" + url);
		//console.log("params" + params);
		
		$.post(usl.params)
		.done(function(data)) {
			if (data.result == "success") {
				location.href = "/post/post_list_view";
			} else {
				alert(data.error_message);
			}
		}
	});
});
</script>