/**
 *  inquire.jsp inquire.css
 */
var regExpEamil = RegExp(/^(?=.*[@]{1,50})(?=.*[\.]{1,50}).{1,50}$/); //@와 .이 반드시 들어가게 만드는 정규식

function inq(){
	$('.inq_vali_date').text('');
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
	if(!regExpEamil.test($("#email").val())){	//이메일 정규식 양식 체크
		$('#inq_vali_email').text('E-mail을 정확하게 입력해주세요.');
		$('#email').focus();
		return false
	}
	if($('#phone').val() == ""){
		$('#inq_vali_phone').text('Phone번호를 입력해 주세요.');
		$('#phone').focus();
		return false;
	}
	if($('#phone').val().length<8){
		$('#inq_vali_phone').text('Phone번호를 정확하게 입력해 주세요.');
		$('#phone').focus();
		return false;
	}
	if($('#inq_cont').val() == ""){
		$('#inq_vali_info').text('문의내용을 입력해 주세요.');
		$('#inq_cont').focus();
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
	
	
	/* 파일 업로드 */
	$(document).ready(function(){ 
		var fileTarget = $('.inq_wrap_upload #inq_file1'); 
		
		fileTarget.on('change', function(){ // 값이 변경되면 
			if(window.FileReader){ // modern browser
				var filename = $(this)[0].files[0].name; } 
			else { // old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
				}
		
		// 추출한 파일명 삽입
		$(this).siblings('#file_name1').val(filename); 
		}); 
	});
	
	$(document).ready(function(){ 
		var fileTarget = $('.inq_wrap_upload #inq_file2'); 
		
		fileTarget.on('change', function(){ // 값이 변경되면 
			if(window.FileReader){ // modern browser
				var filename = $(this)[0].files[0].name; } 
			else { // old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
				}
		
		// 추출한 파일명 삽입
		$(this).siblings('#file_name2').val(filename); 
		}); 
	});
	
	$(document).ready(function(){ 
		var fileTarget = $('.inq_wrap_upload #inq_file3'); 
		
		fileTarget.on('change', function(){ // 값이 변경되면 
			if(window.FileReader){ // modern browser
				var filename = $(this)[0].files[0].name; } 
			else { // old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
				}
		
		// 추출한 파일명 삽입
		$(this).siblings('#file_name3').val(filename); 
		}); 
	});
	
	$(document).ready(function(){ 
		var fileTarget = $('.inq_wrap_upload #inq_file4'); 
		
		fileTarget.on('change', function(){ // 값이 변경되면 
			if(window.FileReader){ // modern browser
				var filename = $(this)[0].files[0].name; } 
			else { // old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
				}
		
		// 추출한 파일명 삽입
		$(this).siblings('#file_name4').val(filename); 
		}); 
	});

	