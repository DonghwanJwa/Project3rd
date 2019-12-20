<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@include file="../include/admin_header.jsp" %>
<div id="adm_page_title"><h3 class="adm_page_title">작가신청 열람</h3></div>
<div id="adm_mem_info_wrap">
<form action="author_file" method="post" name="file_down">
<input type="hidden" value="${no}" name="no"/>
</form>
	<h4>1.&nbsp;회원정보</h4>
	<div class="adm_table_wrap">
	<table border="1" class="adm_member_table">
		<tr>
			<th align="center">회원상태</th>
			<td align="center">
				<c:if test="${a.memberVO.mem_state == 0 || a.memberVO.mem_state == 9}"><font color="blue">활동</font></c:if>
				<c:if test="${a.memberVO.mem_state == 1}"><font color="red">정지</font></c:if>
				<c:if test="${a.memberVO.mem_state == 2}">탈퇴</c:if>
			</td>
			
			<th align="center">회원구분</th>
			<td align="center">
				<c:if test="${a.memberVO.mem_author == 0 && a.memberVO.mem_state != 9}">일반</c:if>
				<c:if test="${a.memberVO.mem_author == 1 && a.memberVO.mem_state != 9}"><b>작가</b></c:if>
				<c:if test="${a.memberVO.mem_state == 9 && (a.memberVO.mem_author == 0 || a.memberVO.mem_author == 1) }"><b>관리자</b></c:if>
			</td>
			
			<th align="center">가입일자</th>
			<td align="center">
				${a.memberVO.mem_date}
			</td>
		</tr>
		
		<tr>
			<th align="center">회원ID</th>
			<td align="center">
				${a.memberVO.mem_id}
			</td>
			
			<th align="center">닉네임</th>
			<td align="center">
				${a.memberVO.mem_nickname}
			</td>
			<td rowspan="3" colspan="2" align="center">
				<img src="${a.memberVO.profile_photo}" width="150" height="150"/>
			</td>
		</tr>
		
		<tr>
			<th align="center" colspan="4">
				관심 카테고리
			</th>
		</tr>
			
		<tr>
			<td align="center" colspan="4">
			<c:if test="${empty a.memberVO.mem_fav1 && empty a.memberVO.mem_fav2 && empty a.memberVO.mem_fav3}">
				등록된 관심 카테고리가 없습니다.
			</c:if>
			
			<c:if test="${!empty a.memberVO.mem_fav1 && !empty a.memberVO.mem_fav2 && !empty a.memberVO.mem_fav3}">
				${a.memberVO.mem_fav1} / ${a.memberVO.mem_fav2} / ${a.memberVO.mem_fav3}
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
				${a.memberVO.profile_cont}
			</td>
		</tr>
		
		<tr>
			<th align="center">이름</th>
			<td align="center">
				${a.memberVO.mem_name}
			</td>
			
			<th align="center">성별</th>
			<td align="center">
				${a.memberVO.mem_gender}
			</td>
			
			<th align="center">생년월일</th>
			<td align="center">
				${a.memberVO.mem_birth1}-${a.memberVO.mem_birth2}-${a.memberVO.mem_birth3}
			</td>
		</tr>
		
		<tr>
			<th align="center">연락처</th>
			<td colspan="2" align="center">
				${a.memberVO.mem_phone01}-${a.memberVO.mem_phone02}-${a.memberVO.mem_phone03}
			</td>
			
			<th align="center">이메일</th>
			<td colspan="2" align="center">
				${a.memberVO.email_id}@${a.memberVO.email_domain}
			</td>
		</tr>
	</table>
	</div>
	<div class="adm_author_table">
	<h4>2.&nbsp;신청내용</h4>
	<table border="1" class="adm_member_table">
		<tr>
			<th>작가소개</th>
		</tr>
		
		<tr>
			<td>${a.aut_intro}</td>
		</tr>
		
		<tr>
			<th>작가계획</th>
		</tr>
		
		<tr>
			<td>${a.aut_plan}</td>
		</tr>
		
		<tr>
			<th>제출한 다른 글</th>
		</tr>
		
		<c:if test="${!empty a.aut_url1}">
		<tr>
			<td>첨부 URL 1. <a href="${a.aut_url1}" target="_blank">${a.aut_url1}</a></td>
		</tr>
		</c:if>
		<c:if test="${!empty a.aut_url2}">
		<tr>
			<td>첨부 URL 2. <a href="${a.aut_url2}" target="_blank" >${a.aut_url2}</a></td>
		</tr>
		</c:if>
		<c:if test="${!empty a.aut_url3}">
		<tr>
			<td>첨부 URL 3. <a href="${a.aut_url3}" target="_blank">${a.aut_url3}</a></td>
		</tr>
		</c:if>
		
		<c:if test="${!empty a.aut_file1}">
		<tr>
			<td>첨부파일 1. <a href="#" onclick="javascript:file_down.submit()">${fileName1}</a>
		</tr>
		</c:if>
	</table>
	</div>
</div>
<%@include file="../include/admin_footer.jsp" %>
</html>