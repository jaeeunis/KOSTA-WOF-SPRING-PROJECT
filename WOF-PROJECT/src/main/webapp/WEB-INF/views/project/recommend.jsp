<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!-- Header & Menu -->
	<%@ include file="../includes/header.jsp" %>

	<%@ include file="menu.jsp"%>
	
	
	<!-- Main Content -->
   <div class="main-content" id="panel">
   

   <div class="container">
   
         <!-- 제목 -->
         <div class="row mt-3">
            <h3></h3>
         </div>
         
      <div class="row mb-3">
            <div class="col-lg-3 col-3"></div>
            <div class="col-lg-6 col-7">
               <form class="navbar-search navbar-search-light form-inline mr-sm-3"
               id="searchForm" action="/partners/list" method="get">
                  <div class="form-group mb-0">
                     <div
                        class="input-group input-group-alternative input-group-merge mr-2">
                        <div class="input-group-prepend">
                           <span class="input-group-text"><i class="fas fa-search"></i></span>
                        </div>
                        <input type="text" name="keyword" class="form-control" placeholder="Search" />
                        <%-- value='<c:out value="${pageMaker.standard.keyowrd }"/>' />
                        <input type="hidden" name='type' value='<c:out value="${pageMaker.standard.type }"/>' /> --%>
                        <input type="hidden" name='member_no' value='${member.member_no}'>
                        <input type="hidden" name='pageNum' value = '${pageMaker.standard.pageNum}' />
                        <input type="hidden" name='amount' value = '${pageMaker.standard.amount}' />
                     </div>
                     <button class="btn btn-secondary">Search</button>
                  </div>
               </form>
            </div>
         </div>


   <!-- Page content -->
            <div class="row">
            <!-- 체크박스 -->
            <div class="col-sm-3" style="margin-top: 30px;">
               <div class="row">
                  <div class="col-sm-12" >
                  <div class="pl-3 shadow-sm rounded bg-white position-relative" id="findquick" >
                              
                              
                              <h5 class="h3">프로젝트 카테고리</h5>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck1"> <label
                                    class="custom-control-label" for="customCheck1">개발</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck2"> <label
                                    class="custom-control-label" for="customCheck2">디자인</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck3"> <label
                                    class="custom-control-label" for="customCheck3">기획</label>
                              </div>
                              <br>

                              <h5 class="h3">프로젝트 분야</h5>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck4"> <label
                                    class="custom-control-label" for="customCheck4">#웹</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck5"> <label
                                    class="custom-control-label" for="customCheck5">#애플리케이션</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck6"> <label
                                    class="custom-control-label" for="customCheck6">#커머스,쇼핑몰</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck7"> <label
                                    class="custom-control-label" for="customCheck7">#일반 소프트웨어</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck8"> <label
                                    class="custom-control-label" for="customCheck8">#퍼블리싱</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck9"> <label
                                    class="custom-control-label" for="customCheck9">#워드프레스</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck10"> <label
                                    class="custom-control-label" for="customCheck10">#임베디드</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck11"> <label
                                    class="custom-control-label" for="customCheck11">#제품</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck12"> <label
                                    class="custom-control-label" for="customCheck12">#프레젠테이션</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck13"> <label
                                    class="custom-control-label" for="customCheck13">#그래픽</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck14"> <label
                                    class="custom-control-label" for="customCheck14">#인쇄물</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck15"> <label
                                    class="custom-control-label" for="customCheck15">#로고</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck16"> <label
                                    class="custom-control-label" for="customCheck16">#영상</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck17"> <label
                                    class="custom-control-label" for="customCheck17">#게임</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck18"> <label
                                    class="custom-control-label" for="customCheck18">#기타</label>
                              </div>
                              
                              <br>
                                          
                                 
                                 
                                 
                              
                              

                              <h5 class="h3">프로젝트 기술</h5>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck19"> <label
                                    class="custom-control-label" for="customCheck19">Bash</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck20"> <label
                                    class="custom-control-label" for="customCheck20">C/C++/C#</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck21"> <label
                                    class="custom-control-label" for="customCheck21">Java</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck22"> <label
                                    class="custom-control-label" for="customCheck22">JavaScript</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck23"> <label
                                    class="custom-control-label" for="customCheck23">Swift</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck24"> <label
                                    class="custom-control-label" for="customCheck24">Perl</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck25"> <label
                                    class="custom-control-label" for="customCheck25">Ruby</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck26"> <label
                                    class="custom-control-label" for="customCheck26">Python</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck27"> <label
                                    class="custom-control-label" for="customCheck27">PHP</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck28"> <label
                                    class="custom-control-label" for="customCheck28">R</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck29"> <label
                                    class="custom-control-label" for="customCheck29">VBA</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck30"> <label
                                    class="custom-control-label" for="customCheck30">Scala</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input"
                                    id="customCheck31"> <label
                                    class="custom-control-label" for="customCheck31">Go</label>
                              </div>
                              <br>

                              <h5 class="h3">근무지역</h5>
                              
                           <div class="row">
                               <div class="col">
                               <select class="form-control"  name="proj_work_place" onChange="cat1_change(this.value,proj_work_place1)" >
                                 <option selected>-선택-</option>
                                 <option value='1'>서울</option>
                                 <option value='2'>부산</option>
                                 <option value='3'>대구</option>
                                 <option value='4'>인천</option>
                                 <option value='5'>광주</option>
                                 <option value='6'>대전</option>
                                 <option value='7'>울산</option>
                                 <option value='8'>강원</option>
                                 <option value='9'>경기</option>
                                 <option value='10'>경남</option>
                                 <option value='11'>경북</option>
                                 <option value='12'>전남</option>
                                 <option value='13'>전북</option>
                                 <option value='14'>제주</option>
                                 <option value='15'>충남</option>
                                 <option value='16'>충북</option>
                                   </select>
                              </div>
                              
                              <div class="col">
                              <select class="form-control" name="proj_work_place1">
                                 <option  selected>-선택-</option>
                                 <option value='215'>군산시</option>
                                 <option value='216'>김제시</option>
                                 <option value='217'>남원시</option>
                                 <option value='218'>익산시</option>
                                 <option value='219'>전주시 덕진구</option>
                                 <option value='220'>전주시 완산구</option>
                                 <option value='221'>정읍시</option>
                                 <option value='222'>고창군</option>
                                 <option value='223'>무주군</option>
                                 <option value='224'>부안군</option>
                                 <option value='225'>순창군</option>
                                 <option value='226'>완주군</option>
                                 <option value='227'>임실군</option>
                                 <option value='228'>장수군</option>
                                 <option value='229'>진안군</option>
                                </select>
                              </div><!-- col --> 
                           </div><!-- row -->

                           </div>
                        </div>
                     </div>
                  </div>

			<!-- list -->    
     		<div class="col-sm-9">
	
	<c:forEach var="project" items="${projects}">
 		<div class="row shadow-sm p-3 bg-white rounded mb-3"  style="margin-left: 10px; margin-top: 10px">
    	<div class="col-sm-7 ">
    
        <div class="row align-items-center" >
        <h2 class="card-title text-uppercase text-muted mb-0 mr-2"><a href="#">${project.proj_title}</a></h2>
		<span class="justify-content-center mr-2">
		<c:choose>
		<c:when test="${project.followproject_no == null}">         
        <i class="ni ni-favourite-28 mt-2 " >
        </c:when>
        <c:when test="${project.followproject_no != null }">         
        <i class="ni ni-favourite-28 mt-2 color" >
        </c:when>
         </c:choose> 
        <input type="hidden" id ="projectId" value="${project.proj_id}" >
        <input type="hidden" id="memberId" value="${member.member_no}" >     
        </i>   
        </span>
        
         <fmt:parseDate value="2020-11-25" var="strPlanDate" pattern="yyyy-MM-dd"/>
            <fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
            <fmt:parseDate value="${project.getProj_apply_deadline()}" var="endPlanDate" pattern="yyyy-MM-dd"/>
            <fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
            
            <i class="ni ni-notification-70 mr-2"></i>
            <span  style="color: red;">마감  ${endDate - strDate}일 전</span>
     	
	</div>	      
    </div>
   <div>
    <p class="mt-3 mb-0 text-sm">
    <i class="ni ni-check-bold mr-3"></i><span class="text-success mr-2">${project.proj_career}</span>
  	 <i class="ni ni-key-25 mr-3"></i><span class="text-success mr-2">${project.proj_estimate}원</span>
	</p>
	</div>
	<div>
	<p class="mt-3 mb-0 text-sm">
    <i class="ni ni-single-02 mr-3"></i><span class="text-success mr-2">${project.proj_reqr_person}</span>
   <i class="ni ni-time-alarm mr-3"></i><span class="text-success mr-2">${project.proj_work_time}</span>
   <i class="ni ni-compass-04 mr-3"></i><span class="text-success mr-2">${project.proj_work_place}</span>
	</p>
 	</div>
 	
    <div class="mt-3 mr-3 text-sm d-flex">
	<c:set var="TextValue" value="${project.proj_detail}"/>
	${fn:substring(TextValue,0,60)}<br>${fn:substring(TextValue,61,120)}
	<br>${fn:substring(TextValue,121,180)}<br>${fn:substring(TextValue,181,240)}
	</div>
	
	<div>
	<p class="mt-3 mb-0 text-sm">
   <i class="ni ni-chart-bar-32 mr-3"></i><span class="text-success mr-2">${project.apply_mem}명</span>
	</p>
	</div>
	
