<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="../includes/header-point-detail.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<!-- 부트스트랩 --> 
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- <style type="text/css"> 
td{ border:1px solid #000000; 
	border-collapse:collapse; 
	} 
</style> -->

<div class="row">
  <div class="col-md-6">
     
<div class="modal fade" id="modal-charging-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
   <div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">
      <div class="modal-content">
        	
<div class="modal-body p-0">
            	
<div class="card bg-secondary border-0 mb-0" style="width: 500px">

    <div class="card-header bg-transparent pb-3">
        <div class="text-muted text-center mt-2 mb-3"><large>충전하기</large></div>
    </div>
    
    <div class="card-body px-lg-5 py-lg-5">
    
        <div class="text-center text-muted mb-4">
            <small>아래 내용을 입력 후, '충전' 버튼을 눌러주세요~~!</small>
        </div>
        
        <form role="form" action="charging" method="post" name="charging" id="usercheck">
          <div>
        	<div>
				<input type="hidden" name="point_owner" value=${member.member_no }> 
			</div>
        
            <div class="form-group mb-3">
              <label for="id" class="form-control-label">충전 금액</label>
                <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-money-coins"></i></span>
                    </div>
                    <input class="form-control" type="text" id="mem_id" name="point_amount" placeholder="금액을 입력해주세요." required>
                </div>
            </div>
            <div class="check_font" id="id_check"></div>
            
            <div class="form-group">
              <label for="example-search-input" class="form-control-label">메모 입력</label> 
                <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-align-center"></i></span>
                    </div>
                    <input class="form-control" type="text" id="mem_name" name="point_contents" placeholder="ex) 충전" required>
                </div>
            </div>
            <div class="check_font" id="name_check"></div>
            
            <div class="form-group">
              <label for="pw" class="form-control-label">비밀번호 확인</label> 
                <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" type="password" id="mem_pw" name="userpw" placeholder="비밀번호를 입력해주세요." required>
                    <div class="check_font" id="pwCheck" name="pwCheck"></div>
                    <div class="eheck_font" id="pw_check"></div>
                    
                    <div class="form-control"> 
                    <input type="hidden" class="form-control" id="userpw" name="userpw" > 
                    </div>
                </div>
            </div>
            
           </div> 
            
            <div class="text-center">
                <input type="submit" class="btn btn-primary my-6" data-toggle="modal" 
                	   id="TestBtn" data-target="#exampleModal" value="충전">
            </div>
        </form>
        
        
    </div> <!-- end of card body -->
</div> <!-- end of card -->

</div> <!-- end of modal body -->
            
        </div> <!-- end of modal-content -->
    </div> <!-- end of modal-dialog -->
</div> <!-- end of modal fade -->


  </div> <!-- end of col -->
  
</div> <!-- end of row -->	

