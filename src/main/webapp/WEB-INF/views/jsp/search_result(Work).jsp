<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="./resources/css/search_result.css" />
<script src="./resources/js/search.js"></script>

<%-- 검색페이지 header --%>
<div id="search_header">
 <input id="search_keyword" placeholder="검색어 입력">
 <div id="search_type">
  <input type="button" id="search_type_btn_post" class="btn type_btn" value="글">
  <input type="button" id="search_type_btn_work" class="btn type_btn work" value="작품">
  <input type="button" id="search_type_btn_author" class="btn type_btn" value="작가">
 </div>
</div>

<div id="search_result_contents">

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
    <img id="work_img" src="./resources/img/b.jpg" alt="책 표지인데 안나옴;">
    <div class="work_cont_view">
     <div class="work_cont_view_top">
      <strong>강아지와 지내는건 어때?</strong>
      <span>by 멍뭉이</span>
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

</div>
<jsp:include page="../include/footer.jsp"></jsp:include>