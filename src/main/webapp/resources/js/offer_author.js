/**
 * offer_author.js
 */

/* 유효성 검증 */
function check() {
	
	if(!($('#r1').prop('checked') || $('#r2').prop('checked') || $('#r3').prop('checked') || $('#r4').prop('checked'))) {
		alert('작가님께 제안하는 목적을 체크해주세요.');
		$('#r1').focus();
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
	
	if($.trim($(".offer_text_area").text())=="") {
		alert("세부내용을 입력해주세요.");
		$('.offer_text_area').text('').focus();
		return false;	
	}
}
