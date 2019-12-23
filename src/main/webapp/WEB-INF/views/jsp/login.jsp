<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/login.css" />
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/font.css"/>	
<script src="/jamong.com/resources/js/jquery.js"></script>
<script src="/jamong.com/resources/js/login.js"></script>
<title>로그인 페이지입니다</title>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<div id ="login_main_wrap">
 <div id="login_main_div">
  <div id="login_logo_wrap">
   <a href="/jamong.com/">
    <img id="login_img_logo" src="/jamong.com/resources/img/logo2.png"/>
   </a>
  </div>
  <input type="hidden" id="login_back_page" value="${ref}"/>
  <div id="login_mid">
   <div class="login_color">
    <input id="login_id" name="login_id" type="text" placeholder="아이디" autocomplete="off" tabindex="1">
   </div> 
   <div class="login_error" id="login_id_error"></div>
   <div class="login_color">
	<input type="password" id="login_pwd" name="login_pwd" type="text" placeholder="비밀번호" tabindex="2"/>
   </div>
   <div class="login_error" id="login_pwd_error"></div>
   <input type="button" class="login_btn_color" id="login_btn" value="로그인" tabindex="3"/>
   <input type="button" class="login_btn_color" id="login_btn_join_membership" value="회원가입" onclick="location.href='/jamong.com/join_membership'"/>
  </div>
  <div id="login_bottom">
   <div class="login_bottom_link">
	<a href="/jamong.com/find_id">계정을 잃어버리셨나요?</a>
   </div> 
 </div>
 </div>
</div>
<script>
 $('#login_id').focus();
</script>
 </body>
</html>