<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.customerDetail{
        width: 900px;
        float: right;
    }

    .customerDetail button{
        text-align: center;
        margin: auto;
    }
    .answer-area{
        margin: auto;
        width: 80%;
        height: 400px;
        border: black solid 1px;
    }
    
    .btn-float{
    	float: right;
    }
    #customerAnswer{
    	width: 80%;
    }
    #enrollAnswer-btn{
    	text-align: center;
    }
    
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    
    <div class="outer">
    	<jsp:include page="../common/adminPageNavibar.jsp"/>
    	<div class="customerDetail" align="left">
    		<br>
    		<span data-text-content="true" style="font-size: 16px; font-weight: bold; color: rgb(127, 127, 127);" class="text-left" spellcheck="false">통합 관리&gt; 1:1문의</span>
	        <br>
	        <span data-text-content="true" style="font-weight: bold; font-size: 32px; color: rgb(127, 127, 127);" class="text-left" spellcheck="false">1:1문의</span>
	        <br>
	        <a href="list.ca" class="btn btn-float text-left" style="background-color: rgb(187, 208, 227)">목록</a>
	        <br><br>
			<input type="hidden" name="cno" value="${ cno }">
            <table id="customerAnswer" class="text-center" border="1" align="center">
                <tr>
                    <th width="150px" height="50px">작성자 아이디</th>
                    <td width="400px">${ c.queId }</td>
                </tr>
                <tr>
                    <th width="150px" height="50px">문의 제목</th>
                    <td width="400px">
                    	${ c.queTitle }
                    </td>
                </tr>
                <tr>
                    <th width="150px" height="50px">문의 내용</th>
                    <td width="400px" height="200px">${ c.queContent }</td>
                </tr>
            </table>

            <br>

            <h3 style="font-weight: bold; font-size: 25px; color: rgb(127, 127, 127); margin-left: 150px;">문의 답변 작성</h3>
                
           	<div class="answer-area" border="1">
				<form action="update.ca" method="post">
					<input type="hidden" name="cno" value="${ cno }">
					<textarea name="ansContent" cols="88" rows="20" style="resize: none;">${ c.ansContent }</textarea>
					         
					<div class="button-area" align="center">
						<button type="reset" class="btn" style="background-color: lightgray">초기화</button>
						<button type="submit" class="btn" style="background-color: rgb(187, 208, 227)">등록</button>
					</div>
				</form>
                   
           	</div>
        </div>
        <br><br>
        <jsp:include page="../common/footer.jsp"/>
    </div>
</body>
</html>