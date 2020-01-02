<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/find_id.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/find_id&pass.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sweetalert2.min.js"></script>
<title>글에 꿈을 담다, 자몽</title>
</head>
<body >
<div id="find_id_main_wrap">
<form  method="post" action="find_pass_ok" autocomplete="off" >
<div class="wrap-loading" style="display:none">
     <div>
       <img src="${pageContext.request.contextPath}/resources/img/loading1.gif" />
     </div>
</div>
	<div id="find_id_main_div">
		<div>
			<a id="find_id_img_logo_link" href="${pageContext.request.contextPath}/"><img id="find_id_img_logo"src="${pageContext.request.contextPath}/resources/img/logo2.png" /></a>
		</div>
			<div id="find_id_btn_box">
				<a class="find_id_link1 active" >아이디 찾기</a><a class="find_pass_link2">비밀번호 찾기</a>
			</div>
			
			<div id="find_id_sub_box_id">
				<input class="find_id_text" id="find_id_name" placeholder="이름" tabindex="1" autocomplete="off"/>
				<div class="find_id_error" id="find_id_error_id"></div>
				<input class="find_id_text_email" id="find_id_email" placeholder="이메일" tabindex="2" autocomplete="off"/> @
				<input type="text" class="find_id_text_email" id="find_id_domain" name="email_domain" placeholder="도메인" tabindex="3" autocomplete="off"/>
				<div class="find_id_error" id="find_id_error_pass"></div>
				<button type="button" id="find_id_btn" >아이디 찾기</button>
			</div>
						
			<div id="find_id_sub_box_pass">
				<input class="find_id_pass_text" id="find_id_pass_id" name="mem_id" placeholder="아이디"autocomplete="off"/>
				<div class="find_id_error" id="find_pass_error_id"></div>
				<input class="find_id_pass_text" id="find_id_pass_name" name="mem_name" placeholder="이름"autocomplete="off">
				<div class="find_id_error" id="find_pass_error_name"></div>
				<div id="find_pass_email_box">
					<input class="find_id_pass_email1" id="find_id_pass_email" name="email_id" placeholder="이메일" autocomplete="off"/> @
					<input class="find_id_pass_email2" id="find_id_pass_domain"name="email_domain" placeholder="도메인" autocomplete="off"/>
					<button type="button" id="find_id_pass_email_Certified_btn">인증</button>
					<div class="find_id_error" id="find_pass_error_email"></div>
					<div id="find_id_pass_before_certified">
						<input class="find_id_pass_Certified_text" id="find_id_pass_Certified" placeholder="인증번호" autocomplete="off">
						<button type="button" id="find_id_pass_email_Certified_next_btn" >확인</button>
						<div class="find_id_error" id="find_pass_error_Certified"></div>
					</div>
				</div>
				<div id="find_id_pass_after_certified">
					<input type="password" class="find_id_pass_text" id="find_id_pass_pass" name="mem_pwd" placeholder="비밀번호 수정" autocomplete="off"/>
					<div class="find_id_error long" id="find_pass_error_pass"></div>
					<input type="password" class="find_id_pass_text" id="find_id_pass_pass_check" placeholder="비밀번호  수정 확인" autocomplete="off"/>
					<div class="find_id_error" id="find_pass_error_pass_check"></div>
				</div>
				<input type="submit" value="비밀번호 변경" id="find_pass_pass_modify"> <%--id="find_id_btn"--%>
			</div>
						<!-- 비밀번호 수정도  -->
	</div>
</form>
</div>  
</body>
</html>








