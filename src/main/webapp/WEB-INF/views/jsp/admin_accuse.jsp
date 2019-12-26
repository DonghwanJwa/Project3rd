<%@ page contentType="text/html; charset=UTF-8"%>
<meta charset="UTF-8">
<%@ include file="../include/admin_header.jsp" %>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/admin_accuse.css"/>
<script src="/jamong.com/resources/js/admin_accuse.js"></script>
 <h3 class=admin_acc_title>신고목록</h3>
<form action="admin_accuse">
 <div class=admin_acc_main>
  <table id="adm_accuse_table">
     <tr>
      <td align="right" colspan="6" class="adm_accuse_count">${listcount} 개의 신고사항이 있습니다.</td>
     </tr> 
     
     <tr>
               <th width="40px">번호</th>
               <th width="131px">분류</th>
               <th width="160px">내용</th>
               <th width="125px">신고항목</th>
               <th width="200px">신고일자</th>
               <th width="85px">처리여부</th>
     </tr>
     
     <c:if test="${!empty alist}">
     	<c:forEach var="a" items="${alist}">   	 	
     	 <tr onclick="location.href='/jamong.com/admin_accuse_info?no=${a.ac_no}&page=${page}'" class="ac_adm_tr">
     	 	<td align="center" class="ac_list_underline">
     	 	  ${a.ac_no}
     	 	</td>
     	 	<td align="center" class="ac_list_underline">
     	 		${a.ac_reason}
     	 	</td>
     	 	
     	 	<td align="center" class="ac_list_underline" id="ac_cont_td">
     	 	  ${a.ac_cont}
     	 	</td>
    
     	 	<td align="center" class="ac_list_underline">
     	 	  <c:if test="${a.ac_item == 1}">
     	 	  	<font color="blue">회원신고</font>
     	 	  </c:if>
     	 	  <c:if test="${a.ac_item == 2}">
     	 	   	<font color="red">게시물신고</font>
     	 	  </c:if>
     	 	</td>
 
     	 	<td align="center" class="ac_list_underline">
     	 	  ${a.ac_date}
     	 	</td>
 
     	 	<td align="center" class="ac_list_underline">
     	 	  <c:if test="${a.ac_state == 1}">
     	 	  	<font color="blue">처리완료</font>
     	 	  </c:if>
     	 	  <c:if test="${a.ac_state == 0}">
     	 	  	<font color="red">처리대기</font>
     	 	  </c:if>
     	 	</td>     	   
    </tr>
     		</c:forEach>
     	</c:if>
     
     <c:if test="${empty alist}">
          <tr>
          	<th colspan="6">문의사항 목록이 없습니다.</th>
          </tr>
     </c:if>
     
     
     <%--페이징 구간--%>
     <tr>
     	<td colspan="6" align="center" id="ac_paging">
     	<%--전체리스트 (검색전) --%>
     	<c:if test="${(empty search_field) && (empty search_field_item) && (empty search_field_handling) && (empty search_field_info)}">
     		<c:if test="${page<=1}">
     			< 이전&nbsp;
     		</c:if>
     		<c:if test="${page>1}">
     			<a href="admin_accuse?page=${page-1}">< 이전</a>&nbsp;
     		</c:if>
     		
     		<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
     			<c:if test="${a==page}">
     				<b>${a}</b>&nbsp;
     			</c:if>
     			
     			<c:if test="${a != page}">
     				<a href="admin_accuse?page=${a}">${a}</a>&nbsp;
     			</c:if>
     		</c:forEach>
     		
     		<c:if test="${page >= maxpage}">
     		   다음 >
     		</c:if>
     		
     		<c:if test="${page < maxpage}">
     			<a href="admin_accuse?page=${page+1}">다음 ></a>
     		</c:if>
     	</c:if>
     	<%-- 검색전 페이징 끝 --%>
     	
     	<%--검색후 페이징 --%>
     	<c:if test="${(!empty search_field) || (!empty search_field_item) || (!empty search_field_handling || (!empty search_field_info))}">
     		<c:if test="${page<=1}"> <%--이전 비활성 --%>
     			< 이전&nbsp;
     		</c:if>
     		
     		<c:if test="${page > 1}"> <%--이전 활성화 --%>
     			<a href="admin_accuse?page=${page-1}&search_field=${search_field}&search_field_item=${search_field_item}&search_field_handling=${search_field_handling}&search_field_info=${search_field_info}">< 이전</a>&nbsp;
     		</c:if>
     		
     		<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
     		 <c:if test="${a==page}"> <%--선택된 쪽번호 --%>
     		 	<b>${a}</b>&nbsp;
     		 </c:if>
     		 
     		 <c:if test="${a != page}">
     		 	<a href="admin_accuse?page=${a}&search_field=${search_field}&search_field_item=${search_field_item}&search_field_handling=${search_field_handling}&search_field_info=${search_field_info}">${a}</a>&nbsp;
     		 </c:if>
     		</c:forEach>
     		
     		<c:if test="${page >= maxpage}">
     			다음
     		</c:if>
     		
     		<c:if test="${page < maxpage}">
     			<a href="admin_accuse?page=${page+1}&search_field=${search_field}&search_field_item=${search_field_item}&search_field=${search_field}&search_field_handling=${search_field_handling}&search_field=${search_field}&search_field_info=${search_field_info}">다음 ></a>
     		</c:if>
     	</c:if>
     	</td>
     </tr>
     	<%--검색후 페이징 끝 --%>
     
  </table>
 </div>

	 <div id="ac_search_interface">
	   <div class="select">
		<select name="search_field" id="search_field" style="margin-right:5px;">
			<option value="all"  selected>
				회원구분
			</option>
			<option value="신고자" <c:if test="${search_field == '신고자'}">${'selected'}</c:if>>
				신고자
			</option>
			<option value="피신고인" <c:if test="${search_field == '피신고인'}">${'selected'}</c:if>>
				피신고인
			</option>
		</select>
	   </div>
		
	   <div class="select">
		<select name="search_field_acc" id="search_field_acc" style="margin-right:5px;height:24.4px;">
			<option value="all" selected>
			  신고구분
			</option>
			<option value="회원신고" <c:if test="${search_field_acc == '회원신고'}">${'selected'}</c:if>>
				회원신고
			</option>
			<option value="게시물신고" <c:if test="${search_field_acc == '게시글신고'}">${'selected'}</c:if>>
				게시물신고
			</option>
		</select>
	  </div>
	  
	  <div class="select">
	    <select name="search_field_item" id="search_field_item" style="margin-right:5px;">
	      <option value="all" selected>
	        	신고목록
	      </option>
	      <option value="영리목적/홍보성"<c:if test="${search_field_item == '개선/제안'}">${'selected'}</c:if>>
	      	영리목적/홍보성
	      </option>
	      <option value="불법정보"<c:if test="${search_field_item == '불법정보'}">${'selected'}</c:if>>
	      	불법정보
	      </option>
	      <option value="욕설/인신공격"<c:if test="${search_field_item == '욕설/인신공격'}">${'selected'}</c:if>>
	      	욕설/인신공격
	      </option>
	      <option value="음란/선정성"<c:if test="${search_field_item == '음란/선정성'}">${'selected'}</c:if>>
	      	음란/선정성
	      </option>
	      <option value="개인정보노출"<c:if test="${search_field_item == '개인정보노출'}">${'selected'}</c:if>>
	      	개인정보노출
	      </option>
	      <option value="같은내용도배"<c:if test="${search_field_item == '같은내용도배'}">${'selected'}</c:if>>
	      	같은내용도배
	      </option>
	      <option value="권리침해신고"<c:if test="${search_field_item == '권리침해신고'}">${'selected'}</c:if>>
	      	권리침해신고
	      </option>
	      <option value="기타"<c:if test="${search_field_item == '기타'}">${'selected'}</c:if>>
	      	기타
	      </option>
	    </select>
	   </div>
		
	  <div class="select">
		<select name="search_field_handling" id="search_field_handling" style="margin-right:5px;">
			<option value="all" selected>
			 처리여부
			</option>
			<option value="처리완료" <c:if test="${search_field_handling == '처리완료'}">${'selected'}</c:if>>
				처리완료
			</option>
			<option value="미처리" <c:if test="${search_field_handling == '처리대기'}">${'selected'}</c:if>>
				처리대기
			</option>
		</select>
	  </div>
	  
		<select name="search_field_info" id="search_field_info">
			<option value="all" selected>
			  상세검색
			</option>
			<option value="ID" <c:if test="${search_field_info == 'a.memberVO.mem_id'}">${'selected'}</c:if>>
				ID
			</option>
			<option value="내용" <c:if test="${search_field_info == 'a.ac_cont'}">${'selected'}</c:if>>
				내용
			</option>
			<option value="Phone" <c:if test="${search_field_info == 'a.memberVO.mem_phone'}">${'selected'}</c:if>>
				Phone
			</option>
			<option value="Email" <c:if test="${search_field_info == 'a.memberVO.mem_email'}">${'selected'}</c:if>>
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
