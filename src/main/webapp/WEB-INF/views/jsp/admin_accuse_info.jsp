<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@include file="../include/admin_header.jsp" %>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/admin_accuse_info.css"/>
<script src="/jamong.com/resources/js/admin_accuse_info.js"></script>
<div class="wrap-loading" style="display:none">
 <div>	
  <img src="/jamong.com/resources/img/loading1.gif" />
 </div>
</div>
<div id="adm_ac_title"><h3 class="adm_ac_title">신고내용 열람</h3></div>
<table class="adm_ac_table">
	
	<tr>
		<th align="center" style="width:110px; height:40px;">신고분류</th>
		<td align="center" style="width:120px;">
			<c:if test="${a.ac_item == 1}"><font color="red">회원신고</font></c:if>
			<c:if test="${a.ac_item == 2}"><font color="blue">게시물신고</font></c:if>
		</td>
		
		<th align="center" style="width:150px;">처리상태</th>
		<td align="center" style="width:150px;">
			<c:if test="${a.ac_state == 0}"><font color="red">처리대기</font></c:if>
			<c:if test="${a.ac_state == 1}"><font color="blue">처리완료</font></c:if>			
		</td>
		
		<th align="center" style="width:105px;">신고날짜</th>
		<td align="center" style="width:205px;">
			${a.ac_date}
		</td>
	</tr>
	
	<tr>
		<th align="center" style="width:110px; height:40px;">문의분류</th>
		<td align="center" style="width:120px;">
			${a.ac_reason}
		</td>
	
		
		<th align="center" style="width:150px;">PhoneNumber</th>
		<td align="center" style="width:150px;">
			${a.memberVO.mem_phone01}-${a.memberVO.mem_phone02}-${a.memberVO.mem_phone03}
		</td>
		
		<th align="center" style="width:105px;">E-Mail</th>
		<td align="center" style="width:205px;">
			${a.memberVO.email_id}@${a.memberVO.email_domain}
		</td>	
	</tr>
	
	<tr>
		<th colspan="6" align="center" style="height:50px;">
			신고한페이지 URL
		</th>
	</tr>
	<tr>
		<td colspan="6" id="adm_ac_url" style="height:50px;">
			<a href="${a.ac_href}">신고한 페이지 이동</a>
		</td>
	</tr>
	
	
	<tr>
		<th colspan="6" align="center" style="height:50px;">
			신고하기 내용
		</th>
	</tr>
	<tr>
		<td colspan="6" id="adm_ac_field" style="height:175px;">
			<p>${a.ac_cont}</p>
		</td>
	</tr>
</table>
	
<h3 style="padding-left:20px;">신고자 정보</h3>	
<c:if test="${a.mem_no != 0}">
	<table class="ac_adm_table2">
		<tr>
			<th align="center" style="width:140px; height:40px;">ID</th>
			 <td align="center" style="width:150px;">
			 	${a.memberVO.mem_id}
			 </td>		
			 <th align="center" style="width:140px;">이름</th>
			  <td align="center" style="width:180px;">
			  	${a.memberVO.mem_name}
			  </td>
			 <th align="center" style="width:115px;">성별</th>
			  <td align="center" style="width:115px;">
			  	${a.memberVO.mem_gender}
			  </td>
		</tr>
		
			<tr>
				<th align="center" style="height:40px;">생년월일</th>
			 		<td align="center">
					${a.memberVO.mem_birth1}-${a.memberVO.mem_birth2}-${a.memberVO.mem_birth3}
			 		</td>
				<th align="center">가입날짜</th>
			 		<td align="center" colspan="3">
			 		${a.memberVO.mem_date}
			 		</td>
			</tr>
		</table>
	</c:if>

	<c:if test="${a.mem_no == 0}">

	</c:if>

<h3 style="padding-left:20px;">피신고인 정보</h3>
<c:if test="${a.ac_member != 0}">
	<table class="ac_adm_table2">
		<tr>
			<th align="center" style="width:140px; height:40px;">ID</th>
			 <td align="center" style="width:150px;">
			 	${mem.mem_id}
			 </td>		
			 <th align="center" style="width:140px;">이름</th>
			  <td align="center" style="width:180px;">
			  	${mem.mem_name}
			  </td>
			 <th align="center" style="width:115px;">성별</th>
			  <td align="center" style="width:115px;">
			  	${mem.mem_gender}
			  </td>
		</tr>
		
			<tr>
				<th align="center" style="height:40px;">생년월일</th>
			 		<td align="center">
					${mem.mem_birth1}-${mem.mem_birth2}-${mem.mem_birth3}
			 		</td>
				<th align="center">가입날짜</th>
			 		<td align="center" colspan="3">
			 		${mem.mem_date}
			 		</td>
			</tr>
		</table>
	</c:if>
	
	
	
	
	<form class="ac_adm_request" method="post"  action="admin_accuse_info_ok"  name="ac_adm_request" >
		<h3>신고 답변하기</h3>
		<input type="hidden" name="page" value="${page}"/>
		<input type="hidden" name="ac_no" value="${a.ac_no}"/>
		<div>
		 <textarea id="ac_adm_remail" name="ac_reply" placeholder="문의 답변 입력해주세요(최대400자)"
		  cols="24" rows="6" maxlength="400"></textarea>
		 <input type="submit" id="ac_request_btn" class="ac_button" value="답변완료" />
		</div> 
	</form>
	
 <c:if test="${a.ac_state == 1}">
	<table id="ac_adm_complete">
		<tr>
			<td align="right" colspan="5" class="ac_adm_readmin">처리자 : ${a.ac_sender} </td>
		</tr>
		<tr>	
			<td align="right" colspan="5" class="ac_adm_retime">처리날짜 : ${a.ac_replydate}</td>
		</tr>
		
			<tr>
		<th colspan="6" id="adm_ac_replyname" align="center" style="height:50px;">
			답변내용
		</th>
	</tr>
	<tr>
		<td colspan="6" id="adm_ac_field" style="height:175px;">
			<p>${a.ac_reply}</p>
		</td>
	</tr>
	</table>
  </c:if>
   
   
   <!-- 목록으로, 답변하기 버튼 -->
  <form action="admin_accuse_del" onsubmit="return delconfirm()">
  <input type="hidden" name="ac_no" value="${a.ac_no}" />
  <script>
  			function delconfirm(){
  				var con=confirm('삭제하시겠습니까?');
  				
  				if(con === false){
  					return false;
  				}
  			}
  </script>
  	
	<div id="ac_adm_button">
		<input type="button" id="ac_list_btn" class="ac_button" value="목록으로" onclick="location='admin_accuse?page=${page}';"/>
		<c:if test="${a.ac_state == 0}">
		<input type="button" id="ac_re_btn" class="ac_button" value="답변하기" />
		</c:if>
		<input type="submit" id="ac_del_btn" class="ac_button" value="삭제하기" />
	</div>
   </form>
<%@include file="../include/admin_footer.jsp" %>
</html>