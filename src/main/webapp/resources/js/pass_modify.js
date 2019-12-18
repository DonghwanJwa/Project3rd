
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

		$.ajax({
			type:"POST",
			url:"pass_modify_ok",
			data: {"pass_modify_id":pass_modify_id,"pass_modify_pass":pass_modify_pass},
			datatype:"int",
			success: function (data){
				if(data==1){
					$('#pass_modify_error_pass_check').text('비밀번호가 일치하지 않습니다!');
					return false;
				}else if(data==2){
					alert("로그인이 필요한 페이지입니다!");
					window.location.replace("/jamong.com/login");
				}else{
				window.location.replace("/jamong.com/member_modify");					

				}
			},
			error:function(){
				alert("data error");
			}
		});
	});
});
