/**
 *  accuse.jsp 신고하기 페이지 js
 */

function accuseShow(a) {
	//lock -> unlock
	$.ajax({
		type:"POST",
		url:"/jamong.com/accuse_ok",
		success: function (data) {		
			if(data==-1){
				Swal.fire({ 
							title : 'Oops!', 
							text : '로그인이 필요합니다!',
							icon: 'error',
							showCancelButton : true,
							confirmButtonText : '로그인',
							cancelButtonText : '메인으로'
							}).then((result) => {
								if(result.value){
									location='/jamong.com/login';
								}else if(result.dismiss === Swal.DismissReason.cancel) {
									location='/jamong.com/';
								}
							});
			}else if(data==1){
				if($('#acc_wrap').css("display") == "none") {
					$('#acc_wrap').show();
					$('html').css("overflow-y","hidden");
					$('#ac_item').val(a);
				}
			}
		},
		error:function(){
			alert("data error");
		}
	});	
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
	if($(':radio[name="ac_reason"]:checked').length <1 ){
		$('#acc_vali_list').text("신고종류를 선택해 주세요.")
		$("#ac_reason").focus();
		return false;
	}
	if($('#acc_write_reason').val() == ""){
		$('#acc_vali_field').text("신고내용을 입력해 주세요.")
		$('#acc_vali_list').text("")
		$("#acc_reason_text").focus();
		return false;
	}
}
function captureReturnKey(e) { 
    if(e.keyCode==13 && e.srcElement.type != 'textarea') {
       e.preventDefault();
    }
} 
