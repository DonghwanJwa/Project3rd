<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script>
$(document).ready(function(){
	$('#book_info_intro_like_img').click(function(event){
		if($(event.target).css('background-color')=='rgb(255, 255, 255)'){
			$(event.target).css('background-color','RGB(245,124,104)');
		}else{
			$(event.target).css('background-color','rgb(255, 255, 255)');			
		}
	});
});
</script>
<link rel="stylesheet" type="text/css" href="./resources/css/book_info.css"/>
<div id="book_info_wrap">
 <div id="book_info_base">
  <div id="book_info_about">
  
   <div id="book_info_cover" class="book_info_about_div">
    <img id="book_info_cover_img" src="./resources/img/write2.jpg">
    <div id="book_info_cover_txt">
	 <div id="book_info_cover_head">
	  <strong id="book_info_cover_title">강아지와 지내는건 어때?</strong>
	  <span id="book_info_cover_author">by 멍뭉이 </span>
	 </div>
	 <div id="book_info_cover_bot">
	  <span>Jamong Book</span>
	 </div>
    </div>
    <span id="book_info_cover_line"></span>
   </div>
   
   <div id="book_info_intro" class="book_info_about_div">
    <div id="book_info_intro_inner">
     <div id="book_info_intro_like">
      <button id="book_info_intro_like_inner">
       <img id="book_info_intro_like_img" src="./resources/img/heart.png"/>
      </button>
     </div>
     <strong id="book_info_intro_title">브런치북 소개</strong>
     <p id="book_info_intro_cont">
     	"좋아하는 일이 밥벌이가 될 수 있다면" 10년을 그래픽 디자이너로 일했고, 
     	2018년에는 디자인 사무실을 겸한 작은 카페 ’호피폴라’를 오픈하고, 
     	폐업하기 까지의 이야기를 엮었습니다. 힘빼고 가볍게, 무리하지 말고 살라고 
     	말하는 요즘이지만 ’지금 우리, 젊은 날, 나를 잃지 않는 선에서 조금 더 무리하게 
     	사는 거 괜찮지 않을까요?’ 하고 이야기 합니다. 좋아하는 일로 밥벌이를 하면서, 
     	많은 사람을 만나고, 또 헤어지고, 버티며 반복되던 날들, 일에 차이고 치여도 
     	나를 잃지 않으며 무리하게 살고 있어요. 아 참, 카페는 폐업했어요. 나만의 
     	방식으로 우.아.하.게. 말이에요.
     </p>
    </div>
   </div>
   
   <div id="book_info_author" class="book_info_about_div">
    <a id="book_info_author_wrap" href="./profile">
     <div id="book_info_author_head">
     
     </div>
  	 <div id="book_info_author_main">
  	  <span id="book_info_author_img">
  	   <img src="./resources/img/cat_writer_face1.jpg">
  	  </span>
  	  <div id="book_info_author_desc">
  	   <strong id="book_info_author_name">멍뭉이</strong>
  	  </div>
  	  <div id="book_info_author_intro">
  	   <p id="book_info_author_intro_cont">
  	    	글을 쓰고 그림을 그립니다. 한치앞도 알 수 없는 인생이란 드라마를 살고 있어요. 
  	    	“엄마, 드라마 보면서 왜 울어?” 저자입니다.
  	   </p>
  	  </div>
  	 </div>
    </a>
   </div>
   
  </div>
  
  <%-- 글 리스트 --%>
  <div id="book_info_article">
   <div id="book_info_article_inner">
<% for(int i=1;i<=15;i++) { %>
    <div class="book_info_article_list">
     <a href="./read" class="book_info_article_link">
      <div class="book_info_article_num">
	   <em class="book_info_num_txt"><%=i%></em>
      </div>
      <div class="book_info_article_cont">
       <strong class="book_info_article_head">디자인하지 않는 디자이너</strong>
       <span class="book_info_article_main">내 꿈은 디자인하지 않는 디자이너   
       	나는 '디자인 시바'로 무엇인가 해보고 싶다는 생각이 들었다. 
       	정확히 무엇인지 형태를 만들고 입으로 내뱉어 정형화시키기가 까다롭다. 
       	흔히 말하는 '디자인 회사' 보다 '디자인 프리랜서 그룹'의 색이 강하고 디자이너들은 각자 역량에 맞는 일을 하고, 
       	실무 디자인과는 무관하다 하더라도 하고 싶은 것들을 실현시킬 수 있는 바
       </span>
       <em class="book_info_time">3일전</em>
      </div>
      <div class="book_info_article_img">
       <img src="./resources/img/write1.jpg">
      </div>
     </a>
    </div>
<% } %>   
   </div>
  </div>
  
 </div>
</div>
<%@ include file="../include/footer.jsp" %>