<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글에 꿈을 담다, 자몽</title>
</head>
<%@include file="../include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css"/>
 <div class="notice_cont_page_wrap">
  <div id="notice_cont_page_container">
   <div id="notice_cont_page_title">
    <h3>Notice</h3>
   </div>
   <div class="notice_cont_body">
   
    <div class="notice_cont_head">
     <div class="notice_cont_writer">
      <span>자몽운영팀</span>
     </div>
     <div class="notice_cont_title">
      <span>${n.noti_title}</span>
     </div>
     <div class="notice_cont_date">
      <span>${n.noti_date}</span>
     </div>
    </div>
    
    <div class="notice_cont_cont">
     ${noti_cont}
    </div>
    
    <div class="notice_cont_footer">
     <input type="button" class="notice_btn" onclick="location='notice?page=${page}'" value="목록으로"/>
    </div>
    
   </div>
  </div>
 </div>
<%@include file="../include/footer.jsp" %>
</html>