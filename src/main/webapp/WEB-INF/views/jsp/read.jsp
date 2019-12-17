<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/read.css"/>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/write.css" />
<script src="/jamong.com/resources/js/jquery.js"></script>
<script src="/jamong.com/resources/js/read.js"></script>
</head>
<body>
	<%-- 본문 구역 쓰기 페이지와 같음 --%>
 <div id="write_wrap">
  <div id="write_min-wrap" style="min-width:940px;">
   <!-- 타이틀 부분 -->
   <c:if test="${!empty bo.bo_thumbnail && empty bo.bo_color}">
   <div id="write_title" style='height:450px; background-image:url("${bo.bo_thumbnail}");'>
   </div>
   </c:if>
   <c:if test="${empty bo.bo_thumbnail && !empty bo.bo_color}">
   <div id="write_title" style='height:450px; background-color:${bo.bo_color}; filter:none;'>
   </div>
   </c:if>
   <c:if test="${empty bo.bo_thumbnail && empty bo.bo_color}">
   <div id="write_title" style="height:450px;"></div>
   </c:if>
    <div id="write_title_area_bg" style="height:250px;">
     <!-- 타이틀 텍스트 부분  -->
     <c:if test="${bo.bo_titlespace == 0}">
     <div id="write_title_parent_center">
      <!-- 메인 타이틀 (썸네일이나 배경색상이 있을때)-->
      <c:if test="${!empty bo.bo_thumbnail || !empty bo.bo_color}">
      <h1 class="write_main_title" style="color:#FFF">${bo.bo_title}</h1>
      <br/>
      <!-- 서브 타이틀 -->
      <c:if test="${!empty bo.bo_subtitle}">
      <div class="write_sub_title" style="color:#FFF">${bo.bo_subtitle}</div>
      </c:if>
      </c:if>
      <!-- 메인 타이틀 (썸네일과 배경색상이 둘다 없을떄) -->
      <c:if test="${empty bo.bo_thumbnail && empty bo.bo_color}">
      <h1 class="write_main_title" style="color:#000">${bo.bo_title}</h1>
      <br/>
      <!-- 서브 타이틀 -->
      <c:if test="${!empty bo.bo_subtitle}">
      <div class="write_sub_title" style="color:#000">${bo.bo_subtitle}</div>
      </c:if>
      </c:if>
      <c:if test="${!empty bo.bo_thumbnail || !empty bo.bo_color}">
      <div class="write_article_info_center" style="color:#FFF !important;">
       <span class="write_article_by">by</span>
       <span class="write_article_author">${bo.memberVO.mem_nickname}</span>
       <span class="write_article_icon">·</span>
       <span class="write_article_date">${bo.bo_date}</span>
      </div>
      </c:if>
      <!-- 하단 정보  -->
      <c:if test="${empty bo.bo_thumbnail && empty bo.bo_color}">
      <div class="write_article_info_center" style="color:#333 !important;">
       <span class="write_article_by">by</span>
       <span class="write_article_author">${bo.memberVO.mem_nickname}</span>
       <span class="write_article_icon">·</span>
       <span class="write_article_date">${bo.bo_date}</span>
      </div>
      </c:if>
    </div>
     </c:if>
     <c:if test="${bo.bo_titlespace == 1}">
     <div id="write_title_parent_bottom">
      <!-- 메인 타이틀 (썸네일이나 배경색상이 있을때)-->
      <c:if test="${!empty bo.bo_thumbnail || !empty bo.bo_color}">
      <h1 class="write_main_title" style="color:#FFF">${bo.bo_title}</h1>
      <br/>
      <!-- 서브 타이틀 -->
      <c:if test="${!empty bo.bo_subtitle}">
      <div class="write_sub_title" style="color:#FFF">${bo.bo_subtitle}</div>
      </c:if>
      </c:if>
      <!-- 메인 타이틀 (썸네일과 배경색상이 둘다 없을떄) -->
      <c:if test="${empty bo.bo_thumbnail && empty bo.bo_color}">
      <h1 class="write_main_title" style="color:#000">${bo.bo_title}</h1>
      <br/>
      <!-- 서브 타이틀 -->
      <c:if test="${!empty bo.bo_subtitle}">
      <div class="write_sub_title" style="color:#000">${bo.bo_subtitle}</div>
      </c:if>
      </c:if>
      <!-- 하단정보 썸네일이나 배경색 있을 때 -->
      <c:if test="${!empty bo.bo_thumbnail || !empty bo.bo_color}">
      <div class="write_article_info_bottom" style="color:#FFF !important;">
       <span class="write_article_by">by</span>
       <span class="write_article_author">${bo.memberVO.mem_nickname}</span>
       <span class="write_article_icon">·</span>
       <span class="write_article_date">${bo.bo_date}</span>
      </div>
      </c:if>
      <!-- 썸네일, 배경색 없을때 -->
      <c:if test="${empty bo.bo_thumbnail && empty bo.bo_color}">
      <div class="write_article_info_bottom" style="color:#333 !important;">
       <span class="write_article_by">by</span>
       <span class="write_article_author">${bo.memberVO.mem_nickname}</span>
       <span class="write_article_icon">·</span>
       <span class="write_article_date">${bo.bo_date}</span>
      </div>
      </c:if>
    </div>
     </c:if>
    </div>
  </div>
   
  <!-- 글 내용 부분 --> 
  <div id="write_cont">
       <div id="write_wrap_bg" style="min-width:940px;">
       		<div id="edit_del_wrap">
   				<i class="user_edit_btn" title="글 수정하기"></i>
   				<i class="user_del_btn" title="글 삭제하기"></i>
   			</div>
    <div class="write_cont_area write_cont_align_left" style="min-height:300px;">
    ${bo.bo_cont}
    </div> 
   </div>
  </div>
 </div>
	
	<%-- 본문 구역 끝 --%>	
		<div class="clear"></div>
		
	<%-- 읽기 페이지 하단부 (프로필, 댓글, 이전글/다음글 리스트, 같은 카테고리 다른 글 --%>
	<div id="read_back">
	<div id="border_line_wrap">
		<hr class="border_line"/>
		<img src="/jamong.com/resources/img/logo.png"/>
		<hr class="border_line"/>
	</div>
		<div id="white_back">	
		<%-- 작가 프로필 --%>
		<div id="author_profile">
			<%-- 프로필사진, 이름 --%>
			<a href="/jamong.com/profile"><img class="author_img" src=/jamong.com/resources/img/a.jpg width="90" height="90" alt="글쓴이 프로필사진"/></a>
			<a href="/jamong.com/profile"><span><strong>글쓴이 프로필 명</strong></span></a>
			
			<%-- 작가 키워드 --%>
			<div class="author_keyword">
				<a href="/jamong.com/search?result=post">작가키워드1</a>
				<a href="/jamong.com/search?result=post">작가키워드2</a>
				<a href="/jamong.com/search?result=post">작가키워드3</a>
			</div>
			
			<%-- 작가 소개 --%>
			<div class="intro">
				<p>
				 작가소개란입니다.<br/>
				 잘 부탁드립니다.
				</p>
			</div>
			
			<div class="clear"></div>
			
			<%-- 구독/제안 버튼부 --%>
			<div class="author_button_wrap">
				<a href="#" class="subscribe">구독하기</a>
				<a href="/jamong.com/offer_author" class="offer">제안하기</a>
				<a class="accuse_page_open" onclick="accuseShow();" title="신고하기"><img src="/jamong.com/resources/img/warring.png" /></a>
			</div>
		</div>
		
		<%-- 댓글창 => 버튼눌러 감추거나 나타나게 하기 --%>	
		<div id="read_comment">
			<div class="comment_hide_button_wrap">
				<a class="comment_hide" onclick="showHide();">댓글(5)</a>
			</div>
			<div class="hide_comment" style="display:none;">
				<div class="comment_frame">
					<a href="/jamong.com/profile"><img class="comment_user_img" src=/jamong.com/resources/img/a.jpg width="50" height="50"/></a>
					<a href="/jamong.com/profile" class="comment_user_name"><span >사용자 1</span></a>
					<p class="comment_cont">댓글입니다.</p><br/>
					<span class="comment_date">2019-10-15 00:00:00</span>
					<div class="reply_hide_wrap"><a class="comment_reply" onclick="replyHide();">답글</a></div>
				</div>
				<div class="reply_wrap" style="display:none;">
					<div class="reply_textarea" contenteditable="true">
						답글! LOLEMIPSUM
					</div>
					<div class="reply_btn_wrap">
						<a class="reply_btn">답글 달기</a>
					</div>
				</div>
				<div id="write_comment">
					<div class="textarea" contenteditable="true"></div>
					<div class="btn_wrap"><a class= write_comment_btn>댓글 쓰기</a></div> 
				</div>
			</div>
		</div>
		
		<%-- 댓글 쓰기 form으로 감싸기 --%>

		
		<div class="clear"></div>
		
		<%-- 이전, 다음글 리스트 --%>
		<div id="read_list">
			<div class="remote_button">
				<a href="#"> < 이전글 </a>
				<a href="#"> 다음글 > </a>
			</div>
		<%-- 리스트 반복문으로 처리 할 것. --%>	
			<a href="#">
			<div class="list">
				<img src="/jamong.com/resources/img/a.jpg" width="250" height="100">
				<p>이전글, 다음글 리스트 입니다.</p>
			</div>
			</a>
			
			<a href="#">
			<div class="list">
				<img src="/jamong.com/resources/img/a.jpg" width="250" height="100">
				<p>이전글, 다음글 리스트 입니다.</p>
			</div>
			</a>
			
			<a href="#">
			<div class="list">
				<img src="/jamong.com/resources/img/a.jpg" width="250" height="100">
				<p>이전글, 다음글 리스트 입니다.</p>
			</div>
			</a>
		</div>
		
		<%-- 같은 카테고리의 다른 글 --%>
		<div id="read_another">
		<%-- 반복해서 프레임 배치 --%>
			<div class="another_wrap">
				<h3>같은 카테고리 다른 글</h3>
				<a href="#">
					<div class="another_cover">
						<img src="/jamong.com/resources/img/a.jpg" width="700" height="250"/>
						<div class="another_title">
						<p><strong>캐나다의 밤은 서울의 밤보다 천천히 흐른다.</strong></p>
						</div>
						
						<div class="another_cont">
						<p>
							test본문입니다. LOLEMIPSUM <br/>
							test본문입니다. LOLEMIPSUM
						</p>
						</div>
						
						<div class="another_auth">
						<span>by.작가</span>
						</div>
						
						<div class="another_key">
							<span>#키워드</span>
							<span>#키워드</span>
							<span>#키워드</span>
						</div>
					</div>
				</a>
				
				<a href="#">
					<div class="another_cover">
						<img src="/jamong.com/resources/img/a.jpg" width="700" height="250"/>
						<div class="another_title">
						<p><strong>캐나다의 밤은 서울의 밤보다 천천히 흐른다.</strong></p>
						</div>
						
						<div class="another_cont">
						<p>
							test본문입니다. LOLEMIPSUM <br/>
							test본문입니다. LOLEMIPSUM
						</p>
						</div>
						
						<div class="another_auth">
						<span>by.작가</span>
						</div>
						
						<div class="another_key">
							<span>#키워드</span>
							<span>#키워드</span>
							<span>#키워드</span>
						</div>
					</div>
				</a>
				
				<a href="#">
					<div class="another_cover">
						<img src="/jamong.com/resources/img/a.jpg" width="700" height="250"/>
						<div class="another_title">
						<p><strong>캐나다의 밤은 <br/>서울의 밤보다 천천히 흐른다.</strong></p>
						</div>
						
						<div class="another_cont">
						<p>
							test본문입니다. LOLEMIPSUM <br/>
							test본문입니다. LOLEMIPSUM	test본문입니다.
						</p>
						</div>
						
						<div class="another_auth">
						<span>by.작가</span>
						</div>
						
						<div class="another_key">
							<span>#키워드</span>
							<span>#키워드</span>
							<span>#키워드</span>
						</div>
					</div>
				</a>
			</div>
				
			</div>
		</div>
		</div>
	</div>
</body>
<%@ include file="../include/footer.jsp"%>
</html>