/**
 * admin.js
 */

function notice_check() {
	if($('#noti_name').val() == "") {
		Swal.fire({
			text : '작성자를 입력해주세요.',
			icon : 'info'
			});
		$('#noti_name').val("").focus();
		return false;
	}
	if($('#noti_pwd').val() == "") {
		Swal.fire({
			text : '비밀번호를 입력해주세요.',
			icon : 'info'
			});
		$('#noti_pwd').val("").focus();
		return false;
	}
	if($('#noti_title').val() == "") {
		Swal.fire({
			text : '공지사항 제목을 입력해주세요.',
			icon : 'info'
			});
		$('#noti_title').val("").focus();
		return false;
	}
	if($('#noti_cont').val() == "") {
		Swal.fire({
			text : '공지사항 내용을 입력해주세요.',
			icon : 'info'
			});
		$('#noti_cont').val("").focus();
		return false;
	}
}