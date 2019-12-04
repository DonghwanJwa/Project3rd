<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="./resources/css/search_result.css" />
<script src="./resources/js/search.js"></script>

<%-- 검색페이지 header --%>
<div id="search_header">
 <input id="search_keyword" placeholder="검색어 입력">
 <div id="search_type">
  <input type="button" id="search_type_btn_post" class="btn type_btn" value="글">
  <input type="button" id="search_type_btn_work" class="btn type_btn" value="작품">
  <input type="button" id="search_type_btn_author" class="btn type_btn author" value="작가">
 </div>
</div>

<div id="search_result_contents">

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
       <img id="search_result_author_profile_img" src="./resources/img/profile.jpg" alt="프로필 사진">
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

</div>
<jsp:include page="../include/footer.jsp"></jsp:include>