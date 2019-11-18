/**
 * login.jsp, join_membership.jsp,find_id,find_pass의 자바스크립트 기능들이 있습니다
 */

function login() {
	if ($.trim($('#login_id').val()) == "") {//기본 텍스트
		$('#login_id_error').text('아이디를 입력해주세요!');//에러택스트
		$("#login_id").val("").focus();
		
		return false;
	}else{
		$('#login_id_error').text('');//에러택스트
		$("#login_pass").focus();
		
	}
	if ($.trim($('#login_psss').val())=="") {
		$('#login_pass_error').text('비밀번호를 입력해주세요!');
		$("#login_pass").val("").focus();
		return false;
	}else{
		$('#login_pass_error').text('asdasdasd');
		
	}

}

function join_membership() {
	$('#join_membership_error_id').text('');//에러택스트
	$('#join_membership_error_pass').text('');
	$('#join_membership_error_pass_check').text('');
	$('#join_membership_error_name').text('');
	$('#join_membership_error_birth').text('');
	$('#join_membership_error_email').text('');
	$('#join_membership_error_email_domain').text('');
	
	
	if ($.trim($('#join_membership_id').val()) == "") {//기본 텍스트
		$('#join_membership_error_id').text('아이디를 입력해주세요!');//에러택스트
		$("#join_membership_id").val("").focus();		
		return false;
	}
	
	if ($.trim($('#join_membership_pass').val())=="") {
		$('#join_membership_error_pass').text('비밀번호를 입력해주세요!');
		$("#join_membership_pass").val("").focus();
		return false;
	}
	
	if ($.trim($('#join_membership_pass_check').val())=="") {
		$('#join_membership_error_pass_check').text('비밀번호를 확인해주세요!');
		$("#join_membership_pass_check").val("").focus();
		return false;
	}

	if ($.trim($('#join_membership_name').val())=="") {
		$('#join_membership_error_name').text('이름을 입력해주세요!');
		$("#join_membership_name").val("").focus();
		return false;
	}
	
		
	if ($.trim($('#join_membership_email').val())=="") {
		$('#join_membership_error_email_domain').text('이메일을 입력해주세요!');
		$("#join_membership_email").val("").focus();
		return false;
	}
	
	if ($.trim($('#join_membership_email_datalist').val())=="") {
		$('#join_membership_error_email_domain').text('도메인을 입력해주세요!');
		$("#join_membership_email_datalist").val("").focus();
		return false;
	}
	
	if ($.trim($('#join_membership_email_domain').val())=="") {
		$('#join_membership_error_email_domain').text('도메인을 입력해주세요!');
		$("#join_membership_email_domain").val("").focus();
		return false;
	}

	if ($.trim($('#join_membership_tel').val())=="") {
		$('#join_membership_error_tel').text('비밀번호를 입력해주세요!');
		$("#join_membership_tel").val("").focus();
		return false;
	}
	
}
	













