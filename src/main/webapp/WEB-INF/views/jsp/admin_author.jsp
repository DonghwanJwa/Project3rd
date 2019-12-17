<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@include file="../include/admin_header.jsp" %>

<div id="adm_page_title"><h3 class="adm_page_title">작가신청</h3></div>
<form action="admin_author">
<div id="adm_author_wrap">
	<%-- 회원목록 시작 --%>
	<table id="adm_aut_table">
		<tr>
			<td colspan="6" align="right" class="adm_author_count"><b>${listcount}</b>건의 작가신청이 있습니다.</td>
		</tr>
		
		<tr id="table_column">
			<th>번호</th>
			<th>회원ID</th>
			<th>닉네임</th>
			<th>처리상태</th>
			<th>신청날짜</th>
			<th>처리날짜</th>
		</tr>
		
		<c:if test="${!empty reqlist}">
			<c:forEach var="a" items="${reqlist}">
				<tr onclick="location='admin_author_info?no=${a.aut_no}&page=${page}';" id="to_info">
					<td align="center" class="list_underline">${a.aut_no}</td>
					<td align="center" class="list_underline">${a.memberVO.mem_id}</td>
					<td align="center" class="list_underline">${a.memberVO.mem_nickname}</td>
					
					<%-- 처리상태 분기 시작 --%>
					<c:if test="${a.aut_state == 0}">
						<td align="center" class="list_underline"><b>심사대기</b></td>
					</c:if>
					<c:if test="${a.aut_state == 1}">
						<td align="center" class="list_underline"><font color="blue">승인</font></td>
					</c:if>
					<c:if test="${a.aut_state == 2}">
						<td align="center" class="list_underline"><font color="red">거절</font></td>
					</c:if>
					<%-- 처리상태 분기 끝 --%>
					
					<td align="center" class="list_underline">${a.aut_date}</td>
					
					<%-- 처리날짜 분기 시작 --%>
					<c:if test="${a.aut_state == 0}">
						<td align="center" class="list_underline">-</td>
					</c:if>
					<c:if test="${a.aut_state != 0}">
						<td align="center" class="list_underline">${a.aut_update}</td>
					</c:if>
					<%-- 처리날짜 분기 끝 --%>
				</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${empty reqlist}">
			<tr>
				<th colspan="6">결과가 없습니다.</th>
			</tr>
		</c:if>
		
		<%-- 신청 목록 페이징 시작 --%>
		<tr>
			<td colspan="6" align="center" id="paging">
			<%-- 검색 전(전체리스트) --%>
			<c:if test="${(empty search_field1) && (empty search_field2) && (empty search_name)}">
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
			<c:if test="${(!empty search_field1) || (!empty search_field2) || (!empty search_name)}">
				<c:if test="${page<=1}"> <%-- 이전 비활성 --%>
					< 이전&nbsp;
				</c:if>
				
				<c:if test="${page > 1}"> <%-- 이전 활성화 --%>
					<a href="admin_author?page=${page-1}&search_field1=${search_field1}&search_field2=${search_field2}&search_name=${search_name}">< 이전</a>&nbsp;
				</c:if>
				
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a==page}"> <%-- 선택된 쪽번호 --%>
					<b>${a}</b>&nbsp;
				</c:if>
				
				<c:if test="${a != page}">
					<a href="admin_author?page=${a}&search_field1=${search_field1}&search_field2=${search_field2}&search_name=${search_name}">${a}</a>&nbsp;
				</c:if>
				</c:forEach>
				
				<c:if test="${page >= maxpage}">
					다음 >
				</c:if>
				
				<c:if test="${page < maxpage}">
					<a href="admin_author?page=${page+1}&search_field1=${search_field1}&search_field2=${search_field2}&search_name=${search_name}">다음 ></a>
				</c:if>
			</c:if>
		<%-- 신청 목록 페이징 끝 --%>
	</table>
	<%-- 회원목록 끝 --%>
	
</div>
		<%-- 검색기능 패널 --%>
	<div id="search_panel">
		<select id="search_field1" name="search_field1" class="search_field">
			<option value="all" selected>
				처리상태
			</option>
			<option value="waiting" <c:if test="${search_field1 == 'waiting'}">${'selected'}</c:if>>
				심사대기
			</option>
			<option value="accept" <c:if test="${search_field1 == 'accept'}">${'selected'}</c:if>>
				승인
			</option>
			<option value="reject" <c:if test="${search_field1 == 'reject'}">${'selected'}</c:if>>
				거절
			</option>
		</select>
		
		<select id="search_field2" name="search_field2" class="search_field">
			<option value="mem_id" <c:if test="${search_field2 == 'mem_id'}">${'selected'}</c:if>>
				ID
			</option>
			<option value="mem_nickname" <c:if test="${search_field2 == 'mem_nickname'}">${'selected'}</c:if>>
				닉네임
			</option>
			<option value="mem_name" <c:if test="${search_field2 == 'mem_name'}">${'selected'}</c:if>>
				이름
			</option>
		</select>
		
		<input name="search_name" id="search_name" value="${search_name}" />
		<input type="submit" class="notice_btn" value="검색" />
	</div>
	<%-- 검색기능 패널 끝 --%>
</form>

<%@include file="../include/admin_footer.jsp" %>
</html>