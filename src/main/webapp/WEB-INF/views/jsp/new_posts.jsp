<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>

<script src="./resources/js/new_book.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/new_post.css" />

<div id="new_post_title">최신 글</div>

<div id="new_post_maintt">
 <div id="new_post_contents">

  <%-- 최신 책 로드 --%>
  <div id="new_post_loading">
   <ul id="new_post_list">
    <c:forEach var="b" items="${bList}">
     <li class="scrolling" data-no="${b.bo_no}"><a href="./read">
       <div id="new_post_loading_cont">
        <c:set var="img" value="${b.bo_thumbnail}"/>
        <c:if test="${not empty img}">
        <img id="new_post_loading_cont_img" src="${b.bo_thumbnail}">
        </c:if>
        <c:if test="${empty img}">
        <div id='new_post_loading_cont_img'></div>
        </c:if>
        <div id="new_post_loading_cont_text">
         <div id="new_post_loading_cont_text_title">${b.bo_title}</div>
         <div id="new_post_loading_cont_text_cont">${b.bo_cont}</div>
         <div id="new_post_loading_cont_text_writer">
          <i>by</i> ${m.mem_nickname}
         </div>
         <div id="new_post_loading_cont_text_tag">
          <span>${m.mem_keyword}</span>
         </div>
         <div id="new_post_loading_cont_text_ago">${b.bo_date}</div>
        </div>
       </div>
     </a></li>
    </c:forEach>
   </ul>
  </div>

 </div>
</div>
<%@ include file="../include/footer.jsp"%>
