<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="./resources/css/search_result.css" />
<script src="./resources/js/search.js"></script>

<%-- 검색페이지 header --%>
<div id="search_header">
 <input id="search_keyword" placeholder="검색어 입력">
 <div id="search_type">
  <input type="button" id="search_type_btn_post" class="btn type_btn post" value="글">
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

  <c:forEach begin="1" end="10" step="1">
   <a href="./read">
    <div class="post_cont">
     <img id="post_img" src="./resources/img/a.jpg" alt="그림 안나옴">
     <div id="post_text">
      <div id="post_title">여기에 제목이 출력</div>
      <div id="post_cont">이곳에 간단한 줄거리를 작성합니다. 글자 크기는 15px정도로 테스트 해보겠습니다.이곳에 간단한 줄거리를 작성합니다.
       글자 크기는 15px정도로 테스트 해보겠습니다.이곳에 간단한 줄거리를 작성합니다. 글자 크기는 15px정도로 테스트 해보겠습니다.</div>
       <div id="post_writer">아마추어 작가</div>
      <div id="post_tag">
       <span>태그1</span><span>태그2</span>
      </div>
     </div>
    </div>
   </a>
  </c:forEach>

  </div>
 </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>