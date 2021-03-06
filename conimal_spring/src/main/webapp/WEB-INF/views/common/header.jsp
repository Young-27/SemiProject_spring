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
    	height: 800px;
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
        <!-- ????????? ???????????? ?????? -->	
		<c:remove var="alertMsg" scope="session"/>	
	</c:if>
	<div class="on">
		<image onclick="location.href='${ pageContext.request.contextPath }'" src="resources/images/mainLogo.png" width="558px" height="120px" class="mainLogo">
		<c:choose>
			<c:when test="${ loginUser eq null }">
				<div class="login" align="center">
					<form action="login.me" id="loginform" method="POST">
						<div class="id_pwd">
							<input type="text" class="id" placeholder="?????????" name="memId" required>
							<br> 
							<input type="password" class="pwd" placeholder="????????????" name="memPwd" required>
						</div>
						<div class="loginbtn">
							<input type="submit" value="login">
						</div>
					</form>
					<a href="/searchIdPwd.me" id="searchMem"
						style="font-style: normal; text-decoration: none; color: black;"
						class="find">ID/PW ??????</a> | <a href="/joinChooseForm.me"
						id="enrollMem"
						style="font-style: normal; text-decoration: none; color: black;"
						class="find">????????????</a>
				</div>
				<script>
					function enrollPage(){
					    //location.href = "= contextPath /views/member/memberEnrollForm.jsp";
					    // ??? ????????????????????? ???????????? ????????? url??? ???????????? ????????? ?????????
					    
					    // ????????? ????????? ????????? ??????????????? ?????? ????????? servlet????????? ???! => url?????? ????????? ???????????? ?????????
					    location.href="enrollForm.me";
					}
				</script>
			</c:when>
		
		
			<c:otherwise>
				<div id="user-info" align="right" class="login">
					<b>${ loginUser.memName }???</b>??? ????????? ???????????????. <br>
					<br>
					<div align="center">
						<c:choose>
							<c:when test="${ loginUser.memCode eq 1 }">
								<a href="list.me?currentPage=1">????????????</a>
							</c:when>
							<c:otherwise>
								<a href="myPage.me">???????????????</a>
							</c:otherwise> 
						</c:choose>
						<a href="logout.me">????????????</a>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="navi">
		<ul id="navi1">
			<li><a href="/Main.intro">????????? ??????</a></li>
			<li><a href="/Main.sh?currentPage=1">?????????</a></li>
			<!-- <li><a href="/list.sh?currentPage=1">?????????</a></li> -->
			<li><a href="">????????????</a>
				<ul>
					<li><a href="/list.dog?currentPage=1">???????????? ??????</a></li>
					<li><a href="/process.ad">?????? ??????</a></li>
					<li><a href="">?????? ??????</a></li>
					<li><a href="list.ad?currentPage=1">?????? ??????</a></li>
				</ul></li>
			<li><a href="">????????????</a>
				<ul>
					<li><a href="/process.en">?????? ??????</a></li>
					<li><a href="">?????? ??????</a></li>
				</ul></li>
			<li><a href="">?????? &amp; ????????????</a>
				<ul>
					<li><a href="/list.vo?currentPage=1">????????????</a></li>
					<li><a href="/Main.do?currentPage=1">??????</a></li>
					<!-- <li><a href="/list.do?currentPage=1">??????</a></li> -->
				</ul></li>
			<li><a href="">????????????</a>
				<ul>
					<li><a href="list.cp?currentPage=1">?????? ?????????</a></li>
					<li><a href="Main.no?currentPage=1">????????????</a></li>
					<li><a href="">????????????</a></li>
				</ul></li>
		</ul>
	</div>
	<!-- ???????????? ????????? ????????? Modal -->
	<div class="modal" id="reportForm">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">????????????</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form action="report" method="post">

					<!-- Modal body -->
					<div class="modal-body">
						<div class="post-info">
							<!-- ????????? ?????? -->
							<input type="hidden" name="postNo" id="postNo" value="" />
							<!-- ????????? ?????? -->
							<input type="hidden" name="refType" id="refType" value="" />
							<!-- ????????? ?????? -->
							<input type="hidden" name="memNo" id="memNo" value="" />
						</div>

						<div class="form-check">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="reportNo" value="1">????????????
								?????? ?????????
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="reportNo" value="2">?????????
								?????? ??????????????? ???????????? ??????
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="reportNo" value="3">????????????/?????????
								?????? ??? ????????? ?????? ???
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="reportNo" value="4">???????????????
								??? ??????
							</label>
						</div>

					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">??????</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">??????</button>
					</div>

				</form>

			</div>
		</div>
	</div>

</body>
</html>