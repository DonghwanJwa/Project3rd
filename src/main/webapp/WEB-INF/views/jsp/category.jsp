<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="./resources/css/category.css" />

 <div id=cat_empty>
  <div id=cat_title_name><strong>영화·평가</strong></div>
   <div id=cat_writer_block>
    <div id=cat_writer_title><b>추천작가</b></div>
     <div id=cat_writer_list>
       <a class=cat_writer_a href="./profile">
      	<div id=cat_writer_list1>
       		<div id=cat_writer_face1>
        		<img class="cat_face_img" src="./resources/img/cat_writer_face1.jpg" alt="작가이미지" />
       		</div>
       		<div class=cat_writer_name><strong>좌동환</strong></div>
       		<div id=cat_write_count1>글      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	    : &nbsp;25개</div>
       		<div id=cat_sub_count1>구독자 : 121만</div>
      		 <div class=cat_writer_keyword_div>
      		 	<button class="cat_writer_keyword" ><strong>영화</strong></button>
      		 	<button class="cat_writer_keyword" ><strong>여행</strong></button>
      		 	<button class="cat_writer_keyword" ><strong>맛집</strong></button>
      		 </div>
      	</div>
       </a>
        <a class=cat_writer_a href="./profile">
          <div id=cat_writer_list2>
        	<div id=cat_writer_face2>
         		<img class="cat_face_img" src="./resources/img/cat_writer_face2.jpg" alt="작가이미지" />
         	</div>
         	<div class=cat_writer_name><strong>최하늘</strong></div>
         	<div id=cat_write_count2>글      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	    : &nbsp;30개</div>
         	<div id=cat_sub_count2>구독자 :  122만</div>
         	 <div class=cat_writer_keyword_div>
         	    <button class="cat_writer_keyword" ><strong>영화</strong></button>
      		 	<button class="cat_writer_keyword" ><strong>여행</strong></button>
      		 	<button class="cat_writer_keyword" ><strong>맛집</strong></button>
         	 </div>
          </div>
        </a>
         <a class=cat_writer_a href="./profile">
        	<div id=cat_writer_list3>
         		<div id=cat_writer_face3>
          			<img class="cat_face_img" src="./resources/img/cat_writer_face3.png" alt="작가이미지" />        
         		</div>
         		<div class=cat_writer_name><strong>이상헌</strong></div>
        		<div id=cat_write_count3>글      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	    : &nbsp;40개</div>
        		<div id=cat_sub_count3>구독자 : 123만</div>
        		 <div class=cat_writer_keyword_div>
      		 	  <button class="cat_writer_keyword" ><strong>영화</strong></button>
      		 	  <button class="cat_writer_keyword"><strong>여행</strong></button>
      		 	  <button class="cat_writer_keyword" ><strong>맛집</strong></button>
      		 	 </div>
        	</div>
         </a>
          <a class=cat_writer_a href="./profile">
         	<div id=cat_writer_list4>
         		 <div id=cat_writer_face4>
           			<img class="cat_face_img" src="./resources/img/cat_writer_face4.jpg" alt="작가이미지" />
          		 </div>
         		 <div class=cat_writer_name><strong>노광훈</strong></div>
         		 <div id=cat_write_count4>글      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	    : &nbsp;45개</div>
         		 <div id=cat_sub_count4>구독자 : 125만</div>
         		 	<div class=cat_writer_keyword_div>
      		 			<button class="cat_writer_keyword" ><strong>영화</strong></button>
      		 			<button class="cat_writer_keyword" ><strong>여행</strong></button>
      		 			<button class="cat_writer_keyword" ><strong>맛집</strong></button>
      		        </div>
         	</div>
          </a>
           <a class=cat_writer_a href="./profile">
          		<div id=cat_writer_list5>
           			<div id=cat_writer_face5>
            			<img class="cat_face_img" src="./resources/img/cat_writer_face5.png" alt="작가이미지" />
           			</div>
          			<div class=cat_writer_name><strong>김학영</strong></div>
          			<div id=cat_write_count5>글      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	    : &nbsp;50개</div>
          			<div id=cat_sub_count5>구독자 : 140만</div>
          				<div class=cat_writer_keyword_div>
      		 				<button class="cat_writer_keyword" ><strong>영화</strong></button>
      		 				<button class="cat_writer_keyword" ><strong>여행</strong></button>
      		 				<button class="cat_writer_keyword" ><strong>맛집</strong></button>
      				    </div>
          		</div>
          </a>
     </div>
     
     
     <div class=cat_write_button>
     <input type="button" id="cat_book_button" class="cat_write_btn" value="Article"  onclick="location.href='category?directory=articles'" >
     	<input type="button" id="cat_write_button" class="cat_book_btn" value="Book" onclick="location.href='category?directory=books'"/>
     	 
     </div>
   </div>
   
    <!-- 글 내용부분 -->
    <c:forEach begin="1" end="5" step="1" var="i">
	<div class=cat_writing_block>
	 <div class=cat_writing>
	  <div class="cat_writing_img-div">
	   <img class="cat_writing_img" src="./resources/img/joker.jpg" alt="글" />
	  </div>
	 <a class=cat_write_top href="./read">
	  <div class=cat_writing_top>
	  	<p class=cat_story_title><strong>왜 그는 조커가 되었나.</strong></p>
	  	<span class=cat_story_cont>'인생이란 가까이서 보면 비극이지만, 멀리서 보면 희극이다.'                    찰리 체플린이 남긴 유명한 말이다. 꽤나 희망적인 의미를 담고 있는 것 같지만,이말의 순서를 뒤집으면, 우리가 지금 살고 있는 하루하루는 비극이라는 의미다.</span>
	  	<span class=cat_story_writer>By 최하늘</span>
	  </div>
	</a>
	  <div class=cat_writing_bottom>
	   <button class=cat_writing_button onclick="location.href='http://localhost:8018/jamong.com/search?result=post'"><b>여행</b></button>
	   <button class=cat_writing_button2 onclick="location.href='http://localhost:8018/jamong.com/search?result=post'"><b>힐링</b></button>
	   <button class=cat_writing_button3 onclick="location.href='http://localhost:8018/jamong.com/search?result=post'"><b>도시</b></button>
	  </div>
	 </div>
	</div>
	</c:forEach>
	<!-- 끝 -->
	
	<div class=cat_writing_block>
	 <div class=cat_writing>
	  <div class="cat_writing_img-div">
	   <img class="cat_writing_img" src="./resources/img/write1.jpg" alt="글" />
	  </div>
	 <a class=cat_write_top href="./read">
	  <div class=cat_writing_top>
	  	<p class=cat_story_title><strong>친구가 소개팅에서 남자에게 학을 뗐다.</strong></p>
	  	<span class=cat_story_cont>단 두번밖에 만나지 않은 남자에게 이별을 고했더니, 폭언을 쏟아냈단다. 평생 노처녀로 늙을 팔자랬다나. 열길 물속은 알아도 한길 사람 속은 모른다며 친구를 피를 토했다.</span>
	  	<span class=cat_story_writer>By 최하늘</span>
	  </div>
	</a>
	  <div class=cat_writing_bottom>
	   <button class=cat_writing_button onclick="location.href='http://localhost:8018/jamong.com/search?result=post'"><b>이별</b></button>
	   <button class=cat_writing_button2 onclick="location.href='http://localhost:8018/jamong.com/search?result=post' "><b>슬픔</b></button>
	   <button class=cat_writing_button3 onclick="location.href='http://localhost:8018/jamong.com/search?result=post' "><b>눈물</b></button>
	  </div>
	 </div>
	</div>
	<div class=cat_writing_block>
	 <div class=cat_writing>
	  <div class="cat_writing_img-div">
	   <img class="cat_writing_img" src="./resources/img/write2.jpg" alt="글" />
	  </div>
	 <a class=cat_write_top href="./read">
	  <div class=cat_writing_top>
	  	<p class=cat_story_title><strong>우리집 강아지가 나를 돌보는 방법.</strong></p>
	  	<span class=cat_story_cont>우리 강아지 크림이는 4살이 되어 우리집에 왔다. 크림이는 아픔이 많은 강아지다.</span>
	  	<span class=cat_story_writer>By 최하늘</span>
	  </div>
	</a>
	  <div class=cat_writing_bottom>
	   <button class=cat_writing_button onclick="location.href='http://localhost:8018/jamong.com/search?result=post'"><b>반려</b></button>
	   <button class=cat_writing_button2 onclick="location.href='http://localhost:8018/jamong.com/search?result=post'"><b>동물</b></button>
	   <button class=cat_writing_button3 onclick="location.href='http://localhost:8018/jamong.com/search?result=post'"><b>존귀</b></button>
	  </div>
	 </div>
	</div>  
	<div class=cat_writing_block>
	 <div class=cat_writing>
	  <div class="cat_writing_img-div">
	   <img class="cat_writing_img" src="./resources/img/write3.jpg" alt="글" />
	  </div>
	 <a class=cat_write_top href="./read">
	  <div class=cat_writing_top>
	  	<p class=cat_story_title><strong>돈 있는 백수의 맛</strong></p>
	  	<span class=cat_story_cont>포틀랜드에 가기로 결심한 두 번째 이유는 후드산(Mt.Hood)이었다. 도심에서 한시간만 벗어나면 만날 수 있다는 후드산 사진을 보고 홀딱 반했다. 포틀랜드에 뭣하러 가냐는 질문을 받았을 때 가장 많이 보여준 것도 후드산 사진이었다.</span>
	  	<span class=cat_story_writer>By 최하늘</span>
	  </div>
	</a>
	  <div class=cat_writing_bottom>
	   <button class=cat_writing_button onclick="location.href='http://localhost:8018/jamong.com/search?result=post'"><b>여행</b></button>
	   <button class=cat_writing_button2 onclick="location.href='http://localhost:8018/jamong.com/search?result=post'"><b>포틀랜드</b></button>
	   <button class=cat_writing_button3 onclick="location.href='http://localhost:8018/jamong.com/search?result=post'"><b>후드산</b></button>
	  </div>
	 </div>
	</div>    
   </div>
<%@ include file="../include/footer.jsp" %>