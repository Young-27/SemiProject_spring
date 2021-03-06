<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  	
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
    .body{
        width: 1200px;
        height: 1240px;
        margin: 0 auto;
    }
    /**/
    .img1{
        position: relative;
        z-index: 1;
    }
     .animal{
        height: 25%;
        
     }
     .adoption{
        height: 25%;
     }
    
    .extitle{
        height: 13%;
        color: rgb(94, 94, 94);
        font-weight: bold;
        text-align: left; 
        width: 100%;
        
    }
    .careingimg{
         height: 65%;
         width: 100%;       
         
    }
    .more{
        height: 15%;
        width: 100%;
        margin-top: 70px;
        margin-left: 40px;
    }
    .animalimg{
        width: 23%;
        float: left;
        margin: 10px;        
    }
    .animalimg>img{
        width:261px;
        height:188px;
    }
        
    .more>button{
	    font-size: 16px; 
	    color: rgb(255, 255, 255); 
	    text-align: center; 
	    line-height: 2.5em; 
	    border-radius: 4px; 
	    background-color: rgb(127, 127, 127);
	    border:0px;
	    margin-right: 62px;
    }
    .product-title {
	    text-align:center;
	    display:table;
	    border:1px solid #cecece;
	    width:280px;
	    height:250px;
	}
	
	/* 새로운 배너 설정 */
	.banner{text-align:left}
	.mySlides {display:none}
	.w3-left, .w3-right, .w3-badge {cursor:pointer;}
	.w3-badge {height:15px;width:15px;padding:0;}
	.w3-button{top: -700% !important;}
</style>
</head>

<body>

	<jsp:include page="common/header.jsp"/>
	
	<div class="outer">
		<br>
		<div class="w3-content w3-display-container banner" style="max-width:1000px;/*  height:300px; */">
			<img class="mySlides" src="resources/images/5772177.jpg" style="width:100%; height:450px;">
			<img class="mySlides" src="resources/images/5199738.jpg" style="width:100%; height:450px;">
			<img class="mySlides" src="resources/images/5.jpg" style="width:100%; height:450px;">
			<div class="w3-center w3-container w3-section w3-large w3-display-bottommiddle" style="width:100%">
			    <div class="w3-button w3-dark-gray w3-display-left" onclick="plusDivs(-1)">&#10094;</div>
			    <div class="w3-button w3-dark-gray w3-display-right" onclick="plusDivs(1)">&#10095;</div>
				<span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
			    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
			    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
			</div>
			<a href='https://kr.freepik.com/psd/banner' align="center">Banner psd는 freepik - kr.freepik.com가 제작함</a>
		</div>
		
		
		<script>
			var slideIndex = 1;
			showDivs(slideIndex);
			
			function plusDivs(n) {
			  showDivs(slideIndex += n);
			}
			
			function currentDiv(n) {
			  showDivs(slideIndex = n);
			}
			
			function showDivs(n) {
			  var i;
			  var x = document.getElementsByClassName("mySlides");
			  var dots = document.getElementsByClassName("demo");
			  if (n > x.length) {slideIndex = 1}
			  if (n < 1) {slideIndex = x.length}
			  for (i = 0; i < x.length; i++) {
			    x[i].style.display = "none";  
			  }
			  for (i = 0; i < dots.length; i++) {
			    dots[i].className = dots[i].className.replace(" w3-dark-gray", "");
			  }
			  x[slideIndex-1].style.display = "block";  
			  dots[slideIndex-1].className += " w3-dark-gray";
			}
		</script>
	<%-- <% if(memcode==1){ %>
		<button onclick="location.href='<%=contextPath%>/bannerUpdateForm.main'" class="banner btn btn-secondary">배너 수정</button>
	<% }%> --%>
	<br>
	<br>
	<br>
	<br>
	<div class="animal">
		<div class="extitle">
			<h3>보호중인 아이들</h3>
		</div>
		<div class="careingimg">
			<%-- <%if(list.isEmpty()) {%>
	조회된 결과가 없습니다
<%} else { %>
	<%for(Animal a : list) {%>
		 <div class="animalimg">
			<div class="pet" style="text-align: center;">
				<a href="<%=contextPath%>/detail.ao?ano=<%=a.getAnNo()%>" ><img src="<%=contextPath%>/<%=a.getFilePath()%>/<%=a.getChangeName()%>" class="img-thumbnail" alt="Cinque Terre"></a><br>
				<%=a.getAnTitle() %>
			</div>
		 </div>
	<%} %>	
<%} %> --%>
			</div>

			<div class="more" align="right">
				<button onclick="location.href=list.dog?currentPage=1">더보기</button>

			</div>
		</div>
		<br>
		<br>
		<br>
		<br>

		<div class="adoption">
			<div class="extitle">
				<h3>입양 후기</h3>
			</div>
			<div class="careingimg">

				<%-- <%if(list1.isEmpty()) {%>
	조회된 결과가 없습니다
<%} else { %>
	<%for(Adopt a1 : list1) {%>
	 <div class="animalimg">
		<div class="pet" style="text-align: center;">					
			<a href="<%=contextPath%>/detail.ad?ano=<%=a1.getAdoptNo()%>" ><img src="<%=contextPath%>/<%=a1.getFilePath()%>/<%=a1.getChangeName()%>" class="img-thumbnail" alt="Cinque Terre"></a><br>
			<%=a1.getAdoptTitle() %>
		</div>
		 </div>
	<%} %>	
<%} %> --%>

			</div>
			<div class="more" align="right">
				<button onclick="location.href=list.ad?currentPage=1">더보기</button>
			</div>
		</div>
		<jsp:include page="common/footer.jsp"/> 
	</div>

	
        
</body>
</html>
