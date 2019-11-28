<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="../resources/css/feed.css" />
<script type="text/javascript" src="../resources/js/feed.js"></script>

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
   <div class="feed_new_cont_article">
    <a href="./read">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="../resources/img/cat_writer_face1.jpg"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	정다정 작가님의 새 글이 발행되었습니다.
      </div>
      <div class="feed_new_cont_time">
      	1분 전
      </div>
     </div>
    </a>
   </div>
   <div class="feed_new_cont_article">
    <a href="./read">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="../resources/img/cat_writer_face2.jpg"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	홍끼 작가님의 새 글이 발행되었습니다.
      </div>
      <div class="feed_new_cont_time">
      	1시간 전
      </div>
     </div>
    </a>
   </div>
   <div class="feed_new_cont_article">
    <a href="#">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="../resources/img/profile_logout.png"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	문의사항에 대한 답변이 고객님의 메일로 전송되었습니다.
      </div>
      <div class="feed_new_cont_time">
      	4시간 전
      </div>
     </div>
    </a>
   </div>
   <div class="feed_new_cont_article">
    <a href="./read">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img no_img"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	작가님의 글에 댓글이 달렸습니다.
      </div>
      <div class="feed_new_cont_time">
      	12시간 전
      </div>
     </div>
    </a>
   </div>
   <div class="feed_new_cont_article">
    <a href="./read">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img no_img" />
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	작가님의 댓글에 답글이 달렸습니다.
      </div>
      <div class="feed_new_cont_time">
      	12시간 전
      </div>
     </div>
    </a>
   </div>
   <div class="feed_new_cont_article">
    <a href="./book_info">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="../resources/img/cat_writer_face4.jpg"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	워킹데드 작가님의 새 책이 발간되었습니다.
      </div>
      <div class="feed_new_cont_time">
      	1주 전
      </div>
     </div>
    </a>
   </div>
   <div class="feed_new_cont_article">
    <a href="./read">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="../resources/img/cat_writer_face1.jpg"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	정다정 작가님의 새 글이 발행되었습니다.
      </div>
      <div class="feed_new_cont_time">
      	1분 전
      </div>
     </div>
    </a>
   </div>
   <div class="feed_new_cont_article">
    <a href="#">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="../resources/img/cat_writer_face2.jpg"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	홍끼 작가님의 새 글이 발행되었습니다.
      </div>
      <div class="feed_new_cont_time">
      	1시간 전
      </div>
     </div>
    </a>
   </div>
   <div class="feed_new_cont_article">
    <a href="#">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="../resources/img/profile_logout.png"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	문의사항에 대한 답변이 고객님의 메일로 전송되었습니다.
      </div>
      <div class="feed_new_cont_time">
      	4시간 전
      </div>
     </div>
    </a>
   </div>
   <div class="feed_new_cont_article">
    <a href="./read">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img no_img"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	작가님의 글에 댓글이 달렸습니다.
      </div>
      <div class="feed_new_cont_time">
      	12시간 전
      </div>
     </div>
    </a>
   </div>
   <div class="feed_new_cont_article">
    <a href="./read">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img no_img" />
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	작가님의 댓글에 답글이 달렸습니다.
      </div>
      <div class="feed_new_cont_time">
      	12시간 전
      </div>
     </div>
    </a>
   </div>
   <div class="feed_new_cont_article">
    <a href="./book">
     <div class="feed_new_cont_profile">
      <img class="feed_new_cont_profile_img" src="../resources/img/cat_writer_face4.jpg"/>
     </div>
     <div class="feed_new_cont_text">
      <div class="feed_new_cont_message">
       	워킹데드 작가님의 새 책이 발간되었습니다.
      </div>
      <div class="feed_new_cont_time">
      	1주 전
      </div>
     </div>
    </a>
   </div>
  </div><%-- feed_new_wrap --%>
 
  <div id="feed_scrap_wrap" class="feed_main_cont_wrap"><%-- 피드 스크랩 --%><%-- display:none --%>
   
   <div class="feed_scrap_inner">
    <a class="feed_scrap_link" href="./read">
     <div class="feed_scrap_img_container">
      <img class="feed_scrap_img" src="../resources/img/a.jpg" alt="그림 안나옴">
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
      <img class="feed_scrap_like_img" src="../resources/img/heart.png"/>
     </button>
    </div>
   </div>
   
   <div class="feed_scrap_inner">
    <a class="feed_scrap_link" href="./book">
     <div class="feed_scrap_img_container">
      <img class="feed_scrap_img" src="../resources/img/book_img.jpg"/>
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
      <img class="feed_scrap_like_img" src="../resources/img/heart.png"/>
     </button>
    </div>
   </div>
 
   <div class="feed_scrap_inner">
    <a class="feed_scrap_link" href="./read">
     <div class="feed_scrap_img_container">
      <img class="feed_scrap_img" src="../resources/img/a.jpg" alt="그림 안나옴">
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
      <img class="feed_scrap_like_img" src="../resources/heart"/>
     </button>
    </div>
   </div>
   
   <div class="feed_scrap_inner">
    <a class="feed_scrap_link" href="./read">
     <div class="feed_scrap_img_container">
      <img class="feed_scrap_img" src="../resources/img/a.jpg" alt="그림 안나옴">
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
      <img class="feed_scrap_like_img" src="../resources/img/heart.png"/>
     </button>
    </div>
   </div>
 
  </div><%-- feed_scrap_wrap --%>
 </div><%-- feed_main_wrap --%>
</div>

<%@ include file="../include/footer.jsp" %>