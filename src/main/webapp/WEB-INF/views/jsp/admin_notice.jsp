<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%@include file="../include/admin_header.jsp" %>
<form action="admin_notice">
<div id="adm_notice_wrap">
	<table id="adm_notice_table">
		<tr>
			<td align="right" colspan="5" class="adm_notice_count">${listcount}개의 공지사항이 있습니다.</td>
		</tr>
		
		<tr>
			<th width="40px">번호</th>
			<th width="315px">제목</th>
			<th width="101px">작성자</th>
			<th width="95px">조회수</th>
			<th width="137px">작성일자</th>
		</tr>
		
		<c:if test="${!empty nlist}">
			<c:forEach var="n" items="${nlist}">
			<tr>	
				<td align="center" class="list_underline">
					${n.noti_no}
				</td>
				
				<td class="list_underline">
					<a href="admin_notice_cont?no=${n.noti_no}&page=${page}&state=cont">${n.noti_title}</a>
				</td>
				
				<td align="center" class="list_underline">
					${n.noti_name}
				</td>
				
				<td align="center" class="list_underline">
					${n.noti_hit}
				</td>	
				
				<td align="center" class="list_underline">
					${n.noti_date}
				</td>
			</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${empty nlist}">
			<tr>
				<th colspan="5">공지사항 목록이 없습니다.</th>
			</tr>
		</c:if>
		
		<%-- 페이징 --%>
		<tr>
			<td colspan="5" align="center" id="paging">
			<%-- 검색 전(전체리스트) --%>
			<c:if test="${(empty search_field) && (empty search_name)}">
				<c:if test="${page<=1}">	
					< 이전&nbsp;
				</c:if>
				<c:if test="${page>1}">
					<a href="admin_notice?page=${page-1}">< 이전</a>&nbsp;
				</c:if>
			
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a==page}">
						<b>${a}</b>&nbsp;
					</c:if>
				
					<c:if test="${a != page}">
						<a href="admin_notice?page=${a}">${a}</a>&nbsp;
					</c:if>
				</c:forEach>
			
				<c:if test="${page >= maxpage}">
					다음 >
				</c:if>
			
				<c:if test="${page < maxpage}">
					<a href="admin_notice?page=${page+1}">다음 ></a>
				</c:if>
			</c:if>
			<%-- 검색전 페이징 끝 --%>
			
			<%-- 검색후 페이징 --%>
			<c:if test="${(!empty search_field) || (!empty search_name)}">
				<c:if test="${page<=1}"> <%-- 이전 비활성 --%>
					< 이전&nbsp;
				</c:if>
				
				<c:if test="${page > 1}"> <%-- 이전 활성화 --%>
					<a href="admin_notice?page=${page-1}&search_field=${search_field}&search_name=${search_name}">< 이전</a>&nbsp;
				</c:if>
				
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a==page}"> <%-- 선택된 쪽번호 --%>
					<b>${a}</b>&nbsp;
				</c:if>
				
				<c:if test="${a != page}">
					<a href="admin_notice?page=${a}&search_field=${search_field}&search_name=${search_name}">${a}</a>&nbsp;
				</c:if>
				</c:forEach>
				
				<c:if test="${page >= maxpage}">
					다음 >
				</c:if>
				
				<c:if test="${page < maxpage}">
					<a href="admin_notice?page=${page+1}&search_field=${search_field}&search_name=${search_name}">다음 ></a>
				</c:if>
			</c:if>
			<%-- 검색후 페이징 끝 --%>
			</td>
		</tr>
		
		<tr>
			<td colspan="5" align="right">
				<a href="admin_notice_write?page=${page}">공지작성</a>
			</td>
		</tr>
	</table>
</div>
	<div id="search_interface">
		<select name="search_field">
			<option value="noti_title" <c:if test="${search_field == 'noti_title'}">${'selected'}</c:if>>
				제목
			</option>
			<option value="noti_cont" <c:if test="${search_field == 'noti_cont'}">${'selected'}</c:if>>
				내용
			</option>
			<option value="noti_name" <c:if test="${search_field == 'noti_name'}">${'selected'}</c:if>>
				작성자
			</option>
		</select>
		<input name="search_name" id="search_name" size="15" value="${search_name}" />
		<input type="submit" value="검색"/>
	</div>
</form>
<%@include file="../include/admin_footer.jsp" %>
</body>
</html>