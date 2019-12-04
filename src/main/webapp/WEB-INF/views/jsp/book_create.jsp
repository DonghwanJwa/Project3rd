<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="./resources/js/book_create.js"></script>
<script src="./resources/js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/book_create.css">

<div id="book_create_wrap">
 <div id="book_create_list">

  <div id="post_list_ul">
   <div id="check_btn">
    <input type="button" id="post_list_checkAll" class="btn checkAll" value="전체 선택">
    <input type="button" id="post_list_releaseAll" class="btn releaseAll" value="전체 해제">
   </div>
   <ul id="post_list" class="ui-sortable">
    <c:forEach var="i" begin="1" end="29">
     <li class="ui-state-default">
      <label for="chk${i}" class="ckeck_label">
       <input type="checkbox" id="chk${i}" class="check_list">
       <div class="post_list_cont" data-order="${i}">
        <div class="post_list_cont_title">게으름뱅이의 고백&nbsp;${i}</div>
        <div class="post__list_cont_text">
         내 일상을 어떤 색으로 채우고싶나 | 회사를 그만두고 가장 힘들었던 일 중의 하나는 시간
         관리였습니다. 오롯이 펼처진 자유의 시간 속에 게으름뱅이가 되어버린 느낌입니다 아니면 말구
        </div>
       </div>
      </label>
     </li>
    </c:forEach>
   </ul>
  </div> 

  <div id="book_create_btn">
   <div id="book_create_function">
    <input type="button" id="add" class="btn" value="추가">
    <input type="button" id="del" class="btn" value="삭제">
   </div>
  </div>
  
  <div id="create_list_ul">
   <div id="check_btn">
    <input type="button" id="create_list_checkAll" class="btn checkAll" value="전체 선택">
    <input type="button" id="create_list_releaseAll" class="btn releaseAll" value="전체 해제">
   </div>
   <ul id="create_list" class="ui-sortable">
   </ul>
  </div>
  
  <div id="create_book">
   <input type="submit" class="btn" value="만들기">
   <input type="reset" class="btn" value="취소">
  </div>
 </div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>