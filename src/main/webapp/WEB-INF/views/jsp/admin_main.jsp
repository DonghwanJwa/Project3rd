<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@include file="../include/admin_header.jsp" %>
	<%-- 관리자 페이지 중단 (BODY) 시작 --%>
	<div id="adm_main_body">
		
		<div id="adm_main_cont">

		<%-- 최신 공지 --%>
		<form action="admin_main">
		<div class="adm_main_notice">
			<h2>공지사항</h2>
			<div class="adm_table_wrap">
			<table class="adm_main_table">
				<c:forEach begin="0" end="4" step="1" var="n" items="${newNotice}"> <%-- 최신공지 5개 출력 --%>
				<tr>
					<th><a href="admin_notice_cont?no=${n.noti_no}&state=cont">${n.noti_title}</a></th>  <td>${n.noti_name}</td>  <td>${n.noti_date}</td>
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		</form>
		<%-- 최신 신고 --%>
		<div class="adm_main_accuse">
			<h2>신고사항</h2>
			<div class="adm_table_wrap">
			<table class="adm_main_table2">
				<c:forEach begin="0" end="4" step="1" var="a" items="${newAccuse}"> <%-- 최신공지 5개 출력 --%>
				<tr>
					<th style="width:130px;"><a href="admin_accuse_info?no=${a.ac_no}">${a.ac_reason}</a></th>  <td id="adm_ac_cont">${a.ac_cont}</td> <td style="width:130px;"><c:if test="${a.ac_item == 1}">회원신고</c:if><c:if test="${a.ac_item == 2}">게시물신고</c:if></td> <td style="width:130px;">${a.ac_date}</td>
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		
		<%-- 최신 문의 --%>
		<div class="adm_main_inquire">
			<h2>문의사항</h2>
			<div class="adm_table_wrap">
			<table class="adm_main_table3">
				<c:forEach begin="0" end="4" step="1" var="i" items="${newInquire}"> <%-- 최신공지 5개 출력 --%>
				<tr>
					<th style="width:130px;"><a href="admin_inquire_info?no=${i.inq_no}">${i.inq_item1}</a></th>  <td id="adm_inq_cont">${i.inq_cont}</td>  <td style="width:130px;"><c:if test="${!empty i.mem_no}">회원문의</c:if><c:if test="${empty i.mem_no}">비회원문의</c:if></td> <td style="width:130px;">${i.inq_date}</td>
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		</div>
	</div>
	
	<%-- 관리자 페이지 중단 (CONTENT) 끝 --%>
	<%@include file="../include/admin_footer.jsp" %>
</body>
</html>