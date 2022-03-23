<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <a href="#" class="imageUploadBtn"></a>
    
    <div id="fileName"></div>
    
    <script>
    $(document).ready(function() {
    	// 파일 업로드 이미지 클릭 => 파일 선택 창이 떠야함
    	$('#imageUploadBtn').on('click', function(e) {
    		e.preventDefault(); // 위로 올라가는 현상 방지
    		$('#file').click(); // input file을 클릭한 것과 같은 효과
    	});
    	
    	// 사용자가 파일 업로드를 했을 때 유효성 확인 및 업로드 된 파일 이름 노출
    	$('#file').on('change', function(e) {
    		let fimeName = e.target.files[0].name;
    		let fileArr = fileName.split(".");
    		
    		// 확장자 유효성 체크
    		if (fileArr.length < 2 || 
    				(fileArray[fileArr.length - 1] != 'gif')
    				&& (fileArray[fileArr.length - 1] != 'png')
    				&& (fileArray[fileArr.length - 1] != 'jpeg')
    				&& (fileArray[fileArr.length - 1] != 'jpg')) {
    				alert("이미지 파일만 업로드 해 주세요.");
    				$(this).val('');	// 파일이 서버에 넘어가지 않도록 비워줌
    				$('#fileName').text('');	//파일명도 비워줌
    				return;
    		}
    		
    		$('#fileName').text(fileName);
    	});
    });
    </script>