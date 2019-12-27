<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="/jamong.com/resources/js/book_info.js"></script>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/book_info.css"/>
<div id="book_info_wrap">
 <div id="book_info_base">
  <div id="book_info_about">
  
   <div id="book_info_cover" class="book_info_about_div">
    <img id="book_info_cover_img" src="${book_cover}">
    <div id="book_info_cover_txt">
	 <div id="book_info_cover_head">
	  <strong id="book_info_cover_title">${book_name}</strong>
	  <span id="book_info_cover_author">by ${mem_nickname} </span>
	 </div>
	 <div id="book_info_cover_bot">
	  <span>Jamong Book</span>
	 </div>
    </div>
    <span id="book_info_cover_line"></span>
   </div>
   
   <div id="book_info_intro" class="book_info_about_div">
    <div id="book_info_intro_inner">
     <div id="book_info_intro_like">
      <button id="book_info_intro_like_inner">
       <img id="book_info_intro_like_img" src="/jamong.com/resources/img/heart.png"/>
      </button>
     </div>
     <strong id="book_info_intro_title">브런치북 소개</strong>
     <p id="book_info_intro_cont">
     	${book_preface}
     </p>
    </div>
   </div>
   
   <div id="book_info_author" class="book_info_about_div">
    <a id="book_info_author_wrap" href="./profile">
     <div id="book_info_author_head">
     
     </div>
  	 <div id="book_info_author_main">
  	  <span id="book_info_author_img">
  	   <img src="${profile_photo}">
  	  </span>
  	  <div id="book_info_author_desc">
  	   <strong id="book_info_author_name">${mem_nickname}</strong>
  	  </div>
  	  <div id="book_info_author_intro">
  	   <p id="book_info_author_intro_cont">
      ${profile_cont}
  	   </p>
  	  </div>
  	 </div>
    </a>
   </div>
   
  </div>
  
  <%-- 글 리스트 --%>
  <div id="book_info_article">
   <div id="book_info_article_inner">
   <c:forEach var="bk" items="${bkList}" varStatus="bs">
    <div class="book_info_article_list">
     <a href="/jamong.com/@${bk.memberVO.mem_id}/${bk.bo_no}" class="book_info_article_link">
      <div class="book_info_article_num">
	   <em class="book_info_num_txt">${bs.count}</em>
      </div>
      <div class="book_info_article_cont">
       <strong class="book_info_article_head">${bk.bo_title}</strong>
       <span class="book_info_article_main">
       ${bk.bo_cont}
       </span>
       <em class="book_info_time">${bk.bo_date}</em>
      </div>
      <div class="book_info_article_img">
       <img src="${bk.bo_thumbnail}">
      </div>
     </a>
    </div>
    </c:forEach>
   </div>
  </div>
  
 </div>
</div>
<%@ include file="../include/footer.jsp" %>