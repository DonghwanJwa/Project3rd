
function pass_ok(){
	/*확인버튼 클릭시*/
	var  pass_modify_pass = $("#pass_modify_pass").val();

	$(".pass_modify_error").text('');	

	if($("#pass_modify_pass").val() == ""){
		$("#pass_modify_error_pass_check").text("비밀번호를 입력해주세요!")
		$("#pass_modify_pass").val("").focus();
		return false;
	}
}

$(document).ready(function(){
	var regExpPw = RegExp(/^(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()\-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/);//비번	

	/*엔터로 로그인 진행시*/
	$("#pass_modify_pass").on("keyup keydown",function(key){
			if(key.keyCode == 13){
				$("#pass_modify_lastbtn").trigger("click");
			}
			 if(key.type === 'keydown'){
		          if(key.keyCode == 32) {
		             return false;
		          }
		      }
	});
});
