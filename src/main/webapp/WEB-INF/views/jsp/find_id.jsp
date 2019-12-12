<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/find_id.css" />
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/font.css"/>
<script src="/jamong.com/resources/js/jquery.js"></script>
<script src="/jamong.com/resources/js/login.js"></script>
<title>아이디찾기 페이지입니다</title>
</head>
<body >
<div id="find_id_main_wrap">
	<form action="#" method="post" onsubmit="return login_check();">
		<div id="find_id_main_div">
				<!-----------------로고------------------------>
				<div>
					<a href="./"><img id="find_id_img_logo"
						src="/jamong.com/resources/img/logo2.png" /></a>
				</div>
				<!--------------------링크 버튼 두개--------------------->
					<label id="find_id_label">아이디 찾기</label>
					<div id="find_id_sub_div">
				
				<!-------------------이름 텍필 이메일 택필---------------------->
						<div id="find_id_name_email">
						
						<input class="find_id_text" placeholder="이름"/>
						<div class="find_pass_error" id="find_id_error_id"></div>
						
						<input class="find_id_text" placeholder="이메일"/>
						<div class="find_pass_error" id="find_id_error_pass"></div>
						
						</div>
				<!------------------아이디찾기 버튼----------------------->
				<button id="find_id_lastbtn">아이디 찾기</button>

			</div>
		</div>
	</form>
	</div>
</body>
</html>








