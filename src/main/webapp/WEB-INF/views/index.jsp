<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/font.css"/>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/m.css"/>
<script src="/jamong.com/resources/js/jquery.js"></script>
<script src="/jamong.com/resources/js/jquery.word-break-keep-all.min.js"></script>
<script type="text/javascript" src="/jamong.com/resources/js/main.js"></script>
<script>
//메인페이지에서 각메뉴에 좌우스크롤이 키보드로 작동되는것을 방지
$(document).keydown(function(e){
    if (e.keyCode == 37) { 
        e.preventDefault();
    }
    if (e.keyCode == 39) {
        e.preventDefault();
    }
});
</script>
<title>글에 꿈을 담다, 자몽</title>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
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
	      <div class="head-page-main-title-wrap">	      
	       <strong class="head-page-main-title">죽어도 못보냈다.</strong>	     	      
	      </div>
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
      </div>
      <div id="head-page-notice-list-frame">
       <ul id="head-page-notice-list">
       
		<c:forEach var="i" begin="1" end="5" step="1">			
	    <li class="head-page-notice-item">
	     <a>
	      <span class="head-page-notice-title">공지사항 예시입니다</span>
	      <span class="head-page-notice-date">2019.12.15</span>
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
         <a href="/jamong.com/my_info">
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
         <a href="/jamong.com/my_info">
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
  
  <%-- 메인페이지 --%>
  <div id="main_cont"> 
   
   <%-- 메인-빈여백 찐주황--%>
   <div id="main_top">
    
   </div>
  
  <%-- 메인-공감글 노랑--%>
   <div id="recom_writting">
    <div class="main-title-text">
     <h3>SYMPATHETIC ARTICLE</h3>
     <h5>당신을 공감시킬 글모음</h5>
    </div>
	<div id="recom_writting-cont">
	
     <ul id="recom_writting-list">
     
 	  <c:forEach var="blist" items="${blist}" varStatus="status">
       <li>
        <div class="recom_writting-item">
         <a href="/jamong.com/@${blist.memberVO.mem_id}/${blist.bo_no}" class="link_item">
          <div class="recom_writting-item-head">
           <div class="writting-item-head-inner">
            <div class="writting-item-head-inner-cont">
             <div class="writting-item-head-inner-cont-img" style="background-image:url(${blist.bo_thumbnail})">
              <img class="writting-item-head-inner-cont-tape" src="/jamong.com/resources/img/recom_masking/masking${tlist[status.index]}.png">
              <%-- 이미지 div --%>
             </div>
             <div class="writting-item-head-inner-cont-hs">
              <div class="writting-item-head-inner-cont-head">
               <p>${blist.bo_title}</p>
              </div>
              <div class="writting-item-head-inner-cont-sub">
               <div>${blist.bo_cont}</div>
              </div>
             </div>
             <div class="writting-item-head-inner-cont-bottom">
              <span>by ${blist.memberVO.mem_nickname}</span>
             </div>
            </div>
           </div>
          </div>
         </a>
        </div> 
       </li>
	  </c:forEach>
	  
     </ul>
     </div>
     <div class="slide-button">
      <a href="javascript:;" id="recom_writting-cont-slideleft" class="slide-left" onclick="scrollmove('recom_writting-cont','slideleft');"
      	style="visibility:hidden;">
       <img src="/jamong.com/resources/img/writepage_icon/prev_btn.png" alt="왼쪽스크롤버튼"/>
      </a>
      <a href="javascript:;" id="recom_writting-cont-slideright" class="slide-right" onclick="scrollmove('recom_writting-cont','slideright');"
      	style="visibility:visible;">
       <img src="/jamong.com/resources/img/writepage_icon/next_btn.png" alt="오른쪽스크롤버튼"/>
      </a>     
    </div>   
   </div>
  
   <div class="clear"></div>
  
   <%-- 메인-추천책 주황--%>
   <div id="recom_book">
    <div class="main-title-text">
     <h3>RECOMMENED BOOKS</h3>
     <h5>자몽 작가들의 특별한 출간</h5>
    </div>
    <div id="recom_book-cont">
     <ul id="recom_book-list">
     
	  <c:forEach begin="1" end="20" step="1">
       <li>
        <div class="recom_book-item">
         <a href="/jamong.com/book_info" class="link_item">
          <div class="recom_book-item-head">
           <div class="book-item-head-inner">
            <img class="book-item-head-inner-img" src="/jamong.com/resources/img/write2.jpg">
            <div class="book-item-head-inner-cont">
             <div class="book-item-head-inner-cont-top">
              <strong>강아지와 지내는건 어때?</strong>
              <i>by 멍뭉이</i>
             </div>
             <div class="book-item-head-inner-cont-bottom">
              <span>Jamong Book</span>
             </div>
            </div>
            <span class="book-item-head-inner-line"></span>
           </div>
          </div>
         </a>
        </div> 
       </li>
      </c:forEach>
      
     </ul>
     <div id="recom_book-item-shelveback"></div>
     <div class="clear"></div>
 	 <div id="recom_book-item-shelve"></div>
    </div>
     <div class="slide-button">
      <a href="javascript:;" id="recom_book-cont-slideleft" class="slide-left" onclick="scrollmove('recom_book-cont','slideleft');"
      	style="visibility:hidden;">
       <img src="/jamong.com/resources/img/writepage_icon/prev_btn.png" alt="왼쪽스크롤버튼"/>
      </a>
      <a href="javascript:;" id="recom_book-cont-slideright" class="slide-right" onclick="scrollmove('recom_book-cont','slideright');"
      	style="visibility:visible;">
       <img src="/jamong.com/resources/img/writepage_icon/next_btn.png" alt="오른쪽스크롤버튼"/>
      </a>
     </div>
   </div>
   
   <div class="clear"></div>
    
   <%-- 메인-추천 작가 초록--%>
   <div id="recom_author">
    <div class="main-title-text">
     <h3>JAMONG AUTHORS</h3>
     <h5>다양한 작가들을 만나보세요</h5>
    </div>
    <div id="recom_author-cont">
     <ul id="recom_author-list">

	  <c:forEach var="mlist" items="${mlist}">
	  <li class="recom_author-item">
	   <div class="recom_author-item-inner">
	   	<a href="/jamong.com/profile" class="recom_author-item-link">
		 <div class="recom_author-item-intro">
		  <strong>${mlist.mem_nickname}</strong><%-- 와드! mem_nickname --%>
		  <span class="recom-author-intro">${mlist.profile_cont}</span>
		 </div>	  
	   	 <div class="recom_author-item-img">
		  <img src="${mlist.profile_photo}" alt="프로필 사진"/>
		 </div>
	   	</a>		  	
	    <div class="recom_author-keyword">
	    <c:if test="${!empty mlist.mem_fav1}">
	     <button class="keyword1">${mlist.mem_fav1}</button>
	    </c:if>
	    <c:if test="${!empty mlist.mem_fav2}">
	     <button class="keyword2">${mlist.mem_fav2}</button>
	    </c:if>
	    <c:if test="${!empty mlist.mem_fav3}">
	     <button class="keyword3">${mlist.mem_fav3}</button>
	    </c:if>
	    </div>
	   </div>
	  </li>
	  </c:forEach>
	  
     </ul>
    </div>
   </div>
   
   <div class="clear"></div>

  <%-- 정보란 파랑--%>
 <footer id="foot-main-footer">
  <div id="foot-footer">
   <div id="foot-footer-inner">
    <div id="foot-inner-quotation">
     <p class="foot-inner-quotation-text">글 쓰는 것은 쉽다. 그저 혈관을 열고 피를 흘리면 된다.</p>
     <span class="foot-inner-quotation-author">레드스미스(Red Smith, 스포츠 기자)</span>
    </div>
    <div id="foot-inner-right">
     <div id="foot-inner-menu">
      <ul id="foot-inner-menu-list">
       <li class="foot-inner-menu-item"><a href="/jamong.com/notice">공지사항</a></li>
       <li class="foot-inner-menu-item"><a href="#">자몽 이용안내</a></li>
       <li class="foot-inner-menu-item"><a href="/jamong.com/request_author">작가신청</a></li>
       <li class="foot-inner-menu-item"><a href="/jamong.com/inquire">문의하기</a></li>
       <li class="foot-inner-menu-item"><a href="/jamong.com/policy_terms">이용약관</a></li>
       <li class="foot-inner-menu-item"><a href="/jamong.com/policy_privacy">개인정보 처리방침</a></li>
      </ul>
     </div>
     <div id="foot-inner-sns">
      <ul id="foot-inner-sns-list">
       <li class="foot-inner-sns-item">
        <a class="foot-inner-sns-link" href="http://www.facebook.com" target="_blank">
         <img class="foot-inner-sns-img" src="/jamong.com/resources/img/footer/facebook.png" alt="페이스북"/>
        </a>
       </li>
       <li class="foot-inner-sns-item">
        <a class="foot-inner-sns-link" href="https://www.instagram.com" target="_blank">
         <img class="foot-inner-sns-img" src="/jamong.com/resources/img/footer/instagram.png" alt="인스타그램"/>
        </a>
       </li>
       <li class="foot-inner-sns-item">
        <a class="foot-inner-sns-link" href="http://www.twitter.com" target="_blank">
         <img class="foot-inner-sns-img" src="/jamong.com/resources/img/footer/twitter.png" alt="트위터"/>
        </a>
       </li>
      </ul>
     </div>
    </div>
   </div>
  </div>
 </footer>
</body>
</html>