<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script src="${pageContext.request.contextPath}/resources/js/new_book.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/new_book.css">

<%-- 상단 슬라이드 배너 --%>
<section class="new_book_list_banner">
 <div class="new_book_banner" style="display: block;">

<%-- 상단 배너 forEach로 랜덤한 5개 띄우기 --%>
<c:forEach var="bkBanner" items="${bkList}" varStatus="status">
<div id="new_book_banner_item${status.count}" class="item_banner showing" 
<c:choose>
<c:when test="${status.count eq 1}"> style="background-color: #ef844f; top: 0px;" </c:when>
<c:when test="${status.count eq 2}"> style="background-color: #388e80; top: 400px;" </c:when>
<c:when test="${status.count eq 3}"> style="background-color: #ea6262; top: 400px;" </c:when>
<c:when test="${status.count eq 4}"> style="background-color: #ad90fb; top: 400px;" </c:when>
<c:when test="${status.count eq 5}"> style="background-color: #005365; top: 400px;" </c:when>
</c:choose>
>
   <a target="_blank" href="${pageContext.request.contextPath}/book/@${bkBanner.memberVO.mem_id}/${bkBanner.bookVO.book_no}">
    <div class="new_book_banner_book">
     <div class="new_book_banner_book_info">
      <p class="text_banner_book_title">
       <span>${bkBanner.bookVO.book_name}</span>
      </p>
      <p class="text_banner_edit_desc">
          ${bkBanner.bookVO.book_preface}
      </p>
      <div class="text_banner_author">
       <img src="${bkBanner.memberVO.profile_photo}">
       <div class="text_banner_author_desc">
        <p class="text_banner_author_user">${bkBanner.memberVO.mem_nickname}</p>
        <span class="publisher_name">자몽북(jamongbook)</span>
        <span>&nbsp;/&nbsp;</span>
        <span class="text_banner_prize">자몽 선정 대상 수장작품</span>
       </div>
      </div>
     </div>
     <div class="new_book_banner_book_image_container">
      <div class="new_book_banner_book_image">
       <div class="book_image">
       <div class="border_left"></div>
       <c:if test="${!empty bkBanner.bookVO.book_cover}">
        <img src="${bkBanner.bookVO.book_cover}" alt="책 커버 이미지">
       </c:if>
       <c:if test="${empty bkBanner.bookVO.book_cover}">
        <img src="${pageContext.request.contextPath}/resources/img/book_cover.jpg" alt="책 커버 이미지">
       </c:if>
      <div class="new_book_banner_book_cont">
       <div class="new_book_banner_book_cont_top">
        <strong>${bkBanner.bookVO.book_name}</strong>
        <i>by&nbsp;${bkBanner.memberVO.mem_nickname}</i>
       </div>
       <div class="new_book_banner_book_cont_bottom">
        <span>Jamong Book</span>
       </div>
      </div>
       </div>
      </div>
     </div>
    </div>
   </a>
  </div>
  </c:forEach>
  
 </div>

 <div class="new_book_inner_banner">
  <span class="new_book_inner_page" style="top: 118px;">
   <span class="page1 page_no showing"></span>
   <span class="page2 page_no"></span>
   <span class="page3 page_no"></span>
   <span class="page4 page_no"></span>
   <span class="page5 page_no"></span>
  </span>
 </div>
</section>

<%-- 최신 책 리스트 --%>
<section class="new_book_list_work">
 <div class="new_book_inner_list_work">
  <div class="new_book_list_work_title">
   <span class="title">자몽의 최신 책들</span>
<!--    <span class="new_book_list_page"> -->
<!--     <span id="all" class="page_type visible" data-grade="all">전체</span> -->
<!--     <span id="column" class="page_type" data-grade="column">컬럼</span> -->
<!--     <span id="essay" class="page_type" data-grade="essay">에세이</span> -->
<!--    </span> -->
   <span class="sub_title">JaMong-Book Project</span>
  </div>
  <div class="new_book_list_item" id="new_book_list">
   <ul id="gradeItemList_all" style="width: 21840px;" class="slide_work_list visible" data-page="1">
    <c:forEach var="book" items="${bookList}">
     <li class="item_work <%-- open --%>" data-no="${book.book_no}">
      <div class="new_book_item_work_cover">
       <div class="border_left"></div>
      <c:set var="img" value="${book.bookVO.book_cover}" />
      <c:if test="${!empty img}">
       <img class="img_cover" src="${book.bookVO.book_cover}">
      </c:if>
      <c:if test="${empty img}">
       <img class="img_cover" src="${pageContext.request.contextPath}/resources/img/book_cover.jpg">
      </c:if>
       <div class="item_work_book_cont">
        <div class="item_work_book_cont_top">
         <strong>${book.bookVO.book_name}</strong>
        </div>
        <div class="item_work_book_cont_bottom">
         <span>Jamong Book</span>
        </div>
       </div>
      </div>
      <p class="title">${book.bookVO.book_name}</p>
      <p class="author">
       <span class="by">by</span>
       &nbsp;
       <a target="_blank" href="#">"${book.memberVO.mem_nickname}"</a>
      </p>
      <span class="open_marker"></span>
     </li>
    </c:forEach>
   </ul>
  </div>
 </div>
 <button type="button" data-grade="all" class="btnMoveWorkSlide btn_move_slide prev on"></button>
 <button type="button" data-grade="all" class="btnMoveWorkSlide btn_move_slide next on"></button>
</section>

<%-- section open --%>
<section class="new_book_info <%-- open --%>">
<%-- ajax로 출력 할 부분 --%>

 <%-- ajax로 출력 할 부분 --%>
</section>

<%@ include file="../include/footer.jsp"%>