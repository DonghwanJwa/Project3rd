/**
 *  inquire.jsp inquire.css
 */

function inq(){
	if($("#listselect option:selected").val() == "none"){
		$('#inq_vali_list').text('목록을 선택해주세요.');
		$("#listselect").focus();
		return false;
	}
	if($("#listsub option:selected").val() == "none"){
		$('#inq_vali_wrap').text('목록을 선택해주세요.');
		$('#listsub').focus();
		return false;
	}
	if($("#email").val() == ""){
		$('#inq_vali_email').text('E-mail을 작성해 주세요.');
		$('#email').focus();
		return false;
	}
	if($('#phone').val() == ""){
		$('#inq_vali_phone').text('Phone번호를 입력해 주세요.');
		$('#phone').focus();
		return false;
	}
	if($('#info').val() == ""){
		$('#inq_vali_info').text('문의내용을 입력해 주세요.')
		$('#info').focus();
		return false;
	}
		
}
	/* phone 번호에 번호이외에 것이 들어가면 삭제 */
	$(document).ready(function(){
		$("#phone").on("focus",function(){
		var x = $(this).val();
		$(this).val(x);
		}).on("focusout", function(){
			var x = $(this).val();
		if(x && x.length > 0){
			if(!$.isNumberic(x)){
				x = x.replace(/[^0-9]/g,"");
			}
		}
	}).on("keyup", function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	});




	$(document).ready(function(){
	$("#info").on("keyup",function(){
		if($('#info').val().length > $(this).attr('maxlength')){
		 $('#inq_vali_info').text('최대글자수를 초과하셨습니다.');
		 $('#info').focus();
		 return false;
	}
	});	
	});