<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/member_modify.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/font.css"/>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/login.js"></script>
</head>
<body>
<div id="member_modify_main_wrap">
	<div id="member_modify_main_div">
		<!-------------------------------로고------------------------------------>
				<div id="member_modify_img_logo">
					<a href="./"><img src="./resources/img/logo2.png" /></a>
					
					<div id="member_modify_sequence_box">
								<span class="member_modify_sequence_list membership_step"id="member_modify_sequence_list1">회원정보수정</span>
					</div>
					
				</div>

				<!-------------------------------아이디, 비번, 비번확인, 이름,------------------------------------>
				<div id="member_modify_page1" >
					<div id="member_modify_sub_div_1">
							
						
						<input type="password" placeholder="비밀번호" tabindex="2"class="member_modify_text" id="member_modify_pass" name="mem_pwd">
						<div class="member_modify_error" id="member_modify_error_pass"></div>

						<input type="password" placeholder="비밀번호 확인" tabindex="3"class="member_modify_text" id="member_modify_pass_check">
						<div class="member_modify_error"id="member_modify_error_pass_check"></div>

						<input placeholder="이름" class="member_modify_text" tabindex="4"id="member_modify_name" name="mem_name">
						<div class="member_modify_error" id="member_modify_error_name"></div>

					</div>

					<!------------------------------------ 두번째 디브--------------------------------- -->

					<div id="member_modify_sub_div_2">

						<span id="member_modify_birth_span"> 
							<input placeholder="년" class="member_modify_birth numberOnly"	id="member_modify_birth_year" name="mem_birth1" tabindex="5" maxlength="4">
							<input placeholder="월" class="member_modify_birth numberOnly" id="member_modify_birth_month" name="mem_birth2" tabindex="6" maxlength="2">
							<input placeholder="일" class="member_modify_birth numberOnly" id="member_modify_birth_date" name="mem_birth3" tabindex="7" maxlength="2">
						</span> 
						<select id="member_modify_select_gender" name="mem_gender" tabindex="8">
							<option value="	성별">성별</option>
							<option value=" 남자">남자</option>
							<option value=" 여자">여자</option>
						</select>

						<div class="member_modify_error"id="member_modify_error_birth"></div>

						<div class="member_modify_email_class">
							<input class="member_modify_email" tabindex="9"id="member_modify_email" name="email_id" placeholder="이메일">
						</div>
						<b id="member_modify_email_atMark">@</b> 
						<input type="text" list="browsers" id="member_modify_email_datalist"name="email_domain" placeholder="도메인" tabindex="10">
						<datalist id=browsers>
							<option value="naver.com">
							<option value="daum.com">
							<option value="gmail.com">
							<option value="nate.com">
						</datalist>
						<button id="member_modify_certified_btn" tabindex="11">인증</button>
						<div class="member_modify_error"id="member_modify_error_email_domain"></div>

						<div id="member_modify_tel_color">
							<div class="member_modify_tel_hover_focus">
								<input class="member_modify_tel numberOnly" id="member_modify_tel1"	name="mem_phone01" placeholder="010" maxlength="3" tabindex="12"
								>-<input class="member_modify_tel numberOnly" id="member_modify_tel2" name="mem_phone02" placeholder="0000" maxlength="4" tabindex="13"
								>-<input class="member_modify_tel numberOnly" id="member_modify_tel3" name="mem_phone03" placeholder="0000" maxlength="4" tabindex="14">
							</div>
							<div class="member_modify_error" id="member_modify_error_tel"></div>
						</div>
					</div>
						<input type="button" id="member_modify_next_btn" tabindex="15" value="수정완료" />
				</div>
			</div>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>