<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글에 꿈을 담다, 자몽</title>
</head>
<%@include file="../include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/notice.css"/>
<div id="main_page_notice_wrap">
	<form action="notice">
	<div id="main_notice_wrap">
	 <div id="main_page_title">
	  <h3 class="main_page_title">Notice</h3>
	 </div>
	   <div id="main_notice_table_wrap">
		<table id="main_notice_table">
			<tr id="main_notice_table_title">
				<th class="main_page_notice_title" width="40px">번호</th>
				<th class="main_page_notice_title" width="310px">제목</th>
				<th class="main_page_notice_title" width="95px">조회수</th>
				<th class="main_page_notice_title" width="135px">작성일자</th>
			</tr>
			
			<c:if test="${!empty nlist}">
				<c:forEach var="n" items="${nlist}">
				<tr onclick="location='notice_cont?no=${n.noti_no}&page=${page}&state=cont';" class="notice_page_info">	
					<td align="center" class="list_underline">
						${n.noti_no}
					</td>
					
					<td class="list_underline notice_list_title">
						${n.noti_title}
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
		</table>
		</div>
		<div id="notice_paging_wrap">
			<%-- 페이징 --%>
			<div id="notice_paging">
				<%-- 검색 전(전체리스트) --%>
				<c:if test="${(empty search_field) && (empty search_name)}">
					<c:if test="${page<=1}">	
						< 이전&nbsp;
					</c:if>
					<c:if test="${page>1}">
						<a href="notice?page=${page-1}">< 이전</a>&nbsp;
					</c:if>
				
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a==page}">
							<b>${a}</b>&nbsp;
						</c:if>
					
						<c:if test="${a != page}">
							<a href="notice?page=${a}">${a}</a>&nbsp;
						</c:if>
					</c:forEach>
				
					<c:if test="${page >= maxpage}">
						다음 >
					</c:if>
				
					<c:if test="${page < maxpage}">
						<a href="notice?page=${page+1}">다음 ></a>
					</c:if>
				</c:if>
				<%-- 검색전 페이징 끝 --%>
				
				<%-- 검색후 페이징 --%>
				<c:if test="${(!empty search_field) || (!empty search_name)}">
					<c:if test="${page<=1}"> <%-- 이전 비활성 --%>
						< 이전&nbsp;
					</c:if>
					
					<c:if test="${page > 1}"> <%-- 이전 활성화 --%>
						<a href="notice?page=${page-1}&search_field=${search_field}&search_name=${search_name}">< 이전</a>&nbsp;
					</c:if>
					
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a==page}"> <%-- 선택된 쪽번호 --%>
						<b>${a}</b>&nbsp;
					</c:if>
					
					<c:if test="${a != page}">
						<a href="notice?page=${a}&search_field=${search_field}&search_name=${search_name}">${a}</a>&nbsp;
					</c:if>
					</c:forEach>
					
					<c:if test="${page >= maxpage}">
						다음 >
					</c:if>
					
					<c:if test="${page < maxpage}">
						<a href="notice?page=${page+1}&search_field=${search_field}&search_name=${search_name}">다음 ></a>
					</c:if>
				</c:if>
				<%-- 검색후 페이징 끝 --%>
			</div>
		</div>
	<%-- 검색기능 패널 --%>
	<div id="search_panel">
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
		<input type="submit" value="검색" class="notice_btn"/>
	</div> 
	<%-- 검색기능 패널 끝 --%>
	</div>
 </form>
</div>
<%@include file="../include/footer.jsp" %>
</html>