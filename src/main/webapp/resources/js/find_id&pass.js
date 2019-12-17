/**
 * find_id, find_pass
 */
var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]{5,14}$/);	//이메일
$(function(){
	//이메일 인증 버튼 클릭시 발생하는 이벤트 //아이디 찾기 버튼
	$(document).on("click", "#find_id_btn", function(){
		var email = $.trim($('#find_id_email').val());				//이메일값
		var domain = $.trim($('#find_id_domain').val());	//도메인값
		var name = $.trim($('#find_id_name').val());
		$('#find_id_error_pass').text('');
		
		if (email=="") {
			$('#find_id_error_pass').text('이메일을 입력해주세요!');
			return false;
		}
		if (domain=="") {
			$('#find_id_error_pass').text('도메인을 입력해주세요!');
			return false;
		}
		if (!emailCheck.test($('#find_id_domain').val())) {
			$('#find_id_error_pass').text('도메인을 입력해주세요!');
			return false;
		}
		
		//이메일 메일 발송 비동기 처리 
		$.ajax({
			type:"POST",
			url : "find_id_emailCert",
			data : {"email": email,"domain":domain,"name":name},
			success : function(data){
				alert("입력하신 이메일로 아이디가 발송되었습니다.");
				//readonly는 읽기만 가능 값변경 불가능 form으로 값보낼떄는 가능 
				//readonly false면 값변경이 가능
				//disabled 태그 속성 활성화 false 비활성화
			},
			beforeSend:function(){
			        //(이미지 보여주기 처리)
			        $('.wrap-loading').show();
			},
			complete:function(){
			        //(이미지 감추기 처리)
			        $('.wrap-loading').hide();
			        window.location.replace("login");
			        //비번찾기로 넘어가도 된다
			},
			error: function(data){
				alert("입력하신 이름과 이메일이 일치하지 않습니다.");
				return false;
			}
		})
	});
});
