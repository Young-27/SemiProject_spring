<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
    .outer{
    	width: 1200px; 
    	margin: auto;  
	}
	body{font-family: 'NEXON Lv1 Gothic OTF';}
	@font-face {
	    font-family: 'NEXON Lv1 Gothic OTF';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
    .on{
         width: 1200px;
         height: 180px;         
         margin: 0 auto;
         }
    .mainLogo{

        margin-left: 302px;

    }

    .login {           
        float:right; 
        margin-top:40px;
     }
   #loginform>*{
    
    float:left;
    }
    .id_pwd{width: 65%; height: 70px; } .loginbtn{width: 35%;}

    .pwd,.id{
        color: rgb(94, 94, 94);
        border-style: solid; 
        border-color: rgb(204, 204, 204);
        width:100%;
        height:50%;
    }
    .loginbtn>input{        
        font-size: 24px; 
        width: 80%;
        height: 100%;
        color: rgb(255, 255, 255); 
        line-height: 3.2em;        
        background-color: rgb(171, 198, 223); 
        text-align: center;
        border-radius: 4px;        
        border:0px;
    }

    .find{
    text-decoration-line: underline;
    font-style: italic;
    font-size: 16px;
    line-height: 3.2em;      
    }
               
    .navi{
            width: 1200px; height: 55px;
            background-color: rgb(187, 208, 227);            
            margin: 0 auto;         
     }
     #navi1{
            list-style-type:none;
            margin:0;
            padding:0;
            height:100%;
            text-decoration:none;
            
        }
       
        #navi1>li{
            margin-left: 8px;
            float:left;
            width:16%;
            height:100%;
            text-align:center;
        }
        #navi1 a{
            line-height: 2.8em; 
            font-size: 20px; 
            color: rgb(110, 109, 109);
            width: 16.6%;   
            font-weight: bold; 
            cursor:pointer;
            height:100%;
            width:100%;
            display:block;
            text-decoration:none; 
            z-index: 6;
        }
        #navi1 a:hover{color: white;}
        #navi1>li>ul{
            list-style-type:none;
            display:none;           
            margin-top:0px;
            padding:10px;
            background-color: rgb(184, 183, 183); 
            line-height: 2.8em; 
            font-size: 20px;
            position: relative;
            z-index: 6;
        }
        #navi1>li>ul a{font-size:15px;}
        #navi1>li>a:hover+ul{display:block;}
        #navi1>li>ul:hover{display:block;}
        #user-info a{
        text-decoration: none;
        color:black;
        font-size: 14px;
        margin-left:10px;
        background : ligthgray;
        font-weight:border;
    }
     </style>
</head>
<body>
	<c:if test="${ !empty alertMsg }">
		<script>	
			alert("${alertMsg}");
		</script>
        <!-- 뭔가가 담겨있는 경우 -->	
		<c:remove var="alertMsg" scope="session"/>	
	</c:if>
	<div class="on">
		<image onclick="location.href='${ pageContext.request.contextPath }'" src="resources/images/mainLogo.png" width="558px" height="120px" class="mainLogo">
		<c:choose>
			<c:when test="${ loginUser eq null }">
				<div class="login" align="center">
					<form action="login.me" id="loginform" method="POST">
						<div class="id_pwd">
							<input type="text" class="id" placeholder="아이디" name="memId" required>
							<br> 
							<input type="password" class="pwd" placeholder="비밀번호" name="memPwd" required>
						</div>
						<div class="loginbtn">
							<input type="submit" value="login">
						</div>
					</form>
					<a href="/searchIdPwd.me" id="searchMem"
						style="font-style: normal; text-decoration: none; color: black;"
						class="find">ID/PW 찾기</a> | <a href="/joinChooseForm.me"
						id="enrollMem"
						style="font-style: normal; text-decoration: none; color: black;"
						class="find">회원가입</a>
				</div>
				<script>
					function enrollPage(){
					    //location.href = "= contextPath /views/member/memberEnrollForm.jsp";
					    // 웹 애플리케이션의 디렉토리 구조가 url에 노출되면 보안에 위험함
					    
					    // 단순한 정적인 페이지 요청이라고 해도 반드시 servlet거쳐갈 것! => url에서 서블릿 매핑값만 노출됨
					    location.href="enrollForm.me";
					}
				</script>
			</c:when>
		
		
			<c:otherwise>
				<div id="user-info" align="right" class="login">
					<b>${ loginUser.memName }님</b>의 방문을 환영합니다. <br>
					<br>
					<div align="center">
						<c:choose>
							<c:when test="${ loginUser.memCode eq 1 }">
								<a href="list.me?currentPage=1">통합관리</a>
							</c:when>
							<c:otherwise>
								<a href="myPage.me">마이페이지</a>
							</c:otherwise> 
						</c:choose>
						<a href="logout.me">로그아웃</a>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="navi">
		<ul id="navi1">
			<li><a href="/Main.intro">코니멀 소개</a></li>
			<li><a href="/Main.sh?currentPage=1">보호소</a></li>
			<!-- <li><a href="/list.sh?currentPage=1">보호소</a></li> -->
			<li><a href="">입양문의</a>
				<ul>
					<li><a href="/list.dog?currentPage=1">보호중인 동물</a></li>
					<li><a href="/process.ad">입양 절차</a></li>
					<li><a href="">입양 신청</a></li>
					<li><a href="list.ad?currentPage=1">입양 후기</a></li>
				</ul></li>
			<li><a href="">입소문의</a>
				<ul>
					<li><a href="/process.en">입소 절차</a></li>
					<li><a href="">입소 신청</a></li>
				</ul></li>
			<li><a href="">후원 &amp; 자원봉사</a>
				<ul>
					<li><a href="/list.vo?currentPage=1">자원봉사</a></li>
					<li><a href="/Main.do?currentPage=1">후원</a></li>
					<!-- <li><a href="/list.do?currentPage=1">후원</a></li> -->
				</ul></li>
			<li><a href="">커뮤니티</a>
				<ul>
					<li><a href="list.cp?currentPage=1">자유 게시판</a></li>
					<li><a href="Main.no?currentPage=1">공지사항</a></li>
					<li><a href="">고객센터</a></li>
				</ul></li>
		</ul>
	</div>
	<!-- 신고버튼 클릭시 보여질 Modal -->
	<div class="modal" id="reportForm">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">신고하기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form action="report" method="post">

					<!-- Modal body -->
					<div class="modal-body">
						<div class="post-info">
							<!-- 게시글 번호 -->
							<input type="hidden" name="postNo" id="postNo" value="" />
							<!-- 게시글 유형 -->
							<input type="hidden" name="refType" id="refType" value="" />
							<!-- 신고자 번호 -->
							<input type="hidden" name="memNo" id="memNo" value="" />
						</div>

						<div class="form-check">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="reportNo" value="1">부적절한
								홍보 게시글
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="reportNo" value="2">음란성
								또는 청소년에게 부적합한 내용
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="reportNo" value="3">명예훼손/사생활
								침해 및 저작권 침해 등
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="reportNo" value="4">불법촬영물
								등 신고
							</label>
						</div>

					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">신고</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>

				</form>

			</div>
		</div>
	</div>

</body>
</html>