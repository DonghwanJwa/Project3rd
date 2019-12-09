/**
 * 
 */

$(document).ready(function(){
	
	/*엔터로 로그인 진행시*/
	$("#pass_modify_pass_text").on("keyup",function(key){
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
			url:"member_modify_ok", 
			data: {"pass_modify_id":pass_modify_id ,"pass_modify_pass":pass_modify_pass},
			datatype:"int",					//서버의 실행된 결과값을 사용자로 받아오는 방법
			success: function (data) {		//아작스로 받아오는것이 성공했을경우 서버 데이터를 data변수에 저장
				if(data==1){					//아이디가없거나 비밀번호가 틀리다면
					$('#pass_modify_error_pass_check').text('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.!');
					return false;
				}else{
					window.location.replace("member_modify");					
				}
			},
			error:function(){//비동기식 아작스로 서버디비 데이터를 못가져와서 에러가 발생했을 때 호출되는 함수이다.
				alert("data error");
			}
		});
	
	});
});