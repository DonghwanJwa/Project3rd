<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/member_modify.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/member_modify_categore.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/font.css"/>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/member_modify.js"></script>
</head>
<body>
<div id="member_modify_main_wrap">
	<div id="member_modify_main_div">
		<!-------------------------------로고------------------------------------>
				<div id="member_modify_img_logo">
					<a href="./"><img src="./resources/img/logo2.png" /></a>
					<div id="member_modify_sequence_box">
						<ol id="member_modify_sequence">
							<li>
								<span class="member_modify_sequence_list membership_step"	
									id="member_modify_sequence_list1">기본정보</span>
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
							
						
						<input type="password" placeholder="비밀번호" tabindex="2"class="member_modify_text" 
						id="member_modify_pass" name="mem_pwd">
						<div class="member_modify_error" id="member_modify_error_pass"></div>

						<input type="password" placeholder="비밀번호 확인" tabindex="3"class="member_modify_text" id="member_modify_pass_check">
						<div class="member_modify_error"id="member_modify_error_pass_check"></div>

						<input placeholder="이름" class="member_modify_text" tabindex="4"id="member_modify_name" name="mem_name">
						<div class="member_modify_error" id="member_modify_error_name"></div>

					</div>

					<!------------------------------------ 두번째 디브--------------------------------- -->

					<div id="member_modify_sub_div_2">

						<span id="member_modify_birth_span"> 
							<input placeholder="년" class="member_modify_birth number2Only"	id="member_modify_birth_year" name="mem_birth1" tabindex="5" maxlength="4">
							<input placeholder="월" class="member_modify_birth number2Only" id="member_modify_birth_month" name="mem_birth2" tabindex="6" maxlength="2">
							<input placeholder="일" class="member_modify_birth number2Only" id="member_modify_birth_date" name="mem_birth3" tabindex="7" maxlength="2">
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
								<input class="member_modify_tel number2Only" id="member_modify_tel1"	name="mem_phone01" placeholder="010" maxlength="3" tabindex="12"
								>-<input class="member_modify_tel number2Only" id="member_modify_tel2" name="mem_phone02" placeholder="0000" maxlength="4" tabindex="13"
								>-<input class="member_modify_tel number2Only" id="member_modify_tel3" name="mem_phone03" placeholder="0000" maxlength="4" tabindex="14">
							</div>
							<div class="member_modify_error" id="member_modify_error_tel"></div>
						</div>
					</div>
						<input type="button" id="member_modify_next_btn" tabindex="15" value="넘어가기" />
				</div>
			
			<!-- 카테고리 --------------------------------------------------------------------------------------->
			
			<div id="member_modify_page2" style="display: none;">

					<div id="member_modify_category-wrap">
						<div id="member_modify_category-frame">
							<b class="member_modify_category-anoun">
								관심있는 카테고리를 선택해 주세요.(최대 3개)
							</b>	
							<ul id="member_modify_category-list">
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">여행</span>
									<input type="hidden" value="여행"/>
								</li>
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">감성·에세이</span>
									<input type="hidden" value="감성에세이"/>
								</li>
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">시사·이슈</span>
									<input type="hidden" value="시사이슈"/>
								</li>
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">IT 트렌드</span>
									<input type="hidden" value="IT트렌드"/>
								</li>
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">사진·촬영</span>
									<input type="hidden" value="사진촬영"/>
								</li>
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">영화 리뷰</span>
									<input type="hidden" value="영화리뷰"/>
								</li>
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">음악</span>
									<input type="hidden" value="음악"/>
								</li>
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">글쓰기 코치</span>
									<input type="hidden" value="글쓰기"/>
								</li>
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">문화·예술</span>
									<input type="hidden" value="문화예술"/>
								</li>
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">육아 이야기</span>
									<input type="hidden" value="육아이야기"/>
								</li>
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">요리·레시피</span>
									<input type="hidden" value="요리레시피"/>
								</li>
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">건강·운동</span>
									<input type="hidden" value="건강운동"/>
								</li>
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">심리 탐구</span>
									<input type="hidden" value="심리탐구"/>
								</li>
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">건축·설계</span>
									<input type="hidden"  value="건축설계"/>
								</li>
								<li class="member_modify_category-item">
									<span class="member_modify_category-span">인문학·철학</span>
									<input type="hidden" value="인문학철학"/>
								</li>
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
</body>
</html>
<%@ include file="../include/footer.jsp"%>