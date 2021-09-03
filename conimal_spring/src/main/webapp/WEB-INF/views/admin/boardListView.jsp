<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
		margin-top:50px;
		margin:auto;
		width: 1000px;
		height: 1200px;
        
	}
    .outer>h2{
        text-align: left;
    }
    table{
    	width: 700px;
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
		<br>
        <div data-text-content="true" style="font-size: 16px; font-weight: bold; color: rgb(127, 127, 127);" class="text-left" spellcheck="false">통합 관리&gt; 게시판 글 조회</div>
        <div data-text-content="true" style="font-weight: bold; font-size: 32px; color: rgb(127, 127, 127);" class="text-left" spellcheck="false">게시판 글 조회</div>
        <!-- 
			게시판 글 검색기능--------------------------------------------------------------------------------------- 
		    http://localhost:8888/conimal/list.me?search_op=id&keyword=dd
		-->
		<nav class="navbar navbar-dark justify-content-center">
			<form class="form-inline" action="<%=contextPath%>/listSearch.bo">
				<div class="search">
					<input type="hidden" name="currentPage" value="1">
					<input type="text" name="keyword" class="form-control mr-sm-2" placeholder="검색할 게시글 제목을 입력하세요" style="width:500px">
					<button class="btn" type="submit" style="background-color: rgb(187, 208, 227)">검색</button>
				</div>
			</form>
		</nav>
        
	    <div class="container">
	      
	        
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
		            	<tr>
		            		<%if(list.isEmpty()){ %>
			            		<tr>
			            			<td colspan="6">등록된 글이 없습니다.</td>
			            		</tr>
		            		<%} else { %>
		            			<% for(Board b : list){ %>
		            			<tr>
					                <td><%=b.getBno() %></td>
					                <% if(b.getbRefType().equals("POST")){ %>
					                	<td>자유게시판</td>
					                <% }else if(b.getbRefType().equals("ANIMAL")){ %>
			                			<td>보호중인 아이들</td>
				                	<% }else if(b.getbRefType().equals("ADOPT")){ %>
				                		<td>입양 후기</td>
				                	<% }else if(b.getbRefType().equals("DONATION")){ %>
				                		<td>후원</td>
				                	<% }else if(b.getbRefType().equals("VOLUNTEER")){ %>
				                		<td>자원봉사</td>
				                	<% } else {%>
				                		<td></td>
				                		<td></td>
				                	<% } %>
					                <td><%=b.getbTitle() %></td>
					                <td><%=b.getbWrtier() %></td>
					                <td><%=b.getbDate() %></td>
					                <td><%=b.getbCount() %></td>
			            		</tr>
			            		<% } %>
			            	<% } %>
		            </tbody>
	        	</table>
	          </div>
	          
	          <script>
	          	$(function(){ // 자유게시판이면 => / 보호중인아이들이면 => 
	          		$(".list-area>tbody>tr").click(function(){
	          			var refType = $(this).children().eq(1).text();
	          			if(refType == "자유게시판"){
	          				location.href = "<%=contextPath%>/detail.cp?cno=" + $(this).children().eq(0).text();
	          			}else if(refType == "보호중인 아이들"){
	          				location.href = "<%=contextPath%>/detail.an?ano=" + $(this).children().eq(0).text();
	          			}else if(refType == "입양 후기"){
	          				location.href = "<%=contextPath%>/detail.ad?ano=" + $(this).children().eq(0).text();
	          			}else if(refType == "후원"){
	          				location.href = "<%=contextPath%>/detail.do?dno=" + $(this).children().eq(0).text();
	          			}else if(refType == "자원봉사"){
	          				location.href = "<%=contextPath%>/detail.vo?vno=" + $(this).children().eq(0).text();
	          			}
	          		})
	          	})
	          	
	          </script>
	          
	        	<!-- 
					페이징바--------------------------------------------------------------------------------------- 
				-->
				<br>
				<div align="center" class="paging-area">
				  <ul class="pagination justify-content-center" align="center">
				  	<% if(currentPage != 1){ %>
				    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.bo?currentPage=<%=currentPage-1%>">Previous</a></li>
				    <% }else{ %>
				    	<li class="page-item disabled"><a class="page-link" href="<%=contextPath%>/list.bo?currentPage=<%=currentPage%>">Previous</a></li>
				    <% } %>
				    
				    <% for(int p=startPage; p<=endPage; p++){ %>
				    	<%if(currentPage == p){ %>
				    		<li class="page-item active"><a class="page-link" href="<%=contextPath%>/list.bo?currentPage=<%= p %>"><%= p %></a></li>
				    	<% }else{ %>
				    		<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.bo?currentPage=<%= p %>"><%= p %></a></li>
				    	<% } %>
				    <% } %>
				    
				    <% if(currentPage != maxPage){ %>
				    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.bo?currentPage=<%=currentPage+1%>">Next</a></li>
				    <% }else{ %>
				    	<li class="page-item disabled"><a class="page-link" href="<%=contextPath%>/list.bo?currentPage=<%=currentPage%>">Next</a></li>
				    <% } %>
				  </ul>
				</div>
	        </div>
	        <jsp:include page="../common/footer.jsp"/>
	      </div>
        <br>

        <br>
   
  
</body>
</html>