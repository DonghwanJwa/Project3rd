<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link rel="stylesheet" type="text/css" href="./resources/css/admin.css" />
<script src="./resources/js/jquery.js"></script>
<script>
	function admin_check() {
		if($.trim($("#adm_id").val())=="") {
			alert('관리자 아이디를 입력하세요.');
			$('#adm_id').val("").focus();
			return false;
		}
		if($.trim($('#adm_pwd').val())=="") {
			alert('관리자 비밀번호를 입력하세요.');
			$("#adm_pwd").val('').focus();
			return false;
		}
	}
</script>
</head>
<body>
<div id="aLogin_back">
<div id="aLogin_wrap">
	<h2 class="aLogin_title">자몽 관리자 로그인</h2>
	<form method="post" action="admin_login_ok" onsubmit="return admin_check();">
		<table id="aLogin_t">
			<tr>
				<th>ID</th>
				<td>
				<input name="adm_id" id="adm_id" size="14" tabindex="1" />
				</td>
				
				<th rowspan="2">
					<input type="submit" value="로그인" />
				</th>
			</tr>
			
			<tr>
				<th>PW</th>
				<td>
					<input type="password" name="adm_pwd" id="adm_pwd" size="14" tabindex="2" />
				</td>
			</tr>
		</table>
	</form>
</div>
</div>
</body>
</html>