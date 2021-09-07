<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#list-area{
    	float:right; 
    	margin: 0;
		width: 900px;
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
    	<jsp:include page="../common/adminPageNavibar.jsp" />	
        <br>
        <div id="list-area">
       	<div data-text-content="true" style="font-size: 16px; font-weight: bold; color: rgb(127, 127, 127);" class="text-left" spellcheck="false">통합 관리&gt; 신고 조회</div>
        <div data-text-content="true" style="font-weight: bold; font-size: 32px; color: rgb(127, 127, 127);" class="text-left" spellcheck="false">신고 조회</div>
        <br>
	        <div class="table-responsive-sm">
		        <table border="1" class="list-area table table-bordered" align="center">
		            <thead class="thead-light text-center">
		            	<tr>
			                <th>No</th>
			                <th>신고자 아이디</th>
			                <th>게시판 이름</th>
			                <th>제목</th>
			                <th>신고 사유</th>
			                <th>신고 날짜</th>
		            	</tr>
		            </thead>
		            <tbody class="text-center">
		            	<c:if test="${ rList.isEmpty() }">
				            <tr>
				                <td colspan="6">조회할 데이터가 없습니다.</td>
				            </tr>
				        </c:if>
				        <c:if test="${ !rList.isEmpty() }">
					        <c:forEach var="r" items="${ rList }">
					            <tr>
					                <td>${ r.reportNo }</td>
					                <td>${ r.reportWriter }</td>
					                <td>
					                	<c:choose>
					                		<c:when test="${ r.refBoardType eq 'POST' }">
					                			자유게시판
					                		</c:when>
					                		<c:when test="${ r.refBoardType eq 'ANIMAL' }">
					                			보호중인 아이들
					                		</c:when>
					                		<c:when test="${ r.refBoardType eq 'ADOPT' }">
					                			입양 후기
					                		</c:when>
					                		<c:when test="${ r.refBoardType eq 'DONATION' }">
					                			후원
					                		</c:when>
					                		<c:when test="${ r.refBoardType eq 'VOLUNTEER' }">
					                			자원봉사
					                		</c:when>
					                		<c:otherwise>
					                		</c:otherwise>
					                	</c:choose>
					                </td>
					                <td>
					                	<c:choose>
					                		<c:when test="${ r.refBoardType eq 'POST' }">
					                			${ r.cpostTitle }
					                		</c:when>
					                		<c:when test="${ r.refBoardType eq 'ANIMAL' }">
					                			${ r.animalTitle }
					                		</c:when>
					                		<c:when test="${ r.refBoardType eq 'ADOPT' }">
					                			${ r.adoptTitle }
					                		</c:when>
					                		<c:when test="${ r.refBoardType eq 'DONATION' }">
					                			${ r.donationTitle }
					                		</c:when>
					                		<c:when test="${ r.refBoardType eq 'VOLUNTEER' }">
					                			${ r.valunteerTitle }
					                		</c:when>
					                		<c:otherwise>
					                		</c:otherwise>
					                	</c:choose>
									</td>
					                <td>${ r.reportReason }</td>
					                <td>${ r.reportDate }</td>
					            </tr>
							</c:forEach>
						</c:if>
				    </tbdoy>
		        </table>
	        </div>
        
	        <br>
			<script>
				$(function(){
	          		$(".list-area>tbody>tr").click(function(){
	          			var refType = $(this).children().eq(3).text();
		      			var refNo = $(this).children(".refNo").val();
	          			if(refType == "자유게시판"){
	          				location.href = "detail.cp?cno=" + refNo;
	          			}else if(refType == "보호중인 아이들"){
	          				location.href = "detail.an?ano=" + refNo;
	          			}else if(refType == "입양 후기"){
	          				location.href = "detail.ad?ano=" + refNo;
	          			}else if(refType == "후원"){
	          				location.href = "detail.do?dno=" + refNo;
	          			}else if(refType == "자원봉사"){
	          				location.href = "detail.vo?vno=" + refNo;
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
							<li class="page-item"><a class="page-link" href="list.re?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
						</c:otherwise>
					</c:choose>
				    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				    	<c:choose>
				    		<c:when test="${ pi.currentPage eq p }">
				    			<li class="page-item active"><a class="page-link" href="list.re?currentPage=${ p }">${ p }</a></li>
				    		</c:when>
				    		<c:otherwise>
				    			<li class="page-item"><a class="page-link" href="list.re?currentPage=${ p }">${ p }</a></li>
				    		</c:otherwise>
				    	</c:choose>
				    </c:forEach>
				    <c:choose>
				    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				    	</c:when>
				    	<c:otherwise>
				    		<li class="page-item"><a class="page-link" href="list.re?currentPage=${ pi.currentPage + 1 }">Next</a></li>
				    	</c:otherwise>
				    </c:choose>
				  </ul>
			</div>
		</div>
        
        <br>
        <jsp:include page="../common/footer.jsp" />
    </div>
    
</body>
</html>