<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<%@include file="../include/admin_header.jsp" %>
<div id="adm_member_wrap">
<form action="admin_member">
	<%-- 검색기능 패널 --%>
	<div id="mem_search_panel">
		<select id="search_field_state" name="search_field_state" class="search_field">
			<option value="all" selected>
				계정상태
			</option>
			<option value="active" <c:if test="${search_field_state == 'active'}">${'selected'}</c:if>>
				활동
			</option>
			<option value="banned" <c:if test="${search_field_state == 'banned'}">${'selected'}</c:if>>
				정지
			</option>
			<option value="out" <c:if test="${search_field_state == 'out'}">${'selected'}</c:if>>
				탈퇴
			</option>
		</select>
		
		<select id="search_field_author" name="search_field_author" class="search_field">
			<option value="all" selected>
				회원분류
			</option>
			<option value="normal" <c:if test="${search_field_author == 'normal'}">${'selected'}</c:if>>
				일반회원
			</option>
			<option value="author" <c:if test="${search_field_author == 'author'}">${'selected'}</c:if>>
				작가
			</option>
		</select>
		
		<select id="search_field_key" name="search_field_key" class="search_field">
			<option value="mem_id" <c:if test="${search_field_key == 'mem_id'}">${'selected'}</c:if>>
				ID
			</option>
			<option value="mem_nickname" <c:if test="${search_field_key == 'mem_nickname'}">${'selected'}</c:if>>
				닉네임
			</option>
			<option value="mem_name" <c:if test="${search_field_key == 'mem_name'}">${'selected'}</c:if>>
				이름
			</option>
		</select>
		
		<input name="search_name" id="search_name" value="${search_name}" />
		<input type="submit" class="notice_btn" value="검색" />
	</div>
	<%-- 검색기능 패널 끝 --%>
	
	<%-- 회원목록 시작 --%>
	<table id="adm_mem_table">
		<tr>
			<td colspan="6" align="right" class="adm_member_count"><b>${mcount}</b>건의 회원정보가 있습니다.</td>
		</tr>
		
		<tr>
			<th>번호</th>
			<th>회원ID</th>
			<th>닉네임</th>
			<th>계정상태</th>
			<th>회원분류</th>
			<th>가입날짜</th>
		</tr>
		
		<c:if test="${!empty mlist}">
			<c:forEach var="m" items="${mlist}">
				<tr>
					<td align="center" class="list_underline">${m.mem_no}</td>
					<td align="center" class="list_underline">
						<a href="admin_member_cont?no=${m.mem_no}&page=${page}">${m.mem_id}</a>
					</td>
					<td align="center" class="list_underline">${m.mem_nickname}</td>
					
					<%-- 계정상태 분기 시작 --%>
					<c:if test="${m.mem_state == 0}">
						<td align="center" class="list_underline"><font color="blue">활동</font></td>
					</c:if>
					<c:if test="${m.mem_state == 1}">
						<td align="center" class="list_underline"><font color="red">정지</font></td>
					</c:if>
					<c:if test="${m.mem_state == 2}">
						<td align="center" class="list_underline">탈퇴</td>
					</c:if>
					<%-- 계정상태 분기 끝 --%>
					
					<%-- 회원분류 분기 시작 --%>
					<c:if test="${m.mem_author == 0}">
						<td align="center" class="list_underline">일반</td>
					</c:if>
					<c:if test="${m.mem_author == 1}">
						<td align="center" class="list_underline">작가</td>
					</c:if>
					<%-- 회원분류 분기 끝 --%>
					
					<td align="center" class="list_underline">${m.mem_date}</td>
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
					<a href="admin_member?page=${page-1}">< 이전</a>&nbsp;
				</c:if>
			
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a==page}">
						<b>${a}</b>&nbsp;
					</c:if>
				
					<c:if test="${a != page}">
						<a href="admin_member?page=${a}">${a}</a>&nbsp;
					</c:if>
				</c:forEach>
			
				<c:if test="${page >= maxpage}">
					다음 >
				</c:if>
			
				<c:if test="${page < maxpage}">
					<a href="admin_member?page=${page+1}">다음 ></a>
				</c:if>
			</c:if>
			<%-- 검색전 페이징 끝 --%>
			
			<%-- 검색후 페이징 --%>
			<c:if test="${(!empty search_field_state) || (!empty search_field_author) || (!empty search_field_key) || (!empty search_name)}">
				<c:if test="${page<=1}"> <%-- 이전 비활성 --%>
					< 이전&nbsp;
				</c:if>
				
				<c:if test="${page > 1}"> <%-- 이전 활성화 --%>
					<a href="admin_member?page=${page-1}&search_field_state=${search_field_state}&search_field_author=${search_field_author}&search_field_key=${search_field_key}&search_name=${search_name}">< 이전</a>&nbsp;
				</c:if>
				
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a==page}"> <%-- 선택된 쪽번호 --%>
					<b>${a}</b>&nbsp;
				</c:if>
				
				<c:if test="${a != page}">
					<a href="admin_member?page=${a}&search_field_state=${search_field_state}&search_field_author=${search_field_author}&search_field_key=${search_field_key}&search_name=${search_name}">${a}</a>&nbsp;
				</c:if>
				</c:forEach>
				
				<c:if test="${page >= maxpage}">
					다음 >
				</c:if>
				
				<c:if test="${page < maxpage}">
					<a href="admin_member?page=${page+1}&search_field_state=${search_field_state}&search_field_author=${search_field_author}&search_field_key=${search_field_key}&search_name=${search_name}">다음 ></a>
				</c:if>
			</c:if>
		<%-- 회원 목록 페이징 끝 --%>
	</table>
	<%-- 회원목록 끝 --%>
</form>	
</div>
<%@include file="../include/admin_footer.jsp" %>
</html>