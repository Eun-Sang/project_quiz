<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="topBg bg-light">
	<div class="d-flex">
		<div class="ml-3 mt-3"><h1>Marondalgram</h1></div>
	</div>
	<div class="login-info">
	<c:if test="${not empty userName}">
		<div>
			<span class="text-dark">${userName}님 안녕하세요.</span>
			<a href="/user/sign_in" class="text-dark font-weight-bold">로그아웃</a>
		</div>
	</c:if>
	</div>
</div>