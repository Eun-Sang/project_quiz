<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<h1>로그인</h1>
	<div class="sign-in-box bg-light">
	<form id="signinForm" method="post" action="/user/sign_in">
		<label>ID</label>
		<br>
		<input type="text" id="userId" name="userId" placeholder="ID">
		<br>
		<label>Password</label>
		<br>
		<input type="password" id="password" name="password">
		<br>
		<input type="submit" class="btn btn-primary" value="로그인">
		<br>
		<button type="button" class="btn-dark">가입하기</button>
	</form>
	</div>
</div>

<script>
$(document).ready(function() {
	
});
</script>