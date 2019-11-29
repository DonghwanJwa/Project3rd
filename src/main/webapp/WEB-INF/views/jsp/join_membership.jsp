<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/joinmembership.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/font.css"/>
<link rel=stylesheet type="text/css" href="./resources/css/profile.css">
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
			</div>

			<div id="join_membership_sequence_box">
				<div id="join_membership_label_box">
					<label id="join_membership_label">JA-MONG 계정 만들기</label>
				</div>
				<ol id="join_membership_sequence">
					<li>1.회원가입</li>
					<li>2.프로필</li>
					<li>3.카테고리</li>
				</ol>
			</div>
			<!-------------------------------아이디, 비번, 비번확인, 이름,------------------------------------>

			<div id="join_membership_sub_div_1">

				<input placeholder="아이디" class="join_membership_text"
					id="join_membership_id" tabindex="1" onkeydown="JavaScript:Enter_Check();" />
				<div class="join_membership_error" id="join_membership_error_id"></div>


				<input type="password" placeholder="비밀번호"
					class="join_membership_text" id="join_membership_pass">
				<div class="join_membership_error" id="join_membership_error_pass"></div>

				<input type="password" placeholder="비밀번호 확인"
					class="join_membership_text" id="join_membership_pass_check">
				<div class="join_membership_error"
					id="join_membership_error_pass_check"></div>

				<input placeholder="이름" class="join_membership_text"
					id="join_membership_name">
				<div class="join_membership_error" id="join_membership_error_name"></div>

			</div>

			<!-- 두번째 디브--------------------------------- -->

			<div id="join_membership_sub_div_2">

				<span id="join_membership_birth_span">
				<input placeholder="년" class="join_membership_birth" id="join_membership_birth_year" ><input placeholder="월" class="join_membership_birth" id="join_membership_birth_month"><input placeholder="일" class="join_membership_birth" id="join_membership_birth_date">
				</span> 
					
					<select id="join_membership_select_gender">
					<option value="	성별">성별</option>
					<option value=" 남자">남자</option>
					<option value=" 여자">여자</option>
				</select>

				<div class="join_membership_error" id="join_membership_error_birth"></div>

				<input class="join_membership_email_class"
					id="join_membership_email" placeholder="이메일"> @ <input
					type=text list=browsers id="join_membership_email_datalist"
					placeholder="도메인">
				<datalist id=browsers>
					<option value="naver.com">
					<option value="daum.com">
					<option value="gmail.com">
					<option value="nate.com">
				</datalist>
				<button id="join_membership_certified_btn">인증</button>
				<div class="join_membership_error"
					id="join_membership_error_email_domain"></div>



				<div id="join_membership_tel_color">
					<div class="join_membership_tel_hover_focus">
						<input id="join_membership_tel" placeholder="핸드폰번호 ">
					</div>
					<div class="join_membership_error" id="join_membership_error_tel"></div>
				</div>

				<button id="join_membership_last_btn" onclick="join_membership();" onclick="change();">다음으로</button>
			</div>
		</div>


		<!-- ///////////////////////////두번째 페이지 시작//////////////////////////////////// -->



		<div id="join_membership_main_div2" style="display: none;">
			<!-------------------------------로고------------------------------------>
			<div id="join_membership_img_logo">
				<a href="./resources/index.jsp"><img src="./resources/img/logo2.png" /></a>
			</div>

			<div id="join_membership_sequence_box">
				<div id="join_membership_label_box">
					<label id="join_membership_label">JA-MONG 계정 만들기</label>
				</div>
				<ol id="join_membership_sequence">
					<li>1.회원가입</li>
					<li>2.프로필</li>
					<li>3.카테고리</li>
				</ol>
			</div>

			<!--///////////////////////////광훈이 프로필페이지 가져옴/////////////////////////////////////////////  -->

			<div id="join_membership_profile_main_edit">
				<div id="profile_edit_title"></div>
				<article id="profile_main_edit_article">
					<div>
						<img id="profile_edit_img" alt="이미지" src="./resources/img/profile.jpg">
						<span id="profile_img_edit_button"> <label
							for="profile_img" class="profile_font_hide"></label> <input
							class="profile_input_hide" type="file" name="file"
							accept="image/*">
						</span>
					</div>
					<div>
						<div>
							<div>
								<h3 class="">
									<input type="hidden" id="profile_edit"> <label
										for="profile_editor" class="profile_edit_font">작가명</label> <span></span>
								</h3>
								<textarea id="profile_editor" name="" placeholder="이름을 입력해주세요"
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
							<h3 class="profile_edit_font">자기소개</h3>
						</div>
						<div class="profile_editor_box">
							<textarea class="profile_edit_info" placeholder="자신을 소개해보세요"></textarea>
						</div>
						<!-- 경고문 띄우기 -->
						<button type="button" class="join_membership_profile_edit_btn1">취소하기</button>
						<button type="button" class="profile_edit_btn2" onclick="change2();">넘어가기</button>
					</div>
				</article>
			</div>
		</div>

		<!-- =========================세번쨰 페이지 시작======================================================== -->



		<div id="join_membership_main_div3" style="display: none;">
			<!-------------------------------로고------------------------------------>
			<div id="join_membership_img_logo">
				<a href="./resources/index.jsp"><img src="./img/resources/logo2.png" /></a>
			</div>

			<div id="join_membership_sequence_box">
				<div id="join_membership_label_box">
					<label id="join_membership_label">JA-MONG 계정 만들기</label>
				</div>
				<ol id="join_membership_sequence">
					<li>1.회원가입</li>
					<li>2.프로필</li>
					<li>3.카테고리</li>
				</ol>
			</div>

			<%-- category --%>
			<div id="head-page-category-wrap">
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
