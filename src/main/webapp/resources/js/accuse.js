/**
 *  accuse.jsp 신고하기 페이지 js
 */

function accuseShow() {
		if($('#acc_wrap').css("display") == "none") {
			$('#acc_wrap').show();
			$('html').css("overflow-y","hidden");
		}
}
function accuseHide(){
	if($('#acc_wrap').css("display") == "block"){
		$('#acc_wrap').hide();
		$('html').css("overflow-y","auto");
	}
		$('#acc_close').click(function(){
			$("#acc_form_accuse").each(function(){
				this.reset();
			});
		});
		$('#acc_close').click(function(){
			$('.acc_vali_date').text("")
			return false;
		});
}

function accuseVali(){
	if($(':radio[name="list"]:checked').length <1 ){
		$('#acc_vali_list').text("신고종류를 선택해 주세요.")
		$("#list").focus();
		return false;
	}
	if($('#acc_write_reason').val() == ""){
		$('#acc_vali_field').text("신고내용을 입력해 주세요.")
		$('#acc_vali_list').text("")
		$("#acc_reason_text").focus();
		return false;
	}
}