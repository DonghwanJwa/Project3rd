<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@include file="../include/admin_header.jsp" %>
<div id="adm_inq_title"><h3 class="adm_inq_title">문의내용 열람</h3></div>
<table border="1" class="adm_inq_table">
	
		
	<tr>
		<th align="center" style="width:110px; height:40px;">회원분류</th>
		<td align="center" style="width:120px">
			<c:if test="${i.memberVO.mem_state == 0}"><font color="grey">일반회원</font></c:if>
			<c:if test="${i.memberVO.mem_state == 1}"><font color="blue">정지회원</font></c:if>
		</td>
		
		<th align="center" style="width:150px">처리상태</th>
		<td align="center" style="width:150px">
			<c:if test="${i.inq_state == 0}"><font color="blue">미처리</font></c:if>
			<c:if test="${i.inq_state == 1}"><font color="red">처리</font></c:if>			
		</td>
		
		<th align="center" style="width:105px">문의날짜</th>
		<td align="center" style="width:205px">
			${i.inq_date}
		</td>
	</tr>
	
	<tr>
		<th align="center" style="width:110px; height:40px;">문의분류</th>
		<td align="center" style="width:120px">
			<c:if test="${i.inq_item1 == '개선/제안'}">개선/제안</c:if>
			<c:if test="${i.inq_item1 == '일반문의'}">일반문의</c:if>
			<c:if test="${i.inq_item1 == '제휴/협업 문의'}">제휴/협업 문의</c:if>
		</td>
		
		<th align="center" style="width:150px">PhoneNumber</th>
		<td align="center" style="width:150px">
			${i.inq_phone}
		</td>
		
		<th align="center" style="width:105px">E-Mail</th>
		<td align="center" style="width:205px">
			${i.inq_email}
		</td>	
	</tr>
	
	<tr>
		<th colspan="6" align="center" style="height:50px">
			문의하기 내용
		</th>
	</tr>
	<tr>
		<td colspan="6" id="adm_inq_field" style="height:175px">
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

<h3 class="inq_mem_info">회원정보</h3>

<c:if test="${i.mem_no != 0}">
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

</html>