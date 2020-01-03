<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@include file="../include/admin_header.jsp" %>
<div id="adm_page_title"><h3 class="adm_page_title">글 관리</h3></div>
<form action="admin_article">
<div id="adm_member_wrap">
	<%-- 회원목록 시작 --%>
	<table id="adm_mem_table">
		<tr>
			<td colspan="6" align="right" class="adm_member_count"><b>${bcount}</b>건의 글 정보가 있습니다.</td>
		</tr>
		
		<tr id="table_column">
			<th>상태</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자 닉네임(ID)</th>
			<th>작성일자</th>
			<th>처리일자</th>
		</tr>
		
		<c:if test="${!empty blist}">
			<c:forEach var="b" items="${blist}">
				<tr onclick="location='${pageContext.request.contextPath}/@${b.memberVO.mem_id}/${b.bo_no}';" id="to_info">
					<td align="center" class="list_underline">
					<c:if test='${b.bo_lock == 0}'> <font color="blue">비공개</font> </c:if>
					<c:if test='${b.bo_lock == 2}'> <font color="red">블록</font> </c:if>
					<c:if test='${b.bo_lock == 3}'>	<b>삭제</b> </c:if>
					</td>
					<td align="center" class="list_underline">${b.cat_name}</td>
					<td align="center" class="list_underline">${b.bo_title}</td>
					<td align="center" class="list_underline">${b.memberVO.mem_nickname}( ${b.memberVO.mem_id} )</td>
					<td align="center" class="list_underline">${b.bo_date}</td>
					<td align="center" class="list_underline">${b.bo_editdate}</td>
			</c:forEach>
		</c:if>
		
		<c:if test="${empty blist}">
			<tr>
				<th colspan="6">결과가 없습니다.</th>
			</tr>
		</c:if>
		
		<%-- 회원 목록 페이징 시작 --%>
		<tr>
			<td colspan="6" align="center" id="paging">
			<%-- 검색 전(전체리스트) --%>
			<c:if test="${(empty find_field) && (empty find_field2) && (empty find_field3) && (empty find_name)}">
				<c:if test="${page<=1}">	
					< 이전&nbsp;
				</c:if>
				<c:if test="${page>1}">
					<a href="admin_article?page=${page-1}">< 이전</a>&nbsp;
				</c:if>
			
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a==page}">
						<b>${a}</b>&nbsp;
					</c:if>
				
					<c:if test="${a != page}">
						<a href="admin_article?page=${a}">${a}</a>&nbsp;
					</c:if>
				</c:forEach>
			
				<c:if test="${page >= maxpage}">
					다음 >
				</c:if>
			
				<c:if test="${page < maxpage}">
					<a href="admin_article?page=${page+1}">다음 ></a>
				</c:if>
			</c:if>
			<%-- 검색전 페이징 끝 --%>
			
			<%-- 검색후 페이징 --%>
			<c:if test="${(!empty find_field) || (!empty find_field2) || (!empty find_field3) || (!empty find_name)}">
				<c:if test="${page<=1}"> <%-- 이전 비활성 --%>
					< 이전&nbsp;
				</c:if>
				
				<c:if test="${page > 1}"> <%-- 이전 활성화 --%>
					<a href="admin_article?page=${page-1}&find_field=${find_field}&find_field2=${find_field2}&find_field3=${find_field3}&find_name=${find_name}">< 이전</a>&nbsp;
				</c:if>
				
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a==page}"> <%-- 선택된 쪽번호 --%>
					<b>${a}</b>&nbsp;
				</c:if>
				
				<c:if test="${a != page}">
					<a href="admin_article?page=${a}&find_field=${find_field}&find_field2=${find_field2}&find_field3=${find_field3}&find_name=${find_name}">${a}</a>&nbsp;
				</c:if>
				</c:forEach>
				
				<c:if test="${page >= maxpage}">
					다음 >
				</c:if>
				
				<c:if test="${page < maxpage}">
					<a href="admin_article?page=${page+1}&find_field=${find_field}&find_field2=${find_field2}&find_field3=${find_field3}&find_name=${find_name}">다음 ></a>
				</c:if>
			</c:if>
		<%-- 회원 목록 페이징 끝 --%>
	</table>
	<%-- 회원목록 끝 --%>
