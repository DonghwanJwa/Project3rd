<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/find_id.css" />
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/font.css"/>
<script src="/jamong.com/resources/js/jquery.js"></script>
<script src="/jamong.com/resources/js/find_id&pass.js"></script>
<title></title>
</head>
<body >
 <div class="wrap-loading" style="display:none">
      <div>
       <img src="/jamong.com/resources/img/loading1.gif" />
      </div>
	 </div>
		<div id="find_id_main_wrap">
			<div id="find_id_main_div">
				<div>
					<a href="./"><img id="find_id_img_logo"src="/jamong.com/resources/img/logo2.png" /></a>
				</div>
				<div id="find_id_btn_box">
				<a href="#" class="find_id_link1 active" >아이디 찾기</a><a href="#" class="find_id_link2">비밀번호 찾기</a>
				</div>

						<div id="find_id_sub_box_id">
						<input class="find_id_text" id="find_id_name" name="mem_name" placeholder="이름" tabindex="1"/><div class="find_id_error" id="find_id_error_id"></div>
						<input class="find_id_text1" id="find_id_email" name="email_id" placeholder="이메일" tabindex="2"/> @
						<input class="find_id_text1" id="find_id_domain"name="email_domain" placeholder="도메인" tabindex="3"/>
						<div class="find_id_error" id="find_id_error_pass"></div>
						<button type="button" id="find_id_btn" >아이디 찾기</button>
						
						<div id="find_id_sub_box_pass">
						<input class="find_id_text" name="namew" placeholder="이름"/>
						<div class="find_id_error" id="find_id_error_id"></div>
						<input class="find_id_text1" id="find_id_email" name="email_id" placeholder="이메일" tabindex="2"/> @
						<input class="find_id_text1" id="find_id_domain"name="email_domain" placeholder="도메인" tabindex="3"/>
						<div class="find_id_error" id="find_id_error_pass"></div>
						<button type="button" id="find_id_btn" >아이디 찾기</button>
						
						
						<!-- 아이디 찾기 페이지에서 비번찾기도 같이 하는 중  -->
				</div>
			</div>
		</div>
</body>
</html>








