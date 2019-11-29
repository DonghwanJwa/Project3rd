<%-- <jsp:include page="../include/header.jsp" /> 사용하여 해더연결--%>

<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/font.css"/> <%-- 폰트 적용 css --%>
<link rel="stylesheet" type="text/css" href="./resources/css/header.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/category.css" />
<script src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="./resources/js/main.js"></script>
<title>글에 꿈을 담다, 자몽</title>
<script>
	$(document).ready(function() {
		$('#head-menu_search-text').keyup(function(e) {
			if (!$.trim($('#head-menu_search-text').val()) == "") {
				if (e.keyCode == 13) {
					location.href = "./search?result=post"
				}
			}
		});
	});
</script>
</head>
<body>
<%@ include file="../jsp/request_author.jsp" %>
<%@ include file="../jsp/accuse.jsp" %>
  <%-- 해드 메뉴바 --%>
 <div id="head-header-wrap">
  <header id="head-main-header">
   <div id="head-header_menubar">
   
  	<%-- 헤드-로고 --%>
 	<div id="head-menu_logo">
 	 <a id="head-logo-link" href="./">
 	  <img id="head-logo-img" src="./resources/img/logo.png" alt="로고"/>
 	 </a>
 	</div>
 	
 	<div id="head-menu-empty"></div>
 	
 	<input id="head-menu_search-text" placeholder="검색어 입력"/>
 	
 	<%-- 헤드-검색버튼 --%>
 	<div id="head-menu_search">
 	 <button id="head-menu_search-button">
 	  <img id="head-search-img" src="./resources/img/glass.png" alt="검색버튼" />
 	 </button>
 	</div>
 	
 	<%-- 헤드-메뉴버튼 --%>
 	<div id="head-menu_open_button">
 	 <button id="head-menu-button" name="head-menu-button">
 	  <img id="head-menu-img" src="./resources/img/menu.png" alt="메뉴버튼"/>
 	 </button>
 	</div>
   </div>
  </header>
  
  <div id="head-menu_search-empty"></div>
  
  <div class="clear"></div>
   
  <%-- 우측 사이드 메뉴창 --%>
  <div id="head-menu_page" class="head-menu_page">
   <div id="head-menu-page-wrap">
   
    <%-- 좌측 닫기버튼 --%>
    <div id="head-menu-close-wrap">
     <a id="head-menu-close-right-button" href="#">
      <img src="./resources/img/right.png">
     </a>
    </div>
    
    <div id="head-page-besthot-wrap">
     <%-- best --%>
     <div id="head-page-best">
      <div id="head-page-best-title">
       <strong>Best</strong>
      </div>
      <div id="head-page-best-list-frame">
       <ul id="head-page-best-list">
<%
	 	for(int i=1;i<=5;i++){
%>			
	    <li class="head-page-best-item">
	     <a href="./read" class="head-page-link">
	      <%if(i%2==1){%>
	      <img src="./resources/img/a.jpg"/>
	      <%}else {%>
	      <img src="./resources/img/b.jpg"/>
	      <%}%>
	      <div class="head-page-cont">	      
	       <strong class="head-page-main-title">죽어도 못보냈다.</strong>	     	      
	       <span class="head-page-sub-title">경력 10년차에 퇴사하고 캐나다로 떠난 여행</span>	     	    
	       <span class="head-page-author">by 누구누구</span>
	      </div>
	     </a>
	    </li>
<% 			
	 	}
%>
	   </ul>
	   </div>
	   <div class="head-item-scroll">
	    <ul class="head-item-scroll-list">
		 <li class="head-item-scroll-item">
		  <a href="#" class="head-item-scroll-link1" onclick="hotscroll('best',1);">
		   <span>&nbsp;</span>
		  </a>
		 </li>
		 <li class="head-item-scroll-item">
		  <a href="#" class="head-item-scroll-link2" onclick="hotscroll('best',2);">
		   <span>&nbsp;</span>
		  </a>
		 </li>
		<li class="head-item-scroll-item">
		 <a href="#" class="head-item-scroll-link3" onclick="hotscroll('best',3);">
		  <span>&nbsp;</span>
		 </a>
		</li>
		<li class="head-item-scroll-item">
		 <a href="#" class="head-item-scroll-link4" onclick="hotscroll('best',4);">
		  <span>&nbsp;</span>
		 </a>
		</li>
		<li class="head-item-scroll-item">
		 <a href="#" class="head-item-scroll-link5" onclick="hotscroll('best',5);">
		  <span>&nbsp;</span>
		 </a>
		</li>		
	   </ul>
	  </div>
     </div>
     
    <%-- hot --%>
     <div id="head-page-hot">
      <div id="head-page-hot-title">
       <strong>Hot</strong>
      </div>
      <div id="head-page-hot-list-frame">
       <ul id="head-page-hot-list">
