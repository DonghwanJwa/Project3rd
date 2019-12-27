<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@include file="../include/admin_header.jsp" %>
<div id="adm_page_title"><h3 class="adm_page_title">제안사항 열람</h3></div>
<div id="adm_mem_info_wrap">
<form method="post" name="file_down">
<input type="hidden" value="${no}" name="no"/>

	<h4>1.&nbsp;작가정보</h4>
	<div class="adm_table_wrap">
	<table border="1" class="adm_member_table">
		<tr>
			<th align="center">회원상태</th>
			<td align="center">
				<c:if test="${ao.mem_state == 0 || ao.mem_state == 9}"><font color="blue">활동</font></c:if>
				<c:if test="${ao.mem_state == 1}"><font color="red">정지</font></c:if>
				<c:if test="${ao.mem_state == 2}">탈퇴</c:if>
			</td>
			
			<th align="center">회원구분</th>
			<td align="center">
				<c:if test="${ao.mem_author == 0 && ao.mem_state != 9}">일반</c:if>
				<c:if test="${ao.mem_author == 1 && ao.mem_state != 9}"><b>작가</b></c:if>
				<c:if test="${ao.mem_state == 9 && (ao.mem_author == 0 || ao.mem_author == 1) }"><b>관리자</b></c:if>
			</td>
			
			<th align="center">가입일자</th>
			<td align="center">
				${ao.mem_date}
			</td>
		</tr>
		
		<tr>
			<th align="center">회원ID</th>
			<td align="center">
				${ao.mem_id}
			</td>
			
			<th align="center">닉네임</th>
			<td align="center">
				${ao.mem_nickname}
			</td>
			<td rowspan="3" colspan="2" align="center">
				<img src="${ao.profile_photo}" width="150" height="150"/>
			</td>
		</tr>
		
		<tr>
			<th align="center" colspan="4">
				관심 카테고리
			</th>
		</tr>
			
		<tr>
			<td align="center" colspan="4">
			<c:if test="${empty ao.mem_fav1 && empty ao.mem_fav2 && empty ao.mem_fav3}">
				등록된 관심 카테고리가 없습니다.
			</c:if>
			
			<c:if test="${!empty ao.mem_fav1 && !empty ao.mem_fav2 && !empty ao.mem_fav3}">
				${ao.mem_fav1} / ${ao.mem_fav2} / ${ao.mem_fav3}
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
				${ao.profile_cont}
			</td>
		</tr>
		
		<tr>
			<th align="center">이름</th>
			<td align="center">
				${ao.mem_name}
			</td>
			
			<th align="center">성별</th>
			<td align="center">
				${ao.mem_gender}
			</td>
			
			<th align="center">생년월일</th>
			<td align="center">
				${ao.mem_birth1}-${ao.mem_birth2}-${ao.mem_birth3}
			</td>
		</tr>
		
		<tr>
			<th align="center">연락처</th>
			<td colspan="2" align="center">
				${ao.mem_phone01}-${ao.mem_phone02}-${ao.mem_phone03}
			</td>
			
			<th align="center">이메일</th>
			<td colspan="2" align="center">
				${ao.email_id}@${ao.email_domain}
			</td>
		</tr>
		<tr>
			<th align="center" colspan="6">작가 포트폴리오</th>
		</tr>
		<tr>
			<c:if test="${!empty ao.mem_portfolio}">
			<td colspan="6" id="adm_portfolio_field">
				${ao.mem_portfolio}
			</td>
			</c:if>
			<c:if test="${empty ao.mem_portfolio}">
			<td align="center" colspan="6" id="adm_portfolio_field">	
				설정 된 포트폴리오 내역이 없습니다.
			</td>
			</c:if>
		</tr>
		
		<tr>
			<th colspan="6" align="center">작가 키워드</th>
		</tr>
		<tr>
			<c:if test="${!empty ao.mem_keyword}">
			<td colspan="6">
				${ao.mem_keyword}
			</td>
			</c:if>
			<c:if test="${empty ao.mem_keyword}">
			<td colspan="6" align="center">
				설정 된 작가키워드가 없습니다.
			</td>
			</c:if>
	</table>
	</div>
	<div id="cont_button_wrap">
		<input type="button" class="notice_btn" value="작가 프로필 보기" onclick="window.open('/jamong.com/@${ao.mem_id}');" />
	</div>
	<h4>2.&nbsp;제안정보</h4>
	<div class="adm_table_wrap">
	<table border="1" class="adm_member_table">
		<tr>
			<th>연락처</th> <td align="center">${ao.off_phone1}-${ao.off_phone2}-${ao.off_phone3}
			<th>이메일</th> <td align="center">${ao.off_email}@${ao.off_domain}</td>
			<th>제안 목적</th> <td align="center">${ao.off_item}</td>
		</tr>
		<tr>
			<th colspan="6">제안내용</th>
		</tr>
		<tr>
			<td colspan="6" class="author_cont_td">${ao.off_cont}</td>
		</tr>
		<tr>
			<td colspan="6" class="author_td">
			<c:if test="${fileName1 eq 'null' && fileName2 eq 'null' && fileName3 eq 'null' }">
			첨부된 파일이 없습니다.
			</c:if>
			<c:if test="${!empty ao.off_file1 && !(fileName1 eq 'null')}">
			첨부파일 1. <input type="submit" value="${fileName1}" onclick="javascript:form.action='offer_file1';" class="down_file" /> 
			</c:if>
			<br/>
			<c:if test="${!empty ao.off_file2 && !(fileName2 eq 'null')}">
			첨부파일 2. <input type="submit" value="${fileName2}" onclick="javascript:form.action='offer_file2';" class="down_file"/> 
			</c:if>
			<br/>
			<c:if test="${!empty ao.off_file3 && !(fileName3 eq 'null')}">
			첨부파일 3. <input type="submit" value="${fileName3}" onclick="javascript:form.action='offer_file3';" class="down_file"/>
			</c:if>
			</td>
		</tr>
	</table>
	</div>
	</form>
</div>

<div id="cont_button_wrap">
		<input type="button" class="notice_btn" value="회원 프로필 보기" onclick="window.open('/jamong.com/@${ao.off_id}');" />
		<input type="button" class="notice_btn" value="목록" onclick="location='admin_offer?page=${page}';" />
</div>
<%@include file="../include/admin_footer.jsp" %>
</html>