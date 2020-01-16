<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@include file="../include/admin_header.jsp" %>
<div id="notice_cont_wrap">
	<div id="cont_title_wrap">
		<h3>${n.noti_title}</h3>
		<ul id="cont_sub_info">
			<li id="sub_info_name">
			작성자 : ${n.noti_name}
			</li>
			
			<li id="sub_info_hit">
			조회수 : ${n.noti_hit}
			</li>
			
			<li id="sub_info_date">
			${n.noti_date}
			</li>
		</ul>
	</div>
	
	<div class="clear"></div>
	
	<div id="cont_body_wrap">
		${noti_cont}
	</div>
	
	<div id="cont_button_wrap">
		<input type="button" id="notice_edit" class="notice_btn" value="공지수정" onclick="location='admin_notice_cont?no=${n.noti_no}&page=${page}&state=edit';"/>
		<input type="button" id="notice_del" class="notice_btn" value="공지삭제" onclick="location='admin_notice_cont?no=${n.noti_no}&page=${page}&state=del';"/>
		<input type="button" id="notice_list" class="notice_btn" value="공지목록" onclick="location='admin_notice?page=${page}';" />
	</div>
</div>

<%@include file="../include/admin_footer.jsp" %>
</html>