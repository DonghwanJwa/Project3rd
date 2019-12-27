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
    <a href="#">
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
    <a href="/jamong.com/read">
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
    <a href="/jamong.com/book/@${fList.memberVO.mem_id}/${fList.bookVO.book_no}">
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
    <a href="#">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="/jamong.com/resources/img/logo.png"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	작가님이 등록한 메일로 제안 메일이 발송되었습니다.
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
    <a href="#">
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
    <a href="/jamong.com/read">
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
    <a href="/jamong.com/book_info">
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
    <a href="#">
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
 
  <div id="feed_scrap_wrap" class="feed_main_cont_wrap"><%-- 피드 스크랩 --%><%-- display:none --%>
   
   <div class="feed_scrap_inner">
    <a class="feed_scrap_link" href="/jamong.com/read">
     <div class="feed_scrap_img_container">
      <img class="feed_scrap_img" src="/jamong.com/resources/img/a.jpg" alt="그림 안나옴">
     </div>
     <div class="feed_scrap_cont">
      <div class="feed_scrap_type">Article</div>
      <div class="feed_scrap_title">여기에 Article 제목이 출력됩니다.</div>
      <div class="feed_scrap_author">by 누구누구</div>
      <div class="feed_scrap_date">2019.10.30</div>
     </div>
    </a>
    <div class="feed_scrap_like_outer">
     <button class="feed_scrap_like_inner">
      <img class="feed_scrap_like_img" src="/jamong.com/resources/img/heart.png"/>
     </button>
    </div>
   </div>
   
   <div class="feed_scrap_inner">
    <a class="feed_scrap_link" href="/jamong.com/book">
     <div class="feed_scrap_img_container">
      <img class="feed_scrap_img" src="/jamong.com/resources/img/book_img.jpg"/>
     </div>
     <div class="feed_scrap_cont">
      <div class="feed_scrap_type">Book</div>
      <div class="feed_scrap_title">여기에 Book 제목이 출력됩니다.</div>
      <div class="feed_scrap_author">by 늬구늬구</div>
      <div class="feed_scrap_date">2019.11.01</div>
     </div>
    </a>
    <div class="feed_scrap_like_outer">
     <button class="feed_scrap_like_inner">
      <img class="feed_scrap_like_img" src="/jamong.com/resources/img/heart.png"/>
     </button>
    </div>
   </div>
 
   <div class="feed_scrap_inner">
    <a class="feed_scrap_link" href="/jamong.com/read">
     <div class="feed_scrap_img_container">
      <img class="feed_scrap_img" src="/jamong.com/resources/img/a.jpg" alt="그림 안나옴">
     </div>
     <div class="feed_scrap_cont">
      <div class="feed_scrap_type">Article</div>
      <div class="feed_scrap_title">여기에 Article 제목이 출력됩니다.</div>
      <div class="feed_scrap_author">by 누구누구</div>
      <div class="feed_scrap_date">2019.10.30</div>
     </div>
    </a>
    <div class="feed_scrap_like_outer">
     <button class="feed_scrap_like_inner">
      <img class="feed_scrap_like_img" src="/jamong.com/resources/img/heart.png"/>
     </button>
    </div>
   </div>
   
   <div class="feed_scrap_inner">
    <a class="feed_scrap_link" href="/jamong.com/read">
     <div class="feed_scrap_img_container">
      <img class="feed_scrap_img" src="/jamong.com/resources/img/a.jpg" alt="그림 안나옴">
     </div>
     <div class="feed_scrap_cont">
      <div class="feed_scrap_type">Article</div>
      <div class="feed_scrap_title">여기에 Article 제목이 출력됩니다.</div>
      <div class="feed_scrap_author">by 누구누구</div>
      <div class="feed_scrap_date">2019.10.30</div>
     </div>
    </a>
    <div class="feed_scrap_like_outer">
     <button class="feed_scrap_like_inner">
      <img class="feed_scrap_like_img" src="/jamong.com/resources/img/heart.png"/>
     </button>
    </div>
   </div>
 
  </div><%-- feed_scrap_wrap --%>
 </div><%-- feed_main_wrap --%>
</div>

<%@ include file="../include/footer.jsp" %>