<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/offer_author.css" />
<script>
function offer_check() {
	if(!($('#r1').prop('checked') || $('#r2').prop('checked') || $('#r3').prop('checked') || $('#r4').prop('checked') || $('#r5').prop('checked'))) {
		alert('작가님께 제안하는 목적을 체크해주세요.');
		return false;
	}
	
	if($.trim($('#offer_user_email_1').val())=="" || $.trim($('#offer_user_email_2').val())=="") {
		alert('이메일을 입력하세요.');
		$('#offer_user_email_2').val('');
		$('#offer_user_email_1').val('').focus();
		return false;
	}
	
	if($.trim($("#offer_user_phone_1").val())=="" || $.trim($("#offer_user_phone_2").val())=="" || $.trim($("#offer_user_phone_3").val())=="") {
		alert('전화번호를 입력하세요.');	
		$('#offer_user_phone_2').val('');
		$('#offer_user_phone_3').val('');
		$('#offer_user_phone_1').val('').focus();
		return false;
	}
	
	if($.trim($(".offer_text_area").val())=="") {
		alert("세부내용을 입력해주세요.");
		$('.offer_text_area').val('').focus();
		return false;	
	}
	
	$('.wrap-loading').attr('style','display:block;');
}

/* 파일 업로드 UI */
$(document).ready(function(){ 
	$("input[type=file]").bind( 'change', function (e){
		if( !$(this).val() ) return;
		var f = this.files[0];
		var size = f.size || f.fileSize;
		var limit = 50*1024*1024;
		if( size > limit ){
			alert( '파일용량은 10MB 를 넘을수 없습니다.' );
			$(this).prev().prev().val('파일선택');
			$(this).val('');
			$(this).replaceWith($(this).clone(true));
			return;
		}else{
			
			//보여주는 이름 바꾸기
			if(window.FileReader){ // modern browser
				var filename = $(this)[0].files[0].name; 
			} 
			else { // old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			}

			// 추출한 파일명 삽입
			$(this).prev().prev().val(filename); 
		}
	});
});

/* 글자수 제한 유효성, 실시간 카운팅 */ 
$(document).ready(function() {
    $('.offer_text_area').on('keyup', function() {
    	var cont=$(this).val();
    	$('#counter').html("("+cont.length+" / 1000)");
    	
        if($(this).val().length > 1000) {
        	alert('최대 1000자 까지만 입력해주세요.');
            $(this).val($(this).val().substring(0, 1000));
            $('#counter').html("(1000 / 1000)");
        }
    });
});

</script>
</head>
<body>
	 <div class="wrap-loading" style="display:none">
      <div>
       <img src="${pageContext.request.contextPath}/resources/img/loading1.gif" />
      </div>
	 </div> 
<div id="offer_back">
<div id="offer_wrap">
<form method="post" onsubmit="return offer_check();" action="${pageContext.request.contextPath}/offer_send" enctype="Multipart/form-data">
<input type="hidden" name="id" value="${author.mem_id}" />
	<div id="offer_intro">
		<h2><span class="offer_author_name">${author.mem_nickname}</span><br/> 작가님께 제안합니다.</h2>
		<img class="offer_author_img" src="${author.profile_photo}"/>
	</div>
	
	<div id="offer_tip">
		<p><h3>TIP. 자몽작가님께 제안하기 전 꼭! 한번 읽어주세요.</h3></p>
		<ul>
			<li>1.  강연, 기고, 협업, 출판 등 여러가지 제안이 가능합니다.</li>
			<li>2.  작가님이 제안 의도와 작가님의 역할을 알 수 있도록 되도록 자세하게 기입해주세요.</li>
			<li>3.  작가님의 개인 연락처나 이메일은 공개되지 않습니다. 제안사항은 자몽에서 정확하게 전달해드릴게요.</li>
			<li>4.  선택은 작가님이 합니다. <b>제안사항 이외의 광고글 또는 욕설이나 비방글은 처벌 받을 수 있습니다.</b></li>
		</ul>
	</div>
	
	<div id="offer_type">
		<p class="offer_question"><h3>어떤 제안을 하시나요?</h3></p>
		<div class="offer_radio_div">
			<input type="radio" name="off_item" id="r1" class="offer_type_radio" value="출판" />
			<span class="req_label">출판</span>
			<input type="radio" name="off_item" id="r2" class="offer_type_radio" value="기고" />
			<span class="req_label">기고</span>
			<input type="radio" name="off_item" id="r3" class="offer_type_radio" value="협업" />
			<span class="req_label">협업</span>
			<input type="radio" name="off_item" id="r4" class="offer_type_radio" value="강연" />
			<span class="req_label">강연</span>
			<input type="radio" name="off_item" id="r5" class="offer_type_radio" value="기타" />
			<span class="req_label">기타</span>
		</div>
	</div>
	
	<div id="offer_info_wrap">
		<p class="offer_info_p"><h3>제안 세부정보</h3></p>
		<div class="offer_info">
			
			<div class="offer_email_wrap">
			<span><b>이메일</b></span>
			<input id="offer_user_email_1" class="offer_user_email" name="off_email" size="15" value="${user_email}"/> @
			<input id="offer_user_email_2" class="offer_user_email" name="off_domain" size="20" value="${user_domain}"/>
			</div>
			
			<br/>
			
			<div class="offer_phone_wrap">
			<span><b>연락처</b></span>
			<input id="offer_user_phone_1" class="offer_user_phone" size="3" name="off_phone1" maxlength="3" value="${phone01}"/> -
			<input id="offer_user_phone_2" class="offer_user_phone" size="4" name="off_phone2" maxlength="4" value="${phone02}"/> -
			<input id="offer_user_phone_3" class="offer_user_phone" size="4" name="off_phone3" maxlength="4" value="${phone03}"/>
			</div>
			
			<br/>
			
			<p><b>세부내용</b></p>
			<textarea class="offer_text_area" name="off_cont" placeholder="제안내용을 띄어쓰기 포함 1000자 이내로 입력해주세요."></textarea>
			<div class="counter_wrap">
			<span id="counter" class="counter">(0 / 1000)</span>
			</div>
			
			<div class="offer_file_wrap">
			<span><b>첨부파일</b></span><font size="2" color="red">*파일 최대 용량은 50MB입니다.</font><br/><br/>
			
			<input id="file_name1" class="file_name" value="파일선택" disabled="disabled"/>
			<label for="offer_file1">업로드</label>
			<input class="offer_file" id="offer_file1" type="file" name="off_file1"/>
			
			<br/>
			
			<input id="file_name2" class="file_name" value="파일선택" disabled="disabled"/>
			<label for="offer_file2">업로드</label>
			<input class="offer_file" id="offer_file2" type="file" name="off_file2"/>
			
			<br/>
			
			<input id="file_name3" class="file_name" value="파일선택" disabled="disabled"/>
			<label for="offer_file3">업로드</label>
			<input class="offer_file" id="offer_file3" type="file" name="off_file3"/>
		
			</div>
			
			<br/>
			
			<div class="offer_button_wrap">
				<input type="submit" class="offer_btn" value="제안하기" />
				<input type="button" class="offer_btn" onclick="history.back();" value="돌아가기" />
			</div>
		</div>
	</div>
</form>
</div>
</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>