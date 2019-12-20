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
		
		
		if (name=="") {
			$('#find_id_error_id').text('이름을 입력해주세요!');
			name.val("").focus();
			return false;
		}
		if (email=="") {
			$('#find_id_error_pass').text('이메일을 입력해주세요!');
			return false;
		}
		if (domain=="") {
			$('#find_id_error_pass').text('도메인을 입력해주세요!');
			return false;
		}
		
		
		//이메일 메일 발송 비동기 처리 
		$.ajax({
			type:"POST",
			url : "find_id_emailCert",
			data : {"email": email,"domain":domain,"name":name},
			success : function(data){
				alert("입력하신 이메일로 아이디가 발송되었습니다.\n비밀번호 찾기 페이지로 이동됩니다	");
				//readonly는 읽기만 가능 값변경 불가능 form으로 값보낼떄는 가능 
				//readonly false면 값변경이 가능
				//disabled 태그 속성 활성화 false 비활성화
				 	$("#find_id_sub_box_pass").css("display","none");
					$("#find_id_sub_box_id").css("display","none");
					$("#find_id_sub_box_pass").css("display","block");
					$(".find_pass_link2").css("background","orange");
					$(".find_pass_link2").css("color","white");
					$(".find_id_link1").css("background","lightgray");
					$("#find_id_name").val("");
					$("#find_id_email").val("");
					$("#find_id_domain").val("");
			},
			beforeSend:function(){
			        //(이미지 보여주기 처리)

			        $('.wrap-loading').show();
			},
			complete:function(){
			        //(이미지 감추기 처리)
				$('#find_id_email').val("");
				$('#find_id_domain').val("");
				$('#find_id_name').val("");

			        $('.wrap-loading').hide();
			},
			error: function(data){
				alert("입력하신 이름과 이메일이 일치하지 않습니다.");
				return false;
			}
		})
	});
	
	//비밀번호 찾기 인증번호 발송
	$(document).on("click", "#find_id_pass_email_Certified_btn", function(){
		var pass_email = $.trim($('#find_id_pass_email').val());	//이메일값
		var pass_domain = $.trim($('#find_id_pass_domain').val());	//도메인값
		var pass_name = $.trim($('#find_id_pass_name').val());
		var pass_id = $.trim($('#find_id_pass_id').val());
		var pass_Certified = $.trim ($('#find_id_pass_Certified').val());
		
		$('.find_id_error').text('');
		
		if (pass_id=="") {
			$('#find_pass_error_id').text('아이디를 입력해주세요!');
			return false;
		}
		if (pass_name=="") {
			$('#find_pass_error_name').text('이름을 입력해주세요!');
			return false;
		}
		if (pass_email=="") {
			$('#find_pass_error_email').text('이메일을 입력해주세요!');
			return false;
		}
		if (pass_domain=="") {
			$('#find_pass_error_email').text('도메인을 입력해주세요!');
			return false;
		}
		
		//이메일 메일 발송 비동기 처리 
		$.ajax({
			type:"POST",
			url : "find_pass_emailCert",
			data : {"email": pass_email,"domain":pass_domain,"name":pass_name,"id":pass_id},
			success : function(data){
				alert("입력하신 이메일로 인증번호가 발송되었습니다.");
				//readonly는 읽기만 가능 값변경 불가능 form으로 값보낼떄는 가능 
				//readonly false면 값변경이 가능
				//disabled true가 비활성화 false가 활성화
				$('#find_id_pass_email_Certified_btn').attr("disabled",true);//버튼을 못쓰게 막음
				$('#hidde_box').css("visibility","visible");
				$('#find_id_pass_Certified').val('');
				$('#find_id_pass_Certified').attr('readonly',false);//readonly false면 쓰기 가능 true면 글을 못씀
				$('#find_id_pass_email_Certified_next_btn').attr('disabled',false);
			},
			beforeSend:function(){
				//(이미지 보여주기 처리)
				$('.wrap-loading').show();
			},
			complete:function(){
				//(이미지 감추기 처리)
				$('.wrap-loading').hide();
				
				//비번찾기로 넘어가도 된다
			},
			error: function(data){
				alert("입력하신 회원정보가 일치하지 않습니다.");
				$('#find_id_pass_email').val("");	//이메일값
				$('#find_id_pass_domain').val("");	//도메인값
				$('#find_id_pass_name').val("");
				$('#find_id_pass_id').val("");
				$('#find_id_pass_Certified').val("");
				$('#find_id_pass_pass').val("");
				$('#find_id_pass_pass_check').val("");
				return false;
			}
		})
	});
	
	//이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
	$(document).on("click", "#find_id_pass_email_Certified_next_btn", function(){
		var authCode = $('#find_id_pass_Certified').val();
		$.ajax({
			type:"post",
			url:"find_pass_emailCert_ok",
			data:{"authCode":authCode},
			success:function(data){
				if(data=="complete"){
					alert("인증이 완료되었습니다.");
					$('#find_id_pass_email_Certified_next_btn').attr('disabled', true);//비활성화
					$('#find_id_pass_Certified').attr('readonly',true);
					$('#find_id_pass_email_Certified_btn').attr('disabled',false);
					sessionStorage.removeItem('authCode');
				}else if(data == "false"){
					alert("인증번호를 잘못 입력하셨습니다.")
				}
			},
			beforeSend:function(){
		        //(이미지 보여주기 처리)
		        $('.wrap-loading').show();
			},
			complete:function(){
			    //(이미지 감추기 처리)
			    $('.wrap-loading').hide();
			},
			error:function(data){
				alert("에러가 발생했습니다.");
			}
		});
	});
	
	//	이메일 id 유효성 검증//추후 복구해야됨!!!!
	$('#find_id_pass_email').on("focusout", function() {
		if ($.trim($('#find_id_pass_email').val())=="") {
			$('#find_pass_error_email').text('이메일을 입력해주세요!');
			return false;
		}
	}).on("keyup", function(key) {

		$('#find_id_pass_email_Certified_btn').attr("disabled",false);
		$('#hidde_box').css("visibility","hidden");
		$('#find_id_pass_email_Certified_next_btn').attr('disabled', true);
		
		if ($.trim($('#find_id_pass_email').val())=="") {
			$('#find_pass_error_email').text('이메일을 입력해주세요!');
			return false;
		}
		$('#find_pass_error_email').text('');
	
	});
	

	$(document).on("click",".find_id_link1",function(){
		if($("#find_id_sub_box_id").css("display","none")){
			$("#find_id_sub_box_pass").css("display","none");
			$("#find_id_sub_box_id").css("display","block");
			$("#find_id_sub_box_id").css("display","block");
			$(".find_id_link1").css("background","orange");
			$(".find_id_link1").css("color","white");
			$(".find_pass_link2").css("background","lightgray");
		}
	});
	$(document).on("click",".find_pass_link2",function(){
		if($("#find_id_sub_box_pass").css("display","none")){
			$("#find_id_sub_box_id").css("display","none");
			$("#find_id_sub_box_pass").css("display","block");
			
			$(".find_pass_link2").css("background","orange");
			$(".find_pass_link2").css("color","white");
			$(".find_id_link1").css("background","lightgray");
		}
	});
	
	//비밀번호 변경 버튼 누를 려면 인증버튼이 비활성화 되어 있어야 하고 비밀번호 정규식 넣어주어야 함
});
