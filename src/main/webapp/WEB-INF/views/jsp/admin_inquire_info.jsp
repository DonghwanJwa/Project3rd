<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@include file="../include/admin_header.jsp" %>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/admin_inquire_info.css"/>
<script src="/jamong.com/resources/js/admin_inquire_info.js"></script>
<div id="adm_inq_title"><h3 class="adm_inq_title">문의내용 열람</h3></div>
<table border="1" class="adm_inq_table">
	
		
	<tr>
		<th align="center" style="width:110px; height:40px;">회원분류</th>
		<td align="center" style="width:120px;">
			<c:if test="${i.memberVO.mem_state == 0}"><font color="grey">일반회원</font></c:if>
			<c:if test="${i.memberVO.mem_state == 1}"><font color="blue">정지회원</font></c:if>
		</td>
		
		<th align="center" style="width:150px;">처리상태</th>
		<td align="center" style="width:150px;">
			<c:if test="${i.inq_state == 0}"><font color="blue">미처리</font></c:if>
			<c:if test="${i.inq_state == 1}"><font color="red">처리</font></c:if>			
		</td>
		
		<th align="center" style="width:105px;">문의날짜</th>
		<td align="center" style="width:205px;">
			${i.inq_date}
		</td>
	</tr>
	
	<tr>
		<th align="center" style="width:110px; height:40px;">문의분류</th>
		<td align="center" style="width:120px;">
			<c:if test="${i.inq_item1 == '개선/제안'}">개선/제안</c:if>
			<c:if test="${i.inq_item1 == '일반문의'}">일반문의</c:if>
			<c:if test="${i.inq_item1 == '제휴/협업 문의'}">제휴/협업 문의</c:if>
		</td>
		
		<th align="center" style="width:150px;">PhoneNumber</th>
		<td align="center" style="width:150px;">
			${i.inq_phone}
		</td>
		
		<th align="center" style="width:105px;">E-Mail</th>
		<td align="center" style="width:205px;">
			${i.inq_email}
		</td>	
	</tr>
	
	<tr>
		<th colspan="6" align="center" style="height:50px;">
			문의하기 내용
		</th>
	</tr>
	<tr>
		<td colspan="6" id="adm_inq_field" style="height:175px;">
			${inq_cont}
		</td>
	</tr>
</table>
	
	<div class="adm_inq_file">
	<c:if test="${empty i.inq_file1 && empty i.inq_file2 && empty i.inq_file3 && empty i.inq_file4}">
		
	</c:if>
	<c:if test="${!empty i.inq_file1 || !empty i.inq_file2 || !empty i.inq_file3 || !empty i.inq_file4}">
	<h3>첨부파일</h3>
		${i.inq_file1}
		${i.inq_file2}
		${i.inq_file3}
		${i.inq_file4}
		</c:if>
	</div>		

<!-- 회원일때 문의하기 내용 밑에 회원정보 띄우기 -->

<c:if test="${i.mem_no != 0}">
<h3 class="inq_mem_info">회원정보</h3>
	<table border="1" class="inq_adm_table2">
		<tr>
			<th align="center" style="width:140px; height:40px;">ID</th>
			 <td align="center" style="width:150px;">
			 	${i.memberVO.mem_id}
			 </td>		
			 <th align="center" style="width:140px;">이름</th>
			  <td align="center" style="width:180px;">
			  	${i.memberVO.mem_name}
			  </td>
			 <th align="center" style="width:115px;">성별</th>
			  <td align="center" style="width:115px;">
			  	${i.memberVO.mem_gender}
			  </td>
		</tr>
		
			<tr>
				<th align="center" style="height:40px;">생년월일</th>
			 		<td align="center">
					${i.memberVO.mem_birth1}-${i.memberVO.mem_birth2}-${i.memberVO.mem_birth3}
			 		</td>
				<th align="center">가입날짜</th>
			 		<td align="center" colspan="3">
			 		${i.memberVO.mem_date}
			 		</td>
			</tr>
		</table>
	</c:if>

	<c:if test="${i_mem_no == 0}">

	</c:if>
	
	<!-- 목록으로, 답변하기 버튼 -->
	<div id="inq_adm_button">
		<input type="button" id="inq_list_btn" class="inq_button" value="목록으로" onclick="location='admin_inquire?page=${page}';"/>
		<input type="button" id="inq_re_btn" class="inq_button" value="답변하기" action="inq_adm_re" />	
	</div>

	<form class="inq_adm_request" method="post"  action="admin_inquire_info_ok"  name="inq_adm_request" >
		<h3>문의하기</h3>
		<input type="hidden" name="inq_no" value="${i.inq_no}"/>
		<input type="hidden" name="inq_email" value="${i.inq_email}">
		<div>
		 <textarea id="inq_adm_remail" name="inq_reply" placeholder="문의 답변 입력해주세요(최대400자)"
		  cols="24" rows="6" maxlength="400" type="text"></textarea>
		 <input type="submit" id="inq_request_btn" class="inq_button" value="답변완료" />
		</div> 
	</form>
	
	<table id="inq_adm_complete">
		<tr>
			<td align="right" colspan="5" class="inq_adm_readmin">처리자 : </td>
			<td align="right" colspan="5" class="inq_adm_retime">처리날짜 : ${i.inq_date}</td>
		</tr>
		
		<tr>
			<th align="center" colspan="5" class="inq_adm_retitle">
				답변내용
			</th>
		</tr>
		
		<tr>
			<td align="center" colspan="5" class="inq_adm_recont">
				${i.inq_reply}
			</td>
		</tr>
	</table>
<%@include file="../include/admin_footer.jsp" %>
</html>