</div>
</c:forEach>
	
                        <nav aria-label="Page navigation">
                           <ul class="pagination justify-content-center">
                              <c:if test="${pageDto.prev }">
                                 <li class="page-item">
                                    <a class="page-link" href="${pageDto.startPage - 1 }" tabindex="-1">
                                    <i class="fa fa-angle-left"></i>
                                    <span class="sr-only">Prev</span>
                                    </a>
                                 </li>
                              </c:if>
   
                              <c:forEach var="num" begin="${pageDto.startPage }" end="${pageDto.endPage }">
                                 <li class="page-item ${pageDto.standard.pageNum == num ? 'active':'' }">
                                    <a class="page-link" href="${num }">
                                    <c:out value="${num }" />
                                    </a>
                                 </li>
                              </c:forEach>
                              
                              <c:if test="${pageDto.next }">
                                 <li class="page-item">
                                    <a class="page-link" href="${pageDto.endPage + 1 }">
                                    <i class="fa fa-angle-right"></i>
                                    <span class="sr-only">Next</span>
                                    </a>
                                 </li>
                              </c:if>
                           </ul>
                        </nav>
                        
                        <form id="pagingActionForm" action="/project/list" method="get">
                           <input type="hidden" name="pageNum" value="${pageDto.standard.pageNum }">
                           <input type="hidden" name="amount" value="${pageDto.standard.amount }">
                        </form>
                        <!-- pagination -->




                     </div>
                  </div>
               </div>   
            </div>
  
   