<%
	 	for(int i=1;i<=5;i++){
%>			
	    <li class="head-page-hot-item">
	     <a href="./read" class="head-page-link">
	      <%if(i%2==1){%>
	      <img src="./resources/img/b.jpg"/>
	      <%}else {%>
	      <img src="./resources/img/a.jpg"/>
	      <%}%>
	      <div class="head-page-cont">	      
	       <strong class="head-page-main-title">죽어도 못보냈다.</strong>	     	      
	       <span class="head-page-sub-title">경력 10년차에 퇴사하고 캐나다로 떠난 여행</span>	     	    
	       <span class="head-page-author">by 누구누구</span>
	      </div>
	     </a>
	    </li>
<% 			
	 	}
%>
	   </ul>
	   </div>
	   <div class="head-item-scroll">
	    <ul class="head-item-scroll-list">
		 <li class="head-item-scroll-item">
		  <a href="#" class="head-item-scroll-link1" onclick="hotscroll('hot',1);">
		   <span>&nbsp;</span>
		  </a>
		 </li>
		 <li class="head-item-scroll-item">
		  <a href="#" class="head-item-scroll-link2" onclick="hotscroll('hot',2);">
		   <span>&nbsp;</span>
		  </a>
		 </li>
		<li class="head-item-scroll-item">
		 <a href="#" class="head-item-scroll-link3" onclick="hotscroll('hot',3);">
		  <span>&nbsp;</span>
		 </a>
		</li>
		<li class="head-item-scroll-item">
		 <a href="#" class="head-item-scroll-link4" onclick="hotscroll('hot',4);">
		  <span>&nbsp;</span>
		 </a>
		</li>
		<li class="head-item-scroll-item">
		 <a href="#" class="head-item-scroll-link5" onclick="hotscroll('hot',5);">
		  <span>&nbsp;</span>
		 </a>
		</li>		
	   </ul>
	  </div>
     </div>
    </div>
    
    <%-- category --%>
    <div id="head-page-category-wrap">
     <div id="head-page-category-frame">
      <ul id="head-page-category-list">
<%
	 for(int i=1;i<=15;i++){      
%>
	   <li class="head-page-category-item">
	    <a href="./category">
	    카테고리	    
	    </a>
	   </li>
<%
	 }
%>
	  </ul>
     </div>
    </div>
    
    <%-- profile --%>
    <div id="head-page-profile-wrap">
     <div id="head-profile-menu">
      <a href="./feed" class="head-feed-button">
       <img src="./resources/img/feed.png" alt="피드"/>
      </a>
     </div>
     <a href="../profile" id="head-profile-info-wrap">
      <div id="head-profile-info-img-wrap">
       <img id="head-profile-info-img" src="./resources/img/profile_logout.png">
      </div>
      <div id="head-profile-name-wrap">
       <strong>프로필명</strong>
      </div>
     </a>
     <div id="head-profile-service-wrap">
      <ul>
       <li id="head-profile-service-login" class="head-profile-stat-logout">
        <a href="./login">
         <span class="head-profile-service-bar-left"></span>
        	<b>로그인</b>
         <span class="head-profile-service-bar-right"></span>
        </a>
       </li>
       <li id="head-profile-service-signup" class="head-profile-stat-logout">
        <a href="./join_membership">
         <span class="head-profile-service-bar-left"></span>
        	<b>회원가입</b>
         <span class="head-profile-service-bar-right"></span>
        </a>
       </li>
       <li id="head-profile-service-write" class="head-profile-stat-login">
        <a href="./jamong_write">
         <span class="head-profile-service-bar-left"></span>
       		 <b>글쓰기</b>
         <span class="head-profile-service-bar-right"></span>
        </a>
       </li>
       <li id="head-profile-service-hr">―――――――</li>
       <li id="head-profile-service-rec-writing">
        <a href="./new_posts">
         <span class="head-profile-service-bar-left"></span>
       		 <b>최신 글</b>
         <span class="head-profile-service-bar-right"></span>
        </a>
       </li>
       <li id="head-profile-service-rec-book">
        <a href="./new_book">
         <span class="head-profile-service-bar-left"></span>
        	<b>최신 책</b>
         <span class="head-profile-service-bar-right"></span>
        </a>
       </li>
       <li id="head-profile-service-setting" class="head-profile-stat-login">
        <a href="./pass_modify">
         <span class="head-profile-service-bar-left"></span>
        	<b>내 설정</b>
         <span class="head-profile-service-bar-right"></span>
        </a>
       </li>
       <li id="head-profile-service-logout" class="head-profile-stat-login">
        <a href="#">
         <span class="head-profile-service-bar-left"></span>
    	   	<b>로그아웃</b>
         <span class="head-profile-service-bar-right"></span>
        </a>
       </li>
      </ul>
     </div>
    </div>
   </div> <%-- menu-page-wrap --%>
  </div> <%-- menu-page-wrap --%>
 </div> <%-- header-wrap --%>
  <div class="clear"></div>