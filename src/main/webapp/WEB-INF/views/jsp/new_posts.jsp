<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script src="/jamong.com/resources/js/jquery-ui.min.js"></script>
<script src="/jamong.com/resources/js/new_posts.js"></script>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/new_post.css" />

  <div class="wrap-loading" style="display:none">
      <div>
       <img src="./resources/img/loading1.gif" />
      </div>
  </div>

<div id="new_post_title">최신 글</div>

<div id="new_post_maintt">
 <div id="new_post_contents">

  <%-- 최신 책 로드 --%>
  <div id="new_post_loading">
   <ul id="new_post_list">
    <c:forEach var="b" items="${bList}">
     <li class="scrolling" data-no="${b.bo_no}"><a href="/jamong.com/@${b.memberVO.mem_id}/${b.bo_no}">
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
          <i>by</i> ${b.memberVO.mem_nickname}
         </div>
         <div id="new_post_loading_cont_text_tag">
          <span>${b.memberVO.mem_keyword}</span>
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
