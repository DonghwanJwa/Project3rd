<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css"/>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<body>
<div id="notice_cont_pop_container">
   <div class="notice_cont_pop_body">
   
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
   </div>
   <div class="notice_cont_footer">
    <input type="button" id="notice_cont_pop_btn" class="notice_btn" value="목록으로"/>
   </div>
  </div>
</body>
<script>
 $(document).ready(function(){
	 $('#notice_cont_pop_btn').click(function(){
		 opener.document.location.href='notice'; //부모창을 공지사항리스트 페이지로 이동
		 window.close();						 //현재페이지 닫기
	 });
 });
</script>
</html>