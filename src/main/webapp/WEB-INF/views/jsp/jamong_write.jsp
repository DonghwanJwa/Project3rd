<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/write.css" />
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/jamong_write.js"></script>
<title> </title>
</head>
<body>
 <div id="write_wrap">
  <div class="write_title_error">
   <span class="write_title_error_message">제목을 입력하세요!</span>
  </div>
  <div class="write_cont_error">
   <span class="write_cont_error_message">내용을 입력하세요!</span>
  </div>
  <div id="write_min-wrap" style="min-width:940px;">
   <!-- 타이틀 부분 -->
   <div id="write_title" style="height:450px;">
    <div id="write_title_area_bg" style="height:250px;">
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
  </div>
   
  <!-- 글 내용 부분 --> 
  <div id="write_cont">
   <div id="write_wrap_bg" style="min-width:940px;">
    <div class="write_cont_icon" id="write-cont-icon-1">
     <div id="write_cont_icon">
      <div class="write_button_wrap">
       <button type="button" class="write_icon_btn" title="이미지" >
        <i id="write_cont_image_icon"></i>
       </button>
       <div class="write_file_form">
        <form target="write_frame_2" enctype="multipart/form-data" encoding="multipart/form-data" action="write_cover_ok" method="post" id="write_upload_form_2">
         <input id="write_image_file" type="file" name="file" title="이미지" accept="image/*" multiple="true" />
        </form>
        </div>
      </div>
      <div class="write_button_wrap">
       <button type="button" class="write_icon_btn" title="동영상링크">
        <i id="write_cont_link_icon"></i>
       </button>
      </div>
      <div class="write_button_wrap">
       <button type="button" class="write_icon_btn" title="구분선">
        <i id="write_cont_enter_icon"></i>
       </button>
      </div>
      <div class="write_button_wrap">
       <button type="button" class="write_icon_btn" title="정렬">
        <i class="write_cont_align_icon write_cont_align_icon_left"></i>
       </button>
      </div>
      <div class="write_button_wrap">
       <button class="write_icon_btn" title="저장">
        <i class="write_cont_save_icon"></i>
       </button>
      </div>
     </div>
    </div>
    <!-- 글쓰기 부분 -->
    <div class="write_cont_area write_cont_align_left" style="min-height:300px;" contenteditable="true">
    <p class="write_cont_p write_cont_text"><br></p>
    </div> 
    <!-- 저장/취소or작가신청 버튼 -->     
    <div class="write_cont_fix_wrap">
     <div class="write_cont_btn_wrap">
      <button class="write_cont_save" onclick="return writeCheck();">저장</button>
      <button class="write_cont_cancle">취소</button>
     </div>
    </div>
   </div>
  </div>
  <!-- 에디터 부분 -->
  <div id="write_editor_wrap">
   <div class="write_font_btn write_editor_dropdown write_font_family" style="display:inline-block;">
    <button id="write_editor_first" class="write_font_dropdown_btn">
     <i class="write_font_btn_before write_before_text write_default_font"></i>
     <span class="write_font_dropdown_arrow write_font_type"></span>
    </button>
    <ul class="write_font_dropdown_menu" id="write_font_choice_dropdown">
      <li class="write_font_select">
     <a href="#" title="나눔고딕" class="write_Nanum_Gothic">나눔고딕</a>
     </li>
     <li class="write_font_select">
     <a href="#" title="나눔명조" class="write_Nanum_Myengjo">나눔명조</a>
     </li>
     <li class="write_font_select">
     <a href="#" title="나눔바른고딕" class="write_Nanum_BarunGothic">나눔바른고딕</a>
     </li>
     <li class="write_font_select">
     <a href="#" title="나눔손글씨" class="write_Nanum_Handfont">나눔손글씨</a>
     </li>
     <li class="write_font_select">
     <a href="#" title="나눔스퀘어라운드" class="write_Nanum_SquareRound">스퀘어라운드</a>
     </li>
     <li class="write_font_select">
     <a href="#" title="Georgia" class="write_Georgia">Georgia</a>
     </li>
    </ul>
   </div><%--
   --%><div class="write_font_btn write_editor_dropdown write_format_block" style="display:inline-block;">
    <button id="write_editor_second" class="write_font_dropdown_btn">
     <i class=" write_before_text">본문</i>
     <span class="write_font_dropdown_arrow write_title_type"></span>
    </button>
    <ul class="write_font_dropdown_menu" id="write_type_choice_dropdown">
     <li class="write_font_select">
     <a href="#" title="제목1"><h2>제목1</h2></a>
     </li>
     <li class="write_font_select">
     <a href="#" title="제목2"><h3>제목2</h3></a>
     </li>
     <li class="write_font_select">
     <a href="#" title="제목3"><h4>제목3</h4></a>
     </li>
     <li class="write_font_select">
     <a href="#" title="본문">본문</a>
    </ul>
   </div><%-- 
   --%><button class="write_icon_btn" title="진하게" onclick="document.execCommand('bold')">
    <i class="write_edit_bold_btn write_edit_icon_i"></i>
   </button><%--
   --%><button class="write_icon_btn" title="기울임" onclick="document.execCommand('Italic')" >
    <i class="write_edit_italic_btn write_edit_icon_i" ></i>
   </button><%--
   --%><button class="write_icon_btn" title="취소선" onclick="document.execCommand('StrikeThrough')" >
    <i class="write_edit_stroke_btn write_edit_icon_i" ></i>
   </button><%--
   --%><button class="write_icon_btn" title="밑줄" onclick="document.execCommand('Underline')" >
    <i class="write_edit_under_btn write_edit_icon_i" ></i>
   </button><%--
   --%><div class="write_editor_dropdown" >
    <button id="write_editor_fgcolor" class="write_icon_btn">
     <i class="write_edit_fgcolor_btn write_edit_icon_i" style="background-color:rgb(51,51,51)"></i>
    </button>
    <div class="write_fgcolor_dropdown_menu">
     <div id="write_fgcolor_change_cover" class="write_color_change_cover">
      <span class="write_editor_fgchip write_fgchip_1" style="background-color:#ffffff"></span>
      <span class="write_editor_fgchip write_fgchip_2" style="background-color:#959595"></span><hr>
      <span class="write_editor_fgchip write_fgchip_3" style="background-color:#333333"></span>
      <span class="write_editor_fgchip write_fgchip_4" style="background-color:#F4C216"></span><hr>
      <span class="write_editor_fgchip write_fgchip_5" style="background-color:#16B06D"></span>
      <span class="write_editor_fgchip write_fgchip_6" style="background-color:#F6665B"></span><hr>
      <span class="write_editor_fgchip write_fgchip_7" style="background-color:#00C3BD"></span>
      <span class="write_editor_fgchip write_fgchip_8" style="background-color:#EC4C6A"></span><hr>
      <span class="write_editor_fgchip write_fgchip_9" style="background-color:#2E84B6"></span>
      <span class="write_editor_fgchip write_fgchip_10" style="background-color:#5C5CB2"></span>
     </div>
    </div>
   </div><%--
    --%><div class="write_editor_dropdown" >
    <button id="write_editor_bgcolor" class="write_icon_btn">
     <i class="write_edit_bgcolor_btn write_edit_icon_i"></i>
     <div class="write_bgcolor_dropdown_menu">
      <div id="write_bgcolor_change_cover" class="write_color_change_cover">
       <span class="write_editor_fgchip write_bgchip_1" style="background-color:#ffffff"></span>
       <span class="write_editor_fgchip write_bgchip_2" style="background-color:#959595"></span>
       <hr>
       <span class="write_editor_fgchip write_bgchip_3" style="background-color:#333333"></span>
       <span class="write_editor_fgchip write_bgchip_4" style="background-color:#F4C216"></span>
       <hr>
       <span class="write_editor_fgchip write_bgchip_5" style="background-color:#16B06D"></span>
       <span class="write_editor_fgchip write_bgchip_6" style="background-color:#F6665B"></span>
       <hr>
       <span class="write_editor_fgchip write_bgchip_7" style="background-color:#00C3BD"></span>
       <span class="write_editor_fgchip write_bgchip_8" style="background-color:#EC4C6A"></span>
       <hr>
       <span class="write_editor_fgchip write_bgchip_9" style="background-color:#2E84B6"></span>
       <span class="write_editor_fgchip write_bgchip_10" style="background-color:#5C5CB2"></span>
      </div>
     </div>
    </button>
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
