<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/find_pass.css" />
<link rel="stylesheet" type="text/css" href="./css/font.css"/>
<title>비밀번호찾기 페이지입니다</title>
</head>
<body>
<div id="find_pass_id_main_wrap">
	<form action="#" method="post">
		<div id="find_pass_main_div">
				<!-----------------로고------------------------>
				<div id="find_pass_logo_wrap">
					<a href="../index.jsp"><img id="find_pass_img_logo"src="../img/logo2.png" /></a>
				</div>
				<!--------------------링크 버튼 두개--------------------->
					<label id="find_pass_label">비밀번호 찾기</label>
					
				
				<!-------------------이름 텍필 이메일 택필---------------------->
						<div id="find_pass_sub_div">
					
						<input class="find_pass_inputbox" placeholder="아이디">
						<div class="find_pass_error" id="find_pass_error_id"></div>
						
						<input class="find_pass_inputbox" placeholder="이름">
						<div class="find_pass_error" id="find_pass_error_name"></div>
						
						<input class="find_pass_inputbox" placeholder="이메일">
						<div class="find_pass_error" id="find_pass_error_email"></div>
						
				<!------------------아이디찾기 버튼----------------------->
				<button id="find_pass_lastbtn">비밀번호 찾기</button>

			</div>
		</div>
	</form>
	</div>
</body>
</html>
