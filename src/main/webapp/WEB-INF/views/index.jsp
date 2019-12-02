<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/font.css"/>
<link rel="stylesheet" type="text/css" href="./resources/css/m.css"/>
<script src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="./resources/js/main.js"></script>
<script src="./resources/js/request_author.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/request_author.css"/>
<title>글에 꿈을 담다, 자몽</title>
<script>
$(document).ready(function(){
	$('#head-menu_search-text').keyup(function(e) {
		if(!$.trim($('#head-menu_search-text').val())==""){
			if (e.keyCode == 13){			
				location.href = "./search?result=post"
			}
    	}       
	});
});
</script>
</head>
<body>

<div id="req_wrap">
	<div id="req_auth_wrap">
		<div id="req_auth_title">
		<h1>자몽 작가신청</h1>
		<a href="#" id="req_close" onclick="offerToggle();"><img src="./resources/img/close_x.png"/></a>
	</div>
		<div class="req_form">
			
			<p class="req_form_Mtitle"><b>01. 작가님은 누구신가요?</b><br/></p>
			<p class="req_form_Stitle">
				자몽에선 누구나 언제든 글을 쓸 수 있습니다.<br/>
				하지만, 본격적으로 글에 꿈을 담으려는 작가님이 궁금합니다.<br/>
				작가님을 이해하고 앞으로의 활동을 기대할 수 있게 해주세요. 
			</p>
			
			<div class="req_form_textarea" contenteditable="true">
				<p>
				자-몽 자-몽 자-몽 자-몽 자-몽 자-몽 자-몽 자-몽 자-몽
				</p> 
			</div>
		</div>
		
		<div class="req_form">
			<p class="req_form_Mtitle"><b>02. 글에 담을 꿈을 이야기 해주세요.</b><br/></p>
			<p class="req_form_Stitle">
				자몽에선 모든 글에 글쓴이의 꿈이 담겨있다고 믿습니다.<br/>
				에세이,여행기,일상,그림 무엇이든 좋아요.<br/>
				작가님이 자몽에 싣고 싶은 글에 무엇이 담길지 알려주세요.
			</p>
			
			<div class="req_form_textarea" contenteditable="true">
				<p>
				자-몽 자-몽 자-몽 자-몽 자-몽 자-몽 자-몽 자-몽 자-몽
				</p> 
			</div>
		</div>
		
		<div class="req_form">
			<p class="req_form_Mtitle"><b>03. 작가님의 글을 맛보게 해주세요.</b><br/></p>
			<p class="req_form_Stitle">
				혹시 미리 써둔 글이 있나요?<br/>
				자몽 작가 선정 시 가장 중요한 자료가 된답니다.<br/>
				작가님의 글을 보여주세요.<br/>
				<b>* URL은 최대 3개 까지, 파일형식은 ... ...만 가능합니다.</b> 
			</p>
			
			
			<div id="req_form_upload">
				<div class="req_form_url" >
					<input class="req_url_box" size="67" placeholder="URL을 입력하세요."/>
					<input class="req_url_box" size="67" placeholder="URL을 입력하세요."/>
					<input class="req_url_box" size="67" placeholder="URL을 입력하세요."/>
					
				</div>
			
				<div class="req_form_file">
					<div class="req_form_file_name">파일명.pdf<br/>파일명.png<br/>파일명.jpg</div>
					<a class="req_form_file_add">파일 추가</a>
				</div>
			</div>
		</div>
		
		<div id="req_auth_btn_wrap">
			<a href="#">신청하기</a>
			<a href="#">돌아가기</a>
		</div>
	</div>
