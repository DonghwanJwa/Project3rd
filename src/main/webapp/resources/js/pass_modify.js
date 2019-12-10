
$(document).ready(function(){
	var regExpPw = RegExp(/^(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()\-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/);//비번	
	
	/*엔터로 로그인 진행시*/
	$("#pass_modify_pass").on("keyup",function(key){
		if(key.keyCode == 13){
			$("#pass_modify_lastbtn").trigger("click");
		}
	});
	
	/*확인버튼 클릭시*/
	$("#pass_modify_lastbtn").click(function(){
		var  pass_modify_id = $("#pass_modify_id").val();
		var  pass_modify_pass = $("#pass_modify_pass").val();
		
		$(".pass_modify_error").text('');	
		
		if($("#pass_modify_pass").val() == ""){
		$("#pass_modify_error_pass_check").text("비밀번호를 입력해주세요!")
		$("#pass_modify_pass").val("").focus();
		return false;
	}
		if($.trim($('#pass_modify_pass').val()).length<8 || $.trim($('#join_membership_pass').val()).length>50){
			$('#pass_modify_error_pass_check').text('8자이상으로 설정해주세요!');
			$("#pass_modify_pass").val("").focus();
			return false;
		}
	

		//비밀번호 정규식 = 영문,숫자,특수문자의 조합
		if(!regExpPw.test($("#pass_modify_pass").val())){ 
			$('#pass_modify_error_pass_check').text('영문,숫자,특수문자의 조합으로 입력해주세요!');
			$("#pass_modify_pass").val("").focus();
			return false; 
		}
	
	});
});