<%@ include file="../includes/footer.jsp" %>

	<style type="text/css">
	 .color {
	 	color : #f5365c;
	 }
	</style>
	<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
	<script src="http://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">	
 	$(function() {
 		
 		$(".ni-favourite-28").click(function() {
			$(this).toggleClass("color");
			var related_project = $(this).find('#projectId').val();
			var related_member = $(this).find('#memberId').val();
			
			if ($(this).hasClass("color")) {
				$.ajax({
					url : "/followYes/"+related_project,
					type : "POST",
					data :{
						'related_member' : related_member
					},
					dataType : "json",
					success : function(result) {
						swal(
		                        "관심 프로젝트에 등록하셨습니다."
		                    );
						
					},
					error : function(error) {
						alert(error);
					}
				})
			}else {
				$.ajax({
					url : "/followNo/"+related_project+"/"+related_member,
					type : "delete",
					data :{
						'related_member' : related_member
					},
					success : function(result) {
						swal(
		                        "관심 프로젝트에서 해제하셨습니다."
		                    );
					},
					error : function(error) {
						alert(error);
					}
					})
				}
		});		
}); 
</script>
   <script type="text/javascript">
      $(document).ready(function() {
         
         
         $(window).scroll(function(){
            var scrollTop = $(document).scrollTop();
            if (scrollTop < 0) {
             scrollTop = 0;
            }
            $("#findquick").stop();
            $("#findquick").animate( { "top" : scrollTop });
            });
         
         
         var pagingActionForm = $("#pagingActionForm");
         
         $(".page-item a").on("click", function(e) {
            e.preventDefault();
            
            pagingActionForm.find("input[name='pageNum']").val($(this).attr("href"));
            pagingActionForm.submit();
         });

      });
      
      
      $(".move").on("click", function(e){
         e.preventDefault();
         pagingActionForm.append("<input type='hidden' name='proj_id' value='"+ $(this).attr("href")+"'>");
         pagingActionForm.attr("action","/project/read");
         pagintActionForm.submit();
      });
      
</script>
		
