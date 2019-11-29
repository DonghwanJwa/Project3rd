<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>


 <div id=cat_empty>
  <div id=cat_title_name><strong>영화·평가</strong></div>
   <div id=cat_writer_block>
    <div id=cat_writer_title><b>추천작가</b></div>
     <div id=cat_writer_list>
       <a class=cat_writer_a href="./profile">
      	<div id=cat_writer_list1>
       		<div id=cat_writer_face1>
        		<img class="cat_face_img" src="./resources/cat_writer_face1.jpg" alt="작가이미지" />
       		</div>
       		<div class=cat_writer_name><strong>좌동환</strong></div>
       		<div id=cat_write_count1>글      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	    : &nbsp;25개</div>
       		<div id=cat_sub_count1>구독자 : 121만</div>
      		 <div class=cat_writer_keyword_div>
      		 	<button class="cat_writer_keyword" ><strong>영화</strong></button>
      		 	<button class="cat_writer_keyword"><strong>여행</strong></button>
      		 	<button class="cat_writer_keyword"><strong>맛집</strong></button>
      		 </div>
      	</div>
       </a>
        <a class=cat_writer_a href="./profile">
          <div id=cat_writer_list2>
        	<div id=cat_writer_face2>
         		<img class="cat_face_img" src="./resources/cat_writer_face2.jpg" alt="작가이미지" />
         	</div>
         	<div class=cat_writer_name><strong>최하늘</strong></div>
         	<div id=cat_write_count2>글      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	    : &nbsp;30개</div>
         	<div id=cat_sub_count2>구독자 :  122만</div>
         	 <div class=cat_writer_keyword_div>
         	    <button class="cat_writer_keyword"><strong>영화</strong></button>
      		 	<button class="cat_writer_keyword"><strong>여행</strong></button>
      		 	<button class="cat_writer_keyword"><strong>맛집</strong></button>
         	 </div>
          </div>
        </a>
         <a class=cat_writer_a href="./profile">
        	<div id=cat_writer_list3>
         		<div id=cat_writer_face3>
          			<img class="cat_face_img" src="./resources/cat_writer_face3.png" alt="작가이미지" />        
         		</div>
         		<div class=cat_writer_name><strong>이상헌</strong></div>
        		<div id=cat_write_count3>글      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	    : &nbsp;40개</div>
        		<div id=cat_sub_count3>구독자 : 123만</div>
        		 <div class=cat_writer_keyword_div>
      		 	  <button class="cat_writer_keyword"><strong>영화</strong></button>
      		 	  <button class="cat_writer_keyword"><strong>여행</strong></button>
      		 	  <button class="cat_writer_keyword"><strong>맛집</strong></button>
      		 	 </div>
        	</div>
         </a>
          <a class=cat_writer_a href="./profile">
         	<div id=cat_writer_list4>
         		 <div id=cat_writer_face4>
           			<img class="cat_face_img" src="./resources/cat_writer_face4.jpg" alt="작가이미지" />
          		 </div>
         		 <div class=cat_writer_name><strong>노광훈</strong></div>
         		 <div id=cat_write_count4>글      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	    : &nbsp;45개</div>
         		 <div id=cat_sub_count4>구독자 : 125만</div>
         		 	<div class=cat_writer_keyword_div>
      		 			<button class="cat_writer_keyword"><strong>영화</strong></button>
      		 			<button class="cat_writer_keyword"><strong>여행</strong></button>
      		 			<button class="cat_writer_keyword"><strong>맛집</strong></button>
      		        </div>
         	</div>
          </a>
           <a class=cat_writer_a href="./profile">
          		<div id=cat_writer_list5>
           			<div id=cat_writer_face5>
            			<img class="cat_face_img" src="./resources/cat_writer_face5.png" alt="작가이미지" />
           			</div>
          			<div class=cat_writer_name><strong>김학영</strong></div>
          			<div id=cat_write_count5>글      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	    : &nbsp;50개</div>
          			<div id=cat_sub_count5>구독자 : 140만</div>
          				<div class=cat_writer_keyword_div>
      		 				<button class="cat_writer_keyword"><strong>영화</strong></button>
      		 				<button class="cat_writer_keyword"><strong>여행</strong></button>
      		 				<button class="cat_writer_keyword"><strong>맛집</strong></button>
      				    </div>
          		</div>
          </a>
     </div>
     
   	<!-- 글,책 버튼  -->  
     <div class=cat_write_button>
     	<input type="button" id="cat_write_button" class="cat_write_btn" value="글">
     	<input type="button" id="cat_book_button" class="cat_book_btn" value="책"> 
     </div>
   </div>
   
   
   <!-- 책 div시작 -->
	<div class=cat_writing_block>
	
	 <div class=cat_writing>
	   <img class="cat_writing_img" src="./resources/out.jpg" alt="글" />
		<div class="cat_book_inner">
			<p class=cat_story_title><strong>숲에 소원을 빌어요.</strong></p>
			<span class=cat_story_writer>최하늘</span>
		</div>
		<span class=cat_jamong_book>Jamong Book</span>	 
	 </div>
	
	<div class="cat_writing">
	   <img class="cat_writing_img" src="./resources/out.jpg" alt="글" />
		<div class="cat_book_inner">
			<p class="cat_story_title"><strong>숲에 소원을 빌어요.</strong></p>
			<span class="cat_story_writer">최하늘</span>
		</div>
		<span class=cat_jamong_book>Jamong Book</span>
	 </div>
	 
	 <div class=cat_writing>
	   <img class="cat_writing_img" src="./resources/out.jpg" alt="글" />
		<div class="cat_book_inner">
			<p class=cat_story_title><strong>숲에 소원을 빌어요.</strong></p>
			<span class=cat_story_writer>최하늘</span>
		</div>
		<span class=cat_jamong_book>Jamong Book</span>	 
	 </div>
	</div>
	
   </div>
<%@ include file="../include/footer.jsp" %>