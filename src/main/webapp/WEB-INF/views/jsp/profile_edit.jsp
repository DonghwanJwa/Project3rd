<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<script src="./resources/js/profile.js"></script>
<link rel=stylesheet type="text/css" href="./resources/css/profile.css">
<title></title>
</head>
	<div id="profile_main_edit" oncontextmenu="return false" ondragstart="return false" >
		<div id="profile_edit_title">
			<h3 id="edit_text">프로필 편집</h3>
		</div>
		<div id="profile_main_edit_article">
				<form method="post" enctype="multipart/form-data" onsubmit="return profileCheck();" autocomplete="off" name="profile_form"  action="profile_edit_ok"   >
			<div>
				<div id="profile_edit_img" style='background-image:url("${mp.profile_photo}");'>
					<span id="profile_img_edit_button"> 
					<label for="profile_img" class="profile_font_hide"></label>
					 <input id="pf_input" class="profile_input_hide"  type="file" name="profile_photo" accept="image/*">
					  <%-- type="file" 파일을 업로드 하는기능
					accept=""UI에서 해당되는 파일 목록만 접근시킨다.
					image/*은 모든 이미지파일을 보여줌
					(IE10이상에서 사용가능 및 HTML 4와 5의 값 차이가 있음)--%>
					</span>
				</div>
			</div>
			<%-- enctype전송되는 데이터 형식을 설정함. 종류는 총3가지
	1. application/www-form-urlencoded(default값 폼데이터는 서버로 전송되기전에 URL-Encode 됨)
	2. multipart/form-data (파일이나 이미지를 서버로 전송할 경우 이방식을 사용)
	3. text/plain 이 형식을 인코딩을 하지않은 문자 상태로 전송
	--%>
			<!--  onsubmit="return false"를 사용하면 action이 실행되지않음 -->
				<div>
					<div>
						<div>
							<h3 class="">
								<input type="hidden" id="profile_edit">
								<label for="profile_editor" class="profile_edit_font">닉네임</label>
								<!--  for을 사용해서 라벨을 눌러도 텍스트 박스에 적용되도록 함(구조?) -->
								<span></span>
							</h3>
							<input id="profile_editor" class="error_text"name="mem_nickname" placeholder="이름을 입력해주세요(10자 이내로)"	
									maxlength="10" value="${mp.mem_nickname}"/>
							<div id="profile_editor_error"></div>
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
						<textarea id="pf_info" class="profile_edit_info e error_text" name="profile_cont" 
						placeholder="자신을 소개해보세요(90자 이내로)" maxlength="90">${mp.profile_cont}</textarea>
					</div>
					<div id="profile_info_error"></div>
				<!-- 여기서부터는 작가항목입니다 -->
				<c:if test="${mp.mem_author == 1}">
					<div>
						<h3 class="profile_edit_font">키워드</h3>
					</div>
					<div class="">
						<input type="text" id="keyword_tag" class="keyword_box"
							placeholder="엔터로 원하는 키워드를 입력해주세요(8자 이내로)" maxlength="8"	>
							<button type="button" class="keyword_button"></button>
							<div id="profile_error_keyword" class="error_text"></div>
							
						<ul id="edit_tag_list" >
						<c:forEach items="${mp.mem_keyword.split('/')}" var="tag" varStatus="status">
						<li class='tag_item'>${tag}<span class='del_btn' idx="${status.index}"></span></li>
						</c:forEach>
						</ul>
						<input type="hidden" id="keyword_value" name="mem_keyword" value="${mp.mem_keyword}" />
					</div>
				</div>
				<div class="folio_font" >작가님의 경험을 이야기해 주세요
				<button type="button" id="flio_b"> </button>
				</div>
				<div id="pf_folio"  style="display: none;">	
				<h3 class="profile_edit_font">포트폴리오</h3>
						<textarea id="profile_portflio"  class="profile_edit_info" name="mem_portfolio"
						 >${mp.mem_portfolio}</textarea>
				</div>
				</c:if>
				<div id="profile_edit_button">
					<!-- 경고문 띄우기 -->
					<button type="button" class="profile_edit_btn1">취소하기</button>
					<button type="submit" class="profile_edit_btn2">저장하기</button>
				</div>
			</form>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>
