<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@include file="../include/admin_header.jsp" %>

<div id="adm_page_title"><h3 class="adm_page_title">회원정보 열람</h3></div>
<div id="adm_mem_info_wrap">
	<div class="adm_table_wrap">
	<table border="1" class="adm_member_table">
		<tr>
			<th align="center">회원상태</th>
			<td align="center">
				<c:if test="${me.mem_state == 0 || me.mem_state == 9}"><font color="blue">활동</font></c:if>
				<c:if test="${me.mem_state == 1}"><font color="red">정지</font></c:if>
				<c:if test="${me.mem_state == 2}">탈퇴</c:if>
			</td>
			
			<th align="center">회원구분</th>
			<td align="center">
				<c:if test="${me.mem_author == 0 && me.mem_state != 9}">일반</c:if>
				<c:if test="${me.mem_author == 1 && me.mem_state != 9}"><b>작가</b></c:if>
				<c:if test="${me.mem_state == 9 && (me.mem_author == 0 || me.mem_author == 1) }"><b>관리자</b></c:if>
			</td>
			
			<th align="center">가입일자</th>
			<td align="center">
				${me.mem_date}
			</td>
		</tr>
		
		<tr>
			<th align="center">회원ID</th>
			<td align="center">
				${me.mem_id}
			</td>
			
			<th align="center">닉네임</th>
			<td align="center">
				${me.mem_nickname}
			</td>
			<td rowspan="3" colspan="2" align="center">
				<img src="${me.profile_photo}" width="150" height="150"/>
			</td>
		</tr>
		
		<tr>
			<th align="center" colspan="4">
				관심 카테고리
			</th>
		</tr>
			
		<tr>
			<td align="center" colspan="4">
			<c:if test="${empty me.mem_fav1 && empty me.mem_fav2 && empty me.mem_fav3}">
				등록된 관심 카테고리가 없습니다.
			</c:if>
			
			<c:if test="${!empty me.mem_fav1 && !empty me.mem_fav2 && !empty me.mem_fav3}">
				${me.mem_fav1} / ${me.mem_fav2} / ${me.mem_fav3}
			</c:if>
			</td>
		</tr>
		
		<tr>
			<th colspan="6" align="center">
				프로필 자기소개
			</th>
		</tr>
		<tr>
			<td colspan="6" id="adm_profile_field">
				${me.profile_cont}
			</td>
		</tr>
		
		<tr>
			<th align="center">이름</th>
			<td align="center">
				${me.mem_name}
			</td>
			
			<th align="center">성별</th>
			<td align="center">
				${me.mem_gender}
			</td>
			
			<th align="center">생년월일</th>
			<td align="center">
				${me.mem_birth1}-${me.mem_birth2}-${me.mem_birth3}
			</td>
		</tr>
		
		<tr>
			<th align="center">연락처</th>
			<td colspan="2" align="center">
				${me.mem_phone01}-${me.mem_phone02}-${me.mem_phone03}
			</td>
			
			<th align="center">이메일</th>
			<td colspan="2" align="center">
				${me.email_id}@${me.email_domain}
			</td>
		</tr>
		
		<%-- 작가 회원 분기 시작 --%>
		<c:if test="${me.mem_author == 1}">
		<tr>
			<th align="center" colspan="6">작가 포트폴리오</th>
		</tr>
		<tr>
			<c:if test="${!empty me.mem_portfolio}">
			<td colspan="6" id="adm_portfolio_field">
				${me.mem_portfolio}
			</td>
			</c:if>
			<c:if test="${empty me.mem_portfolio}">
			<td align="center" colspan="6" id="adm_portfolio_field">	
				설정 된 포트폴리오 내역이 없습니다.
			</td>
			</c:if>
		</tr>
		
		<tr>
			<th colspan="6" align="center">작가 키워드</th>
		</tr>
		<tr>
			<c:if test="${!empty me.mem_keyword}">
			<td colspan="6">
				${me.mem_keyword}
			</td>
			</c:if>
			<c:if test="${empty me.mem_keyword}">
			<td colspan="6" align="center">
				설정 된 작가키워드가 없습니다.
			</td>
			</c:if>
		</tr>
		</c:if>
		<%-- 작가 회원 분기 끝 --%>
		
		<%-- 정지 회원 분기 시작 --%>
		<c:if test="${me.mem_state == 1}">
		<tr>
			<th colspan="6">
				정지 사유
			</th>
		</tr>
		
		<tr>
			<td colspan="6">
				신고하기 페이지에서 처리된 내용 전달되야 함.
			</td>
		</tr>
		
		<tr>
			<th colspan="3">
				정지 날짜
			</th>
			<td colspan="3" align="center">
				0000-00-00
			</td>
		</tr>
		</c:if>
		<%-- 정지 회원 분기 끝 --%>
		
		<%-- 탈퇴 회원 분기 시작 --%>
		<c:if test="${me.mem_state == 2}">
		<tr>
			<th colspan="6">
				탈퇴 사유
			</th>
		</tr>
		
		<tr>
			<td colspan="6" style="height:200px;">
				${me.drop_reason}
			</td>
		</tr>
		
		<tr>
			<th colspan="3">
				탈퇴 날짜
			</th>
			<td colspan="3" align="center">
				${me.drop_date}
			</td>
		</tr>
		</c:if>
		<%-- 탈퇴 회원 분기 끝 --%>
	</table>
	</div>
	
	<div id="cont_button_wrap">
		<input type="button" value="회원 프로필" class="notice_btn" onclick="window.open('/jamong.com/@${me.mem_id}');" />
		<input type="button" value="계정정지" class="notice_btn" onclick="location='admin_member_drop?no=${me.mem_no}';" />
		<input type="button" value="회원목록" class="notice_btn" onclick="location='admin_member?page=${page}';" />
	</div>
</div>

<%@include file="../include/admin_footer.jsp" %>
</html>