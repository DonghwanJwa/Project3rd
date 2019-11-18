<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/pass_modify.css" />
<link rel="stylesheet" type="text/css" href="./css/font.css"/>
<title>비밀번호수정페이지입니다</title>
</head>
<body>
	<div id ="pass_modify_main_wrap">
	<form action="#" method="post">
		<div id="pass_modify_main_div">
				<!-----------------로고------------------------>
				<div>
					<a href="../index.jsp"><img id="pass_modify_img_logo"
						src="../img/logo2.png" /></a>
				</div>
				
				<label id="pass_modify_label">비밀번호 확인</label>
				
				<!-------------------이름 텍필 이메일 택필---------------------->
				
			<div id="pass_modify_sub_div">
					
						<div class="pass_modify_color"><input class="pass_modify_text" placeholder="비밀번호"></div>
						<div class="pass_modify_error" id="pass_modify_error_pass"></div>						
						
						<div class="pass_modify_color"><input class="pass_modify_text" placeholder="비밀번호 확인"></div>
						<div class="pass_modify_error" id="pass_modify_error_pass_check"></div>						

				<!------------------아이디찾기 버튼----------------------->
				<button id="pass_modify_lastbtn">비밀번호 확인</button>

			</div>
		</div>
	</form>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>