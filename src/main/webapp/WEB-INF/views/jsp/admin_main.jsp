<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/admin.css" />
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/admin.js"></script>
</head>
<%@include file="../include/admin_header.jsp" %>
	<%-- 관리자 페이지 중단 (BODY) 시작 --%>
	<div id="adm_main_body">
		
		<div id="adm_main_cont">

		<%-- 최신 공지 --%>
		<div class="adm_main_notice">
			<h2>공지사항</h2>
			<div class="adm_table_wrap">
			<table class="adm_main_table">
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST1</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST2</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST3</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST4</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST5</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
			</table>
			</div>
		</div>
		
		<%-- 최신 신고 --%>
		<div class="adm_main_accuse">
			<h2>신고사항</h2>
			<div class="adm_table_wrap">
			<table class="adm_main_table">
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST1</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST2</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST3</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST4</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST5</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
			</table>
			</div>
		</div>
		
		<%-- 최신 문의 --%>
		<div class="adm_main_inquire">
			<h2>문의사항</h2>
			<div class="adm_table_wrap">
			<table class="adm_main_table">
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST1</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST2</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST3</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST4</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
				<tr>
					<th><a href="adm_notice_cont?page=${page}&${no}">TEST5</a></th>  <td>작성자</td>  <td>0000.00.00 00:00:00</td>
				</tr>
			</table>
			</div>
		</div>
		</div>
	</div>
	
	<%-- 관리자 페이지 중단 (CONTENT) 끝 --%>
	<%@include file="../include/admin_footer.jsp" %>
</body>
</html>