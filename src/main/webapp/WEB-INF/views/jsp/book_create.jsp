<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script src="./resources/js/book_create.js"></script>
<script src="./resources/js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/book_create.css">

<div id="book_create_wrap">
 <div id="book_create_list">
 
  <ul id="post_list" class="ui-sortable">
   <li class="ui-state-default">
    <label for="chk1" class="ckeck_label">
     <input type="checkbox" id="chk1" class="check_list">
     <div class="post_list_cont" data-order=1>
      <div class="post_list_cont_title">게으름뱅이의 고백1</div>
      <div class="post__list_cont_text">
       내 일상을 어떤 색으로 채우고싶나 | 회사를 그만두고 가장 힘들었던 일 중의 하나는 시간
       관리였습니다. 오롯이 펼처진 자유의 시간 속에 게으름뱅이가 되어버린 느낌입니다 아니면 말구
      </div>
      <span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
     </div>
    </label>
   </li>
   
   <li class="ui-state-default">
    <label for="chk2" class="ckeck_label">
     <input type="checkbox" id="chk2" class="check_list">
     <div class="post_list_cont" data-order=2>
      <div class="post_list_cont_title">게으름뱅이의 고백2</div>
      <div class="post__list_cont_text">
       내 일상을 어떤 색으로 채우고싶나 | 회사를 그만두고 가장 힘들었던 일 중의 하나는 시간
       관리였습니다. 오롯이 펼처진 자유의 시간 속에 게으름뱅이가 되어버린 느낌입니다 아니면 말구
      </div>
      <span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
     </div>
    </label>
   </li>
   
   <li class="ui-state-default">
    <label for="chk3" class="ckeck_label">
     <input type="checkbox" id="chk3" class="check_list">
     <div class="post_list_cont" data-order=3>
      <div class="post_list_cont_title">게으름뱅이의 고백3</div>
      <div class="post__list_cont_text">
       내 일상을 어떤 색으로 채우고싶나 | 회사를 그만두고 가장 힘들었던 일 중의 하나는 시간
       관리였습니다. 오롯이 펼처진 자유의 시간 속에 게으름뱅이가 되어버린 느낌입니다 아니면 말구
      </div>
      <span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
     </div>
    </label>
   </li>
   
   <li class="ui-state-default">
    <label for="chk4" class="ckeck_label">
     <input type="checkbox" id="chk4" class="check_list">
     <div class="post_list_cont" data-order=4>
      <div class="post_list_cont_title">게으름뱅이의 고백4</div>
      <div class="post__list_cont_text">
       내 일상을 어떤 색으로 채우고싶나 | 회사를 그만두고 가장 힘들었던 일 중의 하나는 시간
       관리였습니다. 오롯이 펼처진 자유의 시간 속에 게으름뱅이가 되어버린 느낌입니다 아니면 말구
      </div>
      <span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
     </div>
    </label>
   </li>
  </ul>

  <div id="book_create_btn">
   <div id="book_create_function">
    <input type="button" id="add" class="btn" value="추가">
    <input type="button" id="del" class="btn" value="삭제">
   </div>
  </div>
  
  <ul id="create_list" class="ui-sortable">
  </ul>
 </div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>