<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/new_posts.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/new_post.css" />

<div class="wrap-loading" style="display: none">
 <div>
  <img src="${pageContext.request.contextPath}/resources/img/loading1.gif" />
 </div>
</div>

<div id="new_post_title">RECENT POST</div>

<div id="new_post_maintt">
 <div id="new_post_contents">

  <%-- 최신 책 로드 --%>
  <div id="new_post_loading">
   <ul id="new_post_list">
    <c:forEach var="b" items="${bList}">
     <c:set var="img" value="${b.bo_thumbnail}" />
     <li class="scrolling" data-no="${b.bo_no}">
      <div id="new_post_loading_cont">
       <div id="new_post_loading_cont_text">
        <div class="new_post_cont_catbook">
         <a href="${pageContext.request.contextPath}/category/${b.cat_name}" class="new_post_cont_cat">${b.cat_name}</a>
         <c:if test="${b.book_no ne 0}">
          <span class="new_post_cont_book">Book</span>
         </c:if>
        </div>
        <a href="${pageContext.request.contextPath}/@${b.memberVO.mem_id}/${b.bo_no}">
         <div id="new_post_loading_cont_text_title">
          <c:if test="${fn:length(b.bo_title)>22}">
          ${fn:substring(b.bo_title,0,22)}...
         </c:if>
          <c:if test="${fn:length(b.bo_title)<=22}">
          ${b.bo_title}
         </c:if>
         </div>
         <div id="new_post_loading_cont_text_cont" <c:if test="${!empty img}"></c:if>
          <c:if test="${empty img}">
          class="new_post_no_img_cont"
          </c:if>
         >
          <c:if test="${fn:length(b.bo_cont)>100}">
          ${fn:substring(b.bo_cont,0,100)}...
         </c:if>
          <c:if test="${fn:length(b.bo_cont)<=100}">
          ${b.bo_cont}
         </c:if>
         </div>
        </a> <a href="${pageContext.request.contextPath}/@${b.memberVO.mem_id}">
         <div id="new_post_loading_cont_text_writer">
          <i>by&nbsp;&nbsp;</i>${b.memberVO.mem_nickname}
         </div>
        </a> &nbsp;&nbsp;
        <div id="new_post_loading_cont_text_ago">${b.bo_date}</div>
       </div>
       <c:if test="${not empty img}">
        <a href="${pageContext.request.contextPath}/@${b.memberVO.mem_id}/${b.bo_no}">
        <img id="new_post_loading_cont_img" src="${b.bo_thumbnail}">
        </a>
       </c:if>
      </div>
     </li>
    </c:forEach>
   </ul>
  </div>
 </div>

</div>
<%@ include file="../include/footer.jsp"%>
