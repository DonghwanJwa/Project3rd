<%@ page contentType="text/html; charset=UTF-8"%>
<meta charset="UTF-8">
<%@ include file="../include/admin_header.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin_inquire.css"/>
<script src="${pageContext.request.contextPath}/resources/js/admin_inquire.js"></script>
 <h3 class=admin_inq_title>문의목록</h3>
<form action="admin_inquire">
 <div class=admin_inq_main>
  <table id="adm_inquire_table">
     <tr>
      <td align="right" colspan="6" class="adm_inquire_count">${listcount} 개의 문의사항이 있습니다.</td>
     </tr> 
     
     <tr>
               <th width="40px">번호</th>
               <th width="131px">분류</th>
               <th width="160px">내용</th>
               <th width="125px">회원구분</th>
               <th width="200px">작성일자</th>
               <th width="85px">처리여부</th>
     </tr>
     
     <c:if test="${!empty ilist}">
     	<c:forEach var="i" items="${ilist}">   	 	
     	 <tr onclick="location.href='${pageContext.request.contextPath}/admin_inquire_info?no=${i.inq_no}&page=${page}'" class="inq_adm_tr">
     	 	<td align="center" class="inq_list_underline">
     	 	  ${i.inq_no}
     	 	</td>
     	 	<td align="center" class="inq_list_underline">
     	 		${i.inq_item1}
     	 	</td>
     	 	
     	 	<td align="center" class="inq_list_underline" id="inq_cont_td">
     	 	  ${i.inq_cont}
     	 	</td>
    
     	 	<td align="center" class="inq_list_underline">
     	 	  <c:if test="${i.mem_no != 0}">
     	 	  	<font color="blue">가입회원</font>
     	 	  </c:if>
     	 	  <c:if test="${i.mem_no == 0}">
     	 	   	<font color="red">비회원</font>
     	 	  </c:if>
     	 	</td>
 
     	 	<td align="center" class="inq_list_underline">
     	 	  ${i.inq_date}
     	 	</td>
 
     	 	<td align="center" class="inq_list_underline">
     	 	  <c:if test="${i.inq_state == 1}">
     	 	  	<font color="blue">처리완료</font>
     	 	  </c:if>
     	 	  <c:if test="${i.inq_state == 0}">
     	 	  	<font color="red">처리대기</font>
     	 	  </c:if>
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
     	<c:if test="${(empty search_field) && (empty search_field_item) && (empty search_field_handling) && (empty search_field_info)}">
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
     	<c:if test="${(!empty search_field) || (!empty search_field_item) || (!empty search_field_handling || (!empty search_field_info))}">
     		<c:if test="${page<=1}"> <%--이전 비활성 --%>
     			< 이전&nbsp;
     		</c:if>
     		
     		<c:if test="${page > 1}"> <%--이전 활성화 --%>
     			<a href="admin_inquire?page=${page-1}&search_field=${search_field}&search_field_item=${search_field_item}&search_field_handling=${search_field_handling}&search_field_info=${search_field_info}">< 이전</a>&nbsp;
     		</c:if>
     		
     		<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
     		 <c:if test="${a==page}"> <%--선택된 쪽번호 --%>
     		 	<b>${a}</b>&nbsp;
     		 </c:if>
     		 
     		 <c:if test="${a != page}">
     		 	<a href="admin_inquire?page=${a}&search_field=${search_field}&search_field_item=${search_field_item}&search_field_handling=${search_field_handling}&search_field_info=${search_field_info}">${a}</a>&nbsp;
     		 </c:if>
     		</c:forEach>
     		
     		<c:if test="${page >= maxpage}">
     			다음
     		</c:if>
     		
     		<c:if test="${page < maxpage}">
     			<a href="admin_inquire?page=${page+1}&search_field=${search_field}&search_field_item=${search_field_item}&search_field=${search_field}&search_field_handling=${search_field_handling}&search_field=${search_field}&search_field_info=${search_field_info}">다음 ></a>
     		</c:if>
     	</c:if>
     	<%--검색후 페이징 끝 --%>
     
  </table>
 </div>

	<div id="inq_search_interface">
	   <div class="select">
		<select name="search_field" id="search_field" style="margin-right:5px;">
			<option value="all"  selected>
				회원구분
			</option>
			<option value="회원" <c:if test="${search_field == '회원'}">${'selected'}</c:if>>
				회원
			</option>
			<option value="비회원" <c:if test="${search_field == '비회원'}">${'selected'}</c:if>>
				비회원
			</option>
		</select>
	   </div>
		
	   <div class="select">
		<select name="search_field_item" id="search_field_item" style="margin-right:5px;">
			<option value="all" selected>
			  문의분류
			</option>
			<option value="개선/제안" <c:if test="${search_field_item == '개선/제안'}">${'selected'}</c:if>>
				개선/제안
			</option>
			<option value="일반문의" <c:if test="${search_field_item == '일반문의'}">${'selected'}</c:if>>
				일반문의
			</option>
			<option value="제휴/협업문의" <c:if test="${search_field_item == '제휴/협업문의'}">${'selected'}</c:if>>
				제휴/협업문의
			</option>
		</select>
	  </div>
		
	  <div class="select">
		<select name="search_field_handling" id="search_field_handling" style="margin-right:5px;">
			<option value="all" selected>
			 처리여부
			</option>
			<option value="처리" <c:if test="${search_field_handling == '처리'}">${'selected'}</c:if>>
				처리완료
			</option>
			<option value="미처리" <c:if test="${search_field_handling == '미처리'}">${'selected'}</c:if>>
				처리대기
			</option>
		</select>
	  </div>
	  
		<select name="search_field_info" id="search_field_info">
			<option value="all" selected>
			  상세검색
			</option>
			<option value="내용" <c:if test="${search_field_info == 'i.inq_cont'}">${'selected'}</c:if>>
				내용
			</option>
			<option value="Phone" <c:if test="${search_field_info == 'i.inq_phone'}">${'selected'}</c:if>>
				Phone
			</option>
			<option value="Email" <c:if test="${search_field_info == 'i.inq_email'}">${'selected'}</c:if>>
				Email
			</option>
		</select>	
	  
		<!-- 검색 DIV -->
		<input name="search_name" id="search_name" size="15" value="${search_name}" />
		<input type="submit" value="검색"/>
	</div>     
</form>
<%@include file="../include/admin_footer.jsp" %>
</body>
</html>