</div>

	<%-- 검색기능 패널 --%>
	<div id="search_panel">
		<select id="find_field" name="find_field" class="search_field">
			<option value="all" selected>
				상태
			</option>
			<option value="hide" <c:if test="${find_field == 'hide'}">${'selected'}</c:if>>
				비공개
			</option>
			<option value="block" <c:if test="${find_field == 'block'}">${'selected'}</c:if>>
				블록
			</option>
			<option value="delete" <c:if test="${find_field == 'delete'}">${'selected'}</c:if>>
				삭제
			</option>
		</select>
		
		<select id="find_field2" name="find_field2" class="search_field">
			<option value="all" selected>
				카테고리
			</option>
			<option value="cat1" <c:if test="${find_field2 == 'cat1'}">${'selected'}</c:if>>
				감성·에세이
			</option>
			<option value="cat2" <c:if test="${find_field2 == 'cat2'}">${'selected'}</c:if>>
				건강·운동
			</option>
			<option value="cat3" <c:if test="${find_field2 == 'cat3'}">${'selected'}</c:if>>
				건축·설계
			</option>
			<option value="cat4" <c:if test="${find_field2 == 'cat4'}">${'selected'}</c:if>>
				글쓰기
			</option>
			<option value="cat5" <c:if test="${find_field2 == 'cat5'}">${'selected'}</c:if>>
				문화·예술
			</option>
			<option value="cat6" <c:if test="${find_field2 == 'cat6'}">${'selected'}</c:if>>
				사진·촬영
			</option>
			<option value="cat7" <c:if test="${find_field2 == 'cat7'}">${'selected'}</c:if>>
				시사·이슈
			</option>
			<option value="cat8" <c:if test="${find_field2 == 'cat8'}">${'selected'}</c:if>>
				심리 탐구
			</option>
			<option value="cat9" <c:if test="${find_field2 == 'cat9'}">${'selected'}</c:if>>
				여행
			</option>
			<option value="cat10" <c:if test="${find_field2 == 'cat10'}">${'selected'}</c:if>>
				영화 리뷰
			</option>
			<option value="cat11" <c:if test="${find_field2 == 'cat11'}">${'selected'}</c:if>>
				요리·레시피
			</option>
			<option value="cat12" <c:if test="${find_field2 == 'cat12'}">${'selected'}</c:if>>
				육아
			</option>
			<option value="cat13" <c:if test="${find_field2 == 'cat13'}">${'selected'}</c:if>>
				음악
			</option>
			<option value="cat14" <c:if test="${find_field2 == 'cat14'}">${'selected'}</c:if>>
				인문학·철학
			</option>
			<option value="cat15" <c:if test="${find_field2 == 'cat15'}">${'selected'}</c:if>>
				IT
			</option>
		</select>
		
		<select id="find_field3" name="find_field3" class="search_field">
			<option value=id <c:if test="${find_field3 == 'id'}">${'selected'}</c:if>>
				작성자 ID
			</option>
			<option value="nickname" <c:if test="${find_field3 == 'nickname'}">${'selected'}</c:if>>
				작성자 닉네임
			</option>
			<option value="name" <c:if test="${find_field3 == 'name'}">${'selected'}</c:if>>
				작성자 이름
			</option>
			<option value="title" <c:if test="${find_field3 == 'title'}">${'selected'}</c:if>>
				글 제목
			</option>
		</select>
		
		<input name="find_name" id="search_name" value="${find_name}" />
		<input type="submit" class="notice_btn" value="검색" />
	</div>
	<%-- 검색기능 패널 끝 --%>
</form>	
<%@include file="../include/admin_footer.jsp" %>
</html>