/**
 * 
 */
/* 댓글 목록 숨김/나타내기 전환 */

function showHide() {
		if($('.hide_comment').css("display") == "none") {
			$('.hide_comment').show();
		}else{
			$('.hide_comment').hide();
		}
		if($('reply_wrap').css("display") != "none") {
			$('.reply_wrap').hide();
		}
}

function replyHide() {
	if($('.reply_wrap').css("display") == "none") {
		$('.reply_wrap').show();
	}else {
		$('.reply_wrap').hide();
	}
}
