<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.attachment.model.vo.Attachment,com.kh.banner.model.service.BannerService
    							,com.kh.animal.model.vo.Animal, com.kh.animal.model.service.AnimalService
    							,java.util.ArrayList,com.kh.common.model.vo.PageInfo,com.kh.adopt.model.service.AdoptService
    							,com.kh.adopt.model.vo.Adopt"%>
    <% Attachment at = new BannerService().selectBanner("MAINPAGE");
	
	int listCount; 		
	int currentPage;	
	int pageLimit;		
	int boardLimit;			
	int maxPage;		
	int startPage;		
	int endPage;	
	
	listCount = new AnimalService().selectDogCount();	
	currentPage = 1; pageLimit = 10; boardLimit = 4;
	
	maxPage = (int)Math.ceil((double)listCount / boardLimit);	
	startPage = (currentPage - 1) / pageLimit * pageLimit + 1;	
	endPage = startPage + pageLimit - 1;
	
	if(endPage > maxPage) {
		endPage = maxPage;
	}
	
	PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	ArrayList<Animal> list = new AnimalService().selectDogList(pi);
	
	String keyword="";	
	listCount = new AdoptService().selectListCount(keyword);
	
	PageInfo pi1 = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage, endPage);
	ArrayList<Adopt> list1 = new AdoptService().selectList(keyword, pi1);
	
	%> --%>
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
        font-family: HanSans; 
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

.banner{
	float:right;
}


</style>
</head>

<body>

    <jsp:include page="common/header.jsp"/>

	<div class="body">
		<div class="imgsilde">
			<%-- <img src="<%=contextPath %>/resources/images/5.jpg" class="img1" width= "1200px"  height= "400px" > --%>

		</div>
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
	</div>

	<jsp:include page="common/footer.jsp"/> 
        
</body>
</html>
