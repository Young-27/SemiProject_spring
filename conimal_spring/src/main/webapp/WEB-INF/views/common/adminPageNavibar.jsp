<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .admin_nav{
        width: 200px;
        box-sizing: border-box;
        float: left;
    }

    .admin_nav>h2{
        color: darkgray;
       
    }
    #ad_nav1{
        list-style-type:none;
        margin:0;
        padding:0;
        text-decoration:none;
        border: 1px solid lightgray;
    }
    #ad_nav1>li{
        list-style-type: none;
        font-size: 20px;
        width: 100%;
        height:20%;
        text-align:center;
    }
    
    #ad_nav1 a{
        text-decoration: none;
        color: black;
        font-weight: bold;
        line-height: 100px;
        height: 100%;
        width: 100%;
        cursor: pointer;
        display: block;
    }

    #ad_nav1>li>ul{
        list-style-type: none;
        font-size: 17px;
        font-weight: bold;
        padding: 0;
        margin: 0;
        display: none;
    }

    #ad_nav1 a:hover{
        background-color: rgb(187, 208, 227);
    }
    
    #ad_nav1>li>a:hover+ul{display:block;}
    #ad_nav1>li>ul:hover{display:block;}

</style>
</head>
<body>
	<div class="admin_nav">
		<br>
        <div data-text-content="true" style="font-weight: bold; font-size: 32px; color: rgb(127, 127, 127);" class="" spellcheck="false" align="center">통합관리</div>
        <ul id="ad_nav1">
            <li><a href="list.me">회원조회</a></li>
            <li><a href="list.re">신고조회</a></li>
            <li>
                <a href="Main.sh">보호소 관리</a>
                <ul>
                    <li><a href="Main.sh">보호소 등록 관리</a></li>
                    <li><a href="Main.do">후원 등록 관리</a></li>
                </ul>
            </li>

            <li>
                <a href="Main.intro">사이트소개 관리</a>
                <ul>
                    <li><a href="Main.intro">사이트 소개</a></li>
                    <li><a href="Main.no?currentPage=1">공지사항</a></li>
                </ul>
            </li>
            <li>
                <a href="list.bo">게시판 관리</a>
                <ul>
                    <li><a href="list.bo">게시판 글 조회</a></li>
                    <li><a href="list.ca">1:1 문의</a></li>
                </ul>
            </li>
            
        </ul>
    </div>
	
	<script>
		$(function(){
			$("#ad_nav1>li>a>ul>li").hover(function(){
				$(this).parent().css("background-color", rgb(187, 208, 227));
				console.log("hover");
			})
		})
	</script>

	
	
	
</body>
</html>