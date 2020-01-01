<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pass_modify.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font.css"/>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/pass_modify.js"></script>
<title>비밀번호수정페이지입니다</title>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<div id ="pass_modify_main_wrap">
	 <form id="pass_modify_form" method="post" action="pass_modify_ok" onsubmit="return pass_ok();">
		<div id="pass_modify_main_div">
					<a href="${pageContext.request.contextPath}/"><img id="pass_modify_img_logo"
						src="${pageContext.request.contextPath}/resources/img/logo2.png" /></a>
				
			<div id="pass_modify_sub_div">
					
						<div class="pass_modify_color">
                        <input id="pass_modify_id" name="pass_modify_id" class="pass_modify_text" readonly="readonly" value="${m.mem_id }"></div>
						<div class="pass_modify_error" id="pass_modify_error_pass"></div>						
						
						<div class="pass_modify_color">
                        <input tabindex="1" id="pass_modify_pass" name="pass_modify_pass" class="pass_modify_text" placeholder="비밀번호" type="password" ></div>
                        <c:if test="${modify_fail eq null }">
						 <div class="pass_modify_error" id="pass_modify_error_pass_check"></div>						
						</c:if>
						<c:if test="${modify_fail ne null }">
						 <div class="pass_modify_error" id="pass_modify_error_pass_check">비밀번호가 일치하지 않습니다!</div>						
						</c:if>

               <input type="submit" id="pass_modify_lastbtn" value="비밀번호 확인"/>
			</div>
		</div>
	 </form>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>