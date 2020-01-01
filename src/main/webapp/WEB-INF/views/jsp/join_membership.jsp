<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/joinmembership.css" />
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/font.css" />
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/header.css" />
<script src="/jamong.com/resources/js/jquery.js"></script>
<script src="/jamong.com/resources/js/login.js"></script>
<title>회원가입 페이지입니다</title>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
   <div id="join_membership_wrap">
	<div id="join_membership_main_wrap">
	 <div class="wrap-loading" style="display:none">
      <div>
       <img src="/jamong.com/resources/img/loading1.gif" />
      </div>
	 </div>

		<form name="m" method="post" enctype="multipart/form-data" onkeydown="return captureReturnKey(event)" autocomplete="off" action="join_membership_ok">
			<div id="join_membership_main_div">
				<!-------------------------------로고------------------------------------>
				<div id="join_membership_img_logo">
					<a href="/jamong.com/"><img src="/jamong.com/resources/img/logo2.png" /></a>
					<div id="join_membership_sequence_box">
						<ol id="join_membership_sequence">
							<li>
								<span class="join_membership_sequence_list membership_step"	
									id="join_membership_sequence_list1">기본정보</span>
							</li>
							<li>
								<span class="join_membership_sequence_list"
									id="join_membership_sequence_list2">프로필</span>
							</li>
							<li>
								<span class="join_membership_sequence_list"
									id="join_membership_sequence_list3">카테고리</span>
							</li>
						</ol>
					</div>
				</div>

				<!-------------------------------아이디, 비번, 비번확인, 이름,------------------------------------>
				<div id="join_membership_page1">
					<div id="join_membership_sub_div_1">

						<input placeholder="아이디" class="join_membership_text"
							id="join_membership_id" name="mem_id" tabindex="1"   />
						<div class="join_membership_error" id="join_membership_error_id"></div>


						<input type="password" placeholder="비밀번호" tabindex="2"
							class="join_membership_text" id="join_membership_pass" name="mem_pwd"  >
						<div class="join_membership_error" id="join_membership_error_pass"></div>

						<input type="password" placeholder="비밀번호 확인" tabindex="3"
							class="join_membership_text" id="join_membership_pass_check"  >
						<div class="join_membership_error"
							id="join_membership_error_pass_check"></div>

						<input placeholder="이름" class="join_membership_text" tabindex="4"
							id="join_membership_name" name="mem_name"  >
						<div class="join_membership_error" id="join_membership_error_name"></div>

					</div>

					<!------------------------------------ 두번째 디브--------------------------------- -->

					<div id="join_membership_sub_div_2">

						<span id="join_membership_birth_span"> 
							<input placeholder="년" class="join_membership_birth numberOnly"	id="join_membership_birth_year" name="mem_birth1" tabindex="5" maxlength="4"  >
							<input placeholder="월" class="join_membership_birth numberOnly" id="join_membership_birth_month" name="mem_birth2" tabindex="6" maxlength="2"  >
							<input placeholder="일" class="join_membership_birth numberOnly" id="join_membership_birth_date" name="mem_birth3" tabindex="7" maxlength="2"  >
						</span> 
						<select id="join_membership_select_gender" name="mem_gender" tabindex="8"  >
							<option value="	성별">성별</option>
							<option value=" 남자">남자</option>
							<option value=" 여자">여자</option>
						</select>

						<div class="join_membership_error"
							id="join_membership_error_birth"></div>

						<div id="join_membership_tel_color">
							<div class="join_membership_tel_hover_focus">
								<input class="join_membership_tel numberOnly" id="join_membership_tel1"	name="mem_phone01" placeholder="010" maxlength="3" tabindex="9"  
								><b class="join_membership_tel_bar">-</b><input class="join_membership_tel numberOnly" id="join_membership_tel2" name="mem_phone02" placeholder="0000" maxlength="4" tabindex="10"  
								><b class="join_membership_tel_bar">-</b><input class="join_membership_tel numberOnly" id="join_membership_tel3" name="mem_phone03" placeholder="0000" maxlength="4" tabindex="11">
							</div>
							<div class="join_membership_error" id="join_membership_error_tel"></div>
						</div>
						
						<div>
						<div class="join_membership_email_class">
							<input class="join_membership_email" tabindex="12"
								id="join_membership_email" name="email_id" placeholder="이메일"  >
						</div>
						<b id="join_membership_email_atMark">@</b> 
						<input type="text" list="browsers" id="join_membership_email_datalist"
							name="email_domain" placeholder="도메인" tabindex="13"  >
						<datalist id=browsers>
							<option value="naver.com">
							<option value="daum.com">
							<option value="gmail.com">
							<option value="nate.com">
						</datalist>
						<button type="button" id="join_membership_certified_btn" tabindex="14">인증</button>
						</div>
						<div class="join_membership_error" id="join_membership_error_email_domain"></div>
						
						<div id="join_membership_emailcheck_div" style="display:none;" >
							<input type="text" placeholder="인증번호 입력란" tabindex="15" maxlength="6"
							class="join_membership_emailcheck numberOnly" id="join_membership_emailcheck"/>
							<button type="button" id="join_membership_emailcheck_btn" tabindex="16">확인</button>
						<div class="join_membership_error" id="join_membership_error_email_check"></div>
						</div>
					</div>
					<div class="join_membership_button_div">
					<%-- 메일인증 구현해야됨!!! --%> 
						<div class="join_membership_policy_box">
					 	 <input id="join_membership_check" type="checkbox" name="agree" >
					 	 <label id="join_membership_check_comment" id="inq_check" for="agree">
					 	   자몽의 <a href="/jamong.com/policy_terms" target="_blank">이용약관</a> 및 <a href="/jamong.com/policy_privacy" target="_blank">개인정보 처리방침</a>에 동의합니다.
					 	 </label>
					 	 <div class="join_membership_error" id="join_membership_policy_error"></div>
					 	</div>
						<input type="button" id="join_membership_next_btn" tabindex="17" value="다음으로" />
					</div>
				</div>



				<!-- ///////////////////////////두번째 페이지 시작//////////////////////////////////// -->



				<div id="join_membership_page2" style="display: none;">
					<div id="join_membership_profile_main">
						<div id="join_membership_profile_title"></div>
						<article id="join_membership_profile_main_article">
							<div>
								<img id="join_membership_profile_img">
									<span id="join_membership_profile_img_button"> 
									<input id="join_membership_profile_input_hide" name="profile_photo" type="file" accept="image/*" title="프로필 이미지" />
								</span>
							</div>
							<div>
								<div>
									<div>
										<h3>
											<label for="join_membership_profile_editor"	class="join_membership_profile_font">닉네임</label> 
										</h3>
										<textarea id="join_membership_profile_editor" name="mem_nickname" placeholder="닉네임을 입력해주세요(10자 이내)" maxlength="10"></textarea>
										<b class="join_membership_profile_anoun">닉네임을 입력하지 않으시면 아이디로 지정이 됩니다.</b>
										<div id="join_membership_profile_editor_error"></div>
									</div>
								</div>
							</div>
							<div>
								<div>
									<h3>
										<label for="join_membership_profile_info" class="join_membership_profile_font">자기소개</label>
									</h3>
								</div>
								<div class="join_membership_profile_editor_box">
									<textarea class="join_membership_profile_info" name="profile_cont" placeholder="자신을 소개해보세요(90자 이내)"></textarea>
								</div>
								<b class="join_membership_profile_anoun">자기소개는 프로필 페이지에서 수정이 가능합니다.</b>
								<!-- 경고문 띄우기 -->
								<div class="join_membership_button_container">
									<input type="button" id="join_membership_before_btn2" value="이전으로"/> 
									<input type="button" id="join_membership_next_btn2" value="다음으로"/>
								</div>
							</div>
						</article>
					</div>
				</div>

				<!-- ////////////////////////////////////세번쨰 페이지 시작////////////////////////////////////////////// -->



				<div id="join_membership_page3" style="display: none;">

					<div id="join_membership_category-wrap">
						<div id="join_membership_category-frame">
							<b class="join_membership_category-anoun">관심있는 카테고리를 선택해 주세요.(최대 3개)</b>	
							<ul id="join_membership_category-list">
								<%-- 카테고리 입력되는란 --%>
							</ul>
						</div>
					</div>
					<div class="join_membership_button_container">
						<input type="button" id="join_membership_before_btn3" value="이전으로"/>
						<input type="submit" id="join_membership_next_btn3" value="가입하기" />
					</div>
				</div>
			</div>
		</form>
		<input type="hidden" id="join_membership_email_flag" value="1"/>
	</div>
   </div>
</body>
</html>