</div>

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
       
		<c:forEach var="i" begin="1" end="5" step="1">	
	    <li class="head-page-best-item">
	     <a href="./read" class="head-page-link">
	      <c:if test="${i%2==1}">
	       <img src="./resources/img/a.jpg"/>
	      </c:if>
	      <c:if test="${i%2!=1}">
	       <img src="./resources/img/b.jpg"/>
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
       
		<c:forEach var="i" begin="1" end="5" step="1">			
	    <li class="head-page-hot-item">
	     <a href="./read" class="head-page-link">
	      <c:if test="${i%2==1}">
	       <img src="./resources/img/a.jpg"/>
	      </c:if>
	      <c:if test="${i%2!=1}">
	       <img src="./resources/img/b.jpg"/>
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

	   <c:forEach begin="1" end="15" step="1">
	   <li class="head-page-category-item">
	    <a href="./category?directory=articles">
	    카테고리	    
	    </a>
	   </li>
	   </c:forEach>
	   
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
     <a href="./profile" id="head-profile-info-wrap">
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
        <a href="./write">
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
  
  <%-- 메인페이지 --%>
  <div id="main_cont"> 
   
   <%-- 메인-빈여백 찐주황--%>
   <div id="main_top">
    
   </div>
  
   <%-- 메인-추천책 주황--%>
   <div id="recom_book">
    <div class="main-title-text">
     <h3>추천 작품</h3>
    </div>
    <div id="recom_book-cont">
     <ul id="recom_book-list">
     
	  <c:forEach begin="1" end="20" step="1">
       <li>
        <div class="recom_book-item">
         <a href="./book_info" class="link_item">
          <div class="recom_book-item-head">
           <div class="book-item-head-inner">
            <img class="book-item-head-inner-img" src="./resources/img/write2.jpg">
            <div class="book-item-head-inner-cont">
             <div class="book-item-head-inner-cont-top">
              <strong>강아지와 지내는건 어때?</strong>
              <span>by 멍뭉이</span>
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
       <img src="./resources/img/writepage_icon/prev_btn.png" alt="왼쪽스크롤버튼"/>
      </a>
      <a href="javascript:;" id="recom_book-cont-slideright" class="slide-right" onclick="scrollmove('recom_book-cont','slideright');"
      	style="visibility:visible;">
       <img src="./resources/img/writepage_icon/next_btn.png" alt="오른쪽스크롤버튼"/>
      </a>
     </div>
   </div>
   
   <div class="clear"></div>
   
   <%-- 메인-공감글 노랑--%>
   <div id="recom_writting">
    <div class="main-title-text">
     <h3>공감 글</h3>
    </div>
	<div id="recom_writting-cont">
	
     <ul id="recom_writting-list">
     
 	  <c:forEach begin="1" end="20" step="1">
       <li>
        <div class="recom_writting-item">
         <a href="./read" class="link_item">
          <div class="recom_writting-item-head">
           <div class="writting-item-head-inner">
            <div class="writting-item-head-inner-cont">
             <div class="writting-item-head-inner-cont-img">
              <%-- 이미지 div --%>
             </div>
             <div class="writting-item-head-inner-cont-hs">
              <div class="writting-item-head-inner-cont-head">
               <p>캐나다의 밤은 서울보다 조용히 흐른다.</p>
              </div>
              <div class="writting-item-head-inner-cont-sub">
               <span>중국 회사에서 인턴을 하며 알게 된 프랑스 친구와 파리에서 3년 만에 만나 이야기를</span>
              </div>
             </div>
             <div class="writting-item-head-inner-cont-bottom">
              <span>by 글쓴이</span>
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
       <img src="./resources/img/writepage_icon/prev_btn.png" alt="왼쪽스크롤버튼"/>
      </a>
      <a href="javascript:;" id="recom_writting-cont-slideright" class="slide-right" onclick="scrollmove('recom_writting-cont','slideright');"
      	style="visibility:visible;">
       <img src="./resources/img/writepage_icon/next_btn.png" alt="오른쪽스크롤버튼"/>
      </a>     
    </div>   
   </div>
    
   <%-- 메인-추천 작가 초록--%>
   <div id="recom_author">
    <div class="main-title-text">
     <h3>추천 작가</h3>
    </div>
    <div id="recom_author-cont">
     <ul id="recom_author-list">

	  <c:forEach begin="1" end="9" step="1">
	  <li class="recom_author-item">
	   <div class="recom_author-item-inner">
	   	<a href="./profile" class="recom_author-item-link">
		 <div class="recom_author-item-intro">
		  <strong>김지아</strong>
		  <span class="recom-author-job">일상담소 강사</span>
		  <span class="recom-author-intro">일의 선택에 필요한 정보/경험을 상담으로 제공합니다. 자신을 빛내는 자소서 글쓰기, 진로 선택을 위한 취준/이직 상담, 워크숍을 주력으로 하고 있습니다.</span>
		 </div>	  
	   	 <div class="recom_author-item-img">
		  <img src="./resources/img/profile.jpg" alt="프로필 사진"/>
		 </div>
	   	</a>		  	
	    <div class="recom_author-keyword">
	     <button class="keyword1">취업</button>
	     <button class="keyword2">상담사</button>
	     <button class="keyword3">컨설턴트</button>
	    </div>
	   </div>
	  </li>
	  </c:forEach>
	  
     </ul>
    </div>
   </div>
   
   <div class="clear"></div>
   
   <%-- 메인-최신글 청록--%>
   <div id="recent_writting">
    <div class="main-title-text">
     <h3>최신 글</h3>
    </div>
    <div id="recent_writting-cont">
     <ul id="recent_writting-list">

	 <c:forEach begin="1" end="20" step="1">
     <li>
       <div class="recent_writting-item">
        <a href="./read" class="link_item">
         <div class="recent_writting-item-head">
          <div class="recent_writting-item-head-inner">
           <div class="recent_writting-item-head-inner-cont">
            <div class="recent_writting-item-head-inner-cont-img">
             <%-- 이미지 div --%>
            </div>
            <div class="recent_writting-item-head-inner-cont-hs">
             <div class="recent_writting-item-head-inner-cont-head">
              <p>캐나다의 밤은 서울보다 조용히 흐른다.</p>
             </div>
             <div class="recent_writting-item-head-inner-cont-sub">
              <span>중국 회사에서 인턴을 하며 알게 된 프랑스 친구와 파리에서 3년 만에 만나 이야기를</span>
             </div>
            </div>
            <div class="recent_writting-item-head-inner-cont-bottom">
             <span>by 글쓴이</span>
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
     <a href="javascript:;" id="recent_writting-cont-slideleft" class="slide-left" onclick="scrollmove('recent_writting-cont','slideleft');"
      style="visibility:hidden;">
      <img src="./resources/img/writepage_icon/prev_btn.png" alt="왼쪽스크롤버튼"/>
     </a>
     <a href="javascript:;" id="recent_writting-cont-slideright" class="slide-right" onclick="scrollmove('recent_writting-cont','slideright');"
     	style="visibility:visible;">
      <img src="./resources/img/writepage_icon/next_btn.png" alt="오른쪽스크롤버튼"/>
     </a>     
    </div>
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
       <li class="foot-inner-menu-item"><a href="#">공지사항</a></li>
       <li class="foot-inner-menu-item"><a href="#">자몽 이용안내</a></li>
       <li class="foot-inner-menu-item"><a onclick="offerToggle();">작가신청</a></li>
       <li class="foot-inner-menu-item"><a href="./inquire">고객센터</a></li>
       <li class="foot-inner-menu-item"><a href="./policy_terms">이용약관</a></li>
       <li class="foot-inner-menu-item"><a href="./policy_privacy">개인정보 처리방침</a></li>
      </ul>
     </div>
     <div id="foot-inner-sns">
      <ul id="foot-inner-sns-list">
       <li class="foot-inner-sns-item">
        <a class="foot-inner-sns-link" href="http://www.facebook.com" target="_blank">
         <img class="foot-inner-sns-img" src="./resources/img/footer/facebook.png" alt="페이스북"/>
        </a>
       </li>
       <li class="foot-inner-sns-item">
        <a class="foot-inner-sns-link" href="https://www.instagram.com" target="_blank">
         <img class="foot-inner-sns-img" src="./resources/img/footer/instagram.png" alt="인스타그램"/>
        </a>
       </li>
       <li class="foot-inner-sns-item">
        <a class="foot-inner-sns-link" href="http://www.twitter.com" target="_blank">
         <img class="foot-inner-sns-img" src="./resources/img/footer/twitter.png" alt="트위터"/>
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