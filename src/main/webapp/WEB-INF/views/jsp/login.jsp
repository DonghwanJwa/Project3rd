<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font.css"/>	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sweetalert2.css" />

<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sweetalert2.min.js"></script>
<title>글에 꿈을 담다, 자몽</title>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<div id ="login_main_wrap">
 <form id="login_main_form" method="post" action="${pageContext.request.contextPath}/login_ok" onsubmit="return loginOk();">
  <div id="login_main_div">
   <div id="login_logo_wrap">
    <a href="${pageContext.request.contextPath}/">
     <img id="login_img_logo" src="${pageContext.request.contextPath}/resources/img/logo2.png"/>
    </a>
   </div>
   <div id="login_mid">
    <div class="login_color">
     <input id="login_id" name="login_id" type="text" placeholder="아이디" autocomplete="off" tabindex="1" value="${fail_id}">
    </div> 
    <div class="login_error" id="login_id_error"></div>
    <div class="login_color">
	 <input type="password" id="login_pwd" name="login_pwd" type="text" placeholder="비밀번호" tabindex="2"/>
    </div>
    <c:if test="${login_fail ne null}">
     <div class="login_error" id="login_pwd_error">가입하지 않은 아이디이거나, 잘못된 비밀번호입니다!</div>
    </c:if>
    <c:if test="${login_fail eq null}">
     <div class="login_error" id="login_pwd_error"></div>
    </c:if>
    <input type="submit" class="login_btn_color" id="login_btn" value="로그인" tabindex="3"/>
    <input type="button" class="login_btn_color" id="login_btn_join_membership" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/join_membership'"/>
   </div>
   <div id="login_bottom">
    <div class="login_bottom_link">
	 <a href="${pageContext.request.contextPath}/find_id">계정을 잃어버리셨나요?</a>
    </div> 
  </div>
  </div>
 </form>
</div>
<script>
 $('#login_id').focus();
</script>
 </body>
</html>