<script src="/resources/template/assets/vendor/jquery/dist/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
		//<충전 금액>입력 => 숫자만 가능, 천단위 콤마
		function inputNumberAutoComma(obj) {
			// 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
			var deleteComma = obj.value.replace(/\,/g, "");
			// 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
			if (isFinite(deleteComma) == false) {
				alert("문자는 입력하실 수 없습니다.");
				obj.value = "";
				return false;
			}
			// 기존에 들어가있던 콤마( , )를 제거한 이 후의 입력값에 다시 콤마( , )를 삽입한다.
			obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
		}
		// 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
		function inputNumberWithComma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
		}
		// 콤마( , )가 들어간 값에 콤마를 제거하는 함수
		function inputNumberRemoveComma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, "");
		}
	</script>
	
	<script>
	 $(function () {
		$("#input_text").on('input',function(){
			if($("input_text").val()=='')
				$("#TestBtn").attr("disabled",true);
			else
				$("#TestBtn").attr("disabled",false);
		});
	})
	</script>
	
	<!-- <script>
	// 비밀번호 일치여부 확인
		function check() {
			if(!pwCheck){
				alert("비밀번호가 일치하지 않습니다.");
				return false;	
			}
		}
	</script> -->
	
	<!-- <script>
	// 비밀번호 일치여부 확인
	
	var pwCheck = false;
	var expPw = /^[0-9a-zA-Z]([0-9a-zA-Z])[0-9a-zA-Z]([0-9a-zA-Z])[a-zA-Z]{2,3}$/i;
	
	// 유효성 검사(1 = 중복 / 0 != 중복)
	$('#userpw').blur(function() {
		// id = "id_reg" / name = "userId"
		var userpw = $('#userpw').val();
		
		$.ajax({
			url : '/point/pwCheck?userpw='+ userpw,
			type : 'get',
			success : function(data) {
		
			parseInt(data);
			
			console.log("1 = 일치 / 0 = 불일치 : "+ data);	
			if (data == 0){
				$("#pwCheck").text("비밀번호 불일치");
				$("#pwCheck").css("color", "red");
			}else if (data == 1){
					$("#pwCheck").text("비밀번호 일치");
					$("#pwCheck").css("color", "green");
					//$("#reg_submit").attr("disabled", true);
					pwCheck = true;
				}
			}
		,error:function(request,status,error){
		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	
		})		
	})
	</script> -->
	


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
		 var inval_Arr = new Array(3).fill(false);
		 
		 if (idJ.test($('#mem_id').val())) {
			 inval_Arr[0] = true; 
			 } else {
			 inval_Arr[0] = false;
			 alert('1,000원 이상 입력 가능합니다.'); 
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
			 alert('완료되었습니다.'); 
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
		 
	 	var pwCheck = false;
		var expPw = /^[0-9a-zA-Z]([0-9a-zA-Z])[0-9a-zA-Z]([0-9a-zA-Z])[a-zA-Z]{2,3}$/i;
		
		// 유효성 검사(1 = 중복 / 0 != 중복)
		$('#mem_pw').blur(function() {
			var userpw = $('#userpw').val();
			
			$.ajax({
				url : '/point/pwCheck?userpw='+ userpw,
				type : 'get',
				success : function(data) {
				parseInt(data);
				
				console.log("1 = 일치 / 0 = 불일치 : "+ data);	
				if (data == 0){
					$("#pw_Check").text("비밀번호 불일치");
					$("#pw_Check").css("color", "red");
				}else if (data == 1){
						$("#pw_Check").text("비밀번호 일치");
						$("#pw_Check").css("color", "green");
						//$("#reg_submit").attr("disabled", true);
						pwCheck = true;
					}
				}
			,error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		
			})		
		})
	 
		 
		
		  /* $('#mem_pw').blur(function() {
			 
			 var mem_pw2 = $('#mem_pw2').val();
			 
			 $.ajax({
					url : '/point/pwCheck?userpw='+ mem_pw2,
					type : 'get',
					success : function(data) {
				
					parseInt(data);
					
					console.log("1 = 일치 / 0 = 불일치 : "+ data);	
					if (data == 0){
						$("#pw_Check").text("비밀번호 불일치");
						$("#pw_Check").css("color", "red");
					}else if (data == 1){
							$("#pw_Check").text("비밀번호 일치");
							$("#pw_Check").css("color", "green");
							//$("#reg_submit").attr("disabled", true);
							pwCheck = true;
						}
					}
				,error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
			
				})		 */
			 
			 
		
		 
		/* // 유효성 검사(1 = 중복 / 0 != 중복)
			$('#mem_pw').blur(function() {
				// id = "id_reg" / name = "userId"
				var mem_pw = $('#mem_pw').val();
				$.ajax({
					url : '/point/pwCheck?userpw='+ userpw,
					type : 'get',
					success : function(data) {
					parseInt(data);
					console.log("1 = 일치 / 0 = 불일치 : "+ data);	
					if (data == 0){
						console.log('false');
						$("#pw_check").text("비밀번호 불일치");
						$("#pw_check").css("color", "red");
					}else if (data == 1){
							console.log('true');
							$("#pw_check").text("비밀번호 일치");
							$("#pw_check").css("color", "green");
							//$("#reg_submit").attr("disabled", true);
							mem_pw2 = true;
						}
					}
				,error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
			
				})		
			}); */
		 
		 /*  $('#mem_pw').blur(function() {
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
			 });   */
		 
		 //이름에 특수문자 들어가지 않도록 설정
		 $("#mem_name").blur(function() {
			 if (nameJ.test($(this).val())) {
				 console.log(nameJ.test($(this).val()));
				 $("#name_check").text(''); 
				 } else {
					 $('#name_check').text('메모를 입력해주세요.(특수기호, 공백 사용 불가)');
					 $('#name_check').css('color', 'red'); 
					 } 
			 });
		 
		});			 
		 
	 </script>
