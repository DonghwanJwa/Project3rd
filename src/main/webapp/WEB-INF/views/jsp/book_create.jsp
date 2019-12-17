<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="/jamong.com/resources/js/book_create.js"></script>
<script src="/jamong.com/resources/js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/book_create.css">

<form method="post" action="book_create_ok" onsubmit="return create_bookCheck()">
<div id="book_create_wrap">
 <div id="book_create_list">

  <div id="post_list_ul">
   <div id="check_btn">
    <input type="button" id="post_list_checkAll" class="btn checkAll" value="전체 선택">
    <input type="button" id="post_list_releaseAll" class="btn releaseAll" value="전체 해제">
   </div>
   <ul id="post_list" class="ui-sortable">
    <c:forEach var="b" items="${bookList}">
     <li class="ui-state-default" data-no="${b.bo_no}">
      <label for="chk${b}" class="ckeck_label">
       <input type="checkbox" id="chk${b}" class="check_list">
       <div class="post_list_cont" data-order="${b.bo_no}">
        <div class="post_list_cont_title">
         <c:if test="${fn:length(b.bo_title)>20}">
          ${fn:substring(b.bo_title,0,20)}...
         </c:if>
         <c:if test="${fn:length(b.bo_title)<20}">
          ${b.bo_title}
         </c:if>
        </div>
        <div class="post__list_cont_text">
        <c:if test="${fn:length(b.bo_cont)>100}">
          ${fn:substring(b.bo_cont,0,100)}...
         </c:if>
         <c:if test="${fn:length(b.bo_cont)<100}">
          ${b.bo_cont}
         </c:if>
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
   <input type="button" class="btn" onclick="return createCheck()" value="만들기">
   <input type="reset" class="btn" value="취소">
  </div>
 </div>
</div>

<!-- 저장 팝업 -->
<div class="create_book_name">
 <div class="create_book_pannel">
  <input type="text" placeholder="책 제목 입력" maxlength="30"> 
  <input type="submit" value="만들기">
  <input type="reset" value="취소">
 </div>
</div>

</form>

<jsp:include page="../include/footer.jsp"></jsp:include>