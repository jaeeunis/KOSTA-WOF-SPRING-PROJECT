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
//아이디 정규식 (금액)
//var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/; 
var idJ = /^[0-9]$/;
// 이름 정규식 (내용)
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{1,20}$/; 
//비밀번호 정규식 (비밀번호)
var pwJ = /^[A-Za-z0-9]{4,12}$/;
//아이디 정규식 (문자인증)
var msg = /^[0-9]{6}$/; 
// 이메일 검사 정규식
//var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
// 휴대폰 번호 정규식 
//var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
 
 $(document).ready(function() { 
	 
	 //아이디 중복확인 
	 $("#mem_id").blur(function() {
		 if($('#mem_id').val()==''){
			 $('#id_check').text('아이디를 입력하세요.');
			 $('#id_check').css('color', 'red'); 
			 } else if(idJ.test($('#mem_id').val())!=true){
			 $('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.'); 
			 $('#id_check').css('color', 'red'); 
			 } else if($('#mem_id').val()!=''){
			 var mem_id=$('#mem_id').val();
			 $.ajax({
				 async : true, 
				 type : 'POST', 
				 data : mem_id, //mem_id라는 이름으로 mem_id라는 데이터를 @WebServlet("/idsearch.do")에 보내겠다 
				 url : 'idcheck.do', 
				 dateType: 'json', 
				 contentType: "application/json; charset=UTF-8", 
				 success : function(data) {
					 if(data.cnt > 0){ $('#id_check').text('중복된 아이디 입니다.');
					 $('#id_check').css('color', 'red');
					 $("#usercheck").attr("disabled", true); 
					 }else{
						 if(idJ.test(mem_id)){
							 $('#id_check').text('사용가능한 아이디 입니다.');
							 $('#id_check').css('color', 'blue');
							 $("#usercheck").attr("disabled", false); 
							 } 
						 else if(mem_id==''){
							 $('#id_check').text('아이디를 입력해주세요.');
							 $('#id_check').css('color', 'red');
							 $("#usercheck").attr("disabled", true); 
							 } 
						 else{
							 $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
							 $('#id_check').css('color', 'red');
							 $("#usercheck").attr("disabled", true); } } } });//ajax/// 
							 }//else if
 					});//blur 
	 
	 
	 						
	 $('form').on('submit',function(){
		 var inval_Arr = new Array(3).fill(false);
		 
		 //아이디 정규식
		 if (idJ.test($('#mem_id').val())) {
			 inval_Arr[0] = true; 
			 } else {
			 inval_Arr[0] = false;
			 alert('금액을 입력해주세요.'); 
			 return false; 
			 } 
		 
		 // 비밀번호가 같은 경우 && 비밀번호 정규식 
		 if (($('#mem_pw').val() == ($('#mem_pw2').val())) 
				 && pwJ.test($('#mem_pw').val())) {
			 inval_Arr[1] = true; 
			 } else {
			 inval_Arr[1] = false;
			 alert('비밀번호를 확인해주세요.');
			 return false; 
			 } 
		 
		 // 이름 정규식 
		 if (nameJ.test($('#mem_name').val())) {
			 inval_Arr[2] = true; 
			 }  else {
			 inval_Arr[2] = false;
			 alert('메모를 입력해주세요.');
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
			 alert('충전이 완료되었습니다!'); 
			 } else{ 
			 alert('입력정보를 다시 확인하세요.') 
			 }
		 }); 
	
	 $('#mem_id').blur(function() {
		 if (idJ.test($('#mem_id').val())) {
			 console.log('true'); 
			 $('#id_check').text(''); 
			 } else {
				 console.log('false');
				 $('#id_check').text('숫자만 입력이 가능합니다.');
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
					 $('#name_check').text('한글 2~30자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
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
						id="mem_id" name="point_amount" placeholder="ID">
					<div class="eheck_font" id="id_check"></div>
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label> <input type="password"
						class="form-control" id="mem_pw" name="userPw"
						placeholder="PASSWORD">
					<div class="eheck_font" id="pw_check"></div>
				</div>
				<!-- <div class="form-group">
					<label for="pw2">비밀번호 확인</label> <input type="password"
						class="form-control" id="mem_pw2" name="userPw"
						placeholder="Confirm Password">
					<div class="eheck_font" id="pw2_check"></div>
				</div> -->
				<div class="form-group">
					<label for="mem_name">이름</label> <input type="text"
						class="form-control" id="mem_name" name="point_contents"
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


