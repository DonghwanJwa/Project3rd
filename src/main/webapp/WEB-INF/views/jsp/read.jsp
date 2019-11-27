<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<link rel="stylesheet" type="text/css" href="../resources/css/read.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/write.css" />
<script src="../resources/js/jquery.js"></script>
<script src="../resources/js/read.js"></script>
</head>
<body>
	<%-- 본문 구역 쓰기 페이지와 같음 --%>
 <div id="write_wrap">
  <div id="write_min-wrap" style="min-width:940px;">
   <!-- 타이틀 부분 -->
   <div id="write_title" style="height:450px;">
    <div id="write_title_area_bg" style="height:250px;">
     <!-- 타이틀 텍스트 부분  -->
     <div id="write_title_parent_center" >
      <!-- 메인 타이틀 -->
      <h1 class="write_main_title">LOLEMIPSUM TEST TITLE</h1>
      <br/>
      <!-- 서브 타이틀 -->
      <div class="write_sub_title">SUB TITLE TEST</div>
    </div>
    </div>
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
    <p>
    	글에 꿈을 담다, 자몽 안녕하세요 JAMONG입니다.<br/><br/><br/><br/><br/>
    	
    	1. 기획 개요<br/><br/>
- 메인 ui설계
 주로 비주얼 이미지를 많이 사용하고 감성적인 메시지를 전달하며, 컬러를 중요시하고 로고를 적극 활용하여 제작할 
 계획입니다. 메인에서 다양한 정보를 잡지를 보듯 자연스럽게 볼 수 있도록 스크롤이 긴 웹페이지를 제작하는 것을 
 구상 하였고, 마우스 오버 시 혹은 해당 섹션이 보여질 시 모션이 들어가도록 개발할 계획입니다. <br/>
<br/>
<br/>
- 메인ui & 서브ui 작업
 저희 조는 Front-end팀과 Back-end팀을 나누어 프로젝트를 진행 할 예정이며, Front-end팀은 프로젝트 초기에  
 메인ui를 제작하고, Back-end팀은 데이터베이스에 대한 구상과 함께 서브ui를 제작할 예정입니다. ui 작업은 섹션을 
 크게 나누어 각 섹션(div)마다 담당자를 지정하여 작업하도록 진행할 것이고, 너비, 높이, class명, id명, 폰트 등과 
 같이 통일성이 필요한 부분에 대해서는 세부 기획단계에서 공유 한 후 진행하도록 할 것입니다.<br/>
<br/>
<br/>

2. HTML의 개념<br/><br/>
 - HTML이란 Hyper Text Markup Language의 약자로 WWW에서 볼 수 있는 문서를 만들기 위한 일종의 
   표준언어입니다.<br/>
   웹 브라우저에서 읽을 수 있는 하이퍼텍스트 기능을 가진 문서를 만드는 언어로, 일반적으로 텍스트로 되어  
   있으며, 태그(tag)를 이용하여 웹브라우저에 나타나는 모양을 지정합니다.
   웹사이트의 골격을 만드는 역할을 합니다. <br/>
<br/>
<br/>

3. CSS의 개념<br/><br/>
 - CSS란 Cascading Style Sheet는 마크업 언어가 실제 표시되는 방법을 기술하는 언어로, HTML과 XHTML애 주로
   쓰이며 XML에서도 사용할 수 있습니다.<br/>
   다시말해, HTML 문서를 스타일링 하는 언어 (W3C의 표준)로 HTML문서에서 link요소를 사용해 CSS 파일을
   읽어들이면 HTML문서의 구조를 CSS를 통해 스타일링하게 됩니다.<br/>
   <br/>
   <br/>
