<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />

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
<link rel="stylesheet" type="text/css" href="./resources/css/write.css" />
<script src="./resources/js/jamong_write.js"></script>
<script src="./resources/js/summernote-ko-KR.js"></script>
<title> </title>
</head>
<body>
 <div id="write_wrap">
  <div class="write_title_error">
   <span class="write_error_message"></span>
  </div>
  <div id="write_min-wrap" style="min-width:940px;">
   <!-- 타이틀 부분 -->
   <div id="write_title" style="height:450px;">
    <div id="write_title_cover_img" style="height:250px;"></div>
    <div id="write_title_area_bg" style="height:250px;"></div>
     <div id="write_background_change_btn">
      <div class="write_title_prev_btn"></div>
      <div class="write_title_next_btn"></div>
     </div>
     <!-- 타이틀 텍스트 부분  -->
     <div id="write_title_parent_center" >
      <!-- 메인 타이틀 -->
      <h1 class="write_main_title" contenteditable="true"></h1>
      <br/>
      <!-- 서브 타이틀 -->
      <div class="write_sub_title" contenteditable="true"></div>
    </div>
     <!-- 우측 아이콘 부분 -->
     <div id="write_title_icon">
      <div class="write_button_wrap write_cover_image">
       <button type="button" class="write_icon_btn" title="커버 이미지" >
        <i id="write_title_coverimage_icon"></i>
       </button>
       <div class="write_file_form">
        <form target="write_frame_1" enctype="multipart/form-data" encoding="multipart/form-data" action="write_cover_ok" method="post" id="write_upload_form_1">
         <input id="write_cover_file"type="file" name="file" accept="image/*" title="커버 이미지" />
        </form>
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
     </div>
   </div>
  </div>
   
  <!-- 글 내용 부분 --> 
  <div id="write_cont">
   <div id="write_wrap_bg" style="min-width:940px;">
    <!-- 글쓰기 부분 -->
    <div class="write_cont_area write_cont_align_left" style="min-height:300px;"></div> 
    <!-- 저장/취소or작가신청 버튼 -->
    <div class="write_cont_fix_wrap">
     <div class="write_cont_btn_wrap">
      <button class="write_cont_save" onclick="return writeCheck();">저장</button>
      <button class="write_cont_cancle">취소</button>
     </div>
    </div>
   </div>
  </div>
 
 <!-- 저장팝업 -->
 <div class="write_choice_wrap">
  <div class="write_save_panel">
   <h3>공개여부와 글타입을 설정하세요</h3>
   <div class="write_save_choice_panel">
    <table>
    <caption>공개여부</caption>
     <tr>
  	  <td>
      <input type="radio" value="open" name="write_open" id="write_open" checked /> 공개
      </td>
     </tr>
     <tr>
      <td>
      <input type="radio" value="close" name="write_open" id="write_close" /> 비공개
      </td>
     </tr>
    </table>
   </div>
   <div class="write_type_choice_panel">
   <table>
   <caption>글 종류</caption>
   <tr>
    <td>
    <input type="radio" value="column" name="write_type" id="write_column" checked /> 칼럼
    </td>   
   </tr>
   <tr>
    <td>
    <input type="radio" value="essay" name="write_type" id="write_essay" /> 에세이
    </td>
   </tr>
   </table>
   </div>
   <div class="write_choice_btn_panel">
    <input type="button" class="write_choice_save_btn" value="확인" />
    <input type="button" class="write_choice_close_btn" value="취소" />
   </div>
  </div>
 </div>
</body>
</html>
