<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.customer-list{
		width:900px; 
		float:right;
		margin:0;
	}
    .pagination{
    	display: block;
    	text-align: center;
    }
    
    .list-area>tbody>tr:hover{
    	cursor: pointer;
		background: gainsboro;
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
    <div class="outer" align="center">
    
    	<jsp:include page="../common/adminPageNavibar.jsp"/>
    	
    	<div class="customer-list" align="left">
    		<br>
    		<span data-text-content="true" style="font-size: 16px; font-weight: bold; color: rgb(127, 127, 127);" class="text-left" spellcheck="false">통합 관리&gt; 1:1문의</span>
	        <br>
	        <span data-text-content="true" style="font-weight: bold; font-size: 32px; color: rgb(127, 127, 127);" class="text-left" spellcheck="false">1:1문의</span>
	        <br>
	        <br>
	        <table class="list-area table table-bordered" border="1">
	            <thead class="thead-light text-center">
		            <tr>
		                <th width='50px'>No</th>
		                <th>제목</th>
		                <th>작성자</th>
		                <th>문의날짜</th>
		                <th>상태</th>
		            </tr>
	            </thead>
	            <tbody class="text-center">
	            	<c:if test="${ cList.isEmpty() }">
		            	<tr>
	                		<td colspan="5">조회된 문의내역이 없습니다.</td>
	            		</tr>
            		</c:if>
            		<c:if test="${ !cList.isEmpty() }">
	            		<c:forEach var="c" items="${ cList }">
			            	<tr>
				                <td>${ c.queNo }</td>
				                <td>${ c.queTitle }</td>
				                <td>${ c.queId }</td>
				                <td>${ c.queDate }</td>
				                <td>
				                	<c:choose>
				                		<c:when test="${ c.ansStatus eq 'N'}">
				                			<span style="color: red;">처리중</span>
				                		</c:when>
				                		<c:otherwise>
				                			<span style="font-weight:bold">답변완료</span>
				                		</c:otherwise>
				                	</c:choose>
				                </td>
		            		</tr>
		            	</c:forEach>
	            	</c:if>
	            </tbody>
	        </table>
        <br>

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
							<li class="page-item"><a class="page-link" href="list.ca?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
						</c:otherwise>
					</c:choose>
				    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				    	<c:choose>
				    		<c:when test="${ pi.currentPage eq p }">
				    			<li class="page-item active"><a class="page-link" href="list.ca?currentPage=${ p }">${ p }</a></li>
				    		</c:when>
				    		<c:otherwise>
				    			<li class="page-item"><a class="page-link" href="list.ca?currentPage=${ p }">${ p }</a></li>
				    		</c:otherwise>
				    	</c:choose>
				    </c:forEach>
				    <c:choose>
				    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				    	</c:when>
				    	<c:otherwise>
				    		<li class="page-item"><a class="page-link" href="list.ca?currentPage=${ pi.currentPage + 1 }">Next</a></li>
				    	</c:otherwise>
				    </c:choose>
				  </ul>
			</div>
			<br>
			
		</div>
		<jsp:include page="../common/footer.jsp"/>
	</div>
        
        <br><br>
        
    
    <script>
    	$(function(){
    		$(".list-area>tbody>tr").click(function(){
    			location.href = "detail.ca?cno=" + $(this).children().eq(0).text();
    		})
    		
		})
    </script>
    
</body>
</html>