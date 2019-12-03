<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/joinmembership.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/font.css"/>
<link rel="stylesheet" type="text/css" href="./resources/css/header.css" />
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/login.js"></script>
<title>회원가입 페이지입니다</title>
</head>
<body>
	<div id="join_membership_main_wrap">

		<div id="join_membership_main_div">
			<!-------------------------------로고------------------------------------>
			<div id="join_membership_img_logo" >
				<a href="./"><img src="./resources/img/logo2.png" /></a>
				<div id="join_membership_sequence_box">
					<ol id="join_membership_sequence">
						<li><span class="join_membership_sequence_list membership_step">기본정보</span></li>
						<li><span class="join_membership_sequence_list">프로필</span></li>
						<li><span class="join_membership_sequence_list">카테고리</span></li>
					</ol>
				</div>
			</div>

			<!-------------------------------아이디, 비번, 비번확인, 이름,------------------------------------>

			<div id="join_membership_sub_div_1">

				<input placeholder="아이디" class="join_membership_text"
					id="join_membership_id" tabindex="1"/>
				<div class="join_membership_error" id="join_membership_error_id"></div>


				<input type="password" placeholder="비밀번호" tabindex="2"
					class="join_membership_text" id="join_membership_pass">
				<div class="join_membership_error" id="join_membership_error_pass"></div>

				<input type="password" placeholder="비밀번호 확인" tabindex="3"
					class="join_membership_text" id="join_membership_pass_check">
				<div class="join_membership_error"
					id="join_membership_error_pass_check"></div>

				<input placeholder="이름" class="join_membership_text" tabindex="4" 
					id="join_membership_name">
				<div class="join_membership_error" id="join_membership_error_name"></div>

			</div>

			<!-- 두번째 디브--------------------------------- -->

			<div id="join_membership_sub_div_2">

				<span id="join_membership_birth_span">
					<input placeholder="년" class="join_membership_birth numberOnly" id="join_membership_birth_year" tabindex="5" maxlength="4">
					<input placeholder="월" class="join_membership_birth numberOnly" id="join_membership_birth_month" tabindex="6" maxlength="2">
					<input placeholder="일" class="join_membership_birth numberOnly" id="join_membership_birth_date" tabindex="7" maxlength="2">
				</span> 
					
				<select id="join_membership_select_gender" tabindex="8">
					<option value="	성별">성별</option>
					<option value=" 남자">남자</option>
					<option value=" 여자">여자</option>
				</select>

				<div class="join_membership_error" id="join_membership_error_birth"></div>

				<div class="join_membership_email_class">
					<input class="join_membership_email" tabindex="9"
							id="join_membership_email" placeholder="이메일">
				</div>			 
				<b id="join_membership_email_atMark">@</b> 
				<input type=text list=browsers id="join_membership_email_datalist"
					placeholder="도메인" tabindex="10">
				<datalist id=browsers>
					<option value="naver.com">
					<option value="daum.com">
					<option value="gmail.com">
					<option value="nate.com">
				</datalist>
				<button id="join_membership_certified_btn" tabindex="11">인증</button>
				<div class="join_membership_error"
					id="join_membership_error_email_domain"></div>



				<div id="join_membership_tel_color">
					<div class="join_membership_tel_hover_focus">
						<input class="join_membership_tel numberOnly" id="join_membership_tel1" placeholder="010" maxlength="3"tabindex="12">-
						<input class="join_membership_tel numberOnly" id="join_membership_tel2" placeholder="0000" maxlength="4"tabindex="13">-
						<input class="join_membership_tel numberOnly" id="join_membership_tel3" placeholder="0000" maxlength="4"tabindex="14">	
					</div>
					<div class="join_membership_error" id="join_membership_error_tel"></div>
				</div>

				<button id="join_membership_next_btn"tabindex="15" onclick="change1();">다음으로</button>
			</div>
		</div>


		<!-- ///////////////////////////두번째 페이지 시작//////////////////////////////////// -->



		<div id="join_membership_main_div2" style="display: none;">
			<!-------------------------------로고------------------------------------>
			<div id="join_membership_img_logo" >
				<a href="./"><img src="./resources/img/logo2.png" /></a>
				<div id="join_membership_sequence_box">
					<ol id="join_membership_sequence">
						<li><span class="join_membership_sequence_list">기본정보</span></li>
						<li><span class="join_membership_sequence_list membership_step">프로필</span></li>
						<li><span class="join_membership_sequence_list">카테고리</span></li>
					</ol>
				</div>
			</div>

			<!--///////////////////////////광훈이 프로필페이지 가져옴/////////////////////////////////////////////  -->

			<div id="join_membership_profile_main_edit">
				<div id="join_membership_profile_edit_title"></div>
				<article id="join_membership_profile_main_edit_article">
					<div>
						<img id="join_membership_profile_edit_img" alt="이미지" src="./resources/img/profile.jpg">
						<span id="join_membership_profile_img_edit_button"> 
						<label for="profile_img" class="join_membership_profile_font_hide"></label> 
						<div id="imagePriview">
					        <form target="Upload" enctype="multipart/form-data"action="write_cover_ok" method="post">
							<input class="join_membership_profile_input_hide" type="file" name="file" accept="image/*"/>
							</form>
							</div>
						</span>
					</div>
					<div>
						<div>
							<div>
								<h3 class="">
									<input type="hidden" id="join_membership_profile_edit"> <label
										for="profile_editor" class="join_membership_profile_edit_font">작가명</label> <span></span>
								</h3>
								<textarea id="join_membership_profile_editor" name="" placeholder="이름을 입력해주세요"
									maxlength="30"></textarea>
							</div>
						</div>
					</div>
					<div>
						<div>
							<h3>
								<label></label> <span></span>
							</h3>
						</div>
						<div>
							<h3 class="join_membership_profile_edit_font">자기소개</h3>
						</div>
						<div class="join_membership_profile_editor_box">
							<textarea class="join_membership_profile_edit_info" placeholder="자신을 소개해보세요"></textarea>
						</div>
						<!-- 경고문 띄우기 -->
						<button type="button" class="join_membership_profile_edit_btn2" onclick="change2();">넘어가기</button>
					</div>
				</article>
			</div>
		</div>

		<!-- =========================세번쨰 페이지 시작======================================================== -->



		<div id="join_membership_main_div3" style="display: none;">
			<!-------------------------------로고------------------------------------>
			<div id="join_membership_img_logo" >
				<a href="./"><img src="./resources/img/logo2.png" /></a>
				<div id="join_membership_sequence_box">
					<ol id="join_membership_sequence">
						<li><span class="join_membership_sequence_list">기본정보</span></li>
						<li><span class="join_membership_sequence_list">프로필</span></li>
						<li><span class="join_membership_sequence_list  membership_step">카테고리</span></li>
					</ol>
				</div>
			</div>

			<%-- category --%>
			<div id="join_membership_head-page-category-wrap">
				<div id="join_membership_head-page-category-frame">
					<ul id="join_membership_head-page-category-list">
						<%
							for (int i = 1; i <= 15; i++) {
						%>
						<li class="join_membership_head-page-category-item">
							<div id="join_membership_color_border">
								<input type="checkbox" /> 카테고리
							</div>
						</li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
				<button id="join_membership_category_btn">가입하기</button>
		</div>
	</div>
</body>
</html>
