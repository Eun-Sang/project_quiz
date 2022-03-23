<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
<h1>회원 가입</h1>
	<div class="sign-up-box">
		<form id="signUpForm" method="post" action="/user/sign_up">
			<label>ID</label>
			<div class="d-flex">
			<input type="text" id="userId" name="userId" placeholder="ID를 입력 해 주세요." class="col-3">
			<button type="button" class="btn btn-primary ml-3" id="nameCheckBtn">중복확인</button>
			</div>
			<div>
			<div id="idCheckLength" class="small text-danger d-none">ID를 4자 이상 입력 해 주세요.</div>
			<div id="idCheckDuplicated" class="small text-danger d-none">이미 사용 중인 ID입니다.</div>
			<div id="idCheckOk" class="small text-danger d-none">사용 가능한 ID입니다.</div>
			</div>
			<label>Password</label>
			<br>
			<input type="password" id="password" name="password" class="col-2">
			<br>
			<label>Confirm Password</label>
			<br>
			<input type="password" id="confirmPassword" name="confirmPassword" class="col-2">
			<br>
			<label>이름</label>
			<br>
			<input type="text" id="name" name="name" placeholder="이름을 입력 해 주세요" class="col-4">
			<br>
			<label>이메일</label>
			<br>
			<input type="text" id="email" nema="email" placeholder="이메일을 입력 해 주세요" class="col-4">
			<br>
		<button type="button" class="btn btn-primary mt-3" id="signUpBtn">가입하기</button>
	</form>
	</div>
</div>


<script>
$(document).ready(function() {
	//중복확인 버튼 클릭
	$('#nameCheckBtn').on('click', function() {
		let userId = $('#userId').val().trim();
		
		//nameStatus 초기화
		$('#idCheckLength').addClass('d-none');
		$('#idCheckDuplicated').addClass('d-none');
		$('#idCheckOk').addClass('d-none');

		if (userId.length < 4) {
			$('#idCheckLength').removeClass('d-none');
			return;
		}
		
		$.ajax({
			url:"/user/is_duplicated_id"
			, data: {"userId" : userId}
			, success: function(data) {
				if (data.result) {
					$('#idCheckDuplicated').removeClass('d-none');
				} else {
					$('#idCheckOk').removeClass('d-none');
				}
			}
			, error: function(e) {
				alert("아이디 중복 확인에 실패 했습니다. 관리자에게 문의 해 주세요");
			}
		});
	});
	
	//회원가입
	$('#signUpBtn').on('click', function() {
		let userId = $('#userId').val().trim();
		if (userId == '') {
			alert("ID를 입력 해 주세요");
			return;
		}
		
		let password = $('#password').val();
		let confirmPassword = $('#confirmPassword').val();
		if (password == '' || confirmPassword == '') {
			alert("비밀번호를 입력 해 주세요");
			return;
		}
		if (password != confirmPassword) {
			alert("비밀번호가 일치하지 않습니다. 다시 입력 해 주세요.");
			
			$('#password').val('');
			$('#confirmPassword').val('');
			return;
		}
		
		let name = $('#name').val().trim();
		if (name == '') {
			alert("이름을 입력 해 주세요.");
			return;
		}
		
		let email = $('#email').val().trim();
		if (email == '') {
			alert("이메일을 입력 해 주세요.");
			return;
		}
		
		// 아이디 중복확인 체크
		if ($('#idCheckOk').hasclass('d-none')) {
			alert("ID 중복확인을 다시 해 주세요.");
			return;
		}
		
		// 서버에 보내기
		let url = $('#signUpForm').attr('action');
		let params = $('#signUpForm').serialize();
		
		$.post(url, params)
		.done(function(data) {
			if (data.result == 'success') {
				alert("회원가입을 환영합니다. 로그인을 해 주세요.");
				location.href = "/user/sign_up_view";
			} else {
				alert("가입에 실패 했습니다. 다시 시도 해 주세요.");
			}
		});
	});
});
</script>
