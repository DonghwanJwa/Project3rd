<%-- <%@ include file="../include/header.jsp" %> 사용하여 해더연결--%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font.css"/> <%-- 폰트 적용 css --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sweetalert2.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.word-break-keep-all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sweetalert2.min.js"></script>
<title>글에 꿈을 담다, 자몽</title>
</head>
<body>
<%@ include file="../jsp/accuse.jsp" %>
  <%-- 해드 메뉴바 --%>
 <div id="head-header-wrap">
  <header id="head-main-header">
   <div id="head-header_menubar">
   
  	<%-- 헤드-로고 --%>
 	<div id="head-menu_logo">
 	 <a id="head-logo-link" href="${pageContext.request.contextPath}/">
 	  <img id="head-logo-img" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="로고"/>
 	 </a>
 	</div>
 	
 	<%-- 읽기페이지에 필요한 버튼 --%>
 	<c:if test="${! empty bo}">
 	 <div id="head-menu-readpage-info">
 	  <c:if test="${bo.cat_name ne null}">
 	   <a id="head-menu-readpage-cat" href="${pageContext.request.contextPath}/category/${bo.cat_name}">${bo.cat_name}</a>
 	  </c:if>
 	  <c:if test="${bo.book_no != 0}">
 	   <a id="head-menu-readpage-booklink" href="${pageContext.request.contextPath}/book/@${bo.memberVO.mem_id}/${bo.book_no}">Book</a>
 	  </c:if>
 	 </div>
 	</c:if>
 	<div id="head-menu-empty">
 	<c:if test="${! empty bo}">
 	<div id="head-menu-readpage">
 	 <c:if test="${(mem_id eq m.mem_id) && (bo.book_no == 0)}">
 	 <div id="head-menu-lock">
 	  <c:if test="${bo.bo_lock==0}">
 	   <button class="head-menu-lock-btn">
 	    <img class="head-menu-lock-img lock" src="${pageContext.request.contextPath}/resources/img/lock.png">
 	   </button>
 	  </c:if>
 	  <c:if test="${bo.bo_lock==1}">
 	   <button class="head-menu-lock-btn">
 	    <img class="head-menu-lock-img unlock" src="${pageContext.request.contextPath}/resources/img/unlock.png">
 	   </button>
 	  </c:if>
 	 </div>
 	 </c:if>
 	 <div id="head-menu-sym">
 	 <c:if test="${! empty m}">
 	  <button class="head-menu-sym-btn">
 	   <img class="head-menu-heart-img" title="공감" src="${pageContext.request.contextPath}/resources/img/heart.png">
 	   <span class="head-menu-heart-rate">${bo.bo_like}</span>
 	  </button>
 	 </c:if>
 	 <c:if test="${empty m}">
 	  <div class="head-menu-sym-div">
 	   <img class="head-menu-heart-img-disabled" title="공감" src="${pageContext.request.contextPath}/resources/img/heart.png">
 	   <span class="head-menu-heart-rate">${bo.bo_like}</span>
 	  </div>
 	 </c:if>
 	 </div>
	  <div id="head-menu-hit">
	   <img class="head-menu-hit-img" title="조회수" src="${pageContext.request.contextPath}/resources/img/hit.png">
	   <span class="head-menu-hit-rate">${bo.bo_hit}</span>
	  </div>
	 </div>
	 <c:if test="${m.mem_state==9}">
	  <c:if test="${bo.bo_lock!=3}">
	  <div id="head-menu-block">
	   <c:if test="${bo.bo_lock!=2}">
	    <img class="head-menu-block-img" src="${pageContext.request.contextPath}/resources/img/block.png" title="정지" data-state="${bo.bo_lock}"/>
	   </c:if>
	   <c:if test="${bo.bo_lock==2}">
	    <img class="head-menu-block-img" src="${pageContext.request.contextPath}/resources/img/unblock.png" title="정지해제" data-state="${bo.bo_lock}"/>
	   </c:if>
	  </div>
	  </c:if>
	 </c:if>
	  	<%-- 신고기능 --%>
	 <c:if test="${m.mem_state!=9}">
 	  <c:if test="${mem_id ne m.mem_id}">
 	   <div id="head-menu-accuse">
 	   <img class="head-menu-accuse-img" src="${pageContext.request.contextPath}/resources/img/warring.png" onclick="accuseShow(2);"
 	  	 		title="신고하기" alt="신고하기" />
 	   </div>
 	  </c:if>
 	 </c:if>
 	</c:if>

 	<%-- 책info 페이지에 필요한 버튼 / 삭제 / 관리자만--%>
 	<c:if test="${book_name ne null}">
 	 <c:if test="${m.mem_state==9}">
   	  <div id="head-menu-readpage">
 	   <a href="${pageContext.request.contextPath}/book/del/${mem_id}/${book_no}" id="head-menu-book-edit">
 	    <img class="head-menu-book-del-img" src="${pageContext.request.contextPath}/resources/img/readpage_icon/del_off.png"
 	    	title="폐간">
 	   </a>
 	  </div>
 	 </c:if>
 	</c:if>
 	</div>
 	
 	<input id="head-menu_search-text" placeholder="검색어 입력"/>
 	
 	<%-- 헤드-검색버튼 --%>
 	<div id="head-menu_search">
 	 <button id="head-menu_search-button">
 	  <img id="head-search-img" src="${pageContext.request.contextPath}/resources/img/glass.png" alt="검색버튼" />
 	 </button>
 	</div>
 	
 	<%-- 헤드-메뉴버튼 --%>
 	<div id="head-menu_open_button">
 	 <button id="head-menu-button" name="head-menu-button">
 	  <img id="head-menu-img" src="${pageContext.request.contextPath}/resources/img/menu.png" alt="메뉴버튼"/>
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
     <a id="head-menu-close-right-button">
      <img src="${pageContext.request.contextPath}/resources/img/right.png">
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
		<%-- Best 내용 들어오는 곳 : getJSON 처리 --%>
	   </ul>
	   </div>
	   <div class="head-item-scroll">
	    <ul class="head-item-scroll-list">
	    
	     <c:forEach var="i" begin="1" end="5" step="1">
		 <li class="head-item-scroll-item">
		  <a class="head-item-scroll-link${i} best-scroll" onclick="hotscroll('best',${i});">
		   <c:if test="${i == 1}">
		    <span class="head-checked">&nbsp;</span>
		   </c:if>
		   <c:if test="${i!=1}">
		    <span>&nbsp;</span>
		   </c:if>
		  </a>
		 </li>		
		</c:forEach>
		
	   </ul>
	  </div>
     </div>
     
     <%-- Notice --%>
     <div id="head-page-notice">
      <div id="head-page-notice-title">
       <strong>Notice</strong>
       <a href="${pageContext.request.contextPath}/notice">more</a>
      </div>
      <div id="head-page-notice-list-frame">
       <ul id="head-page-notice-list">
		<%-- Notice 내용 들어오는곳 : getJSON 처리 --%>
	   </ul>
	  </div>
     </div>
     
    </div>
    
   <%-- category --%>
    <div id="head-page-category-wrap">
     <div id="head-page-category-frame">
      <div id="head-page-category-title">
       <strong>Category</strong>
      </div>
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
       <img id="head-profile-info-img" src="${pageContext.request.contextPath}/resources/img/profile_logout.png">
      </div>
      <div id="head-profile-name-wrap">
       <strong>자몽,꿈에 글을 담다</strong>
      </div>
     </a>
     <div id="head-profile-service-wrap">
      <ul>
       <li id="head-profile-service-login" class="head-profile-stat-logout">
        <a href="${pageContext.request.contextPath}/login">
         <span class="head-profile-service-bar-left"></span>
        	<b>로그인</b>
         <span class="head-profile-service-bar-right"></span>
        </a>
       </li>
       <li id="head-profile-service-signup" class="head-profile-stat-logout">
        <a href="${pageContext.request.contextPath}/join_membership">
         <span class="head-profile-service-bar-left"></span>
        	<b>회원가입</b>
         <span class="head-profile-service-bar-right"></span>
        </a>
       </li>
       <li id="head-profile-service-hr"><span class="head-profile-service-bar"></span></li>
       <li id="head-profile-service-rec-writing">
        <a href="${pageContext.request.contextPath}/new_posts">
         <span class="head-profile-service-bar-left"></span>
       		 <b>최신 글</b>
         <span class="head-profile-service-bar-right"></span>
        </a>
       </li>
       <li id="head-profile-service-rec-book">
        <a href="${pageContext.request.contextPath}/new_book">
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
       <a href="${pageContext.request.contextPath}/feed" class="head-feed-button">
        <img src="${pageContext.request.contextPath}/resources/img/feed.png" alt="피드"/>
        <span id="head-feed-count"></span>
       </a>
      </div>
      <a href="${pageContext.request.contextPath}/@${m.mem_id}" id="head-profile-info-wrap">
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
         <a href="${pageContext.request.contextPath}/write">
          <span class="head-profile-service-bar-left"></span>
       	  <b>글쓰기</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <c:if test="${m.mem_author==1}">
        <li id="head-profile-service-publish" class="head-profile-stat-login">
         <a href="${pageContext.request.contextPath}/book_create">
          <span class="head-profile-service-bar-left"></span>
       	  <b>책 발간</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        </c:if>
        <li id="head-profile-service-setting" class="head-profile-stat-login">
         <a href="${pageContext.request.contextPath}/my_info">
          <span class="head-profile-service-bar-left"></span>
        	<b>내 설정</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-hr"><span class="head-profile-service-bar"></span></li>
        <li id="head-profile-service-rec-writing">
         <a href="${pageContext.request.contextPath}/new_posts">
          <span class="head-profile-service-bar-left"></span>
       		 <b>최신 글</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-rec-book">
         <a href="${pageContext.request.contextPath}/new_book">
          <span class="head-profile-service-bar-left"></span>
         	<b>최신 책</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-logout" class="head-profile-stat-login">
         <a href="${pageContext.request.contextPath}/logout">
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
       <a href="${pageContext.request.contextPath}/feed" class="head-feed-button">
        <img src="${pageContext.request.contextPath}/resources/img/feed.png" alt="피드"/>
        <span id="head-feed-count"></span>
       </a>
       <a href="${pageContext.request.contextPath}/admin_main" class="head-feed-button">
        <img src="${pageContext.request.contextPath}/resources/img/admin_icon.png" alt="관리자">
       </a>
      </div>
      <a href="${pageContext.request.contextPath}/@${m.mem_id}" id="head-profile-info-wrap">
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
         <a href="${pageContext.request.contextPath}/statistics">
          <span class="head-profile-service-bar-left"></span>
       	  <b>통계자료</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-setting" class="head-profile-stat-login">
         <a href="${pageContext.request.contextPath}/my_info">
          <span class="head-profile-service-bar-left"></span>
        	<b>내 설정</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-hr"><span class="head-profile-service-bar"></span></li>
        <li id="head-profile-service-rec-writing">
         <a href="${pageContext.request.contextPath}/new_posts">
          <span class="head-profile-service-bar-left"></span>
       		 <b>최신 글</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-rec-book">
         <a href="${pageContext.request.contextPath}/new_book">
          <span class="head-profile-service-bar-left"></span>
         	<b>최신 책</b>
          <span class="head-profile-service-bar-right"></span>
         </a>
        </li>
        <li id="head-profile-service-logout" class="head-profile-stat-login">
         <a href="${pageContext.request.contextPath}/logout">
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