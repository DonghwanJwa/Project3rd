<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/member_modify.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/font.css"/>
<script src="./resources/js/login.js"></script>
<title>회원정보수정페이지입니다</title>
</head>
<body>
<div id="member_modify_main_wrap">
	<form id="member_modify_form" method="post" action="../index">
	<div id="member_modify_main_div">
	<div id="member_modify_img_logo"><a href="../index"><img src="../resources/img/logo2.png" /></a></div>
		<label id="member_modify_label">회원가입 페이지 입니다!</label>
		<!-- 두개로 나눠진 디브 -->
	
			<div id="member_modify_id_pwd_name_birth">
			<input class="member_modify_boxsize" placeholder="아이디보여줄겁니다">
			<div class="member_modify_error" id="member_modify_error_idShow"></div>
			
			<input class="member_modify_boxsize" placeholder="비밀번호">
			<div class="member_modify_error" id="member_modify_error_pass"></div>
			
			<input class="member_modify_boxsize" placeholder="이름">
			<div class="member_modify_error" id="member_modify_error_name"></div>
			
			<input class="member_modify_boxsize" placeholder="프로필명">
			<div class="member_modify_error" id="member_modify_error_profile"></div>
			</div>
		
			<div id="member_modify_profile_gender_email_tel">
			
			<div id="modify_member_radio_btn_div">
			
			<input class="modify_member_radio_btn" type="radio" value="남자">남자
			<input class="modify_member_radio_btn" type="radio" value="여자">여자</div>
			<div class="member_modify_error" id="member_modify_error_gender"></div>
			
			
			<span class="member_modify_color_div">
			<input class="member_modify_boxsize_tel" placeholder="010">-<input class="member_modify_boxsize_tel" placeholder="0000" >-<input class="member_modify_boxsize_tel" placeholder="0000" ></span>
			<div class="member_modify_error" id="member_modify_error_tel"></div>
			
			<span class="member_modify_color_div">
			<input class="member_modify_boxsize_birth" placeholder="년"><input class="member_modify_boxsize_birth" placeholder="월" ><input class="member_modify_boxsize_birth" placeholder="일" >
			</span>
			<div class="member_modify_error" id="member_modify_error_birth"></div>
			
			<div class="member_modify_color_div">
			<input id="member_modify_boxsize_email" placeholder="이메일">@
			<input type=text list=browsers id="member_modify_boxsize_email_datalist" placeholder="도메인">
			<datalist id=browsers>
 			<option value="naver.com">
  			<option value="daum.com">
 			<option value="gmail.com">
 			<option value="nate.com">
			</datalist>
			<button id="member_modify_check_btn">인증</button>
 			</div>
			<div class="member_modify_error" id="member_modify_error_email"></div>
 		
 		</div>
 		<div id="member_modify_last_btn_div"><button id="member_modify_last_btn">수정완료</button></div>
		</div>
	</form>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>