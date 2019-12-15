<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@include file="../include/admin_header.jsp" %>

<div id="adm_page_title"><h3 class="adm_page_title">회원관리</h3></div>
<form action="admin_request">
<div id="adm_author_wrap">
	<%-- 회원목록 시작 --%>
	<table id="adm_aut_table">
		<tr>
			<td colspan="6" align="right" class="adm_author_count"><b>${mcount}</b>건의 회원정보가 있습니다.</td>
		</tr>
		
		<tr id="table_column">
			<th>번호</th>
			<th>회원ID</th>
			<th>닉네임</th>
			<th>계정상태</th>
			<th>처리상태</th>
			<th>가입날짜</th>
		</tr>
		
		<c:if test="${!empty reqlist}">
			<c:forEach var="a" items="${reqlist}">
				<tr onclick="location='admin_author_info?no=${a.aut_no}&page=${page}';" id="to_info">
					<td align="center" class="list_underline">${a.aut_no}</td>
					<td align="center" class="list_underline">${a.aut_id}</td>
					<td align="center" class="list_underline">${a.aut_nickname}</td>
					
					<%-- 계정상태 분기 시작 --%>
					<c:if test="${a.mem_state == 0 || me.mem_state == 9}">
						<td align="center" class="list_underline"><font color="blue">활동</font></td>
					</c:if>
					<c:if test="${me.aut_state == 1}">
						<td align="center" class="list_underline"><font color="red">정지</font></td>
					</c:if>
					<c:if test="${me.aut_state == 2}">
						<td align="center" class="list_underline">탈퇴</td>
					</c:if>
					<%-- 계정상태 분기 끝 --%>
					
					<%-- 회원분류 분기 시작 --%>
					<c:if test="${me.aut_state == 9 && (me.aut_author == 0 || me.aut_author == 1) }">
						<td align="center" class="list_underline"><b>관리자</b></td>
					</c:if>
					<c:if test="${me.aut_author == 0 && me.aut_state != 9}">
						<td align="center" class="list_underline">일반</td>
					</c:if>
					<c:if test="${me.aut_author == 1 && me.aut_state != 9}">
						<td align="center" class="list_underline">작가</td>
					</c:if>
					<%-- 회원분류 분기 끝 --%>
					
					<td align="center" class="list_underline">${me.aut_date}</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${empty mlist}">
			<tr>
				<th colspan="6">결과가 없습니다.</th>
			</tr>
		</c:if>
		
		<%-- 회원 목록 페이징 시작 --%>
		<tr>
			<td colspan="6" align="center" id="paging">
			<%-- 검색 전(전체리스트) --%>
			<c:if test="${(empty search_field_state) && (empty search_field_author) && (empty search_field_key) && (empty search_name)}">
				<c:if test="${page<=1}">	
					< 이전&nbsp;
				</c:if>
				<c:if test="${page>1}">
					<a href="admin_author?page=${page-1}">< 이전</a>&nbsp;
				</c:if>
			
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a==page}">
						<b>${a}</b>&nbsp;
					</c:if>
				
					<c:if test="${a != page}">
						<a href="admin_author?page=${a}">${a}</a>&nbsp;
					</c:if>
				</c:forEach>
			
				<c:if test="${page >= maxpage}">
					다음 >
				</c:if>
			
				<c:if test="${page < maxpage}">
					<a href="admin_author?page=${page+1}">다음 ></a>
				</c:if>
			</c:if>
			<%-- 검색전 페이징 끝 --%>
			
			<%-- 검색후 페이징 --%>
			<c:if test="${(!empty search_field_state) || (!empty search_field_author) || (!empty search_field_key) || (!empty search_name)}">
				<c:if test="${page<=1}"> <%-- 이전 비활성 --%>
					< 이전&nbsp;
				</c:if>
				
				<c:if test="${page > 1}"> <%-- 이전 활성화 --%>
					<a href="admin_author?page=${page-1}&search_field_state=${search_field_state}&search_field_author=${search_field_author}&search_field_key=${search_field_key}&search_name=${search_name}">< 이전</a>&nbsp;
				</c:if>
				
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a==page}"> <%-- 선택된 쪽번호 --%>
					<b>${a}</b>&nbsp;
				</c:if>
				
				<c:if test="${a != page}">
					<a href="admin_author?page=${a}&search_field_state=${search_field_state}&search_field_author=${search_field_author}&search_field_key=${search_field_key}&search_name=${search_name}">${a}</a>&nbsp;
				</c:if>
				</c:forEach>
				
				<c:if test="${page >= maxpage}">
					다음 >
				</c:if>
				
				<c:if test="${page < maxpage}">
					<a href="admin_author?page=${page+1}&search_field_state=${search_field_state}&search_field_author=${search_field_author}&search_field_key=${search_field_key}&search_name=${search_name}">다음 ></a>
				</c:if>
			</c:if>
		<%-- 회원 목록 페이징 끝 --%>
	</table>
	<%-- 회원목록 끝 --%>
</div>
</form>

<%@include file="../include/admin_footer.jsp" %>
</html>