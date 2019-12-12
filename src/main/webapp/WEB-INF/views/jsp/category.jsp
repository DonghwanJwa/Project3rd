<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/category.css" />
<script type="text/javascript" src="/jamong.com/resources/js/category.js"></script>

 <div id=cat_empty oncontextmenu="return false" ondragstart="return false"
  onselectstart="return false">
  <div id=cat_title_name><strong>영화·평가</strong></div>
   <div id=cat_writer_block>
    <div id=cat_writer_title><b>추천작가</b></div>
     <div id=cat_writer_list>
      <c:forEach var="cat" items="${mlist}">
       <a class=cat_writer_a href="/jamong.com/profile">
      	<div id=cat_writer_list1>
       		<div id=cat_writer_face1>
        		<img class="cat_face_img" src="./resources/img/cat_writer_face1.jpg" alt="작가이미지" />
       		</div>
       		<div class=cat_writer_name><strong>${cat.mem_id}</strong></div>
       		<div id=cat_write_count1>글      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	    : &nbsp;25개</div>
       		<div id=cat_sub_count>구독자 : 121만</div>
      		 <div class=cat_writer_keyword_div>
      		 	<button class="cat_writer_keyword" ><strong>${cat.mem_fav1}</strong></button>
      		 	<button class="cat_writer_keyword" ><strong>${cat.mem_fav2}</strong></button>
      		 	<button class="cat_writer_keyword" ><strong>${cat.mem_fav3}</strong></button>
      		 </div>
      	</div>
       </a>
       </c:forEach>
     </div>
     <div class=cat_write_button>
      <button type="button" id="cat_write_button" class="cat_write_btn" onclick="location.href='#article';">Article</button>
      <button type="button" id="cat_book_button" class="cat_book_btn" onclick="location.href='#book';">Book</button>     	 
     </div>
   </div>
   
    <!-- 글 내용부분 -->
    <c:forEach begin="1" end="5" step="1" var="i">
	<div class=cat_writing_block>
	 <div class=cat_writing>
	  <div class="cat_writing_img-div">
	   <img class="cat_writing_img" src="/jamong.com/resources/img/joker.jpg" alt="글" />
	  </div>
	 <a class=cat_write_top href="/jamong.com/read">
	  <div class=cat_writing_top>
	  	<p class=cat_story_title><strong>왜 그는 조커가 되었나.</strong></p>
	  	<span class=cat_story_cont>'인생이란 가까이서 보면 비극이지만, 멀리서 보면 희극이다.'                    찰리 체플린이 남긴 유명한 말이다. 꽤나 희망적인 의미를 담고 있는 것 같지만,이말의 순서를 뒤집으면, 우리가 지금 살고 있는 하루하루는 비극이라는 의미다.</span>
	  	<span class=cat_story_writer>By 최하늘</span>
	  </div>
	</a>
	  <div class=cat_writing_bottom>
	   <button class=cat_writing_button onclick="location.href='/jamong.com/search?result=post'"><b>여행</b></button>
	   <button class=cat_writing_button2 onclick="location.href='/jamong.com/search?result=post'"><b>힐링</b></button>
	   <button class=cat_writing_button3 onclick="location.href='/jamong.com/search?result=post'"><b>도시</b></button>
	  </div>
	 </div>
	</div>
	</c:forEach>
	
	<!-- 책부분 시작 -->
	<div class=cat_book_block style="display:none;">	
	 <div class=cat_book onclick="location.href='/jamong.com/book_info'">
	   <img class="cat_book_img" src="/jamong.com/resources/img/out.jpg" alt="글" />
		<div class="cat_book_inner">
			<p class=cat_story_title><strong>숲에 소원을 빌어요.</strong></p>
			<span class=cat_story_writer>최하늘</span>
		</div>
		<span class=cat_inner_line></span>
		<span class=cat_jamong_book>Jamong Book</span>	 
	 </div>
	 
	</div>	
   </div>
<%@ include file="../include/footer.jsp" %>