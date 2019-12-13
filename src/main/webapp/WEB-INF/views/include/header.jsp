<%-- <%@ include file="../include/header.jsp" %> 사용하여 해더연결--%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/font.css"/> <%-- 폰트 적용 css --%>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/header.css" />

<script src="/jamong.com/resources/js/jquery.js"></script>
<script type="text/javascript" src="/jamong.com/resources/js/main.js"></script>
<title>글에 꿈을 담다, 자몽</title>
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
 	 <a id="head-logo-link" href="/jamong.com/">
 	  <img id="head-logo-img" src="/jamong.com/resources/img/logo.png" alt="로고"/>
 	 </a>
 	</div>
 	
 	<div id="head-menu-empty"></div>
 	
 	<input id="head-menu_search-text" placeholder="검색어 입력"/>
 	
 	<%-- 헤드-검색버튼 --%>
 	<div id="head-menu_search">
 	 <button id="head-menu_search-button">
 	  <img id="head-search-img" src="/jamong.com/resources/img/glass.png" alt="검색버튼" />
 	 </button>
 	</div>
 	
 	<%-- 헤드-메뉴버튼 --%>
 	<div id="head-menu_open_button">
 	 <button id="head-menu-button" name="head-menu-button">
 	  <img id="head-menu-img" src="/jamong.com/resources/img/menu.png" alt="메뉴버튼"/>
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
      <img src="/jamong.com/resources/img/right.png">
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
       
		<c:forEach var="i" begin="1" end="5" step="1">	
	    <li class="head-page-best-item">
	     <a href="/jamong.com/read" class="head-page-link">
	      <c:if test="${i%2==1}">
	       <img src="/jamong.com/resources/img/a.jpg"/>
	      </c:if>
	      <c:if test="${i%2!=1}">
	       <img src="/jamong.com/resources/img/b.jpg"/>
	      </c:if>
	      <div class="head-page-cont">	      
	       <strong class="head-page-main-title">죽어도 못보냈다.</strong>	     	      
	       <span class="head-page-sub-title">경력 10년차에 퇴사하고 캐나다로 떠난 여행</span>	     	    
	       <span class="head-page-author">by 누구누구</span>
	      </div>
	     </a>
	    </li>
		</c:forEach>
		
	   </ul>
	   </div>
	   <div class="head-item-scroll">
	    <ul class="head-item-scroll-list">
	    
	     <c:forEach var="i" begin="1" end="5" step="1">
		 <li class="head-item-scroll-item">
		  <a class="head-item-scroll-link${i}" onclick="hotscroll('best',${i});">
		   <span>&nbsp;</span>
		  </a>
		 </li>		
		</c:forEach>
		
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
       
		<c:forEach var="i" begin="1" end="5" step="1">			
	    <li class="head-page-hot-item">
	     <a href="/jamong.com/read" class="head-page-link">
	      <c:if test="${i%2==1}">
	       <img src="/jamong.com/resources/img/a.jpg"/>
	      </c:if>
	      <c:if test="${i%2!=1}">
	       <img src="/jamong.com/resources/img/b.jpg"/>
	      </c:if>
	      <div class="head-page-cont">	      
	       <strong class="head-page-main-title">죽어도 못보냈다.</strong>	     	      
	       <span class="head-page-sub-title">경력 10년차에 퇴사하고 캐나다로 떠난 여행</span>	     	    
	       <span class="head-page-author">by 누구누구</span>
	      </div>
	     </a>
	    </li>
		</c:forEach>
		
	   </ul>
	   </div>
	   <div class="head-item-scroll">
	    <ul class="head-item-scroll-list"> 
	    
	    <c:forEach var="i" begin="1" end="5" step="1">
		 <li class="head-item-scroll-item">
		  <a class="head-item-scroll-link${i}" onclick="hotscroll('hot',${i});">
		   <span>&nbsp;</span>
		  </a>
		 </li>		
		</c:forEach>
		
	   </ul>
	  </div>
     </div>
    </div>
    
   <%-- category --%>
    <div id="head-page-category-wrap">
     <div id="head-page-category-frame">
      <ul id="head-page-category-list">
	   <%-- category 내용들어오는곳 : getJSON 처리 --%>
	  </ul>
     </div>
    </div>
    
    <%-- profile --%>
   <%-- 로그인 전 --%>
    <c:if test="${empty m}">
    <div id="head-page-profile-wrap">
     <div id="head-profile-menu">
     </div>
     <a id="head-profile-info-wrap">
      <div id="head-profile-info-img-wrap">
       <img id="head-profile-info-img" src="/jamong.com/resources/img/profile_logout.png">
      </div>
      <div id="head-profile-name-wrap">
       <strong>자몽,꿈에 글을 담다</strong>
      </div>
     </a>
     <div id="head-profile-service-wrap">
      <ul>
       <li id="head-profile-service-login" class="head-profile-stat-logout">
        <a href="/jamong.com/login">
         <span class="head-profile-service-bar-left"></span>
        	<b>로그인</b>
         <span class="head-profile-service-bar-right"></span>
        </a>
       </li>
       <li id="head-profile-service-signup" class="head-profile-stat-logout">
        <a href="/jamong.com/join_membership">
         <span class="head-profile-service-bar-left"></span>
        	<b>회원가입</b>
         <span class="head-profile-service-bar-right"></span>
        </a>
       </li>
       <li id="head-profile-service-hr"><span class="head-profile-service-bar"></span></li>
       <li id="head-profile-service-rec-writing">
        <a href="/jamong.com/new_posts">
         <span class="head-profile-service-bar-left"></span>
       		 <b>최신 글</b>
         <span class="head-profile-service-bar-right"></span>
        </a>
       </li>
       <li id="head-profile-service-rec-book">
        <a href="/jamong.com/new_book">
         <span class="head-profile-service-bar-left"></span>
        	<b>최신 책</b>
         <span class="head-profile-service-bar-right"></span>
        </a>
       </li>
      </ul>
     </div>
    </div>
    </c:if>
    
    <%-- 로그인 후 --%>
    <c:if test="${!empty m}">
     <c:if test="${m.mem_state==0}">
     <div id="head-page-profile-wrap">
      <div id="head-profile-menu">
       <a href="/jamong.com/feed" class="head-feed-button">
        <img src="/jamong.com/resources/img/feed.png" alt="피드"/>
       </a>
      </div>
      <a href="/jamong.com/profile" id="head-profile-info-wrap">
       <div id="head-profile-info-img-wrap">
        <img id="head-profile-info-img" src="${m.profile_photo}">
       </div>
       <div id="head-profile-name-wrap">
        <strong>${m.mem_nickname}</strong>
       </div>
      </a>
      <div id="head-profile-service-wrap">
       <ul>
        <li id="head-profile-service-write" class="head-profile-stat-login">
         <a href="/jamong.com/write">
          <span class="head-profile-service-bar-left"></span>
       	  <b>글쓰기</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-setting" class="head-profile-stat-login">
         <a href="/jamong.com/pass_modify">
          <span class="head-profile-service-bar-left"></span>
        	<b>내 설정</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-hr">―――――――</li>
        <li id="head-profile-service-rec-writing">
         <a href="/jamong.com/new_posts">
          <span class="head-profile-service-bar-left"></span>
       		 <b>최신 글</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-rec-book">
         <a href="/jamong.com/new_book">
          <span class="head-profile-service-bar-left"></span>
         	<b>최신 책</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-logout" class="head-profile-stat-login">
         <a href="/jamong.com/logout">
          <span class="head-profile-service-bar-left"></span>
    	   	<b>로그아웃</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
       </ul>
      </div>
     </div>
     </c:if>
     <c:if test="${m.mem_state==9}">
     <div id="head-page-profile-wrap">
      <div id="head-profile-menu">
       <a href="/jamong.com/feed" class="head-feed-button">
        <img src="/jamong.com/resources/img/feed.png" alt="피드"/>
       </a>
       <a href="/jamong.com/admin_main" class="head-feed-button">
        <img src="/jamong.com/resources/img/admin_icon.png" alt="관리자">
       </a>
      </div>
      <a href="/jamong.com/profile" id="head-profile-info-wrap">
       <div id="head-profile-info-img-wrap">
        <img id="head-profile-info-img" src="${m.profile_photo}">
       </div>
       <div id="head-profile-name-wrap">
        <strong>${m.mem_nickname}</strong>
       </div>
      </a>
      <div id="head-profile-service-wrap">
       <ul>
        <li id="head-profile-service-write" class="head-profile-stat-login">
         <a href="/jamong.com/write">
          <span class="head-profile-service-bar-left"></span>
       	  <b>글쓰기</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-setting" class="head-profile-stat-login">
         <a href="/jamong.com/pass_modify">
          <span class="head-profile-service-bar-left"></span>
        	<b>내 설정</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-hr">―――――――</li>
        <li id="head-profile-service-rec-writing">
         <a href="/jamong.com/new_posts">
          <span class="head-profile-service-bar-left"></span>
       		 <b>최신 글</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-rec-book">
         <a href="/jamong.com/new_book">
          <span class="head-profile-service-bar-left"></span>
         	<b>최신 책</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-logout" class="head-profile-stat-login">
         <a href="/jamong.com/logout">
          <span class="head-profile-service-bar-left"></span>
    	   	<b>로그아웃</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
       </ul>
      </div>
     </div>
     </c:if>
    </c:if>
   </div> <%-- menu-page-wrap --%>
  </div> <%-- menu-page-wrap --%>
 </div> <%-- header-wrap --%>
  <div class="clear"></div>