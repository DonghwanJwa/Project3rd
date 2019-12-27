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
	   <input type="hidden" id="search_rowNum" value="10" disabled/>
	   <input type="hidden" id="search_where" value="${w}" disabled/>
	   <input type="hidden" id="search_step" value="${s}" disabled/>
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
	  
	   <c:if test="${empty boardList}">
		<div class="search_result_none">
		 <span>검색 결과가 없습니다.</span>
		</div>	    
	   </c:if>
	   <ul id="search_result_post_list">
	    <c:forEach var="board" items="${boardList}" varStatus="status">
	     <li class="scrolling" data-no="${status.count}">
	      <div class="post_cont_wrap">     
	      <div id="post_text"
	       <c:if test="${!empty board.bo_thumbnail}"></c:if>
	       <c:if test="${empty board.bo_thumbnail}">
	        class="post_no_img_text"
	       </c:if>
	       >
	        <div class="post_cont_catbook">
	         <a href="/jamong.com/category/${board.cat_name}" class="post_cont_cat">${board.cat_name}</a>
	         <c:if test="${board.book_no ne null}">
	          <span class="post_cont_book">Book</span>
	         </c:if>
	        </div>
	        <a href="/jamong.com/@${board.memberVO.mem_id}/${board.bo_no}">  
	        <div id="post_title">
	        ${board.bo_title}
	        </div>
	        <div id="post_cont"
	         <c:if test="${!empty board.bo_thumbnail}"></c:if>
	         <c:if test="${empty board.bo_thumbnail}">
	          class="post_no_img_cont"
	         </c:if>
	        >
	         ${board.bo_cont}
	        </div>
	        </a>
	        <a href="/jamong.com/@${board.memberVO.mem_id}" class="post_writer"><i>by&nbsp;&nbsp;</i>${board.memberVO.mem_nickname}</a>
	        <div class="post_ago">${board.bo_date}</div>
	       </div>
	       <c:set var="img" value="${board.bo_thumbnail}" />
	       <c:if test="${not empty img}">
	       <a href="/jamong.com/@${board.memberVO.mem_id}/${board.bo_no}" class="post_img_wrap">
	        <img class="post_img" src="${board.bo_thumbnail}" alt="thumbnail">
	       </a>
	       </c:if>
	      </div>
	     </li>
	    </c:forEach>
	   </ul>
	  </div>
	 </div>
	 </c:if>
	 <%-- 글 검색 결과 --%>
	
	 <%-- 검색 페이지 '작품' 검색 결과 --%>
	<c:if test="${w eq 'book'}">
	 <div id="search_result_work">
		
	  <%-- 검색 결과 내용 --%>
	  <div id="search_result_work_main">
	  <c:if test="${empty boardList}">
	  <div style="height:35px;"></div>
		<div class="search_result_none">
		 <span>검색 결과가 없습니다.</span>
		</div>	    
	   </c:if>
	   <c:forEach var="bookList" items="${bookList}" varStatus="status">
	    <a href="/jamong.com/book/@${bookList.memberVO.mem_id}/${bookList.bookVO.book_no}" class="scrolling" data-no="${status.count}">
	     <div class="work_cont">
	      <c:if test="${bookList.bookVO.book_cover eq null}">
		   <img id="work_img" style="background-color:#f2f2f2">
	      </c:if>
	      <c:if test="${bookList.bookVO.book_cover ne null}">
		   <img id="work_img" src="${bookList.bookVO.book_cover}" alt="표지">
	      </c:if>
	      <div class="work_cont_view">
	       <div class="work_cont_view_top">
	        <strong>${bookList.bookVO.book_name}</strong> 
	        <span>by ${bookList.memberVO.mem_nickname}</span>
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
	   
	   <c:if test="${empty boardList}">
		<div class="search_result_none">
		 <span>검색 결과가 없습니다.</span>
		</div>	    
	   </c:if>
	   <ul id="search_author_list">
	    <c:forEach var="member" items="${memberList}" varStatus="status">
	    <li class="scrolling" data-no="${status.count}">
	     <a href="/jamong.com/@${member.mem_id}">
	      <div class="search_result_author_profile">
	       <img class="search_result_author_profile_img" src="${member.profile_photo}" alt="프로필 사진">
	       <div class="search_result_author_profile_info">
	        <div class="search_result_author_name">${member.mem_nickname}</div>
	        <div class="search_result_author_introduce">${member.profile_cont}</div>
	        <div class="search_result_author_tag">
	        <c:forEach items="${member.mem_keyword.split('/')}" var="tag">
	         <span>#${tag}</span>
	        </c:forEach>
	        </div>
	       </div>
	      </div>
	     </a>
	     </li>
	    </c:forEach>
	    </ul>
	
	   </div>
	
	  </div>
	
	 </div>
	 </c:if>
	 <%-- 작가 검색 결과 --%>
	
	</div>
 </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>