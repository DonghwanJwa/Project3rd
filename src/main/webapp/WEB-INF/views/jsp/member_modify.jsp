<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.jamong.domain.MemberVO,java.util.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/member_modify.css" />
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/font.css"/>
<script src="/jamong.com/resources/js/jquery.js"></script>
<script src="/jamong.com/resources/js/member_modify.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<div id="member_modify_main_wrap">
<form method="post" action="member_modify_ok">
 <div class="wrap-loading" style="display:none">
      <div>
       <img src="/jamong.com/resources/img/loading1.gif" />
      </div>
	 </div>

	<div id="member_modify_main_div"><!-- 겉에 싸고 있는 박스 -->
					<div id="member_modify_h4_div"><h4 id="member_modify_h4">${vo.mem_id }님의 정보를 수정해주세요!</h4></div>		
					
	<div id="#member_modify_sub_div"><!-- 겉에 싸고 있는 박스 -->
					<table  id="member_modify_table">	
						<colgroup>
						<col style="width:30%">
						<col style="width:70%">
						
					</colgroup>
					<tr>
					<th>이름</th>
					<td>
						<input placeholder="이름" class="member_modify_text" value="${vo.mem_name}" id="member_modify_name" name="mem_name">
						<div class="member_modify_error" id="member_modify_error_name"></div>
					</td>
					</tr>

					<tr>
					<th>생년월일</th>
					<td>
						<span id="member_modify_birth_span"> 
							<input placeholder="년" value="${vo.mem_birth1 }" class="member_modify_text birth" id="member_modify_birth_year" name="mem_birth1" maxlength="4"> 년 
							<input placeholder="월" value="${vo.mem_birth2 }" class="member_modify_text birth" id="member_modify_birth_month" name="mem_birth2" maxlength="2"> 월 
							<input placeholder="일" value="${vo.mem_birth3 }" class="member_modify_text birth" id="member_modify_birth_date" name="mem_birth3"  maxlength="2"> 일 
						</span> 
						<div class="member_modify_error"id="member_modify_error_birth"></div>
					</td>
					</tr>
					
					<tr>
					<th>전화번호</th>
					<td>
						<div id="member_modify_tel_color">
							<div class="member_modify_tel_hover_focus">
								  <input class="member_modify_text tel" id="member_modify_tel1" value="${vo.mem_phone01 }" name="mem_phone01" placeholder="010" maxlength="3" 
								> - <input class="member_modify_text tel" id="member_modify_tel2" value="${vo.mem_phone02 }" name="mem_phone02" placeholder="0000" maxlength="4" 
								> - <input class="member_modify_text tel" id="member_modify_tel3" value="${vo.mem_phone03 }" name="mem_phone03" placeholder="0000" maxlength="4" >
							</div>
							<div class="member_modify_error" id="member_modify_error_tel"></div>
						</div>
					</td>
					</tr>

					<tr>
					<th>이메일</th>
					<td>
						<div class="member_modify_email_class">
							<input class="member_modify_text email" value="${vo.email_id }" id="member_modify_email" name="email_id" placeholder="이메일">
						</div>
						<b id="member_modify_email_atMark">@</b> 
							<input class="member_modify_text email domain" type="text" list="browsers" value="${vo.email_domain }" id="member_modify_email_datalist"  name="email_domain" placeholder="도메인" >
						<datalist id=browsers>
							<option value="naver.com">
							<option value="daum.com">
							<option value="gmail.com">
							<option value="nate.com">
						</datalist>
						<button type="button" id="member_modify_certified_btn" >인증</button>
						<div class="member_modify_error"id="member_modify_error_email_domain"></div>
					</td>
					</tr>

					<tr>
					<th>인증번호</th>
					<td>
					<!-- style="display:none;" -->
						<!-- 인증번호 확인란 이름바꾸고 css 가져와야하고 인증 기능 넣어야함 -->
					<div id="member_modify_emailcheck_div" style="display:none;">
						<input type="text" placeholder="인증번호 입력란" maxlength="6" class="member_modify_text emailcheck" id="member_modify_emailcheck"/>
						<button type="button" id="member_modify_emailcheck_btn" >확인</button>
					<div class="member_modify_error" id="member_modify_error_email_check"></div>
					</div>
					</td>
					</tr>
					
					<tr>
					<th>
					<button type="button" id="member_modify_pwd_modify">비밀번호 변경</button>
					</th>
					<td></td>
					</tr>
					
					<tr class="hide_box">
					<th>비밀번호 수정</th>
					<td>
						<input type="password" placeholder="비밀번호" class="member_modify_text" id="member_modify_pass" name="mem_pwd">
						<div class="member_modify_error" id="member_modify_error_pass"></div>
					</td>
					</tr>
					
					<tr  class="hide_box">
					<th>비밀번호 확인</th>
					<td>
						<input type="password" placeholder="비밀번호 확인" class="member_modify_text pwd_check" id="member_modify_pass_check">
						<button type="button" id="member_pwd_modify">수정</button>
						<div class="member_modify_error"id="member_modify_error_pass_check"></div>
					</td>
					</tr>
					
					
						</table>
						</div>
						<div id="member_modify_next_btn_div">
						<div id="member_modify_p"><p>* 이메일이 수정되었을 시 인증을 다시 받아주세요 </p></div>
						<input type="submit" id="member_modify_next_btn"  value="수정완료" />
						</div>
				</div>
	</form>
			</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>