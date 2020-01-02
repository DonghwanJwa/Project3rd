<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/book_create.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book_create.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/write.css">

<div id="book_create_wrap">
 <div id="book_create_base">
 <div id="book_create_announce">
  <img id="book_create_anno_img" src="${pageContext.request.contextPath}/resources/img/alert.png" alt="주의">
  <div id="book_create_anno_cont">  
  	자몽에서는 작가님들의 책임있는 출판활동을 권고하기 위하여 완성된 책에 대한 수정 삭제 기능이 없음을 안내드립니다.
  </div>
 </div>
  <form method="post" action="book_create_ok" onsubmit="return createBookCheck();" enctype="multipart/form-data">

  
  <!-- 책 커버, 책 소개, 작가 정보 표시 -->
  <div id="book_create_info">
   <!-- 책 커버 -->
   <div id="book_create_cover" class="book_create_about_div">
   <div id="book_create_cover_img"></div>
   <input id="book_create_cover_imgFile" type="file" name="book_cover" accept="image/*" title="책 커버 이미지"/>
    <div id="book_create_cover_text" title="클릭하여 책커버 이미지 삽입">
     <div id="book_create_cover_head">
      <strong id="book_create_cover_title" class="title" contenteditable="true"></strong>
      <textarea name="book_name" id="book_title" style="display:none;"></textarea>
      <span id="book_create_cover_author">
       <i>by&nbsp;</i>${mem_nickname}
      </span>
     </div>
     <div id="book_create_cover_bot">
      <span>Jamong Book</span>
     </div>
    </div>
    <span id="book_create_cover_line"></span>
   </div>
   <!-- 책 소개 -->
   <div id="book_create_intro" class="book_create_about_div">
    <div id="book_create_intro_inner">
     <strong id="book_create_intro_title">자몽 책 소개</strong>
     <p id="book_create_intro_cont" contenteditable="true"></p>
     <textarea name="book_preface" id="book_intro_cont" style="display:none;"></textarea>
    </div>
   </div>
   <!-- 작가 정보 -->
   <div id="book_create_author" class="book_create_about_div">
    <div id="book_create_author_head"><!-- 작가 소개 상단 ui --></div>
    <div id="book_create_author_main">
     <span id="book_create_author_img">
     <c:set var="profile_poto" value="${profile_photo}"/>
     <c:if test="${not empty profile_photo}">
      <img src="${profile_photo}">
     </c:if>
     <c:if test='${empty profile_photo}'>
      <img src="${pageContext.request.contextPath}/resources/img/profile_logout.png">
     </c:if>
     </span>
     <div id="book_create_author_desc">
      <strong id="book_create_author_name">${mem_nickname}</strong>
     </div>
     <div id="book_create_author_intro">
      <p id="book_create_author_intro_cont">
      ${profile_cont}
      </p>
     </div>
    </div>
   </div>
   
  </div>
  

  <!-- 글 리스트 -->
  <div id="book_create_list">
  <div id="post_list_ul">
   <div id="check_btn">
    <input type="button" id="post_list_checkAll" class="btn checkAll" value="전체 선택">
    <input type="button" id="post_list_releaseAll" class="btn releaseAll" value="전체 해제">
   </div>
   <ul id="post_list" class="ui-sortable">
    <c:forEach var="b" items="${bookList}">
     <li class="ui-state-default" data-no="${b.bo_no}" data-order="${b}">
      <label for="chk${b}" class="ckeck_label">
       <input type="checkbox" name ="book_create" id="chk${b}" value="${b.bo_no}" class="check_list">
       <div class="post_list_cont">
       <div class="post_list_lock">
       <c:if test="${b.bo_lock==0}">
        <img class="post_list_lock_img" src="${pageContext.request.contextPath}/resources/img/lock.png">
       </c:if>
       <c:if test="${b.bo_lock==1}">
        <img class="post_list_lock_img" src="${pageContext.request.contextPath}/resources/img/unlock.png">
       </c:if>
       </div>
        <div class="post_list_cont_title">
         <c:if test="${fn:length(b.bo_title)>20}">
          ${fn:substring(b.bo_title,0,20)}...
         </c:if>
         <c:if test="${fn:length(b.bo_title)<20}">
          ${b.bo_title}
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
    <input type="button" id="add" class="btn" value="▷▷▷" title="삽입" >
    <input type="button" id="del" class="btn" value="◀◀◀" title="제거">
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

<!-- 저장팝업 -->
  <div class="create_choice_wrap">
   <div class="create_save_panel">  
    <div id="join_membership_category-wrap">
     <div id="join_membership_category-frame">
      <h3 class="join_membership_category-anoun">
       책 카테고리를 선택해주세요!
      </h3>
      <ul id="join_membership_category-list">
      <%-- 카테고리 AJAX처리 --%>
      </ul>
     </div>
    </div>
   <div class="write_choice_btn_panel">
    <input type="submit" class="write_choice_save_btn" value="확인" />
    <input type="button" class="write_choice_close_btn" value="취소" />
   </div>
  </div>
 </div>
 
  </form>
 </div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>