<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/joinmembership.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/font.css"/>
<script src="../resources/js/jquery.js"></script>
<script src="../resources/js/login.js"></script>
<title>회원가입 페이지입니다</title>
</head>
<body>
<div id ="join_membership_main_wrap">
		<form method="post" action="../index" onsubmit="return join_membership();">
	
	<div id="join_membership_main_div">
		<!-------------------------------로고------------------------------------>
		<div id="join_membership_img_logo">
			<a href="../index"><img src="../img/logo2.png" /></a>
		</div>
		<label id="join_membership_label">JA-MONG 계정 만들기</label>
			<!-------------------------------아이디, 비번, 비번확인, 이름,------------------------------------>			
			
			<div id="join_membership_sub_div_1">
			
			<input placeholder="아이디" class="join_membership_text" id="join_membership_id" tabindex="1" />
			<div class="join_membership_error" id="join_membership_error_id"></div>

			
			<input type="password" placeholder="비밀번호" class="join_membership_text" id="join_membership_pass">
			<div class="join_membership_error" id="join_membership_error_pass"></div>
			
			<input type="password" placeholder="비밀번호 확인" class="join_membership_text" id="join_membership_pass_check">
			<div class="join_membership_error" id="join_membership_error_pass_check"></div>			
			
			<input placeholder="이름" class="join_membership_text" id="join_membership_name">
			<div class="join_membership_error" id="join_membership_error_name"></div>
			
			</div>
			
			<!-- 두번째 디브--------------------------------- -->
			
			<div id="join_membership_sub_div_2">
			
			<span id="join_membership_birth_span"><input class="join_membership_birth" id="join_membership_birth year" placeholder="년"><input placeholder="월" class="join_membership_birth" id="join_membership_birth month"><input placeholder="일" id="join_membership_birth date" class="join_membership_birth"></span>
				
				<select id="join_membership_select_gender">
				<option value="	성별">성별</option>
				<option value=" 남자">남자</option>
				<option value=" 여자">여자</option>
				</select> 
			
			<div class="join_membership_error" id="join_membership_error_birth"></div>
			
			<input class="join_membership_email_class" id="join_membership_email" placeholder="  이메일"> @ 
			
			<input type=text list=browsers id="join_membership_email_datalist" placeholder="도메인">
			<datalist id=browsers>
 			<option value="naver.com">
  			<option value="daum.com">
 			<option value="gmail.com">
 			<option value="nate.com">
			</datalist>
			<button id="join_membership_certified_btn">인증</button>
			<div class="join_membership_error" id="join_membership_error_email_domain"></div>


			
			<div id="join_membership_tel_color">
			<div class="join_membership_tel_hover_focus"><input id="join_membership_tel" placeholder="핸드폰번호 "></div>
			<div class="join_membership_error" id="join_membership_error_tel"></div>
			</div>
			
			<button id="join_membership_last_btn">가입하기</button>
		</div>
		</div>
		</form>
		</div>
</body>
</html>









