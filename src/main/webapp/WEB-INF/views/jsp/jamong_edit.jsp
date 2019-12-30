<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/write.css" />
<script src="/jamong.com/resources/js/jamong_write.js"></script>
<script src="/jamong.com/resources/js/summernote-ko-KR.js"></script>
<title> </title>
</head>
<body>
 <form method="post" action="write_ok" onsubmit="return saveCheck();" enctype="multipart/form-data">
 <input type="hidden" id="bo_titlespace" name="bo_titlespace" <c:if test="${!empty bo.bo_titlespace}">value="${bo.bo_titlespace}"</c:if> />
 <input type="hidden" id="bo_color" name="bo_color" <c:if test="${!empty bo.bo_color}">value="${bo.bo_color}"</c:if> />
 <input type="hidden" id="thumb_remove" name="thumb_remove" value="0" />
 <div id="write_wrap">
  <div class="write_title_error">
   <span class="write_error_message"></span>
  </div>
  <div id="write_min-wrap" style="min-width:940px;">
   <!-- 타이틀 부분 -->
   <div id="write_title" style="height:450px;">
   <c:if test="${!empty bo.bo_thumbnail && empty bo.bo_color}">
    <div id="write_title_cover_img" style='height:450px; background-image:url("${bo.bo_thumbnail}")'></div>
    <div id="write_title_area_bg" style="height:250px;"></div>
    </c:if>
   <c:if test="${empty bo.bo_thumbnail && !empty bo.bo_color}">
    <div id="write_title_cover_img" style='height:250px;'></div>
    <div id="write_title_area_bg" style='height:450px; background-color:${bo.bo_color}'></div>
    </c:if>
   <c:if test="${empty bo.bo_thumbnail && empty bo.bo_color}">
    <div id="write_title_cover_img" style='height:250px;'></div>
    <div id="write_title_area_bg" style='height:450px;'></div>
    </c:if>
     <div id="write_background_change_btn">
      <div class="write_title_prev_btn"></div>
      <div class="write_title_next_btn"></div>
     </div>
     <!-- 타이틀 텍스트 부분  -->
     <c:if test="${bo.bo_titlespace == 0}">
     <div id="write_title_parent_center" >
      <c:if test="${empty bo.bo_thumbnail && empty bo.bo_color}">
      <!-- 메인 타이틀 -->
      <div class="write_main_title" contenteditable="true">${bo.bo_title}</div>
      <textarea name="bo_title" id="bo_title" style="display:none;"></textarea>
      <br/>
      <!-- 서브 타이틀 -->
      <div class="write_sub_title" name="bo_subtitle" contenteditable="true">${bo.bo_subtitle}</div>
      <textarea name="bo_subtitle" id="bo_subtitle" style="display:none;"></textarea>
      </c:if>
      <c:if test="${!empty bo.bo_thumbnail || !empty bo.bo_color}">
      <!-- 메인 타이틀 -->
      <div class="write_main_title write_bg_title_option" contenteditable="true">${bo.bo_title}</div>
      <textarea name="bo_title" id="bo_title" style="display:none;"></textarea>
      <br/>
      <!-- 서브 타이틀 -->
      <div class="write_sub_title write_bg_title_option" name="bo_subtitle" contenteditable="true">${bo.bo_subtitle}</div>
      <textarea name="bo_subtitle" id="bo_subtitle" style="display:none;"></textarea>
      </c:if>
    </div>
    </c:if>
     <c:if test="${bo.bo_titlespace == 1}">
     <div id="write_title_parent_bottom" >
     <c:if test="${empty bo.bo_thumbnail && empty bo.bo_color}">
      <!-- 메인 타이틀 -->
      <div class="write_main_title" contenteditable="true">${bo.bo_title}</div>
      <textarea name="bo_title" id="bo_title" style="display:none;"></textarea>
      <br/>
      <!-- 서브 타이틀 -->
      <div class="write_sub_title" name="bo_subtitle" contenteditable="true">${bo.bo_subtitle}</div>
      <textarea name="bo_subtitle" id="bo_subtitle" style="display:none;"></textarea>
      </c:if>
      <c:if test="${!empty bo.bo_thumbnail || !empty bo.bo_color}">
      <!-- 메인 타이틀 -->
      <div class="write_main_title write_bg_title_option" contenteditable="true">${bo.bo_title}</div>
      <textarea name="bo_title" id="bo_title" style="display:none;"></textarea>
      <br/>
      <!-- 서브 타이틀 -->
      <div class="write_sub_title write_bg_title_option" name="bo_subtitle" contenteditable="true">${bo.bo_subtitle}</div>
      <textarea name="bo_subtitle" id="bo_subtitle" style="display:none;"></textarea>
      </c:if>
    </div>
    </c:if>
    <c:if test="${empty bo.bo_thumbnail && empty bo.bo_color}">
     <!-- 우측 아이콘 부분 -->
     <div id="write_title_icon">
      <div class="write_button_wrap write_cover_image">
       <button type="button" class="write_icon_btn" title="커버 이미지" >
        <i id="write_title_coverimage_icon"></i>
       </button>
       <div class="write_file_form">
         <input id="write_cover_file"type="file" name="bo_thumbnail" accept="image/*" title="커버 이미지" />
       </div>
      </div>
      <div class="write_button_wrap write_background_icon">
       <button type="button" class="write_icon_btn" title="배경색">
        <i id="write_title_background_icon"></i>
       </button>
      </div>
      <div class="write_button_wrap write_title_align">
       <button type="button" class="write_icon_btn" id="write_title_align" title="정렬">
        <i id="write_title_center_icon"></i>
       </button>
      </div>
      <div class="write_button_wrap write_cover_delete">
       <button type="button" class="write_icon_btn" id="write_cover_delete" title="삭제">
        <i id="write_coverimg_delete_icon"></i>
       </button>
      </div> 
     </div>
    </c:if>
    <c:if test="${!empty bo.bo_thumbnail}">
     <!-- 우측 아이콘 부분 (썸네일이 있을 경우) -->
     <div id="write_title_icon">
      <div class="write_button_wrap write_cover_image">
       <button type="button" class="write_icon_btn" title="커버 이미지" >
        <i id="write_title_coverimage_icon"></i>
       </button>
       <div class="write_file_form">
         <input id="write_title_coverimage_bg"type="file" name="bo_thumbnail" accept="image/*" title="커버 이미지" />
       </div>
      </div>
      <div class="write_button_wrap write_background_icon" style="display:none;">
       <button type="button" class="write_icon_btn" title="배경색">
        <i id="write_title_background_icon"></i>
       </button>
      </div>
      <div class="write_button_wrap write_title_align">
       <button type="button" class="write_icon_btn" id="write_title_align" title="정렬">
        <i id="write_title_center_bg"></i>
       </button>
      </div>
      <div class="write_button_wrap write_cover_delete" style="display:block;">
       <button type="button" class="write_icon_btn" id="write_cover_delete" title="삭제">
        <i id="write_coverimg_delete_icon"></i>
       </button>
      </div> 
     </div>
    </c:if>
    <c:if test="${!empty bo.bo_color}">
     <!-- 우측 아이콘 부분 (색상이 있을 경우) -->
     <div id="write_title_icon">
      <div class="write_button_wrap write_cover_image">
       <button type="button" class="write_icon_btn" title="커버 이미지" >
        <i id="write_title_coverimage_icon"></i>
       </button>
       <div class="write_file_form">
         <input id="write_title_coverimage_bg"type="file" name="bo_thumbnail" accept="image/*" title="커버 이미지" />
       </div>
      </div>
      <div class="write_button_wrap write_background_icon">
       <button type="button" class="write_icon_btn" title="배경색">
        <i id="write_title_background_bg"></i>
       </button>
      </div>
      <div class="write_button_wrap write_title_align">
       <button type="button" class="write_icon_btn" id="write_title_align" title="정렬">
        <i id="write_title_center_bg"></i>
       </button>
      </div>
      <div class="write_button_wrap write_cover_delete">
       <button type="button" class="write_icon_btn" id="write_cover_delete" title="삭제">
        <i id="write_coverimg_delete_icon"></i>
       </button>
      </div> 
     </div>
    </c:if>
  </div>
  
  <!-- 글 내용 부분 --> 
  <div id="write_cont">
   <div id="write_wrap_bg" style="min-width:940px;">
    <!-- 글쓰기 부분 -->
    <textarea class="write_cont_area write_cont_align_left" name="bo_cont" style="min-height:300px;">${bo.bo_cont}</textarea> 
    <!-- 저장/취소or작가신청 버튼 -->
    <div class="write_cont_fix_wrap">
     <div class="write_cont_btn_wrap">
      <button type="button" class="write_cont_save" onclick="location.href='#'; return writeCheck();">저장</button>
      <button type="button" class="write_cont_cancle">취소</button>
     </div>
    </div>
   </div>
  </div>
 
 <!-- 저장팝업 -->
 <div class="write_choice_wrap">
  <div class="write_save_panel">  
					<div id="join_membership_category-wrap">
						<div id="join_membership_category-frame">
							<h3 class="join_membership_category-anoun">
							글 카테고리를 선택해주세요!
							</h3>
							<ul id="join_membership_category-list">
								<%-- 카테고리 AJAX처리 --%>
							</ul>
						</div>
					</div>
					<h3>공개여부와 글종류를 설정하세요</h3>
   <div class="write_save_choice_panel">
    <table>
    <caption>공개여부</caption>
     <tr>
  	  <td>
      <input type="radio" name="bo_lock" id="write_open" value="1" <c:if test="${bo.bo_lock == 1}">checked</c:if> /> 공개
      </td>
     </tr>
     <tr>
      <td>
      <input type="radio" name="bo_lock" id="write_close" value="0" <c:if test="${bo.bo_lock == 0}">checked</c:if> /> 비공개
      </td>
     </tr>
    </table>
   </div>
   <div class="write_type_choice_panel">
   <table>
   <caption>글 종류</caption>
   <tr>
    <td>
    <input type="radio" name="bo_type" id="write_column" value="0" <c:if test="${bo.bo_type == 0}">checked</c:if> /> 칼럼
    </td>   
   </tr>
   <tr>
    <td>
    <input type="radio" name="bo_type" id="write_essay" value="1" <c:if test="${bo.bo_type == 1}">checked</c:if> /> 에세이
    </td>
   </tr>
   </table>
   </div>
   <div class="write_choice_btn_panel">
    <input type="submit" class="write_choice_save_btn" value="수정" />
    <input type="button" class="write_choice_close_btn" value="취소" />
   </div>
  </div>
 </div>
 </form>
</body>
</html>
