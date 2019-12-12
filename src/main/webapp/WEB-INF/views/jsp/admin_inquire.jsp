<%@ page contentType="text/html; charset=UTF-8"%>
<meta charset="UTF-8">
<%@ include file="../include/admin_header.jsp" %>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/admin_inquire.css"/>
<script src="/jamong.com/resources/js/admin_inquire.js"></script>

 <h3 class=admin_inq_title>문의하기</h3>
<form action="admin_inquire">
 <div class=admin_inq_main>
  <table id="adm_inquire_table">
     <tr>
      <td align="right" colspan="6" class="adm_inquire_count">${listcount} 개의 문의사항이 있습니다.</td>
     </tr> 
     
     <tr>
               <th width="40px">번호</th>
               <th width="151px">분류</th>
               <th width="285px">내용</th>
               <th width="145px">회원구분</th>
               <th width="137px">작성일자</th>
               <th width="95px">처리여부</th>
     </tr>
     
     <c:if test="${!empty ilist}">
     	<c:forEach var="i" items="${ilist}">
     	 <tr>
     	 	<td align="center" class="inq_list_underline">
     	 	  ${i.inq_no}
     	 	</td>
     	 	
     	 	<td class="inq_list_underline">
     	 		${i.inq_item1}
     	 	</td>
     	 	
     	 	<td align="center" class="inq_list_underline">
     	 	  ${i.inq_cont}
     	 	</td>
    
     	 	<td align="center" class="inq_list_underline">
     	 	  ${i.inq_phone}
     	 	</td>
 
     	 	<td align="center" class="inq_list_underline">
     	 	  ${i.inq_date}
     	 	</td>
 
     	 	<td align="center" class="inq_list_underline">
     	 	  ${i.inq_state}
     	 	</td>
     	 </tr>
     	</c:forEach>
     </c:if>
     
     <c:if test="${empty ilist}">
          <tr>
          	<th colspan="6">문의사항 목록이 없습니다.</th>
          </tr>
     </c:if>
     
     
     <%--페이징 구간--%>
     <tr>
     	<td colspan="6" align="center" id="inq_paging">
     	<%--전체리스트 (검색전) --%>
     	<c:if test="${(empty search_field) && (empty search_name)}">
     		<c:if test="${page<=1}">
     			< 이전&nbsp;
     		</c:if>
     		<c:if test="${page>1}">
     			<a href="admin_inquire?page=${page-1}">< 이전</a>&nbsp;
     		</c:if>
     		
     		<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
     			<c:if test="${a==page}">
     				<b>${a}</b>&nbsp;
     			</c:if>
     			
     			<c:if test="${a != page}">
     				<a href="admin_inquire?page=${a}">${a}</a>&nbsp;
     			</c:if>
     		</c:forEach>
     		
     		<c:if test="${page >= maxpage}">
     		   다음 >
     		</c:if>
     		
     		<c:if test="${page < maxpage}">
     			<a href="admin_inquire?page=${page+1}">다음 ></a>
     		</c:if>
     	</c:if>
     	<%-- 검색전 페이징 끝 --%>
     	
     	<%--검색후 페이징 --%>
     	<c:if test="${(!empty search_field) || (!empty search_name)}">
     		<c:if test="${page<=1}"> <%--이전 비활성 --%>
     			< 이전&nbsp;
     		</c:if>
     		
     		<c:if test="${page > 1}"> <%--이전 활성화 --%>
     			<a href="admin_inquire?page=${page-1}&search_field=${search_field}&search_name=${search_name}">< 이전</a>&nbsp;
     		</c:if>
     		
     		<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
     		 <c:if test="${a==page}"> <%--선택된 쪽번호 --%>
     		 	<b>${a}</b>&nbsp;
     		 </c:if>
     		 
     		 <c:if test="${a != page}">
     		 	<a href="admin_inquire?page=${a}&search_field=${search_field}&search_name=${search_name}">${a}</a>&nbsp;
     		 </c:if>
     		</c:forEach>
     		
     		<c:if test="${page < maxpage}">
     			<a href="admin_inquire?page=${page+1}&search_field=${search_field}&search_name=${search_name}">다음 ></a>
     		</c:if>
     	</c:if>
     	</td>
     </tr>
     	<%--검색후 페이징 끝 --%>
     
  </table>
 </div>

	<div id="inq_search_interface">
		<select name="search_field">
			<option value="inq_item1" <c:if test="${search_field == 'inq_item1'}">${'selected'}</c:if>>
				제목
			</option>
			<option value="inq_cont" <c:if test="${search_field == 'inq_cont'}">${'selected'}</c:if>>
				내용
			</option>
			<option value="inq_phone" <c:if test="${search_field == 'inq_phone'}">${'selected'}</c:if>>
				전화번호
			</option>
		</select>
		<input name="inq_search_name" id="inq_search_name" size="15" value="${search_name}" />
		<input type="submit" value="검색"/>
	</div>     
</form>
<%@include file="../include/admin_footer.jsp" %>
</body>
</html>
