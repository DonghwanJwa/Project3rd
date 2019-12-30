<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/feed.css" />
<script type="text/javascript" src="/jamong.com/resources/js/feed.js"></script>

<div id="feed_wrap">
 <div id="feed_menu"><%-- 피드 메뉴버튼 --%>
  <div id="feed_menu_type">
   <input type="button" id="feed_type_new" class="feed_type_btn view" value="새소식">
   <input type="button" id="feed_type_scrap" class="feed_type_btn" value="스크랩">
  </div>
 </div>
 
 <div class="clear"></div>
 
 <div id="feed_main_wrap">
  <div id="feed_new_wrap" class="feed_main_cont_wrap"><%-- 피드 새소식 --%><%-- display:show --%>
  
  <%-- 새글 보여주기 양식 --%>
   <c:if test="${empty fList}">
    <h2>알림이 없습니다!</h2>
   </c:if>
  <c:forEach var="fList" items="${fList}">
   <c:if test="${!empty fList}">
   <c:if test="${fList.feed_state == 0}">
   <c:if test="${fList.feed_step == 1}">
   <div class="feed_new_cont_article" onmouseover="FeedMouseUp(event);" 
    onmouseleave="FeedMouseOut(event)" data-no="${fList.feed_no}" >
    <a href="/jamong.com/@${fList.feed_mem_id}/${fList.feed_bo_no}">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="${fList.memberVO.profile_photo}"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	${fList.memberVO.mem_nickname}님의 새 게시글이 등록되었습니다.
      </div>
      <div class="feed_new_icon">N</div>
      <div class="feed_new_cont_time">
      	${fList.feed_date}
      </div>
     </div>
    </a>
   </div>
   </c:if>
   <c:if test="${fList.feed_step == 2}">
    <div class="feed_new_cont_article" onmouseover="FeedMouseUp(event);" 
    onmouseleave="FeedMouseOut(event)" data-no="${fList.feed_no}" >
    <a href="/jamong.com/@${fList.feed_mem_id}/${fList.feed_bo_no}">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="${fList.memberVO.profile_photo}"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	${fList.memberVO.mem_nickname}님이 회원님의 게시글에 댓글을 등록하셨습니다.
      </div>
      <div class="feed_new_icon">N</div>
      <div class="feed_new_cont_time">
      	${fList.feed_date}
      </div>
     </div>
    </a>
   </div>
   </c:if>
   <c:if test="${fList.feed_step == 3}">
    <div class="feed_new_cont_article" onmouseover="FeedMouseUp(event);" 
    onmouseleave="FeedMouseOut(event)" data-no="${fList.feed_no}" >
    <a href="/jamong.com/@${fList.feed_mem_id}/${fList.feed_bo_no}">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="${fList.memberVO.profile_photo}" />
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	${fList.memberVO.mem_nickname}님이 회원님의 댓글에 답글을 등록하셨습니다.
      </div>
      <div class="feed_new_icon">N</div>
      <div class="feed_new_cont_time">
      	${fList.feed_date}
      </div>
     </div>
    </a>
   </div>
   </c:if>
   <c:if test="${fList.feed_step == 4}">
     <div class="feed_new_cont_article" onmouseover="FeedMouseUp(event);" 
    onmouseleave="FeedMouseOut(event)" data-no="${fList.feed_no}" >
    <a>
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="/jamong.com/resources/img/logo.png"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	문의사항에 대한 답변이 고객님의 메일로 전송되었습니다.
      </div>
      <div class="feed_new_icon">N</div>
      <div class="feed_new_cont_time">
      	${fList.feed_date}
      </div>
     </div>
    </a>
   </div>
   </c:if>
   <c:if test="${fList.feed_step == 5}">
      <div class="feed_new_cont_article" onmouseover="FeedMouseUp(event);" 
    onmouseleave="FeedMouseOut(event)" data-no="${fList.feed_no}" >
    <a>
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="/jamong.com/resources/img/logo.png"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	작가님의 작가신청 결과가 메일로 전송되었습니다.
      </div>
      <div class="feed_new_icon">N</div>
      <div class="feed_new_cont_time">
      	${fList.feed_date}
      </div>
     </div>
    </a>
   </div>
   </c:if>
   <c:if test="${fList.feed_step == 6}">
    <div class="feed_new_cont_article" onmouseover="FeedMouseUp(event);" 
    onmouseleave="FeedMouseOut(event)" data-no="${fList.feed_no}" >
    <a href="/jamong.com/book/@${fList.feed_mem_id}/${fList.feed_book_no}">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="${fList.memberVO.profile_photo}"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	${fList.memberVO.mem_nickname}님의 새 책이 발간되었습니다.
      </div>
      <div class="feed_new_icon">N</div>
      <div class="feed_new_cont_time">
      	${fList.feed_date}
      </div>
     </div>
    </a>
   </div>
   </c:if>
   <c:if test="${fList.feed_step == 7}">
    <div class="feed_new_cont_article" onmouseover="FeedMouseUp(event);" 
    onmouseleave="FeedMouseOut(event)" data-no="${fList.feed_no}" >
    <a>
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="/jamong.com/resources/img/logo.png"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	작가님이 등록하신 메일로 제안 메일이 전송되었습니다.
      </div>
      <div class="feed_new_icon">N</div>
      <div class="feed_new_cont_time">
      	${fList.feed_date}
      </div>
     </div>
    </a>
   </div>
   </c:if>
   </c:if>
   <c:if test="${fList.feed_state == 1}">
   <c:if test="${fList.feed_step == 1}">
   <div class="feed_new_cont_article" onmouseover="FeedMouseOn(event);" 
    onmouseleave="FeedMouseOut(event)">
    <a href="/jamong.com/@${fList.feed_mem_id}/${fList.feed_bo_no}">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="${fList.memberVO.profile_photo}"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	${fList.memberVO.mem_nickname}님의 새 게시글이 등록되었습니다.
      </div>
      <div class="feed_new_cont_time">
      	${fList.feed_date}
      </div>
     </div>
    </a>
   </div>
   </c:if>
   <c:if test="${fList.feed_step == 2}">
    <div class="feed_new_cont_article" onmouseover="FeedMouseOn(event);" 
    onmouseleave="FeedMouseOut(event)">
    <a href="/jamong.com/@${fList.feed_mem_id}/${fList.feed_bo_no}">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="${fList.memberVO.profile_photo}"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	${fList.memberVO.mem_nickname}님이 회원님의 게시글에 댓글을 등록하셨습니다.
      </div>
      <div class="feed_new_cont_time">
      	${fList.feed_date}
      </div>
     </div>
    </a>
   </div>
   </c:if>
   <c:if test="${fList.feed_step == 3}">
    <div class="feed_new_cont_article" onmouseover="FeedMouseOn(event);" 
    onmouseleave="FeedMouseOut(event)">
    <a href="/jamong.com/@${fList.feed_mem_id}/${fList.feed_bo_no}">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="${fList.memberVO.profile_photo}" />
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	${fList.memberVO.mem_nickname}님이 회원님의 댓글에 답글을 등록하셨습니다.
      </div>
      <div class="feed_new_cont_time">
      	${fList.feed_date}
      </div>
     </div>
    </a>
   </div>
   </c:if>
   <c:if test="${fList.feed_step == 4}">
     <div class="feed_new_cont_article" onmouseover="FeedMouseOn(event);" 
    onmouseleave="FeedMouseOut(event)">
    <a>
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="/jamong.com/resources/img/logo.png"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	문의사항에 대한 답변이 고객님의 메일로 전송되었습니다.
      </div>
      <div class="feed_new_cont_time">
      	${fList.feed_date}
      </div>
     </div>
    </a>
   </div>
   </c:if>
   <c:if test="${fList.feed_step == 5}">
     <div class="feed_new_cont_article" onmouseover="FeedMouseOn(event);" 
    onmouseleave="FeedMouseOut(event)">
    <a>
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="/jamong.com/resources/img/logo.png"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	작가님의 작가신청 결과가 메일로 전송되었습니다.
      </div>
      <div class="feed_new_cont_time">
      	${fList.feed_date}
      </div>
     </div>
    </a>
   </div>
   </c:if>
   <c:if test="${fList.feed_step == 6}">
    <div class="feed_new_cont_article" onmouseover="FeedMouseOn(event);" 
    onmouseleave="FeedMouseOut(event)">
    <a href="/jamong.com/book/@${fList.feed_mem_id}/${fList.feed_book_no}">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="${fList.memberVO.profile_photo}"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	${fList.memberVO.mem_nickname}님의 새 책이 발간되었습니다.
      </div>
      <div class="feed_new_cont_time">
      	${fList.feed_date}
      </div>
     </div>
    </a>
   </div>
   </c:if>
   <c:if test="${fList.feed_step == 7}">
    <div class="feed_new_cont_article" onmouseover="FeedMouseOn(event);" 
    onmouseleave="FeedMouseOut(event)">
    <a>
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="/jamong.com/resources/img/logo.png"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	작가님이 등록하신 메일로 제안 메일이 전송되었습니다.
      </div>
      <div class="feed_new_cont_time">
      	${fList.feed_date}
      </div>
     </div>
    </a>
   </div>
   </c:if>
   </c:if>
   </c:if>
   </c:forEach>
   </div>
 
  <div id="feed_scrap_wrap" class="feed_main_cont_wrap"><%-- 피드 스크랩 --%><%-- display:none --%>
   
   <div id="feed_scrap_toggle">
    <button type="button" id="feed_btn_article" class="feed_toggle_btn" style="background-color:">내가 공감한 글</button>
    <button type="button" id="feed_btn_book" class="feed_toggle_btn">내가 추천한 책</button>
   </div>
   
   <div id="feed_scrap_article" style="display:block;">
    <c:forEach var="art" items="${aList}">
    <c:if test="${!empty art}">
    <div class="feed_scrap_inner">
     <a class="feed_scrap_link" href="/jamong.com/@${art.memberVO.mem_id}/${art.boardVO.bo_no}">
      <div class="feed_scrap_img_container">
       <img class="feed_scrap_img" src="${art.boardVO.bo_thumbnail}" alt="그림 안나옴">
      </div>
      <div class="feed_scrap_cont">
       <div class="feed_scrap_type">Article</div>
       <div class="feed_scrap_title">${art.boardVO.bo_title}</div>
       <div class="feed_scrap_author">by ${art.memberVO.mem_nickname}</div>
       <div class="feed_scrap_date">${art.sym_date}</div>
      </div>
     </a>
     <div class="feed_scrap_like_outer">
      <button class="feed_scrap_like_inner">
       <img class="feed_scrap_like_img" src="/jamong.com/resources/img/heart.png"/>
      </button>
     </div>
     </div>
    </c:if>
    <c:if test="${empty art}">
    
    </c:if>
    </c:forEach>   
   </div>
    
   <div id="feed_scrap_book" style="display:none;">
   <c:forEach var="book" items="${bList}">
   <c:if test="${!empty book}">
    <div class="feed_scrap_inner">
     <a class="feed_scrap_link" href="/jamong.com/book/@${book.memberVO.mem_id}/${book.bookVO.book_no}">
      <div class="feed_scrap_img_container">
       <img class="feed_scrap_img" src="${book.bookVO.book_cover}"/>
      </div>
      <div class="feed_scrap_cont">
       <div class="feed_scrap_type">Book</div>
       <div class="feed_scrap_title">${book.bookVO.book_name}</div>
       <div class="feed_scrap_author">by ${book.memberVO.mem_nickname}</div>
       <div class="feed_scrap_date">${book.rec_date}</div>
      </div>
     </a>
     <div class="feed_scrap_like_outer">
      <button class="feed_scrap_like_inner">
       <img class="feed_scrap_like_img" src="/jamong.com/resources/img/heart.png"/>
      </button>
     </div>
    </div>
    </c:if>
    <c:if test="${empty book}">
    
    </c:if>
    </c:forEach> 
   </div>
   
 
  </div><%-- feed_scrap_wrap --%>
 </div><%-- feed_main_wrap --%>
</div>

<%@ include file="../include/footer.jsp" %>