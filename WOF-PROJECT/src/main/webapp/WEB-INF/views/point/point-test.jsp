<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NANALAND 회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript"> 
 //모든 공백 체크 정규식 
 var empJ = /\s/g; 
 //아이디 정규식 
 var idJ = /^[0-9]{4,30}$/; 
 // 비밀번호 정규식
 var pwJ = /^[A-Za-z0-9]{4,12}$/; 
 // 이름 정규식
 var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
 
 
 $(document).ready(function() { 
	 						
	 $('form').on('submit',function(){
		 var inval_Arr = new Array(8).fill(false);
		 
		 if (idJ.test($('#mem_id').val())) {
			 inval_Arr[0] = true; 
			 } else {
			 inval_Arr[0] = false;
			 alert('아이디를 확인하세요.'); 
			 return false; 
			 } 
		 // 비밀번호가 같은 경우 && 비밀번호 정규식 
		 if (($('#mem_pw').val() == ($('#mem_pw2').val())) 
				 && pwJ.test($('#mem_pw').val())) {
			 inval_Arr[1] = true; 
			 } else {
			 inval_Arr[1] = false;
			 alert('비밀번호를 확인하세요.');
			 return false; 
			 } 
		 // 이름 정규식 
		 if (nameJ.test($('#mem_name').val())) {
			 inval_Arr[2] = true; 
			 }  else {
			 inval_Arr[2] = false;
			 alert('이름을 확인하세요.');
			 return false; 
			 } 
		 
		 //전체 유효성 검사 
		 var validAll = true;
		 for(var i = 0; i < inval_Arr.length; i++){
			 if(inval_Arr[i] == false){
				 validAll = false; 
				 } 
			 } 
		 
		 if(validAll == true){// 유효성 모두 통과 
			 alert('NANALAND 가족이 되어주셔 감사합니다.'); 
			 } else{ 
			 alert('정보를 다시 확인하세요.') 
			 }
		 }); 
	
	 $('#mem_id').blur(function() {
		 if (idJ.test($('#mem_id').val())) {
			 console.log('true'); 
			 $('#id_check').text(''); 
			 } else {
				 console.log('false');
				 $('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
				 $('#id_check').css('color', 'red'); 
				 } 
		 }); 
		 
		 $('#mem_pw').blur(function() {
			 if (pwJ.test($('#mem_pw').val())) {
				 console.log('true'); 
				 $('#pw_check').text(''); 
				 } else {
					 console.log('false');
					 $('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
					 $('#pw_check').css('color', 'red'); 
					 } 
			 }); 
		 
		 //1~2 패스워드 일치 확인 
		 $('#mem_pw2').blur(function() {
			 if ($('#mem_pw').val() != $(this).val()) {
				 $('#pw2_check').text('비밀번호가 일치하지 않습니다.');
				 $('#pw2_check').css('color', 'red'); 
				 } else {
					 
					 $('#pw2_check').text(''); 
					 } 
			 }); 
		 
		 //이름에 특수문자 들어가지 않도록 설정
		 $("#mem_name").blur(function() {
			 if (nameJ.test($(this).val())) {
				 console.log(nameJ.test($(this).val()));
				 $("#name_check").text(''); 
				 } else {
					 $('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
					 $('#name_check').css('color', 'red'); 
					 } 
			 });
		 
		});			 
		 
 </script>

</head>

<body>
	<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>회원가입</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			<form action="charging" method="post" role="form"
				id="usercheck" name="member">
				<div class="form-group">
					<label for="id">아이디</label> <input type="text" class="form-control"
						id="mem_id" name="mem_id" placeholder="ID">
					<div class="eheck_font" id="id_check"></div>
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label> <input type="password"
						class="form-control" id="mem_pw" name="mem_pw"
						placeholder="PASSWORD">
					<div class="eheck_font" id="pw_check"></div>
				</div>
				<div class="form-group">
					<label for="pw2">비밀번호 확인</label> <input type="password"
						class="form-control" id="mem_pw2" name="mem_pw2"
						placeholder="Confirm Password">
					<div class="eheck_font" id="pw2_check"></div>
				</div>
				<div class="form-group">
					<label for="mem_name">이름</label> <input type="text"
						class="form-control" id="mem_name" name="mem_name"
						placeholder="Name">
					<div class="eheck_font" id="name_check"></div>
				</div>
				
				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">회원가입</button>
				</div>
			</form>
		</div>
	</article>
</body>
</html>


