<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=stylesheet type="text/css" href="./resources/css/profile.css">
<script src="./resources/js/profile.js"></script>
<script src="./resources/js/jquery.js"></script>
<title></title>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false" >
	<div id="profile_main">
		<div id="profile_padding">
			<div id="profile_content">
				<div id="profile_">
					<div>
						<div id="p_menu" class="p_menu_button hide">
							<%--신고  --%>
							<c:if test="${m.mem_id != mp.mem_id}">
								<button id="warring_icon" class="accuse_page_open"
									onclick="accuseShow(1);"
								>
									<!-- after 적용 -->
								</button>
							</c:if>
							<%--편집 --%>
							<c:if test="${m.mem_id == mp.mem_id}">
								<button id="pt_edit_icon" onclick="location='profile_edit';">
									<!-- after 적용 -->
								</button>
							</c:if>
						</div>
						<div id="profile_cont">
							<div class="pf_subscriber">
								<img id="profile_img" alt="이미지" src="${mp.profile_photo}">
								<!--  <input class="?" date-image="???">-->
							</div>
							<strong id="profile_name">${mp.mem_nickname}</strong>
							<br>
							<span class="profile_font_size"></span>
						</div>
						<dl class="subscriber">
							<dt class="hide_font">정보</dt>
							<dd>
								<a><b class="profile_line profile_font_size">구독자</b> <span
									class="profile_line_num"
								>${subCount}</span></a>
							<dd>
								<div id="profile_button">
									<%--해당되는 아이디로 로그인 했을때 --%>
									<c:if test="${m.mem_id == mp.mem_id}">
										<a href="./write" class="profile_button_type subscribe_check">글쓰기</a>
										 <c:if test="${mp.mem_author == 1}">
										  <a href="./new_book" class="profile_button_type subscribe_check">책 편집</a>
										 </c:if>
									</c:if>
									<c:if test="${mp.mem_author == 1 && m.mem_id != mp.mem_id}">
										<a href="./offer_author" class="profile_button_type">제안하기</a>
									</c:if>
									<c:if test="${m.mem_id != mp.mem_id }">
										<span>
										 	<c:if test="${sub.sub_member != m.mem_no || empty sub}">
											<button class="profile_button_type2">구독하기</button>
											</c:if>
											<c:if test="${sub.sub_member == m.mem_no && !empty sub}">
											<button class="profile_button_type2 p_follow">구독중</button>
											</c:if>
										</span>
									</c:if>
									
								</div>
						</dl>
						<c:if test="${mp.mem_author==2}">
							<div id="profile_keyword_line">
								<ul class="profile_keyword_link">
								<c:forEach items="${mp.mem_keyword.split('/')}" var="tag">
							 		<li><a href="new_posts"
										class="profile_button_keyword profile_line"
									>${tag}</a></li>
								
								</c:forEach>
								</ul>
							</div>
						</c:if>
						<!-- after적용 -->
					</div>
				</div>
			</div>
			<div id="profile_menu">
				<%--ARIA roles 적용  --%>
				<div id="Tablist">
					<a href="#info">
						<button id="info_tab" class="tab active">
							<span class="profile_font_size">작가소개</span><b></b>
						</button>
					</a> <a href="#articles">
						<button id="article_tab" class="tab">
							<span class="profile_font_size">글</span><b></b>
						</button>
					</a> <a href="#magazine">
						<button id="Magazine_tab" class="tab">
							<span class="profile_font_size">작품</span><b></b>
						</button>
					</a>
				</div>
			</div>
		</div>
		<main> <!-- main : 문서의 중요한 항목을 담는것  하나의 페이지에 하나의 요소만 사용가능--> <!-- 사용되지않는 main의 요소는 화면에서 감춤처리 -->
		<div id="profile_main_list">
			<div id="profile_info" style="display: block;">
				<h3 class="hide_font">작가소개</h3>
				<div class="author_intro">
					<strong class="profile_font_size">소개</strong>
					<p class="profile_font_size">${mp.profile_cont}</p>
				</div>
				<c:if test="${mp.mem_author == 1 && mp.mem_portfolio != null}">
					<p class="profile_font_size">
						<strong>기타 이력 및 포트폴리오</strong> ${portfolio}
					</p>
				</c:if>
			</div>
			<div id="article" style="display: none;">
				<div class="author_intro">
					<h3 class="hide_font">글목록</h3>
					<ul class="profile_writer_list">
						<c:forEach var="fp" items="${mplist}">
						<!-- 다른사람의 프로필을 들어갔을때 -->
							<c:if test="${m.mem_id != mp.mem_id && fp.bo_lock != 0 && m.mem_id == null}">
								<li class="profile_articles" data-no="">
									<div>
										<a class="profile_article_main" href="./book_info">...</a> 
										<a href="./@${mp.mem_id}/"
										> <strong class="pf_bo_title">${fp.bo_title}</strong> 
										<span class="article_cont">${fp.bo_cont}</span>
										<div>
											<c:set var="img" value="${fp.bo_thumbnail}" />
											<c:if test="${not empty img}">
												<img class="profile_post_img" alt="이미지 정보"
													src="${fp.bo_thumbnail}"
												>
											</c:if>
											<c:if test="${empty img}">
											</c:if>
										</div>
										</a>
									</div> <span></span>
								</li>
							</c:if>
							<!-- 자신의 아이디로 로그인시 -->
							<c:if test="${ m.mem_id == mp.mem_id}">
								<li class="profile_articles" data-no="">
									<div>
									<c:if test ="${fp.bo_lock == 0 }">
									<img class="private" src="./resources/img/lock.png">
									</c:if>
										<a class="profile_article_main" href="./book_info">...</a> <a
											href="./@${mp.mem_id}/"
										> <strong class="pf_bo_title">${fp.bo_title}</strong> <em
											class="article_cont"
										>${fp.bo_cont}</em>
										</a>
										<div>
											<c:set var="img" value="${fp.bo_thumbnail}" />
											<c:if test="${not empty img}">
												<img class="profile_post_img" alt="이미지 정보"
													src="${fp.bo_thumbnail}"
												>
											</c:if>
											<c:if test="${empty img}">
											</c:if>
										</div>
									</div> <span></span>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div id="Magazine" style="display: none;">
				<h3 class="hide_font">매거진</h3>
				<!-- 공감과 추천한 숫자를 지정 -->
				<div id="" class="Magazine_list jm_list ">
					<div class="box_contents">
						<a href="./book_info">
							<div class="cover_book">
								<img class="cover_img" src="./resources/img/a.jpg"
									class="magazin_img"	>
								<div class="info_cover">
									<strong class="tit_cover"></strong> <span>by${mp.mem_nickname}</span>
								</div>
								<span class="book_line"></span>
						</a>
					</div>
					<strong>Magazine</strong> <a class="profile_jm" href="./book_info">...</a>
					<dl class="j_list_info">
						<dt>
							<span class="article_icon"></span>
						</dt>
						<dd class="box_contents_num">
							<b></b>
						</dd>
						<dt>
							<span class="relate"></span>
						</dt>
						<dd class="box_contents_num"></dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
	</div>
	</main>
	</div>
</body>
</html>
<%@include file="../include/footer.jsp" %>