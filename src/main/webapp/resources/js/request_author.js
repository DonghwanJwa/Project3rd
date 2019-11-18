/**
 * request_author 작가 신청 페이지
 */
function offerToggle() {
		if($('#req_wrap').css("display") == "none") {
			$('#req_wrap').show();
		}else{
			$('#req_wrap').hide();
		}
}

function offerCheck() {
	if($.trim($('#req_form_intro').text())=="") {
		alert('작가님의 소개를 적어주세요.');
		$('#req_form_intro').val('').focus();
		return false;
	}
	if($.trim($('#req_form_plan').text())=="") {
		alert('작가님의 계획을 적어주세요.');
		$('#req_form_plan').val('').focus();
		return false;
	}
}
