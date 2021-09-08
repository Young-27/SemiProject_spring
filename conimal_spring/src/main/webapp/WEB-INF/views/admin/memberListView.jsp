<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.mem-list{
		margin: 0;
		width: 900px;
		float: right;
	}
    .pagination{
    	display: block;
    	text-align: center;
    }
    .pagination>li>a{
    	float:none;
    }
    .list-area>tbody>tr:hover{
	   	cursor: pointer;
		background: gainsboro;
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
		<div class="outer">
			<jsp:include page="../common/adminPageNavibar.jsp"/>
		    <div class="mem-list" align="left">
				<br>
		        <span data-text-content="true" style="font-size: 16px; font-weight: bold; color: rgb(127, 127, 127);" class="text-left" spellcheck="false">통합 관리&gt; 회원 조회</span>
		        <br>
		        <span data-text-content="true" style="font-weight: bold; font-size: 32px; color: rgb(127, 127, 127);" class="text-left" spellcheck="false">회원 조회</span>
				
				<!-- 
					회원 검색기능--------------------------------------------------------------------------------------- 
				    http://localhost:8888/conimal/list.me?search_op=id&keyword=dd
				-->
				
				<nav class="navbar navbar-dark justify-content-center">
					<form class="form-inline" action="search.me">
						<div class="search">
							<input type="text" name="keyword" class="form-control mr-sm-2" placeholder="검색할 아이디를 입력하세요" style="width:500px">
							<button class="btn" type="submit" style="background-color: rgb(187, 208, 227)">검색</button>
						</div>
					</form>
				</nav>
		
		        <br>
			
				<div id=list-area class=table-responsive-sm>
					<table border="1" class="list-area table table-bordered" align="center">
							<thead class="thead-light text-center">
								<tr>
									<th>No</th>
									<th>회원정보</th>
									<th>아이디</th>
									<th>이름</th>
									<th>이메일</th>
									<th>가입일</th>
								<tr>
							</thead>
							<tbody class="text-center">
								<c:if test="${ mList.isEmpty() }">
									<tr>
										<td colspan="6">조회된 회원이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${ !mList.isEmpty() }">
									<c:forEach var="m" items="${ mList }">
										<tr>
											<td>${ m.memNo }</td>
											<td>
												<c:choose>
													<c:when test="${ m.memCode == 1 }">
														관리자
													</c:when>
													<c:when test="${ m.memCode == 2 }">
														보호소
													</c:when>
													<c:otherwise>
														일반회원
													</c:otherwise>
												</c:choose>
											</td>
											<td>${ m.memId }</td>
											<td>${ m.memName }</td>
											<td>${ m.email }</td>
											<td>${ m.enrollDate }</td>
										</tr>
									</c:forEach>
								</c:if>	
							</tbody>
					</table>
					
				</div>
				<br>
				<script>
					$(function(){
			    		$(".list-area>tbody>tr").click(function(){
			    			location.href = "detail.me?mno=" + $(this).children().eq(0).text();
			    		})
					})
		 		</script>
				
				<!-- 
					페이징바--------------------------------------------------------------------------------------- 
				-->
				
				<div align="center" class="paging-area text-center">
					<ul class="pagination justify-content-center" align="center">
						<c:choose>
							<c:when test="${ pi.currentPage eq 1}">
								<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="list.me?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
							</c:otherwise>
						</c:choose>
					    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					    	<c:choose>
					    		<c:when test="${ pi.currentPage eq p }">
					    			<li class="page-item active"><a class="page-link" href="list.me?currentPage=${ p }">${ p }</a></li>
					    		</c:when>
					    		<c:otherwise>
					    			<li class="page-item"><a class="page-link" href="list.me?currentPage=${ p }">${ p }</a></li>
					    		</c:otherwise>
					    	</c:choose>
					    </c:forEach>
					    <c:choose>
					    	<c:when test="${ pi.currentPage eq pi.maxPage }">
					    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
					    	</c:when>
					    	<c:otherwise>
					    		<li class="page-item"><a class="page-link" href="list.me?currentPage=${ pi.currentPage + 1 }">Next</a></li>
					    	</c:otherwise>
					    </c:choose>
					  </ul>
				</div>
		    </div>
		    <jsp:include page="../common/footer.jsp"/>
	    </div>
    

</body>
</html>