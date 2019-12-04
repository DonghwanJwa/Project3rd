<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<%@include file="../include/admin_header.jsp" %>
<form method="post" action="admin_notice_del" onsubmit="return notice_check();">
<input type="hidden" name="noti_no" value="${n.noti_no}" />
<input type="hidden" name="page" value="${page}" />
	
	<div id="notice_del_wrap">
		<table>
			<tr>
				<th colspan="2"><font color="red">주의) 삭제 후 복구할 수 없습니다.</font> <br/> 게시물 비밀번호를 입력하세요.</th>
			</tr>
			<tr>
				<th>비밀번호 :</th>
				<td><input type="password" name="noti_pwd" id="noti_pwd" size="14" /></td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="삭제" class="notice_btn"/>
					<input type="button" value="취소" class="notice_btn" onclick="location='admin_notice_cont?no=${n.noti_no}&page=${page}&state=cont';"/>
				</th>
			</tr>
		</table>
	</div>

</form>
<%@include file="../include/admin_footer.jsp" %>
</html>