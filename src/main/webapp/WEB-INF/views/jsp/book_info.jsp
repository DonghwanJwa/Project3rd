<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/book_info.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book_info.css"/>
<div id="book_info_wrap">
 <div id="book_info_base">
  <div id="book_info_about">
  
   <div id="book_info_cover" class="book_info_about_div">
   <c:set var="book_cover" value="${book_cover}"/>
    <c:if test="${!empty book_cover}">
    <img id="book_info_cover_img" src="${book_cover}">
    </c:if>
    <c:if test="${empty book_cover}">
    <img id="book_info_cover_img" src="${pageContext.request.contextPath}/resources/img/book_cover.jpg">
    </c:if>
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
       <img id="book_info_intro_like_img" src="${pageContext.request.contextPath}/resources/img/heart.png"/>
      </button>
      <span class="book_info_intro_like_num">${book_recommend}</span>
     </div>
     <strong id="book_info_intro_title">자몽 책 소개</strong>
     <p id="book_info_intro_cont">
     	${book_preface}
     </p>
    </div>
   </div>
   
   <div id="book_info_author" class="book_info_about_div">
    <a id="book_info_author_wrap" href="${pageContext.request.contextPath}/@${mem_id}">
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
     <a href="${pageContext.request.contextPath}/@${bk.memberVO.mem_id}/${bk.bo_no}" class="book_info_article_link">
      <div class="book_info_article_num">
	   <em class="book_info_num_txt">${bs.count}</em>
      </div>
      <div class="book_info_article_cont">
       <strong class="book_info_article_head">${bk.bo_title}</strong>
       <span class="book_info_article_main 
       <c:if test="${empty bk.bo_thumbnail}">
        book_info_no_img
       </c:if>
       
       ">
       ${bk.bo_cont}
       </span>
       <em class="book_info_time">${bk.bo_date}</em>
      </div>
      <c:if test="${! empty bk.bo_thumbnail}">
      <div class="book_info_article_img">
       <img src="${bk.bo_thumbnail}">
      </div>
      </c:if>
     </a>
    </div>
    </c:forEach>
   </div>
  </div>
  
 </div>
</div>
<%@ include file="../include/footer.jsp" %>