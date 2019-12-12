<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.jamong.domain.MemberVO,java.util.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/member_modify.css" />
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/member_modify_categore.css" />
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/font.css"/>
<script src="/jamong.com/resources/js/jquery.js"></script>
<script src="/jamong.com/resources/js/member_modify.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<form method="post" action="member_modify_ok">
<div id="member_modify_main_wrap">
	<div id="member_modify_main_div">
		<!-------------------------------로고------------------------------------>
				<div id="member_modify_img_logo">
					<a href="/jamong.com/"><img src="/jamong.com/resources/img/logo2.png" /></a>
					<div id="member_modify_sequence_box">
						<ol id="member_modify_sequence">
							<li>
								<span class="member_modify_sequence_list membership_step"	
									id="member_modify_sequence_list1">회원정보수정</span>
							</li>
							<li>
								<span class="member_modify_sequence_list"
									id="member_modify_sequence_list2">카테고리</span>
							</li>
						</ol>
					</div>
				</div>

				<!-------------------------------아이디, 비번, 비번확인, 이름,------------------------------------>
				<div id="member_modify_page1" >
					<div id="member_modify_sub_div_1">
						<input type="password" placeholder="비밀번호" tabindex="1"class="member_modify_text" 
						id="member_modify_pass" name="mem_pwd">
						<div class="member_modify_error" id="member_modify_error_pass"></div>

						<input type="password" placeholder="비밀번호 확인" tabindex="1"class="member_modify_text" id="member_modify_pass_check">
						<div class="member_modify_error"id="member_modify_error_pass_check"></div>

						<input placeholder="이름" class="member_modify_text" value="${mv.mem_name}" tabindex="3"id="member_modify_name" name="mem_name">
						<div class="member_modify_error" id="member_modify_error_name"></div>
					</div>

					<!------------------------------------ 두번째 디브--------------------------------- -->

					<div id="member_modify_sub_div_2">

						<span id="member_modify_birth_span"> 
							<input placeholder="년" value="${mv.mem_birth1 }" class="member_modify_birth number2Only" id="member_modify_birth_year" name="mem_birth1" tabindex="4" maxlength="4">
							<input placeholder="월" value="${mv.mem_birth2 }" class="member_modify_birth number2Only" id="member_modify_birth_month" name="mem_birth2" tabindex="5" maxlength="2">
							<input placeholder="일" value="${mv.mem_birth3 }" class="member_modify_birth number2Only" id="member_modify_birth_date" name="mem_birth3" tabindex="6" maxlength="2">
						</span> 
					
						<div class="member_modify_error"id="member_modify_error_birth"></div>

						<div class="member_modify_email_class">
							<input class="member_modify_email" value="${mv.email_id }" tabindex="7"id="member_modify_email" name="email_id" placeholder="이메일">
						</div>
						<b id="member_modify_email_atMark">@</b> 
						<input type="text" list="browsers" value="${mv.email_domain }" id="member_modify_email_datalist"name="email_domain" placeholder="도메인" tabindex="8">
						<datalist id=browsers>
							<option value="naver.com">
							<option value="daum.com">
							<option value="gmail.com">
							<option value="nate.com">
						</datalist>
						<button id="member_modify_certified_btn" tabindex="9">인증</button>
						<div class="member_modify_error"id="member_modify_error_email_domain"></div>

						<div id="member_modify_tel_color">
							<div class="member_modify_tel_hover_focus">
								  <input class="member_modify_tel number2Only" id="member_modify_tel1" value="${mv.mem_phone01 }" name="mem_phone01" placeholder="010" maxlength="3" tabindex="10"
								>-<input class="member_modify_tel number2Only" id="member_modify_tel2" value="${mv.mem_phone02 }" name="mem_phone02" placeholder="0000" maxlength="4" tabindex="11"
								>-<input class="member_modify_tel number2Only" id="member_modify_tel3" value="${mv.mem_phone03 }" name="mem_phone03" placeholder="0000" maxlength="4" tabindex="12">
							</div>
							<div class="member_modify_error" id="member_modify_error_tel"></div>
						</div>
					</div>
						<input type="button" id="member_modify_next_btn" tabindex="13" value="넘어가기" />
				</div>
			
			<!-- 카테고리 --------------------------------------------------------------------------------------->
			
			<div id="member_modify_page2" style="display: none;">

					<div id="member_modify_category-wrap">
						<div id="member_modify_category-frame">
							<b class="member_modify_category-anoun">관심있는 카테고리를 선택해 주세요.(최대 3개)</b>	
							<ul id="member_modify_category-list">
								<%-- 카테고리 입력되는란 --%>
							</ul>
						</div>
					</div>
					<div class="member_modify_button_container">
						<input type="button" id="member_modify_before_btn2" value="이전으로"/>
						<input type="submit" id="member_modify_next_btn2" value="수정완료" />
					</div>
				</div>
			</div>
	</div>
	</form>
</body>
</html>
<%@ include file="../include/footer.jsp"%>