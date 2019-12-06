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
      <h1 class="write_main_title" name="bo_title" contenteditable="true"></h1>
      <br/>
      <!-- 서브 타이틀 -->
      <div class="write_sub_title" name="bo_subtitle" contenteditable="true"></div>
    </div>
     <!-- 우측 아이콘 부분 -->
     <div id="write_title_icon">
      <div class="write_button_wrap write_cover_image">
       <button type="button" class="write_icon_btn" title="커버 이미지" >
        <i id="write_title_coverimage_icon"></i>
       </button>
       <div class="write_file_form">
        <form target="write_frame_1" enctype="multipart/form-data" encoding="multipart/form-data" action="write_cover_ok" method="post" id="write_upload_form_1">
         <input id="write_cover_file"type="file" name="bo_thumbnail" accept="image/*" title="커버 이미지" />
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
      <div class="write_button_wrap write_cover_delete">
       <button type="button" class="write_icon_btn" id="write_cover_delete" title="삭제">
        <i id="write_coverimg_delete_icon"></i>
       </button>
      </div> 
     </div>
  </div>
   
  <!-- 글 내용 부분 --> 
  <div id="write_cont">
   <div id="write_wrap_bg" style="min-width:940px;">
    <!-- 글쓰기 부분 -->
    <div class="write_cont_area write_cont_align_left" name="bo_cont" style="min-height:300px;"></div> 
    <!-- 저장/취소or작가신청 버튼 -->
    <div class="write_cont_fix_wrap">
     <div class="write_cont_btn_wrap">
      <button class="write_cont_save" onclick="location.href='#'; return writeCheck();">저장</button>
      <button class="write_cont_cancle">취소</button>
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
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">여행</span> <input
									type="hidden" value="1" /></li>
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">감성·에세이</span> <input
									type="hidden" value="2" /></li>
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">시사·이슈</span> <input
									type="hidden" value="3" /></li>
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">IT 트렌드</span> <input
									type="hidden" value="4" /></li>
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">사진·촬영</span> <input
									type="hidden" value="5" /></li>
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">영화 리뷰</span> <input
									type="hidden" value="6" /></li>
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">음악</span> <input
									type="hidden" value="7" /></li>
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">글쓰기 코치</span> <input
									type="hidden" value="8" /></li>
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">문화·예술</span> <input
									type="hidden" value="9" /></li>
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">육아 이야기</span> <input
									type="hidden" value="10" /></li>
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">요리·레시피</span> <input
									type="hidden" value="11" /></li>
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">건강·운동</span> <input
									type="hidden" value="12" /></li>
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">심리 탐구</span> <input
									type="hidden" value="13" /></li>
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">건축·설계</span> <input
									type="hidden" value="14" /></li>
								<li class="join_membership_category-item"><span
									class="join_membership_category-span">인문학·철학</span> <input
									type="hidden" value="15" /></li>
							</ul>
						</div>
					</div>
					<h3>공개여부와 글종류를 설정하세요</h3>
   <div class="write_save_choice_panel">
    <table>
    <caption>공개여부</caption>
     <tr>
  	  <td>
      <input type="radio" value="open" name="bo_lock" id="write_open" checked /> 공개
      </td>
     </tr>
     <tr>
      <td>
      <input type="radio" value="close" name="bo_lock" id="write_close" /> 비공개
      </td>
     </tr>
    </table>
   </div>
   <div class="write_type_choice_panel">
   <table>
   <caption>글 종류</caption>
   <tr>
    <td>
    <input type="radio" value="column" name="bo_type" id="write_column" value="0" checked /> 칼럼
    </td>   
   </tr>
   <tr>
    <td>
    <input type="radio" value="essay" name="bo_type" id="write_essay" value="1" /> 에세이
    </td>
   </tr>
   </table>
   </div>
   <div class="write_choice_btn_panel">
    <input type="button" class="write_choice_save_btn" value="확인" onclick="return saveCheck();" />
    <input type="button" class="write_choice_close_btn" value="취소" />
   </div>
  </div>
 </div>
</body>
</html>
