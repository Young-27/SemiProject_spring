<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .memberDetail{
        width: 900px;
        float: right;
    }

    .memberDetail button{
        text-align: center;
        margin: auto;
    }
    .list-area{
        margin: auto;
        width: 80%;
        height: 50%;
        border: black solid 1px;
    }
    
    #back{float:right;}
    .memberDetail table input{width:300px;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="outer">
		<jsp:include page="../common/adminPageNavibar.jsp"/>
		<br><br>
        <a href="list.me" class="btn" id="back" style="background-color: rgb(187, 208, 227)">목록</a>
        <br><br><br>
        <div class="memberDetail">
            <form action="updateMember.im" method="post">
                <table class="table" id="memberDetail" border="1">
                    <tr>
                        <th width="100px">아이디</th>
                        <td >${ m.memId }</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" name="memName" value="${ m.memName }"></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><input type="text" name="email" value="${ m.email }"></td>
                    </tr>
                    <tr>
                        <th>가입일</th>
                        <td>${ m.enrollDate }</td>
                    </tr>
                    <c:if test="${ m.memCode == 2 }">
                    	<tr>
                    		<th>연락처</th>
                    		<td><input type="text" name="shPhone" value="${ m.shPhone }"></td>
                    	</tr>
                    	<tr>
                    		<th>주소</th>
                    		<td><input type="text" name="shAddress" value="${ m.shAddress }"></td>
                    	</tr>
                    	<tr>
                    		<th>소개글</th>
                    		<td>
                    			<textarea rows="20" cols="70" style="resize:none" name="shAbout">${ m.shAbout }</textarea>
                    		</td>
                    	</tr>
                    </c:if>
                </table>
                <br>
                <div class=button-area align="center">
                    <button type="submit" class="btn" style="background-color: rgb(187, 208, 227)">정보수정</button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
                </div>
                <br>
            </form>
        </div>
        
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
	
	<!-- 회원탈퇴 버튼 클릭시 보여질 Modal -->
	<div class="modal" id="deleteForm">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">회원탈퇴</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" align="center">
	        
	        <b>탈퇴 후 복구가 불가능합니다. <br>정말로 해당 회원을 탈퇴 시키겠습니까?</b> <br><br>
	        
	        <form action="deleteMember.im" method="post">
	        	<input type="hidden" name="memNo" value="${ m.memNo }">
	        	<br><br>
	        	<button type="submit" class="btn btn-danger btn-sm">탈퇴하기</button>
	        </form>
		        	
	      </div>
		</div>
    </div>
    </div>
    
    
</body>
</html>