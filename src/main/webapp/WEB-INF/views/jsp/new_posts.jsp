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
<%--    <c:forEach var="i" begin="1" end="30" step="1"> --%>
<%--     <li data-no="${i}"> --%>
<!--      <a href="./read"> -->
<!--       <div id="new_post_loading_cont"> -->
<!--        <img id="new_post_loading_cont_img" src="./resources/img/bookCover.jpg"> -->
<!--        <div id="new_post_loading_cont_text"> -->
<%--         <div id="new_post_loading_cont_text_title">게으름뱅이의 고백${i}</div> --%>
<!--         <div id="new_post_loading_cont_text_cont">내 일상을 어떤 색으로 채우고싶나 | 회사를 그만두고 가장 힘들었던 일 중의 하나는 -->
<!--          시간 관리였습니다. 오롯이 펼처진 자유의 시간 속에 게으름뱅이가 되어버린 느낌입니다 아니면 말구</div> -->
<!--         <div id="new_post_loading_cont_text_writer"> -->
<!--          <i>by</i> 노시현 -->
<!--         </div> -->
<!--         <div id="new_post_loading_cont_text_tag"> -->
<!--          <span>나무늘보</span>&nbsp;&nbsp;<span>귀차니즘</span> -->
<!--         </div> -->
<!--         <div id="new_post_loading_cont_text_ago">●2분전</div> -->
<!--        </div> -->
<!--       </div> -->
<!--      </a> -->
<!--     </li> -->
<%--    </c:forEach> --%>
  </ul>
 </div>

</div>
</div>
<%@ include file="../include/footer.jsp"%>
