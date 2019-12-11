/**
 *  inquire.jsp inquire.css
 */

function inq(){
	if($("#listselect option:selected").val() == "none"){
		$('#inq_vali_list').text('목록을 선택해주세요.');
		$("#listselect").focus();
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
		$('#inq_vali_info').text('문의내용을 입력해 주세요.');
		$('#info').focus();
		return false;
	}
	if($('#agree').is(":checked") == true){
		onsole.log('체크된 상태');
	}
	
	if($('#agree').is(":checked") == false){
		$('#inq_vali_check').text('개인정보처리 방침에 동의해 주세요.');
		$('#agree').focus();
		return false;
	}
		
}
	
	$(document).ready(function(){
		$("#list").on("click",function(e){
			e.preventDefault();
			fn_openBoardList();
	});
	$("#write").on("click",function(e){
		e.preventDefault();
		fn_insertBoard();
	});
	
	$("#addfile").on("click",function(e){
		e.preventDefault();
		fn_addFile();			
	});
	
	$("a[name='delete']").on("click",function(e){
		e.preventDefault();
		fn_deletefile($(this));
	});
	
});
	function fn_openBoardList(){
		var comSubmit =new ComSubmit();
		comSubmit.setUrl("<c:url value='/views/openBoardList.do'/>");
		comSubmit.submit();
	}
	
	function fn_insertBoard(){
		var comSubmit = new ComSubmit("inq_request");
		comSubmit.setUrl("<c:url value='/sample/insertBoard.do'/>");
		comSubmit.submit();
	}
	
	/** 첨부파일 추가가 4개까지만 가능하게 하는 js  -with 좌욷**/
		function fn_addFile(){
			for(var i=1;i<=4;i++){
				if(!$('#fileinput').children().hasClass('file_'+i)){
					var str = "<p class='file_"+i+"'><input type='file' name='file_"+i+"' class='inq_inp_file'><a href='#this' class='btn' name='delete'>삭제</p></a>";
					$("#fileinput").append(str);
					$("a[name='delete']").on("click",function(e){
						e.preventDefault();
						fn_deletefile($(this));
					});
					return false;
				}
			}
		}
		
		function fn_deletefile(obj){
			obj.parent().remove();
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
	

	