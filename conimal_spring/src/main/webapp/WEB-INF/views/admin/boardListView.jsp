<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .pagination{
    	display: block;
    	text-align: center;
    }
    .list-area>tbody>tr:hover{
	   	cursor: pointer;
		background: gainsboro;
    }
    #list-area{
    	float:right; 
    	margin: 0;
		width: 900px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="outer" align="center">
		<jsp:include page="../common/adminPageNavibar.jsp"/>
		<br>
		<div class="container" id="list-area">
	        <div data-text-content="true" style="font-size: 16px; font-weight: bold; color: rgb(127, 127, 127);" class="text-left" spellcheck="false">통합 관리&gt; 게시판 글 조회</div>
	        <div data-text-content="true" style="font-weight: bold; font-size: 32px; color: rgb(127, 127, 127);" class="text-left" spellcheck="false">게시판 글 조회</div>
	        
	        <%-- 검색 기능 --------------------------------------------------------------------------------- --%>
			<nav class="navbar navbar-dark justify-content-center">
				<form class="form-inline" action="search.bo">
					<div class="search">
						<input type="hidden" name="currentPage" value="1">
						<input type="text" name="keyword" class="form-control mr-sm-2" placeholder="검색할 게시글 제목을 입력하세요" style="width:500px">
						<button class="btn" type="submit" style="background-color: rgb(187, 208, 227)">검색</button>
					</div>
				</form>
			</nav>
	    
	          <div class="container"><br>
	            <table border="1" class="list-area table table-bordered" align="center">
		            <thead class="thead-light text-center">
			            <tr>
			                <th>No</th>
			                <th>게시판 이름</th>
			                <th width="400">제목</th>
			                <th>작성자</th>
			                <th>작성날짜</th>
			                <th>조회수</th>
			            </tr>
		            </thead>
		            <tbody class="text-center">
		            	<c:choose>
		            		<c:when test="${ bList.isEmpty() }">
		            			<tr>
	            					<td colspan="6">등록된 글이 없습니다.</td>
	            				</tr>
		            		</c:when>
		            		<c:otherwise>
		            			<c:forEach var="b" items="${ bList }">
			            			<tr>
						                <td>${ b.bno }</td>
						                <td>
						                	<c:choose>
						                		<c:when test="${ b.refType eq 'POST' }">
						                			자유게시판
						                		</c:when>
						                		<c:when test="${ b.refType eq 'ANIMAL' }">
						                			보호중인 아이들
						                		</c:when>
						                		<c:when test="${ b.refType eq 'ADOPT' }">
						                			입양 후기
						                		</c:when>
						                		<c:when test="${ b.refType eq 'DONATION' }">
						                			후원
						                		</c:when>
						                		<c:when test="${ b.refType eq 'VOLUNTEER' }">
						                			자원봉사
						                		</c:when>
						                		<c:otherwise>
						                		</c:otherwise>
						                	</c:choose>
						                </td>
						                <td>${ b.bTitle }</td>
						                <td>${ b.bWriter }</td>
						                <td>${ b.bDate }</td>
						                <td>${ b.bCount }</td>
				            		</tr> 
			            		</c:forEach>
		            		</c:otherwise>
	            		</c:choose>
		            </tbody>
	        	</table>
	          </div>
	          
	          <script>
	          	$(function(){ // 자유게시판이면 => / 보호중인아이들이면 => 
	          		$(".list-area>tbody>tr").click(function(){
	          			var refType = $(this).children().eq(1).text();
	          			if(refType == "자유게시판"){
	          				location.href = "detail.cp?cno=" + $(this).children().eq(0).text();
	          			}else if(refType == "보호중인 아이들"){
	          				location.href = "detail.an?ano=" + $(this).children().eq(0).text();
	          			}else if(refType == "입양 후기"){
	          				location.href = "detail.ad?ano=" + $(this).children().eq(0).text();
	          			}else if(refType == "후원"){
	          				location.href = "detail.do?dno=" + $(this).children().eq(0).text();
	          			}else if(refType == "자원봉사"){
	          				location.href = "detail.vo?vno=" + $(this).children().eq(0).text();
	          			}
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
							<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
						</c:otherwise>
					</c:choose>
				    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				    	<c:choose>
				    		<c:when test="${ pi.currentPage eq p }">
				    			<li class="page-item active"><a class="page-link" href="list.bo?currentPage=${ p }">${ p }</a></li>
				    		</c:when>
				    		<c:otherwise>
				    			<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">${ p }</a></li>
				    		</c:otherwise>
				    	</c:choose>
				    </c:forEach>
				    <c:choose>
				    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				    	</c:when>
				    	<c:otherwise>
				    		<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage + 1 }">Next</a></li>
				    	</c:otherwise>
				    </c:choose>
				  </ul>
			</div>
			<br>
		</div>
		<jsp:include page="../common/footer.jsp"/>
	</div>
	<br><br>
</body>
</html>