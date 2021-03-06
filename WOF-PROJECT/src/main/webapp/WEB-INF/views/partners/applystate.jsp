<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!-- Header & Menu -->
	<%@ include file="../includes/header.jsp"%>


	<!-- Main content -->
	<div class="main-content" id="panel">

	<!-- Sub menu -->
	<%@ include file="menu.jsp"%>

	<div class="container mt-3">
		<!-- Table -->
		<div class="row">
			<div class="col">
				<div class="card shadow">
					<div class="card-header border-0">
						<h3 class="mb-0">제안 및 지원자현황</h3>
					</div>
					<div class="table-responsive">
						<table class="table align-items-center table-flush">
							<thead class="thead-light">
								<tr>
									<th scope="col"><i class="ni ni-chart-bar-32 mr-3"></i>
										프로젝트명</th>
									<th scope="col"><i class="ni ni-map-big ml-1"></i> 등록자</th>
									<th scope="col"><i class="ni ni-circle-08"></i> 지원마감일</th>
									<th scope="col"><i class="ni ni-map-big ml-1"></i> 필요인원</th>
									<th scope="col"><i class="ni ni-chart-pie-35 ml-1"></i>
										지원자수</th>
									<th scope="col"><i class="ni ni-air-baloon ml-1"></i> 프로젝트
										시작일</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="ProjectVO" items="${applyState }">
									<tr>
										<th scope="row">${ProjectVO.proj_title }</th>
										<td>${ProjectVO.member_no }</td>
										<td>${ProjectVO.proj_apply_deadline }</td>
										<td>${ProjectVO.proj_reqr_person }</td>
										<td>${ProjectVO.apply_mem }</td>
										<td><fmt:parseDate var="dt"
												value="${ProjectVO.proj_start_date }"
												pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
												value="${dt }" pattern="yyyy/MM/dd" /></td>
										<!-- 자세히보기  -->
										<td class="text-right"><a class=""
											href="${pageContext.request.contextPath}/partners/applydetail?member_no=${member.member_no }&proj_id=${ProjectVO.proj_id}">파트너스 선택</a></td>

									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
				
					<!-- 페이징 -->
					<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					  <c:if test="${pageMaker.prev }">
					    <li class="page-item disabled">
					      <a class="page-link" href="${pageMaker.startPage-1}">
					        <i class="fa fa-angle-left"></i>
					        <span class="sr-only">Previous</span>
					      </a>
					    </li>
					  </c:if>
					  
					  <c:forEach var="num" begin="${pageMaker.startPage}"
					  end="${pageMaker.endPage}">
					    <li class="page-item ${pageMaker.standard.pageNum == num ? "active":""}" >
					    <a class="page-link" href="${num}">${num}</a></li>
					  </c:forEach>
					  
					  <c:if test="${pageMaker.next}">
					    <li class="page-item">
					      <a class="page-link" href="${pageMaker.endPage +1}">
					        <i class="fa fa-angle-right"></i>
					        <span class="sr-only">Next</span>
					      </a>
					    </li>
					   </c:if>
					  </ul>
					</nav>
					
					<form id='actionForm' action="/partners/applystate" method="get">
						<input type="hidden" name='member_no' value='${member.member_no}'>
						<input type="hidden" name='pageNum' value = '${pageMaker.standard.pageNum}'>
						<input type="hidden" name='amount' value = '${pageMaker.standard.amount}'>
					</form>
				
			</div>
		</div>
	</div>
</div>
		
	<!-- Footer -->
	<%@ include file="../includes/footer.jsp"%>

<script>
var actionForm = $("#actionForm");

$(".page-item a").on(
		"click",
		function(e) {
			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']")
					.val($(this).attr("href"));
			actionForm.submit();
		});
</script>
</body>
</html>