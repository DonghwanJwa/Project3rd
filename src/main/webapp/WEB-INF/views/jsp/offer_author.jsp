<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="../js/jquery.js"></script>
<script src="../js/offer_author.js"></script>
<link rel="stylesheet" type="text/css"  href="../css/offer_author.css" />
</head>
<body>
<div id="offer_back">
<div id="offer_wrap">
	<div id="offer_intro">
		<h2><span class="offer_author_name">Name</span><br/> 작가님께 제안합니다.</h2>
		<img class="offer_author_img" src="../img/cat_writer_face1.jpg"/>
	</div>
	
	<div id="offer_tip">
		<p><h3>TIP.자몽작가님께 제안하기 전 꼭! 한번 읽어주세요.</h3></p>
		<ul>
			<li>1.  강연, 기고, 협업, 출판 등 여러가지 제안이 가능합니다.</li>
			<li>2.  작가님이 제안 의도와 작가님의 역할을 알 수 있도록 되도록 자세하게 기입해주세요.</li>
			<li>3.  작가님의 개인 연락처나 이메일은 공개되지 않습니다. 자몽에서 친절하고 정확하게 전달해드릴게요.</li>
			<li>4.  선택은 작가님이 합니다. <b>제안사항 이외의 광고글 또는 욕설이나 비방글은 처벌 받을 수 있습니다.</b></li>
		</ul>
	</div>
	
	<div id="offer_type">
		<p class="offer_question"><h3>어떤 제안을 하시나요?</h3></p>
		<div class="offer_radio_div">
			<input type="radio" name="offer_option" id="r1" class="offer_type_radio" value="출판" />
			<span class="req_label">출판</span>
			<input type="radio" name="offer_option" id="r2" class="offer_type_radio" value="협업" />
			<span class="req_label">협업</span>
			<input type="radio" name="offer_option" id="r3" class="offer_type_radio" value="강연" />
			<span class="req_label">강연</span>
			<input type="radio" name="offer_option" id="r4" class="offer_type_radio" value="기타" />
			<span class="req_label">기타</span>
		</div>
	</div>
	
	<div id="offer_info_wrap">
		<p class="offer_info_p"><h3>제안 세부정보</h3></p>
		<div class="offer_info">
			
			<div class="offer_email_wrap">
			<span><b>이메일</b></span>
			<input id="offer_user_email_1" class="offer_user_email" size="15" /> @
			<input id="offer_user_email_2" class="offer_user_email" size="20" />
			</div>
			
			<br/>
			
			<div class="offer_phone_wrap">
			<span><b>연락처</b></span>
			<input id="offer_user_phone_1" class="offer_user_phone" size="3" maxlength="3"/> -
			<input id="offer_user_phone_2" class="offer_user_phone" size="4" maxlength="4"/> -
			<input id="offer_user_phone_3" class="offer_user_phone" size="4" maxlength="4"/>
			</div>
			
			<br/>
			
			<div class="offer_file_wrap">
			<span><b>첨부파일</b></span>
			<input multiple="multiple" class="offer_file" type="file" name="fileName[]"/>
			</div>
			
			<br/>
			
			<p><b>세부내용</b></p>
			<div class="offer_text_area" contenteditable="true"></div>
			
			<div class="offer_button_wrap">
				<a class="offer_btn" onclick="check();">제안하기</a>
				<a class="offer_btn" onclick="location='history.back();'">돌아가기</a>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>