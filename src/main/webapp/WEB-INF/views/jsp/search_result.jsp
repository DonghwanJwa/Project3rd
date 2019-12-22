<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/search_result.css" />
<script src="/jamong.com/resources/js/search.js"></script>

<div id="search_wrap">
 <div id="search_inner_wrap">
	<%-- 검색페이지 header --%>
	<div id="search_header">
	 <div id="search_area">
	  <div id="search_area_align">
	   <input id="search_keyword" name="q" placeholder="검색어 입력" value="${q}" onkeyup="searchEnter(this);">
	   <input type="button" id="search_submit" onclick="search('${w}','${s}');">
	  </div>
	 </div>
	 <div id="search_type">
	 <c:if test="${w eq 'post'}">
	  <input type="button" id="search_type_btn_post" class="btn type_btn view" value="글">
	 </c:if>
	 <c:if test="${w ne 'post'}">
	  <input type="button" id="search_type_btn_post" class="btn type_btn" value="글" onclick="search('post','accuracy');"> 
	 </c:if>
	 <c:if test="${w eq 'book'}">
	  <input type="button" id="search_type_btn_work" class="btn type_btn view" value="작품">
	 </c:if>
	 <c:if test="${w ne 'book'}">
	  <input type="button" id="search_type_btn_work" class="btn type_btn" value="작품" onclick="search('book','');"> 
	 </c:if>
	 <c:if test="${w eq 'author'}">
	  <input type="button" id="search_type_btn_author" class="btn type_btn view" value="작가">
	 </c:if>
	 <c:if test="${w ne 'author'}">
	  <input type="button" id="search_type_btn_author" class="btn type_btn" value="작가" onclick="search('author','all');">
	 </c:if>
	 </div>
	</div>
	
	<div id="search_result_contents">
	
	 <%-- 검색 페이지 '글' 검색 결과 --%>
	<c:if test="${w eq 'post'}">
	 <div id="search_result_post">
	  <%-- 검색 결과 정렬기준 --%>
	  <div id="search_result_post_type">
	  <c:if test="${s eq 'accuracy'}">
	   <input type="button" id="btn_accuracy" class="btn" value="정확도">
	  </c:if>
	  <c:if test="${s ne 'accuracy'}">
	   <input type="button" id="btn_accuracy" class="btn non-select" value="정확도" onclick="search('post','accuracy');">
	  </c:if>
	  <c:if test="${s eq 'recent'}">
	   <input type="button" id="btn_new" class="btn" value="최신">
	  </c:if>
	  <c:if test="${s ne 'recent'}">
	   <input type="button" id="btn_new" class="btn non-select" value="최신" onclick="search('post','recent');">
	  </c:if>
	  </div>
	
	  <%-- 검색 결과 내용 --%>
	  <div id="search_result_post_main">
	  
	   <ul id="search_result_post_list">
	    <c:forEach var="board" items="${boardList}">
	     <li class="scrolling" data-no="${board.bo_no}"><a href="/jamong.com/@${board.memberVO.mem_id}/${board.bo_no}">
	      <div class="post_cont">
	       <div id="post_text">
	        <div id="post_title">
	        <c:if test="${fn:length(board.bo_title)>20}">
	        ${fn:substring(board.bo_title,0,20)}...
	        </c:if>
	        <c:if test="${fn:length(board.bo_title)<20}">
	        ${board.bo_title}
	        </c:if>
	        </div>
	        <div id="post_cont">
	        <c:if test="${fn:length(board.bo_cont)>100}">
	         ${fn:substring(board.bo_cont,0,100)}...
	        </c:if>
	        <c:if test="${fn:length(board.bo_cont)<100}">
	         ${board.bo_cont}
	         </c:if>
	        </div>
	        <div id="post_writer"><i>by&nbsp;&nbsp;</i>${board.memberVO.mem_nickname}</div>
	        <div id="post_tag">
	         <span>${board.memberVO.mem_keyword}</span>
	        </div>
	        <div id="post_ago">${board.bo_date}</div>
	       </div>
	       <c:set var="img" value="${board.bo_thumbnail}" />
	       <c:if test="${not empty img}">
	        <img id="post_img" src="${board.bo_thumbnail}" alt="그림 안나옴">
	       </c:if>
	       <c:if test="${empty img}">
	        <div id='post_img'></div>
	       </c:if>
	      </div>
	     </a></li>
	    </c:forEach>
	   </ul>
	  </div>
	 </div>
	 </c:if>
	 <%-- 글 검색 결과 --%>
	
	 <%-- 검색 페이지 '작품' 검색 결과 --%>
	<c:if test="${w eq 'book'}">
	 <div id="search_result_work">
	
	  <%-- 검색 결과 정렬 기준 --%>
	  <div id="search_result_work_type">
	   <select id="search_result_work_select">
	    <option value="all" selected>모든 작품</option>
	    <option value="column">컬럼</option>
	    <option value="essay">에세이</option>
	   </select>
	  </div>
	
	  <%-- 검색 결과 내용 --%>
	  <div id="search_result_work_main">
	   <c:forEach begin="1" end="10" step="1">
	    <a href="./book_info">
	     <div class="work_cont">
	      <img id="work_img" src="/jamong.com/resources/img/b.jpg" alt="책 표지인데 안나옴;">
	      <div class="work_cont_view">
	       <div class="work_cont_view_top">
	        <strong>강아지와 지내는건 어때?</strong> <span>by 멍뭉이</span>
	       </div>
	       <div class="work_cont_view_bottom">
	        <span>Jamong Book</span>
	       </div>
	      </div>
	     </div>
	    </a>
	   </c:forEach>
	  </div>
	 </div>
	 </c:if>
	 <%-- 작품 검색 결과 --%>
	
	 <%-- 검색 페이지 '작가' 검색 결과 --%>
	 <c:if test="${w eq 'author'}">
	 <div id="search_result_author">
	
	  <%-- 검색 결과 정렬 기준 --%>
	  <div id="search_result_author_type">
	   <select id="search_result_author_select">
	    <c:if test="${empty s}">
	     <option class="search_result_author_option" value="all" selected>모든 작가</option>
	    </c:if>
	    <c:if test="${!empty s}">
	     <option class="search_result_author_option" value="all">모든 작가</option>
	    </c:if>
	    <c:forEach var="cat" items="${catList}" varStatus="status">
	     <c:if test="${s == cat.cat_name}">
	      <option class="search_result_author_option" value="${cat.cat_name}" selected>${cat.cat_name}</option>
	     </c:if>
	     <c:if test="${s != cat.cat_name}">
	      <option class="search_result_author_option" value="${cat.cat_name}">${cat.cat_name}</option>
	     </c:if>
	    </c:forEach>
	   </select>
	  </div>
	
	  <%-- 검색 결과 내용 --%>
	  
	  <div id="search_result_author_main">
	
	   <div class="author_cont">
	    <c:forEach var="member" items="${memberList}">
	     <a href="/jamong.com/@${member.mem_id}">
	      <div id="search_result_author_profile">
	       <img id="search_result_author_profile_img" src="${member.profile_photo}" alt="프로필 사진">
	       <div id="search_result_author_profile_info">
	        <div id="search_result_author_name">${member.mem_nickname}</div>
	        <div id="search_result_author_introduce">${member.profile_cont}</div>
	        <div id="search_result_author_tag">
	        <c:forEach items="${member.mem_keyword.split('/')}" var="tag">
	         <span>${tag}</span>
	        </c:forEach>
	        </div>
	       </div>
	      </div>
	     </a>
	    </c:forEach>
	
	   </div>
	
	  </div>
	
	 </div>
	 </c:if>
	 <%-- 작가 검색 결과 --%>
	
	</div>
 </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>