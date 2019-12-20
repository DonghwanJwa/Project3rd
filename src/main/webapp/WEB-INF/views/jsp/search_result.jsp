<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/search_result.css" />
<script src="/jamong.com/resources/js/search.js"></script>

<%-- 검색페이지 header --%>
<div id="search_header">
 <input id="search_keyword" placeholder="검색어 입력" value="${q}">
 <div id="search_type">
  <input type="button" id="search_type_btn_post" class="btn type_btn view" value="글">
  <input type="button" id="search_type_btn_work" class="btn type_btn" value="작품">
  <input type="button" id="search_type_btn_author" class="btn type_btn" value="작가">
 </div>
</div>

<div id="search_result_contents">

 <%-- 검색 페이지 '글' 검색 결과 --%>
 <div id="search_result_post">

  <%-- 검색 결과 정렬기준 --%>
  <div id="search_result_post_type">
   <input type="button" id="btn_accuracy" class="btn" value="정확도">
   <input type="button" id="btn_new" class="btn non-select" value="최신">
  </div>

  <%-- 검색 결과 내용 --%>
  <div id="search_result_post_main">
   <ul id="search_result_post_list">
    <c:forEach var="b" items="${bList}">
     <li class="scrolling" data-no="${b.bo_no}"><a href="/jamong.com/@${b.memberVO.mem_id}/${b.bo_no}">
      <div class="post_cont">
       <div id="post_text">
        <div id="post_title">
        <c:if test="${fn:length(b.bo_title)>20}">
        ${fn:substring(b.bo_title,0,20)}...
        </c:if>
        <c:if test="${fn:length(b.bo_title)<20}">
        ${b.bo_title}
        </c:if>
        </div>
        <div id="post_cont">
        <c:if test="${fn:length(b.bo_cont)>100}">
         ${fn:substring(b.bo_cont,0,100)}...
        </c:if>
        <c:if test="${fn:length(b.bo_cont)<100}">
         ${b.bo_cont}
         </c:if>
        </div>
        <div id="post_writer"><i>by&nbsp;&nbsp;</i>${b.memberVO.mem_nickname}</div>
        <div id="post_tag">
         <span>${b.memberVO.mem_keyword}</span>
        </div>
        <div id="post_ago">${b.bo_date}</div>
       </div>
       <c:set var="img" value="${b.bo_thumbnail}" />
       <c:if test="${not empty img}">
        <img id="post_img" src="${b.bo_thumbnail}" alt="그림 안나옴">
       </c:if>
       <c:if test="${empty img}">
        <div id='post_img'></div>
       </c:if>
      </div>
     </a></li>
    </c:forEach>
   </ul>
  </div>
 </div>
 <%-- 글 검색 결과 --%>

 <%-- 검색 페이지 '작품' 검색 결과 --%>
 <div id="search_result_work">

  <%-- 검색 결과 정렬 기준 --%>
  <div id="search_result_work_type">
   <select id="search_result_work_select">
    <option value="all" selected>모든 작품</option>
    <option value="column">컬럼</option>
    <option value="essay">에세이</option>
   </select>
  </div>

  <%-- 검색 결과 내용 --%>
  <div id="search_result_work_main">
   <c:forEach begin="1" end="10" step="1">
    <a href="./book_info">
     <div class="work_cont">
      <img id="work_img" src="/jamong.com/resources/img/b.jpg" alt="책 표지인데 안나옴;">
      <div class="work_cont_view">
       <div class="work_cont_view_top">
        <strong>강아지와 지내는건 어때?</strong> <span>by 멍뭉이</span>
       </div>
       <div class="work_cont_view_bottom">
        <span>Jamong Book</span>
       </div>
      </div>
     </div>
    </a>
   </c:forEach>
  </div>
 </div>
 <%-- 작품 검색 결과 --%>

 <%-- 검색 페이지 '작가' 검색 결과 --%>
 <div id="search_result_author">

  <%-- 검색 결과 정렬 기준 --%>
  <div id="search_result_author_type">
   <select id="search_result_author_select">
    <option value="allAuthor" selected>모든 작가</option>
    <option value="authorCategory">작가 카테고리</option>
   </select>
  </div>

  <%-- 검색 결과 내용 --%>
  <div id="search_result_author_main">

   <div class="author_cont">
    <c:forEach begin="1" end="10" step="1">
     <a href="./profile">
      <div id="search_result_author_profile">
       <img id="search_result_author_profile_img" src="/jamong.com/resources/img/profile.jpg"
        alt="프로필 사진"
       >
       <div id="search_result_author_profile_info">
        <div id="search_result_author_name">김 누구누구</div>
        <div id="search_result_author_introduce">당신의 심리상태를 가장 정확하게 진단해주는 차세대....당신의 심리상태를 가장
         정확하게 진단해당신의 심리상태를 가장 정확하게 진단해 진단해당신의 심리상태를 가장 정확하게 진단해</div>
        <div id="search_result_author_tag">
         <span>태그1</span><span>태그2</span><span>태그3</span>
        </div>
       </div>
      </div>
     </a>
    </c:forEach>

   </div>

  </div>

 </div>
 <%-- 작가 검색 결과 --%>

</div>
<jsp:include page="../include/footer.jsp"></jsp:include>