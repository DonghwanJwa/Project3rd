/**
 * request_author 작가 신청 페이지
 */

function req_Check() {
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
}
