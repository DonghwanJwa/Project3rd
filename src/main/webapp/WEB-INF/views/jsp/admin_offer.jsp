<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@include file="../include/admin_header.jsp" %>

<div id="adm_page_title"><h3 class="adm_page_title">작가제안</h3></div>
<form action="admin_offer">
<div id="adm_author_wrap">
	<%-- 회원목록 시작 --%>
	<table id="adm_aut_table">
		<tr>
			<td colspan="5" align="right" class="adm_author_count"><b>${offcount}</b>건의 제안사항이 있습니다.</td>
		</tr>
		
		<tr id="table_column">
			<th>번호</th>
			<th>제안회원 닉네임(ID)</th>
			<th>대상작가 닉네임(ID)</th>
			<th>제안목적</th>
			<th>제안날짜</th>
		</tr>
		
		<c:if test="${!empty offList}">
			<c:forEach var="ol" items="${offList}">
				<tr onclick="location='admin_offer_info?no=${ol.off_no}&page=${page}';" id="to_info">
					<td align="center" class="list_underline">${ol.off_no}</td>
					<td align="center" class="list_underline">${ol.off_nickname} ( ${ol.off_id} )</td>
					<td align="center" class="list_underline">${ol.mem_nickname} ( ${ol.mem_id} )</td>
					<td align="center" class="list_underline"><b>${ol.off_item}</b></td>
					<td align="center" class="list_underline">${ol.off_date}</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${empty offList}">
			<tr>
				<th colspan="5">결과가 없습니다.</th>
			</tr>
		</c:if>
		
		<%-- 신청 목록 페이징 시작 --%>
		<tr>
			<td colspan="5" align="center" id="paging">
			<%-- 검색 전(전체리스트) --%>
			<c:if test="${(empty search_field1) && (empty search_field2) && (empty search_name)}">
				<c:if test="${page<=1}">	
					< 이전&nbsp;
				</c:if>
				<c:if test="${page>1}">
					<a href="admin_offer?page=${page-1}">< 이전</a>&nbsp;
				</c:if>
			
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a==page}">
						<b>${a}</b>&nbsp;
					</c:if>
				
					<c:if test="${a != page}">
						<a href="admin_offer?page=${a}">${a}</a>&nbsp;
					</c:if>
				</c:forEach>
			
				<c:if test="${page >= maxpage}">
					다음 >
				</c:if>
			
				<c:if test="${page < maxpage}">
					<a href="admin_offer?page=${page+1}">다음 ></a>
				</c:if>
			</c:if>
			<%-- 검색전 페이징 끝 --%>
			
			<%-- 검색후 페이징 --%>
			<c:if test="${(!empty search_field1) || (!empty search_field2) || (!empty search_name)}">
				<c:if test="${page<=1}"> <%-- 이전 비활성 --%>
					< 이전&nbsp;
				</c:if>
				
				<c:if test="${page > 1}"> <%-- 이전 활성화 --%>
					<a href="admin_offer?page=${page-1}&search_field1=${search_field1}&search_field2=${search_field2}&search_name=${search_name}">< 이전</a>&nbsp;
				</c:if>
				
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a==page}"> <%-- 선택된 쪽번호 --%>
					<b>${a}</b>&nbsp;
				</c:if>
				
				<c:if test="${a != page}">
					<a href="admin_offer?page=${a}&search_field1=${search_field1}&search_field2=${search_field2}&search_name=${search_name}">${a}</a>&nbsp;
				</c:if>
				</c:forEach>
				
				<c:if test="${page >= maxpage}">
					다음 >
				</c:if>
				
				<c:if test="${page < maxpage}">
					<a href="admin_offer?page=${page+1}&search_field1=${search_field1}&search_field2=${search_field2}&search_name=${search_name}">다음 ></a>
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
				제안목적
			</option>
			<option value="publish" <c:if test="${search_field1 == 'publish'}">${'selected'}</c:if>>
				출판
			</option>
			<option value="contribute" <c:if test="${search_field1 == 'contribute'}">${'selected'}</c:if>>
				기고
			</option>
			<option value="cooperate" <c:if test="${search_field1 == 'cooperate'}">${'selected'}</c:if>>
				협업
			</option>
			<option value="lecture" <c:if test="${search_field1 == 'lecture'}">${'selected'}</c:if>>
				강연
			</option>
			<option value="etc" <c:if test="${search_field1 == 'etc'}">${'selected'}</c:if>>
				기타
			</option>
		</select>
		
		<select id="search_field2" name="search_field2" class="search_field">
			<option value="all" selected>
				검색타입
			</option>
			<option value="user_id" <c:if test="${search_field2 == 'user_id'}">${'selected'}</c:if>>
				제안회원 ID
			</option>
			<option value="user_nickname" <c:if test="${search_field2 == 'user_nickname'}">${'selected'}</c:if>>
				제안회원 닉네임
			</option>
			<option value="author_id" <c:if test="${search_field2 == 'author_id'}">${'selected'}</c:if>>
				작가 ID
			</option>
			<option value="author_nickname" <c:if test="${search_field2 == 'author_nickname'}">${'selected'}</c:if>>
				작가 닉네임
			</option>
		</select>
		
		<input name="search_name" id="search_name" value="${search_name}" />
		<input type="submit" class="notice_btn" value="검색" />
	</div>
	<%-- 검색기능 패널 끝 --%>
</form>

<%@include file="../include/admin_footer.jsp" %>
</html>