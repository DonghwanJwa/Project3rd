/**
 * member_modify.js
 */

/*정규식*/
var regExpPw = RegExp(/^(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()\-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/);//비번
var getCheck= RegExp(/^[a-zA-Z0-9]{6,12}$/); 			//아이디
var getyear= RegExp(/^[0-9]{4}$/); 						//년
var getmonth_date= RegExp(/^[0-9]{1,2}$/); 				//월,일
var getName= RegExp(/^[가-힣]+$/);						//이름
var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]{5,14}$/);	//이메일
var tel_first = RegExp(/^[0-9]{3}$/); 					//폰번호 3
var tel_second = RegExp(/^[0-9]{3,4}$/); 				//폰번호 3,4
var tel_third = RegExp(/^[0-9]{4}$/); 					//폰번호 4



$(document).ready(function(){
	//생년월일,전화번호 숫자만 받도록
	$(".number2Only").on("focus", function() {//포커스되었을때
		var x = $(this).val();
		$(this).val(x);
	}).on("focusout", function() {//포커스에서 나갔을 때
		var x = $(this).val();		//값을 받아오고
		if(x && x.length > 0) {		//내용물이 입력되었다면
			if(!$.isNumeric(x)) {	//숫자가 아니라면
				x = x.replace(/[^0-9]/g,"");	//숫자가 아닌존재들을 지움
			}
		}
	}).on("keyup", function() {//숫자가 눌렸을 때
		$(this).val($(this).val().replace(/[^0-9]/g,""));//숫자가 아닌존재들을 지움
	});


	//이름 유효성 검증
	$('#member_modify_name').on("focusout", function() {
		if ($.trim($('#member_modify_name').val())=="") {
			$('#member_modify_error_name').text('이름을 입력해주세요!');
			return false;
		}

		if (!getName.test($('#member_modify_name').val())) {//이름 정규식
			$('#member_modify_error_name').text('이름을 입력해주세요!');
			return false;
		}
		$('#member_modify_error_name').text('');
	}).on("keyup", function(key) {
		if ($.trim($('#member_modify_name').val())=="") {
			$('#member_modify_error_name').text('이름을 입력해주세요!');
			return false;
		}

		if (!getName.test($('#member_modify_name').val())) {//이름 정규식
			$('#member_modify_error_name').text('이름을 입력해주세요!');
			return false;
		}
		$('#member_modify_error_name').text('');
		if (key.keyCode == 13) {
			$('#member_modify_birth_year').focus();
		}
	});

	//생년월일 : 년 유효성 검증
	$('#member_modify_birth_year').on("focusout", function() {
		if ($.trim($('#member_modify_birth_year').val())=="") {
			$('#member_modify_error_birth').text('생년월일을 입력해 주세요!');
			return false;
		}

		if(!getyear.test($('#member_modify_birth_year').val())){
			$('#member_modify_error_birth').text('년을 입력해주세요!');
			return false;
		}
		if ($.trim($('#member_modify_birth_year').val())>2020 || $.trim($('#member_modify_birth_year').val())<1900) {
			$('#member_modify_error_birth').text('유효한 년도를 입력해 주세요!');
			return false;
		}

		$('#member_modify_error_birth').text('');
	}).on("keyup", function(key) {
		if ($.trim($('#member_modify_birth_year').val())=="") {
			$('#member_modify_error_birth').text('생년월일을 입력해 주세요!');
			return false;
		}

		if(!getyear.test($('#member_modify_birth_year').val())){
			$('#member_modify_error_birth').text('년을 입력해주세요!');
			return false;
		}
		if ($.trim($('#member_modify_birth_year').val())>2020 || $.trim($('#member_modify_birth_year').val())<1900) {
			$('#member_modify_error_birth').text('유효한 년도를 입력해 주세요!');
			return false;
		}
		$('#member_modify_error_birth').text('');
		if (key.keyCode == 13) {
			$('#member_modify_birth_month').focus();
		}

	});

	//생년월일 : 월 유효성검증
	$('#member_modify_birth_month').on("focusout", function() {
		if ($.trim($('#member_modify_birth_month').val())=="") {
			$('#member_modify_error_birth').text('생년월일을 입력해 주세요!');
			return false;
		}

		if(!getmonth_date.test($('#member_modify_birth_month').val())){
			$('#member_modify_error_birth').text('월을 입력해주세요!');
			return false;
		}

		if ($.trim($('#member_modify_birth_month').val())>12 || $.trim($('#member_modify_birth_month').val())<1) {
			$('#member_modify_error_birth').text('유효한 월을 입력해 주세요!');
			return false;
		}
		$('#member_modify_error_birth').text('');
	}).on("keyup", function(key) {
		if ($.trim($('#member_modify_birth_month').val())=="") {
			$('#member_modify_error_birth').text('생년월일을 입력해 주세요!');
			return false;
		}

		if(!getmonth_date.test($('#member_modify_birth_month').val())){
			$('#member_modify_error_birth').text('월을 입력해주세요!');
			return false;
		}

		if ($.trim($('#member_modify_birth_month').val())>12 || $.trim($('#member_modify_birth_month').val())<1) {
			$('#member_modify_error_birth').text('유효한 월을 입력해 주세요!');
			return false;
		}
		$('#member_modify_error_birth').text('');
		if (key.keyCode == 13) {
			$('#member_modify_birth_date').focus();
		}
	});

	//생년월일 : 일 유효성 검증
	$('#member_modify_birth_date').on("focusout", function() {
		if ($.trim($('#member_modify_birth_date').val())=="") {
			$('#member_modify_error_birth').text('생년월일을 입력해 주세요!');
			return false;
		}

		if(!getmonth_date.test($('#member_modify_birth_date').val())){
			$('#member_modify_error_birth').text('일을 입력해주세요!');
			return false;
		}

		if ($.trim($('#member_modify_birth_date').val())>31 || $.trim($('#member_modify_birth_date').val())<1) {
			$('#member_modify_error_birth').text('유효한 일을 입력해 주세요!');
			return false;
		}
		$('#member_modify_error_birth').text('');
	}).on("keyup", function(key) {
		if ($.trim($('#member_modify_birth_date').val())=="") {
			$('#member_modify_error_birth').text('생년월일을 입력해 주세요!');
			return false;
		}

		if(!getmonth_date.test($('#member_modify_birth_date').val())){
			$('#member_modify_error_birth').text('일을 입력해주세요!');
			return false;
		}

		if ($.trim($('#member_modify_birth_date').val())>31 || $.trim($('#member_modify_birth_date').val())<1) {
			$('#member_modify_error_birth').text('유효한 일을 입력해 주세요!');
			return false;
		}
		$('#member_modify_error_birth').text('');
		if (key.keyCode == 13) {
			$('#member_modify_select_gender').focus();
		}
	});

	//핸드폰 번호1
	$('#member_modify_tel1').on("focusout", function() {
		if ($.trim($('#member_modify_tel1').val())=="") {
			$('#member_modify_error_tel').text('핸드폰번호를 입력해주세요!');
			return false;
		}
		if(!tel_first.test($('#member_modify_tel1').val())){
			$('#join_membership_error_tel').text('정확한 번호를 입력해주세요!');
			return false;
		}
	}).on("keyup", function(key) {
		if ($.trim($('#member_modify_tel1').val())=="") {
			$('#member_modify_error_tel').text('핸드폰번호를 입력해주세요!');
			return false;
		}
		if(!tel_first.test($('#member_modify_tel1').val())){
			$('#join_membership_error_tel').text('정확한 번호를 입력해주세요!');
			return false;
		}
		$('#member_modify_error_tel').text('');
		if (key.keyCode == 13) {
			$('#member_modify_tel2').focus();
		}
	});

	//핸드폰 번호2
	$('#member_modify_tel2').on("focusout", function() {
		if ($.trim($('#member_modify_tel2').val())=="") {
			$('#member_modify_error_tel').text('핸드폰번호를 입력해주세요!');
			return false;
		}
		if(!tel_second.test($('#member_modify_tel2').val())){
			$('#member_modify_error_tel').text('정확한 번호를 입력해주세요!');
			return false;
		}
	}).on("keyup", function(key) {
		if ($.trim($('#member_modify_tel2').val())=="") {
			$('#member_modify_error_tel').text('핸드폰번호를 입력해주세요!');
			return false;
		}
		if(!tel_second.test($('#member_modify_tel2').val())){
			$('#member_modify_error_tel').text('정확한 번호를 입력해주세요!');
			return false;
		}
		$('#member_modify_error_tel').text('');
		if (key.keyCode == 13) {
			$('#member_modify_tel3').focus();
		}
	});

	//핸드폰 번호3
	$('#member_modify_tel3').on("focusout", function() {
		if ($.trim($('#member_modify_tel3').val())=="") {
			$('#member_modify_error_tel').text('핸드폰번호를 입력해주세요!');
			return false;
		}
		if(!tel_third.test($('#member_modify_tel3').val())){
			$('#member_modify_error_tel').text('정확한 번호를 입력해주세요!');
			return false;
		}
	}).on("keyup", function(key) {
		if ($.trim($('#member_modify_tel3').val())=="") {
			$('#member_modify_error_tel').text('핸드폰번호를 입력해주세요!');
			return false;
		}
		if(!tel_third.test($('#member_modify_tel3').val())){
			$('#member_modify_error_tel').text('정확한 번호를 입력해주세요!');
			return false;
		}
		$('#member_modify_error_tel').text('');
		if (key.keyCode == 13) {
			$("#member_modify_next_btn").trigger("click");
		}
	});

//이메일 수정하기 전에 인증버튼 없어짐
	$('#member_modify_email').on("focusout", function() {
		if ($.trim($('#member_modify_email').val())=="") {
			$('#member_modify_error_email_domain').text('이메일을 입력해주세요!');
			return false;
		}
		if($('#member_modify_email').val()==$('#member_modify_original_email').val()){//원래 이메일과 입력한 이메일이 같으면
			$('#member_modify_certified_btn').hide();
			$('#member_modify_certified_btn').attr("disabled",true);
			$('.member_modify_emailcheck_div').hide();
			$('#member_modify_emailcheck_btn').attr('disabled', true);
			$('#member_modify_next_btn').attr('disabled', false);
		}else{
			$('#member_modify_certified_btn').show();
			$('#member_modify_certified_btn').attr("disabled",false);
			$('.member_modify_emailcheck_div').hide();
			$('#member_modify_emailcheck_btn').attr('disabled', true);		
			$('#member_modify_next_btn').attr('disabled', true);
		}
		$('#find_pass_error_email').text('');
	}).on("keyup", function(key) {
		if($('#member_modify_email').val()==$('#member_modify_original_email').val()){//원래 이메일과 입력한 이메일이 같으면
			$('#member_modify_certified_btn').hide();
			$('#member_modify_certified_btn').attr("disabled",true);
			$('.member_modify_emailcheck_div').hide();
			$('#member_modify_emailcheck_btn').attr('disabled', true);
			$('#member_modify_next_btn').attr('disabled', false);
		}else{
			$('#member_modify_certified_btn').show();
			$('#member_modify_certified_btn').attr("disabled",false);
			$('.member_modify_emailcheck_div').hide();
			$('#member_modify_emailcheck_btn').attr('disabled', true);	
			$('#member_modify_next_btn').attr('disabled', true);
		}

		if ($.trim($('#member_modify_email').val())=="") {
			$('#member_modify_error_email_domain').text('이메일을 입력해주세요!');
			return false;
		}
		$('#find_pass_error_email').text('');
		if (key.keyCode == 13) {
			$('#member_modify_email_datalist').focus();
		}
	});

	$('#member_modify_email_datalist').on("focusout", function() {
		if ($.trim($('#member_modify_email_datalist').val())=="") {
			$('#member_modify_error_email_domain').text('도메인을 입력해주세요!');
			return false;
		}
		if($('#member_modify_email_datalist').val()==$('#member_modify_original_domain').val()){//원래 이메일과 입력한 이메일이 같으면
			$('#member_modify_certified_btn').hide();
			$('#member_modify_certified_btn').attr("disabled",true);
			$('.member_modify_emailcheck_div').hide();
			$('#member_modify_emailcheck_btn').attr('disabled', true);
			$('#member_modify_next_btn').attr('disabled', false);
		}else{
			$('#member_modify_certified_btn').show();
			$('#member_modify_certified_btn').attr("disabled",false);
			$('.member_modify_emailcheck_div').hide();
			$('#member_modify_emailcheck_btn').attr('disabled', true);		
			$('#member_modify_next_btn').attr('disabled', true);
		}
		$('#find_pass_error_email').text('');
	}).on("keyup", function(key) {
		if($('#member_modify_email_datalist').val()==$('#member_modify_original_domain').val()){//원래 이메일과 입력한 이메일이 같으면
			$('#member_modify_certified_btn').hide();
			$('#member_modify_certified_btn').attr("disabled",true);
			$('.member_modify_emailcheck_div').hide();
			$('#member_modify_emailcheck_btn').attr('disabled', true);
			$('#member_modify_next_btn').attr('disabled', false);
		}else{
			$('#member_modify_certified_btn').show();
			$('#member_modify_certified_btn').attr("disabled",false);
			$('.member_modify_emailcheck_div').hide();
			$('#member_modify_emailcheck_btn').attr('disabled', true);		
			$('#member_modify_next_btn').attr('disabled', true);
		}
		if ($.trim($('#member_modify_email').val())=="") {
			$('#member_modify_error_email_domain').text('이메일을 입력해주세요!');
			return false;
		}
		$('#find_pass_error_email').text('');
		if (key.keyCode == 13) {
			$("#member_modify_certified_btn").trigger("click");
		}
	});



//	회원정보수정 페이지에서  이메일 인증 아작스
	$(document).on("click", "#member_modify_certified_btn", function(){
		var email = $.trim($('#member_modify_email').val());				//이메일값
		var domain = $.trim($('#member_modify_email_datalist').val());	//도메인값

		$('#member_modify_error_email_domain').text('');

		if (email=="") {
			$('#member_modify_error_email_domain').text('이메일을 입력해주세요!');
			return false;
		}
		if (domain=="") {
			$('#member_modify_error_email_domain').text('도메인을 입력해주세요!');
			return false;
		}
		if (!emailCheck.test($('#member_modify_email_datalist').val())) {
			$('#member_modify_error_email_domain').text('도메인을 입력해주세요!');
			return false;
		}

		//이메일 중복체크
		$.ajax({
			type:"POST",
			url : "modify_emailCert",
			data : {"email": email,"domain":domain},
			datatype:"int",	
			success : function(data){
				if(data==1){
					//readonly는 읽기만 가능 값변경 불가능 form으로 값보낼떄는 가능 
					//readonly false면 값변경이 가능
					//disabled 태그 속성 활성화 false 비활성화
					//#01ea137a 확인된 곳엔 색 주기
					Swal.fire({
						icon : 'info',
						text : '입력하신 이메일로 아이디가 발송되었습니다.'
					}).then(function(){						
						$('#member_modify_next_btn').attr('disabled', true);
						$('#member_modify_certified_btn').attr("disabled",true);//disabled 태그 속성 활성화 true
						$('#member_modify_certified_btn').css('cursor','default');
						$('#member_modify_emailcheck').val('');//이메일 인증체크 디브를 공백으로 만들어줌
						$('#member_modify_emailcheck').attr('readonly',false);
						$('#member_modify_emailcheck_btn').attr('disabled',false);
						$(".member_modify_emailcheck_div").show();
					});
				}
			},
			beforeSend:function(){
				//(이미지 보여주기 처리)
				$('.wrap-loading').show();
			},
			complete:function(){
				//(이미지 감추기 처리)
				$('.wrap-loading').hide();
				$('#member_modify_emailcheck').focus();
			},
			error: function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
		});
	});//회원정보수정 페이지에서  이메일 수정 아작스

	//이메일 인증번호 입력 후 확인 버튼 클릭 이벤트
	$(document).on("click", "#member_modify_emailcheck_btn", function(){
		var authCode = $('#member_modify_emailcheck').val();
		$.ajax({
			type:"post",
			url:"modify_emailCert_ok",
			data:{"authCode":authCode},
			success:function(data){
				if(data=="complete"){
					Swal.fire({
						icon : 'success',
						text : '이메일 인증에 성공하셨습니다!'
					}).then(function(){
						$('#member_modify_next_btn').attr('disabled', false);//수정완료버튼 활성화
						$('#member_modify_emailcheck').attr('readonly',true);//이메일 체크 못쓰게함
						$('#member_modify_emailcheck_btn').attr('disabled',true);//확인버튼 못쓰게함
						$('#member_modify_emailcheck_btn').css('cursor','default');
						sessionStorage.removeItem('authCode');						
					});
					//sessionStorage.removeItem('authCode'); 란 세션스토리지에 저장되어 있는 인증번호값을 리무브아이템으로 
					//세션에 저장된 인증번호 값을 지운다 인증이 다 끝났으니깐 안지우면 다시 받을 때 문제가 될 것 같다.
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
	});//이메일 인증번호 입력 후 확인 버튼 클릭 이벤트

	$("#member_modify_pwd_modify").click(function(){
		if($(".hide_box").css("display") == "none"){
			$("#member_modify_pass").attr("name","mem_pwd");
			$(".hide_box").show();
		}else{
			$(".hide_box").hide();
			$("#member_modify_pass").removeAttr("name");
		}
	});//비밀번호 변경 박스


	//비밀번호 확인 유효성 검증
	$("#member_modify_pass").on("focusout keydown", function(e) {
		
		if(e.type === 'focusout'){
		if ($.trim($('#member_modify_pass').val())=="") {
			$('#member_modify_error_pass_check').text('비밀번호 확인을 입력해주세요!');
			return false;
		}
		if($.trim($('#member_modify_pass_check').val()) != $.trim($('#member_modify_pass').val())){
			$('#member_modify_error_pass_check').text('비밀번호가 같지 않습니다!');
			return false;
		}
	   }
		 if(e.type === 'keydown'){
	          if(e.keyCode == 32) {
	             return false;
	          }
	     }
		$('#member_modify_error_pass_check').text('');
	}).on("keyup", function(key) {
		if ($.trim($('#member_modify_pass').val())=="") {
			$('#member_modify_error_pass_check').text('비밀번호 확인을 입력해주세요!');
			return false;
		}
		if($.trim($('#member_modify_pass_check').val()) != $.trim($('#member_modify_pass').val())){
			$('#member_modify_error_pass_check').text('비밀번호가 같지 않습니다!');
			return false;
		}
		$('#member_modify_error_pass_check').text('');
		if (key.keyCode == 13) {
			$('#member_modify_pass_check').focus();
		}
	});
	
	$("#member_modify_pass_check").on("focusout keydown", function(e) {
		if(e.type === 'focusout'){
		if ($.trim($('#member_modify_pass_check').val())=="") {
			$('#member_modify_error_pass_check').text('비밀번호 확인을 입력해주세요!');
			return false;
		}
		if($.trim($('#member_modify_pass_check').val()) != $.trim($('#member_modify_pass').val())){
			$('#member_modify_error_pass_check').text('비밀번호가 같지 않습니다!');
			return false;
		}
	   }
		if(e.type === 'keydown'){
	          if(e.keyCode == 32) {
	             return false;
	          }
	     }
		$('#member_modify_error_pass_check').text('');
	}).on("keyup", function(key) {
		if ($.trim($('#member_modify_pass_check').val())=="") {
			$('#member_modify_error_pass_check').text('비밀번호 확인을 입력해주세요!');
			return false;
		}
		if($.trim($('#member_modify_pass_check').val()) != $.trim($('#member_modify_pass').val())){
			$('#member_modify_error_pass_check').text('비밀번호가 같지 않습니다!');
			return false;
		}
		$('#member_modify_error_pass_check').text('');
		if (key.keyCode == 13) {
			$("#member_modify_next_btn").trigger("click");
		}
	});
	
	document.addEventListener('keydown', function(event) {//엔터키 서브밋 막기 이벤트
		if (event.keyCode === 13) {
			event.preventDefault();
		};
	}, true);
});


function updateCheck(){
	var member_modify_pass = $("#member_modify_pass").val();
	var updateCon = confirm('수정하시겠습니까?');
	if(updateCon){
		if ($.trim($('#member_modify_name').val())=="") {
			$('#member_modify_error_name').text('이름을 입력해주세요!');
			$("#member_modify_name").val("").focus();
			return false;
		}

		if (!getName.test($('#member_modify_name').val())) {//이름 정규식
			$('#member_modify_error_name').text('이름을 입력해주세요!');
			$("#member_modify_name").val("").focus();
			return false;
		}

		//년 공백
		if ($.trim($('#member_modify_birth_year').val())=="") {
			$('#member_modify_error_birth').text('생년월일을 입력해 주세요!');
			$("#member_modify_birth_year").focus();
			return false;
		}

		//년 정규식
		if(!getyear.test($('#member_modify_birth_year').val())){
			$('#member_modify_error_birth').text('년을 입력해주세요!');
			$("#member_modify_birth_year").val("").focus();
			return false;
		}

		//년 1900 ~ 2020사이 체크
		if ($.trim($('#member_modify_birth_year').val())>2020 || $.trim($('#member_modify_birth_year').val())<1900) {
			$('#member_modify_error_birth').text('유효한 년도를 입력해 주세요!');
			$("#member_modify_birth_year").val("").focus();
			return false;
		}
		//월 공백
		if ($.trim($('#member_modify_birth_month').val())=="") {
			$('#member_modify_error_birth').text('생년월일을 입력해 주세요!');
			$("#member_modify_birth_month").focus();
			return false;
		}

		//월 정규식
		if(!getmonth_date.test($('#member_modify_birth_month').val())){
			$('#member_modify_error_birth').text('월을 입력해주세요!');
			$("#member_modify_birth_month").val("").focus();
			return false;
		}

		//월 1 ~ 12사이 체크
		if ($.trim($('#member_modify_birth_month').val())>12 || $.trim($('#member_modify_birth_month').val())<1) {
			$('#member_modify_error_birth').text('유효한 월을 입력해 주세요!');
			$("#member_modify_birth_month").val("").focus();
			return false;
		}

		//일 정규식
		if ($.trim($('#member_modify_birth_date').val())=="") {
			$('#member_modify_error_birth').text('생년월일을 입력해 주세요!');
			$("#member_modify_birth_date").focus();
			return false;
		}

		//일 정규식
		if(!getmonth_date.test($('#member_modify_birth_date').val())){
			$('#member_modify_error_birth').text('일을 입력해주세요!');
			$("#member_modify_birth_date").val("").focus();
			return false;
		}

		//일 1 ~ 30사이 체크
		if ($.trim($('#member_modify_birth_date').val())>31 || $.trim($('#member_modify_birth_date').val())<1) {
			$('#member_modify_error_birth').text('유효한 일을 입력해 주세요!');
			$("#member_modify_birth_date").val("").focus();
			return false;
		}

		if ($.trim($('#member_modify_email').val())=="") {
			$('#member_modify_error_email_domain').text('이메일을 입력해주세요!');
			$("#member_modify_email").val("").focus();
			return false;
		}

		if ($.trim($('#member_modify_email_datalist').val())=="") {
			$('#member_modify_error_email_domain').text('도메인을 입력해주세요!');
			$("#member_modify_email_datalist").val("").focus();
			return false;
		}

		//이메일 도메인 정규식
		if (!emailCheck.test($('#member_modify_email_datalist').val())) {
			$('#member_modify_error_email_domain').text('도메인을 입력해주세요!');
			$("#member_modify_email_datalist").val("").focus();
			return false;
		}

		if ($.trim($('#member_modify_tel1').val())=="") {
			$('#member_modify_error_tel').text('핸드폰번호를 입력해주세요!');
			$("#member_modify_tel1").focus();
			return false;
		}
		if (!tel_first.test($('#member_modify_tel1').val())) {
			$('#member_modify_error_tel').text('정확한 번호를 입력해주세요!');
			return false;
		}
		
		if ($.trim($('#member_modify_tel2').val())=="") {
			$('#member_modify_error_tel').text('핸드폰번호를 입력해주세요!');
			$("#member_modify_tel2").focus();
			return false;
		}
		if (!tel_second.test($('#member_modify_tel2').val())) {
			$('#member_modify_error_tel').text('정확한 번호를 입력해주세요!');
			return false;
		}
		
		if ($.trim($('#member_modify_tel3').val())=="") {
			$('#member_modify_error_tel').text('핸드폰번호를 입력해주세요!');
			$("#member_modify_tel3").focus();
			return false;
		}
		if (!tel_third.test($('#member_modify_tel3').val())) {
			$('#member_modify_error_tel').text('정확한 번호를 입력해주세요!');
			return false;
		}
		
		if($("#member_modify_pass").attr("name")=="mem_pwd"){ //비밀번호란이 활성화 되었을때만 유효성 검사
			if ($.trim($('#member_modify_pass').val())=="") {
				$('#member_modify_error_pass_check').text('비밀번호를 입력해주세요!');
				return false;
			}
			if($.trim($('#member_modify_pass').val()).length<8 || $.trim($('#join_membership_pass').val()).length>50){
				$('#member_modify_error_pass_check').text('8자이상으로 설정해주세요!');
				return false;
			}
		
			if ($.trim($('#member_modify_pass_check').val())=="") {
				$('#member_modify_error_pass_check').text('비밀번호 확인을 입력해주세요!');
				return false;
			}
		
			if(!regExpPw.test($("#member_modify_pass").val())){ 
				$('#member_modify_error_pass_check').text('영문,숫자,특수문자의 조합으로 입력해주세요!');
				return false; 
			}
		
			if($("#member_modify_pass_check").val() != $('#member_modify_pass').val()){
				$('#member_modify_error_pass_check').text('비밀번호가 같지 않습니다!');
				return false;
			}
		
			if($("#member_modify_id").val() == $("#member_modify_pass").val()){ 
				$('#member_modify_error_pass_check').text('아이디와 비밀번호가 같습니다');
				return false; 
			}
		}
	}else{
		return false;
	}
}

