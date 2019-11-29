<jsp:include page="../include/header.jsp" />
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./resources/js/profile.js"></script>
<link rel=stylesheet type="text/css" href="./resources/css/profile.css">
<title></title>
</head>
<body>
	<div id="profile_main_edit">
		<div id="profile_edit_title">
			<h3 id="edit_text">프로필 편집</h3>
		</div>
		<article id="profile_main_edit_article">
			<div>
				<img id="profile_edit_img" alt="이미지" src="./resources/img/profile.jpg">
				<form enctype="multipart/form-data" action="">
					<span id="profile_img_edit_button"> <label for="profile_img"
						class="profile_font_hide"
					></label> <input class="profile_input_hide" type="file" name="file"
							accept="image/*"
						> <!-- type="file" 파일을 업로드 하는기능
					accept=""UI에서 해당되는 파일 목록만 접근시킨다.
					image/*은 모든 이미지파일을 보여줌
					(IE10이상에서 사용가능 및 HTML 4와 5의 값 차이가 있음)-->
					</span>
				</form>
			</div>
			<!-- enctype전송되는 데이터 형식을 설정함. 종류는 총3가지
	1. application/www-form-urlencoded(default값 폼데이터는 서버로 전송되기전에 URL-Encode 됨)
	2. multipart/form-data (파일이나 이미지를 서버로 전송할 경우 이방식을 사용)
	3. text/plain 이 형식을 인코딩을 하지않은 문자 상태로 전송
	-->
			<!--  onsubmit="return false"를 사용하면 action이 실행되지않음 -->
			<form onsubmit="return false;" method="post" autocomplete="off">
				<div>
					<div>
						<div>
							<h3 class="">
								<input type="hidden" id="profile_edit">
								<label for="profile_editor" class="profile_edit_font">작가명</label>
								<!--  for을 사용해서 라벨을 눌러도 텍스트 박스에 적용되도록 함(구조?) -->
								<span></span>
							</h3>
							<textarea id="profile_editor" name="" placeholder="이름을 입력해주세요"
								maxlength="30"
							></textarea>
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
				<!-- 여기서부터는 작가항목입니다 -->
					<div>
						<h3 class="profile_edit_font">키워드</h3>
					</div>
					<div class="">
						<input type="text" id="keyword_tag" class="keyword_box"
							placeholder="엔터로 원하는 키워드를 입력해주세요" maxlength="8"	>
							<button class="keyword_button"></button>
						<ul id="edit_tag_list">
						</ul>
					</div>
				</div>
				<div>
					<h3 class="profile_edit_font">포트폴리오</h3>
					
						<div id="profile_portflio" contenteditable="true" class="profile_edit_info" 
						 placeholder=""></div>
				</div>
				<div id="profile_edit_button">
					<!-- 경고문 띄우기 -->
					<button type="button" class="profile_edit_btn1">취소하기</button>
					<button type="button" class="profile_edit_btn2">저장하기</button>
				</div>
			</form>
		</article>
	</div>
</body>
</html>
<jsp:include page="../include/footer.jsp" />