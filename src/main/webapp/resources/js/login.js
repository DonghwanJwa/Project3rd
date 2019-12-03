/**
 * login.jsp, join_membership.jsp,find_id,find_pass의 자바스크립트 기능들이 있습니다
 */

function login() {
	$('#login_id_error').text('');//에러택스트
	$('#login_pass_error').text('');//에러택스트
	
	if ($.trim($('#login_id').val()) == "") {//기본 텍스트
		$('#login_id_error').text('아이디를 입력해주세요!');//에러택스트
		$("#login_id").val("").focus();
		return false;
	}
	if ($.trim($('#login_psss').val())=="") {
		$('#login_pass_error').text('비밀번호를 입력해주세요!');
		$("#login_pass").val("").focus();
		return false;
	}
}


//글자 수 제한, 특수기호 사용가능, 엔터로 빈칸이동
function join_membership() {
	
	var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
	var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/); 
	var getyear= RegExp(/^[0-9]{4}$/); 
	var getmonth_date= RegExp(/^[0-9]{1,2}$/); 
	var getName= RegExp(/^[가-힣]+$/);
	var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]{5,14}$/);
	
	$('#join_membership_error_id').text('');//에러택스트
	$('#join_membership_error_pass').text('');
	$('#join_membership_error_pass_check').text('');
	$('#join_membership_error_name').text('');
	$('#join_membership_error_birth').text('');
	$('#join_membership_error_email').text('');
	$('#join_membership_error_email_domain').text('');
	$('#join_membership_error_tel').text('');
	
	if ($.trim($('#join_membership_id').val()) == "") {//아이디 공백
		$('#join_membership_error_id').text('아이디를 입력해주세요!');
		$("#join_membership_id").val("").focus();		
		return false;
	}
	
	if(!getCheck.test($("#join_membership_id").val())){ //아이디 정규식
		$('#join_membership_error_id').text('형식에 맞게 입력해주세요');
		$("#join_membership_id").val("").focus(); 
		return false; 
	}

	if ($.trim($('#join_membership_pass').val())=="") {//비번 공백입니다
		$('#join_membership_error_pass').text('비밀번호를 입력해주세요!');
		$("#join_membership_pass").val("").focus();
		return false;
	}
	
	if(!regExpPw.test($("#join_membership_pass").val())){ //비밀번호 정규식
		$('#join_membership_error_pass').text('형식에 맞게 입력해주세요');
		$("#join_membership_pass").val("").focus(); 
		return false; 
	}
	//아이디 비밀번호 같음 확인 
	if($("#join_membership_id").val() == $("#join_membership_pass").val()){ 
		$('#join_membership_error_pass').text('아이디와 비밀번호가 같습니다');
		$("#join_membership_pass").val("").focus(); 
		return false; 
	}
	
	if ($.trim($('#join_membership_pass_check').val())=="") {//비번체크공백입니다
		$('#join_membership_error_pass_check').text('비밀번호를 다시 확인해주세요!');
		$("#join_membership_pass_check").val("").focus();
		return false;
	}
	
	//비번 비번책 같은지 확인
	if($("#join_membership_pass_check").val() != $('#join_membership_pass').val()){
		$('#join_membership_error_pass_check').text('비밀번호가 같지 않습니다!');
		$("#join_membership_pass_check").val("").focus();
		return false;
	}

	if ($.trim($('#join_membership_name').val())=="") {//이름 공백입니다
		$('#join_membership_error_name').text('이름을 입력해주세요!');
		$("#join_membership_name").val("").focus();
		return false;
	}
	if (!getName.test($('#join_membership_name').val())) {//이름 정규식
		$('#join_membership_error_name').text('이름을 입력해주세요!');
		$("#join_membership_name").val("").focus();
		return false;
	}
	
	//년 공백
	if($.trim($('#join_membership_birth_year').val())==""){
		$('#join_membership_error_birth').text('년을 입력해주세요!');
		$("#join_membership_birth_year").val("").focus();
		return false;
	}
	//년 정규식
	if(!getyear.test($('#join_membership_birth_year').val())){
		$('#join_membership_error_birth').text('년을 입력해주세요!');
		$("#join_membership_birth_year").val("").focus();
		return false;
	}
	
	//월 공백
	if($.trim($('#join_membership_birth_month').val())==""){
		$('#join_membership_error_birth').text('월을 입력해주세요!');
		$("#join_membership_birth_month").val("").focus();
		return false;
	}
	//월 정규식
	if(!getmonth_date.test($('#join_membership_birth_month').val())){
		$('#join_membership_error_birth').text('월을 입력해주세요!');
		$("#join_membership_birth_month").val("").focus();
		return false;
	}
	//일 공백
	if($.trim($('#join_membership_birth_date').val())==""){
		$('#join_membership_error_birth').text('일을 입력해주세요!');
		$("#join_membership_birth_date").val("").focus();
		return false;
	}
	//일 정규식
	if(!getmonth_date.test($('#join_membership_birth_date').val())){
		$('#join_membership_error_birth').text('일을 입력해주세요!');
		$("#join_membership_birth_date").val("").focus();
		return false;
	}
	
	if ($.trim($('#join_membership_email').val())=="") {//이메일공백입니다
		$('#join_membership_error_email_domain').text('이메일을 입력해주세요!');
		$("#join_membership_email").val("").focus();
		return false;
	}
	if (!emailCheck.test($('#join_membership_email').val())) {//이메일 정규식
		$('#join_membership_error_email_domain').text('이메일을 입력해주세요!');
		$("#join_membership_email").val("").focus();
		return false;
	}
	
	if ($.trim($('#join_membership_email_datalist').val())=="") {//도메일공백입니다
		$('#join_membership_error_email_domain').text('도메인을 입력해주세요!');
		$("#join_membership_email_datalist").val("").focus();
		return false;
	}

	if ($.trim($('#join_membership_tel').val())=="") {//핸드폰번호 공백입니다
		$('#join_membership_error_tel').text('핸드폰번호를 입력해주세요!');
		$("#join_membership_tel").val("").focus();
		return false;
	}
	if (!pornNUM.test($('#join_membership_tel').val())) {//핸드폰번호 정규식
		$('#join_membership_error_tel').text('핸드폰번호를 입력해주세요!');
		$("#join_membership_tel").val("").focus();
		return false;
	}
	
	if($("#join_membership_main_div2").css("display") == "none"){
		
		$("#join_membership_main_div").css("display","none");
		$("#join_membership_main_div2").css("display","block");
	} else {  
		$('#join_membership_main_div2').css("display", "none");   
	}  
}


function change2(){
	if($("#join_membership_main_div3").css ("display") == "none"){
		$("#join_membership_main_div2").hide();
		$("#join_membership_main_div3").show();
	}
}

