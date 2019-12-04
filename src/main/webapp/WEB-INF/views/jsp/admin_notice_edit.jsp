<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<%@include file="../include/admin_header.jsp" %>
<form method="post" action="admin_notice_edit" onsubmit="return notice_check();">
<input type="hidden" name="noti_no" value="${n.noti_no}" />
<input type="hidden" name="page" value="${page}" />

		<h2 align="center">공지사항 수정</h2>
	<div id="notice_write_wrap">
		<table id="notice_write_form">
			<tr>
				<th>작성자 :</th>
				<td>
					<input name="noti_name" id="noti_name" class="notice_text_field" value="${n.noti_name}" size="20">
				</td>
			</tr>

			<tr>
				<th>비밀번호 :</th> 
				<td>
					<input type="password" name="noti_pwd" id="noti_pwd" class="notice_text_field" size="14"/>
				</td>
			</tr>
			
			<tr>
				<th width="15%">제목 :</th> 
				<td width="85%">
					<input name="noti_title" id="noti_title" class="notice_text_field" value="${n.noti_title}" size="20" />
				</td>
			</tr>
			
			<tr>
				<th colspan="2">공지내용</th>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="noti_cont" id="noti_cont" class="notice_text_field" cols="80" rows="40">${n.noti_cont}</textarea>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="공지수정" id="notice_submit_btn"/>
					<input type="button" value="목록" onclick="location='admin_notice?page=${page}';" class="notice_btn"/>
				</th>
			</tr>
		</table>
	</div>
</form>
<%@include file="../include/admin_footer.jsp" %>
</html>