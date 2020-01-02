<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/read.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/write.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/read.js"></script>
</head>
<body>
	<%-- 본문 구역 쓰기 페이지와 같음 --%>
 <div id="write_wrap">
  <input type="hidden" name="mem_no" id="mem_no" value="${bo.mem_no}" />
  <div class="write_title_error">
   <span class="write_error_message"></span>
  </div>
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
    </div>
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
     </c:if>
     <c:if test="${bo.bo_titlespace == 1}">
     <div id="write_title_parent_bottom" style="bottom:115px;">
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
    </div>
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
     </c:if>
    </div>
  </div>
   
  <!-- 글 내용 부분 --> 
  <div id="write_cont" style="height:auto;">
       <div id="write_wrap_bg" style="min-width:940px;">
         <c:if test="${bo.memberVO.mem_no == m.mem_no && bo.book_no == 0}">
       		<div id="edit_del_wrap">
   				<i class="user_edit_btn" title="글 수정" onclick="location.href='${pageContext.request.contextPath}/@${bo.memberVO.mem_id}/${bo.bo_no}/write';"></i>
   				<i class="user_del_btn" title="글 삭제" onclick="ArticleRemove();"></i>
   			</div>
   		 </c:if>
   		 <c:if test="${m.mem_state==9}">
   		 	<div id="edit_del_wrap">
   		 	 <c:if test="${bo.bo_lock==3}">
   				<i class="admin_art_del_recover_btn" title="글 복구"></i>
   			 </c:if>
   			 <c:if test="${bo.bo_lock!=3}">
   				<i class="admin_art_del_btn" title="글 삭제"></i>
   			 </c:if>
   			 <input type="hidden" id="user_del_no" value="${bo.memberVO.mem_no}" readonly>
   			</div>
   		 </c:if>
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
		<img src="${pageContext.request.contextPath}/resources/img/logo.png"/>
		<hr class="border_line"/>
	</div>
		<div id="white_back">	
		<%-- 작가 프로필 --%>
		<div id="author_profile">
			<%-- 프로필사진, 이름 --%>
			<a href="${pageContext.request.contextPath}/@${bo.memberVO.mem_id}"><img class="author_img" src="${bo.memberVO.profile_photo}" alt="글쓴이 프로필사진"/></a>
			<a href="${pageContext.request.contextPath}/@${bo.memberVO.mem_id}"><span><strong>${bo.memberVO.mem_nickname}</strong></span></a>
			
			<%-- 작가 키워드 --%>
			<div class="author_keyword">
			 <c:if test="${!empty bo.memberVO.mem_fav1}">
				<a href="${pageContext.request.contextPath}/category/${bo.memberVO.mem_fav1}">${bo.memberVO.mem_fav1}</a>
			 </c:if>
			 <c:if test="${!empty bo.memberVO.mem_fav2}">
				<a href="${pageContext.request.contextPath}/category/${bo.memberVO.mem_fav2}">${bo.memberVO.mem_fav2}</a>
			 </c:if>
			 <c:if test="${!empty bo.memberVO.mem_fav3}">
				<a href="${pageContext.request.contextPath}/category/${bo.memberVO.mem_fav3}">${bo.memberVO.mem_fav3}</a>
			 </c:if>
			</div>
			
			<%-- 작가 소개 --%>
			<div class="intro">
				<p>
				 ${bo.memberVO.profile_cont}
				</p>
			</div>
			
			<div class="clear"></div>
			
			<%-- 구독/제안 버튼부 --%>
			<div class="author_button_wrap">
				<c:if test="${bo.memberVO.mem_no ne m.mem_no}">
					<c:if test="${bo.memberVO.mem_author==1}">
					 <a href="${pageContext.request.contextPath}/offer_author/@${bo.memberVO.mem_id}" class="offer">제안하기</a>
					</c:if>
				</c:if>
			</div>
		</div>
		
		<%-- 댓글창 => 버튼눌러 감추거나 나타나게 하기 --%>	
		<div id="read_comment">
			<div class="comment_hide_button_wrap">
				<a class="comment_hide" onclick="showHide();">댓글(${replyCount})</a>
			</div>
			<div class="hide_comment" style="display:none;">
			 <c:forEach var="r" items="${rList}">
			 <%-- 댓글일 때 --%>
			  <c:if test="${r.rep_step == 0}">
				<li class="comment_frame" onmouseenter="replyBtnShow(event);" onmouseleave="replyBtnHide(event);">
					<a href="${pageContext.request.contextPath}/profile"><img class="comment_user_img" src=${r.memberVO.profile_photo} width="45" height="45"/></a>
					<div class="comment_info_wrap">
					<a href="${pageContext.request.contextPath}/profile" class="comment_user_name"><span>${r.memberVO.mem_nickname}</span></a>
					<span class="comment_info_icon">·</span>
					<span class="comment_date">${r.rep_date}</span>
					<span class="comment_menu">
					<c:if test="${!empty m.mem_no}">
					<a class="comment_reply" data-ref="${r.rep_ref}" data-step="${r.rep_step}" data-level="${r.rep_level}" data-mem="${r.mem_no}" onclick="replyHide(event);">답글</a>
					<c:if test="${m.mem_no == r.mem_no}">
					· <a class="comment_edit" data-no="${r.rep_no}" onclick="replyEdit(event);">수정</a>
					· <a class="comment_del" data-no="${r.rep_no}" onclick="CommentRemove(event);">삭제</a>
					</c:if>
					</c:if>
					<c:if test="${m.mem_no != r.mem_no}">
					·
					<a class="comment_accuse" onclick="accuseShow(3);">신고하기</a>
					</c:if>
					</span>
					<div class="comment_cont">${r.rep_cont}</div>
				</div>
				</li>
				</c:if>
			  <%-- 답글일 때 --%>
			  <c:if test="${r.rep_step != 0}">
				<li class="comment_frame" onmouseenter="replyBtnShow(event);" onmouseleave="replyBtnHide(event);">
					<span class="comment_enter_icon">ㄴ</span><span class="comment_enter_re">RE:</span>
					<a href="${pageContext.request.contextPath}/profile"><img class="comment_user_img" src=${r.memberVO.profile_photo} width="45" height="45"/></a>
					<div class="comment_info_wrap">
					<a href="${pageContext.request.contextPath}/profile" class="comment_user_name"><span>${r.memberVO.mem_nickname}</span></a>
					<span class="comment_info_icon">·</span>
					<span class="comment_date">${r.rep_date}</span>
					<span class="comment_menu">
					<c:if test="${!empty m.mem_no}">
					<a class="comment_reply" data-ref="${r.rep_ref}" data-step="${r.rep_step}" data-level="${r.rep_level}" data-mem="${r.mem_no}" onclick="replyHide(event);">답글</a>
					<c:if test="${m.mem_no == r.mem_no}">
					· <a class="comment_edit" data-no="${r.rep_no}" onclick="replyEdit(event);">수정</a>
					· <a class="comment_del" data-no="${r.rep_no}" onclick="CommentRemove(event);">삭제</a>
					</c:if>
					</c:if>
					<c:if test="${m.mem_no != r.mem_no}">
					·
					<a class="comment_accuse" onclick="accuseShow(3);" >신고하기</a>
					</c:if>
					</span>
					<div class="comment_cont">${r.rep_cont}</div>
				</div>
				</li>
				</c:if>
			 </c:forEach>
				<div id="write_comment">
					<div class="rep_textarea" contenteditable="true">
					<p><br/></p>
					</div>
					<div class="btn_wrap"><a class= write_comment_btn onclick="addComment();">댓글 작성</a></div>
				</div>
			</div>
		</div>
		

		<div class="clear"></div>
		
			<div class="remote_button">
				<c:if test="${!empty pre}">
                <a href="${pageContext.request.contextPath}/@${pre.memberVO.mem_id}/${pre.bo_no}"> < 이전글 </a>
                </c:if>
                <c:if test="${empty pre}">
                <a class="read_preArt_btn" onclick="preNullError();"> < 이전글 </a>
                </c:if>
                <c:if test="${!empty next}">
                <a href="${pageContext.request.contextPath}/@${next.memberVO.mem_id}/${next.bo_no}"> 다음글 > </a>
                </c:if>
                <c:if test="${empty next}">
                <a class="read_nextArt_btn" onclick="nextNullError();"> 다음글 > </a>
                </c:if>
			</div>
		 <hr class="read_division_line">
		<%-- 이전, 다음글 리스트 --%>
		<div id="read_list">
		<%-- 리스트 반복문으로 처리 할 것. --%>
		<h3>같은 작가의 다른 글</h3>
		 <c:forEach var="blist" items="${bList}">
		  <c:if test="${!empty blist.bo_thumbnail}">
			<a href="${pageContext.request.contextPath}/@${blist.memberVO.mem_id}/${blist.bo_no}">
			<div class="list">
				<p style="font-weight:bold;">${blist.bo_title}</p>
				<span id="read_list_date">${blist.bo_date}</span>
				<img src="${blist.bo_thumbnail}">
			</div>
			</a>
		  </c:if>
		  <c:if test="${empty blist.bo_thumbnail}">
			<a href="${pageContext.request.contextPath}/@${blist.memberVO.mem_id}/${blist.bo_no}">
			<div class="list">
				<p style="font-weight:bold; width:700px">${blist.bo_title}</p>
				<span id="read_list_date">${blist.bo_date}</span>
			</div>
			</a>
		  </c:if>
		 </c:forEach>
		</div>
		
		<%-- 같은 카테고리의 다른 글 --%>
		<div id="read_another">
		<%-- 반복해서 프레임 배치 --%>
			<div class="another_wrap">
				<h3>같은 카테고리 다른 글</h3>
				<c:forEach var="catList" items="${catList}">
				<a href="${pageContext.request.contextPath}/@${catList.memberVO.mem_id}/${catList.bo_no}">
				  <!-- 썸네일 있을때 -->
				   <c:if test="${!empty catList.bo_thumbnail}">
					<div class="another_cover">
						<img src="${catList.bo_thumbnail}" width="700" height="250"/>
						<div class="another_title">
						<p><strong>${catList.bo_title}</strong></p>
						</div>
						
						<div class="another_cont">
							${catList.bo_cont}
						</div>
						
						<div class="another_auth">
						<span style="font-style:italic;">by</span><span style="margin-left:5px;">${catList.memberVO.mem_nickname}</span>
						</div>
						
						<div class="another_key">
							<c:if test="${!empty catList.memberVO.mem_fav1}">
							<span>${catList.memberVO.mem_fav1}</span>
							</c:if>
							<c:if test="${!empty catList.memberVO.mem_fav2}">
							<span>${catList.memberVO.mem_fav2}</span>
							</c:if>
							<c:if test="${!empty catList.memberVO.mem_fav3}">
							<span>${catList.memberVO.mem_fav3}</span>
							</c:if>
						</div>
					</div>
				 </c:if>
				  <!-- 썸네일 없을 때 -->
				   <c:if test="${empty catList.bo_thumbnail}">
					<div class="another_cover">
						<div style="width:700px; height:250px; background-color:#FAFAFA"/></div>
						<div class="another_title">
						<p><strong style="color:#333;">${catList.bo_title}</strong></p>
						</div>
						
						<div class="another_cont_noimg">
							${catList.bo_cont}
						</div>
						
						<div class="another_auth">
						<span style="color:#333; font-style:italic;">by</span><span style="color:#333; margin-left:5px">${catList.memberVO.mem_nickname}</span>
						</div>
						
						<div class="another_key">
						 	<c:if test="${!empty catList.memberVO.mem_fav1}">
							<span style="color:#333">${catList.memberVO.mem_fav1}</span>
							</c:if>
							<c:if test="${!empty catList.memberVO.mem_fav2}">
							<span style="color:#333">${catList.memberVO.mem_fav2}</span>
							</c:if>
							<c:if test="${!empty catList.memberVO.mem_fav3}">
							<span style="color:#333">${catList.memberVO.mem_fav3}</span>
							</c:if>
						</div>
					</div>
				 </c:if>
				</a>
				</c:forEach>
			</div>
				
			</div>
		</div>
		</div>
	</div>
</body>
<%@ include file="../include/footer.jsp"%>
</html>