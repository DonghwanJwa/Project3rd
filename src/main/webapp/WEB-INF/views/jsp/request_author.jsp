<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/request_author.css"/>
<script src="/jamong.com/resources/js/request_author.js"></script>
<script>
function req_check() {
	
	if($.trim($('#req_form_intro').val())=="") {
		alert('작가님의 소개를 적어주세요.');
		$('#req_form_intro').val('').focus();
		return false;
	}
	if($.trim($('#req_form_plan').val())=="") {
		alert('작가님의 계획을 적어주세요.');
		$('#req_form_plan').val('').focus();
		return false;
	}
	
	var con=confirm('작가신청 후 내용을 수정할 수 없습니다.\n정말로 신청하시겠습니까?');
	
	if(con === false) {
		return false;
	}
}

$('#req_form_intro').on('keyup', function() {
	if($(this).val().length > 3000) {
		alert('띄어쓰기 포함 3000자 이내로 작성해 주세요.');
		$(this).val($(this).val().substring(0,3000));
	}
});
$('#req_form_plan').on('keyup', function() {
	if($(this).val().length > 3000) {
		alert('띄어쓰기 포함 3000자 이내로 작성해 주세요.');
		$(this).val($(this).val().substring(0,3000));
	}
});

</script>
<form action="request_author_in" onsubmit="return req_check();" method="post" enctype="Multipart/form-data">
<div id="req_auth_wrap">
		<div id="req_auth_title">
		<h1>자몽 작가신청</h1>
	</div>
		<div class="req_form">
			
			<p class="req_form_Mtitle"><b>01. 작가님은 누구신가요?</b><br/></p>
			
			<p class="req_form_Stitle">
				자몽에선 누구나 언제든 글을 쓸 수 있습니다.<br/>
				하지만, 본격적으로 글에 꿈을 담으려는 작가님이 궁금합니다.<br/>
				작가님을 이해하고 앞으로의 활동을 기대할 수 있게 해주세요. 
			</p>
			
			<textarea id="req_form_intro" class="req_form_textarea" name="aut_intro"></textarea>
		</div>
		
		<div class="req_form">
			<p class="req_form_Mtitle"><b>02. 글에 담을 꿈을 이야기 해주세요.</b><br/></p>
			
			<p class="req_form_Stitle">
				자몽에선 모든 글에 글쓴이의 꿈이 담겨있다고 믿습니다.<br/>
				에세이,여행기,일상,그림 무엇이든 좋아요.<br/>
				작가님이 자몽에 싣고 싶은 글에 무엇이 담길지 앞으로의 계획을 알려주세요.
			</p>
			
			<textarea id="req_form_plan" class="req_form_textarea" name="aut_plan"></textarea>
		</div>
		
		<div class="req_form">
			<p class="req_form_Mtitle"><b>03. 작가님의 글을 맛보게 해주세요.</b><br/></p>
			<p class="req_form_Stitle">
				혹시 미리 써둔 글이 있나요?<br/>
				필수사항은 아니지만, 자몽 작가 선정 시 가장 중요한 자료가 된답니다.<br/>
				작가님의 글을 보여주세요.<br/>
				<b>* URL은 최대 3개 까지, 파일형식은 .jpg, .png, .pdf, .doc, .docx, .hwp, .zip 만 가능합니다.</b> 
			</p>
			
			<div id="req_form_upload">
				<div class="req_form_url" >
					<input class="req_url_box" size="67" placeholder="URL을 입력하세요." name="aut_url1"/>
					<input class="req_url_box" size="67" placeholder="URL을 입력하세요." name="aut_url2"/>
					<input class="req_url_box" size="67" placeholder="URL을 입력하세요." name="aut_url3"/>
					
				</div>
			
				<div class="req_form_file">
					<%-- <div class="req_form_file_name">파일명.pdf<br/>파일명.png<br/>파일명.jpg</div>
					<a class="req_form_file_add">파일 추가</a>
					--%>
					<input type="file" name="aut_file1" id="aut_file1" class="aut_file" accept=".jpg,.png,.pdf,.doc,.docx,.hwp,.zip"><br/>
					<input type="file" name="aut_file2" id="aut_file2" class="aut_file" accept=".jpg,.png,.pdf,.doc,.docx,.hwp,.zip"><br/>
					<input type="file" name="aut_file3" id="aut_file3" class="aut_file" accept=".jpg,.png,.pdf,.doc,.docx,.hwp,.zip">
				</div>
			</div>
		</div>
		
		<div id="req_auth_btn_wrap">
			<input type="submit" value="신청하기" class="req_button" />
			<input type="button" value="돌아가기" class="req_button" onclick="history.back();" />
		</div>
</div>
</form>

<%@ include file="../include/footer.jsp" %>