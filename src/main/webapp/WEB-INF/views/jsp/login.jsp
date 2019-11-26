<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/login.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/font.css"/>	
<script src="../resources/js/jquery.js"></script>
<script src="../resources/js/login.js"></script>
<title>로그인 페이지입니다</title>
</head>
<body>
<div id ="login_main_wrap">
<form id="login_main_form" action="#" method="post" onsubmit="return login();">
		<div id="login_main_div">
			<div id="login_logo_wrap">
			 <a href="../index.jsp"><img id="login_img_logo" src="../resources/img/logo2.png"/></a>
			</div>
			
			<div id="login_mid">
			
				<!-- ---------------------아이디필드------------------------------------------ -->
				
				<div class="login_color"><input id="login_id" type="text" placeholder="아이디" ></div> 
				<div class="login_error" id="login_id_error"></div>

				
				<!-- ---------------------비밀번호 필드------------------------------------------ -->
								
				<div class="login_color"><input id="login_pass" type="text" placeholder="비밀번호" onblur="checkempty(this)"></div>
				<div class="login_error" id="login_pass_error"></div>
				
				<!-- ---------------------버튼------------------------------------------ -->
								
				<button class="login_btn_color" id="login_btn" type="submit" onclick="#">로그인</button>
				<button class="login_btn_color" id="login_btn_join_membership" type="submit" onclick="location.href='join_membership.jsp'">회원가입</button>
			
			</div>
			
			<div id="login_bottom">
				<div class="login_bottom_link"><a href="find_id">계정을 잃어버리셨나요?</a></div> <div class="login_bottom_link"><a href="find_pass">비밀번호를 잊으셨나요?</a></div>
			</div>
			</div>
	</form>
</div>
</body>
</html>