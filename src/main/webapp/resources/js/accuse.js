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
}