자바 서블릿(servlet)의 개념)<br/>
- 서블릿이란 웹프로그래밍에서 클라이언트의 요청을 처리하고 그 결과를 다시 클라이언트에게 전송하는 Servlet 클래스의 구현 규칙을 지킨 자바 프로그래밍 기술이다.
<br/>
<br/>
서블릿의 특징)<br/>
1 - 클라이언트의 요청에 대해 동적으로 작동하는 웹 어플리케이션 컴포넌트이다.<br/>
2 - HTML을 사용하여 요청에 응답한다.<br/>
3 - JAVA Thread를 이용하여 동작한다.<br/>
4 - MVC패턴에서 Controller로 이용된다.<br/>
5 - HTTP 프로토콜 서비스를 지원하는 javax.servlet.http.HttpServlet 클래스를 상속받는다.<br/>
6 - UDP보다 속도가 느리다.<br/>
7 - HTML 변경시 Servlet을 재 컴파일 해야하는 단점이 있다.<br/>
<br/>
<br/>
<br/>
MVC ( Model, View, Controller ）의 개념 )<br/>
<br/>
- MVC란 디자인 패턴중 하나로 Model, View, Controller의 약자이며 하나의 애플리케이션, 프로젝트를 구성할 때 그 구성 요소를 세가지 역할로 구분한 패턴을 의미합니다.<br/>
 1. 모델(Model) - 애플리케이션의 정보, 데이터를 나타내며 데이터베이스, 처음에 정의하는 상수, 초기화값, 변수 등과   이러한 Data, 정보들의 가공을 책임지는 컴포넌트를 말합니다. 모델은 몇가지 규칙이 있는데 사용자가 편집하길       원하는 모든 데이터를 가지고 있어야하고 뷰(View)나 컨트롤러(Controller)에 대해서는 어떠한 정보도 알고있으면      안되며 변경이 일어나면 변경 통지에 대한 처리방법이 구현되어있어야 합니다.<br/>
 2. 뷰(View) - input텍스트, 체크박스 항목등과 같은 사용자 인터페이스(User Interface:UI)요소를 나타냅니다. 쉽게말해   데이터 및 객체의 입력, 그리고 보여주는 출력을 담당합니다. 데이터를 기반으로 사용자들이 볼 수 있는(View)         화면입니다. 뷰에도 몇가지 규칙이 있는데 모델이 가지고있는 정보를 따로 저장해서는 안되며 모델이나 컨트롤러와    같이 다른 구성요소들을 알지 못해야 하고 모델과 마찬가지로 변경이 일어나면 변경통지에 대한 처리방법을 구현해야만 합니다.<br/>
 3. 컨트롤러(Controller) - 데이터와 사용자인터페이스 요소들을 잇는 다리역할을 하는 것으로 사용자가 데이터를 클릭하고 수정하는것에 대한 이벤트들을 처리하는 부분을 뜻합니다. 컨트롤러 또한 몇가지 규칙이 있습니다.<br/>
 컨트롤러는 모델이나 뷰에 대해서 알고있어야 하고 모델이나 뷰의 변경사항을 모니터링하여 각각의 구성요소에게 통지해야 합니다.<br/>
 <br/>
 <br/>
 <br/>
    </p>
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
		<img src="../resources/img/logo.png"/>
		<hr class="border_line"/>
	</div>
		<div id="white_back">	
		<%-- 작가 프로필 --%>
		<div id="author_profile">
			<%-- 프로필사진, 이름 --%>
			<a href="../profile"><img class="author_img" src=../resources/img/a.jpg width="90" height="90" alt="글쓴이 프로필사진"/></a>
			<a href="../profile"><span><strong>글쓴이 프로필 명</strong></span></a>
			
			<%-- 작가 키워드 --%>
			<div class="author_keyword">
				<a href="../search_result(Post)">작가키워드1</a>
				<a href="../search_result(Post)">작가키워드2</a>
				<a href="../search_result(Post)">작가키워드3</a>
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
				<a href="../jsp/offer_author.jsp" class="offer">제안하기</a>
				<a class="accuse_page_open" onclick="accuseShow();" title="신고하기"><img src="../resources/img/warring.png" /></a>
			</div>
		</div>
		
		<%-- 댓글창 => 버튼눌러 감추거나 나타나게 하기 --%>	
		<div id="read_comment">
			<div class="comment_hide_button_wrap">
				<a class="comment_hide" onclick="showHide();">댓글(5)</a>
			</div>
			<div class="hide_comment" style="display:none;">
				<div class="comment_frame">
					<a href="../profile"><img class="comment_user_img" src=../resources/img/a.jpg width="50" height="50"/></a>
					<a href="../profile" class="comment_user_name"><span >사용자 1</span></a>
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
				<img src="../resources/img/a.jpg" width="250" height="100">
				<p>이전글, 다음글 리스트 입니다.</p>
			</div>
			</a>
			
			<a href="#">
			<div class="list">
				<img src="../resources/img/a.jpg" width="250" height="100">
				<p>이전글, 다음글 리스트 입니다.</p>
			</div>
			</a>
			
			<a href="#">
			<div class="list">
				<img src="../resources/img/a.jpg" width="250" height="100">
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
						<img src="../resources/img/a.jpg" width="700" height="250"/>
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
						<img src="../resources/img/a.jpg" width="700" height="250"/>
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
						<img src="../resources/img/a.jpg" width="700" height="250"/>
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