<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@include file="../include/admin_header.jsp" %>
<div id="mem_drop_wrap">
<script>
function drop_check() {
	var flag;
	
	if($('#drop_reason').val() == '') {
		Swal.fire({
			icon : 'info',
			title : 'Reason Choice!',
			text :'정지사유를 선택하세요'
		}).then(function(){
			$('#drop_reason').focus();			
		})
		return false;
	};
	if($('#drop_cont').val().trim() == '') {
		Swal.fire({
			icon : 'warning',
			title : 'Exceed!',
			text : '정지사유는 500자 이내로 입력하세요!'
		}).then(function(){
			$('#drop_cont').val('').focus();
		});
		return false;
	};
	
	var reject = confirm('정말로 해당 계정을 정지시키시겠습니까?');
	if(reject === false){
		return false;
	}
}

$(document).ready(function() {
    $('#drop_cont').on('keyup', function() {
    	var cont=$(this).val();
    	$('#counter').html("("+cont.length+" / 500)");
    	
        if($(this).val().length > 500) {
        	Swal.fire({
    			icon : 'warning',
    			title : 'Exceed!',
    			text : '정지사유는 500자 이내로 입력하세요!'
    		}).then(function(){
	            $('#drop_cont').val($('#drop_cont').val().substring(0, 500));
   		        $('#counter').html("(500 / 500)");
    		});
        }
    });
});
</script>
<form action='admin_member_drop_ok' onsubmit="return drop_check();">
<input type="hidden" name="no" value="${no}" />
<input type="hidden" name="page" value="${page}" />
	<div id="drop_cont_wrap">
		<h3>정지사유</h3>
		<select id="drop_reason" name="drop_reason">
			<option value="">
				정지사유를 선택하세요.
			</option>
		
			<option value="영리목적/홍보성">
				영리목적/홍보성
			</option>
			
			<option value="불법정보">
				불법정보
			</option>
			
			<option value="욕설/인신공격">
				욕설/인신공격
			</option>
			
			<option value="음란/선정성">
				음란/선정성
			</option>
			
			<option value="개인정보 노출">
				개인정보 노출
			</option>
			
			<option value="같은 내용 도배">
				같은 내용 도배
			</option>
			
			<option value="권리침해 신고">
				권리침해 신고
			</option>
			
			<option value="기타">
				기타
			</option>
		</select>
		
		<br/>
		
		<textarea id="drop_cont" name="drop_cont" class="drop_reason_cont" placeholder="정지사유를 500자 이내로 입력하세요."></textarea>
		<div class="counter_wrap">
			<span id="counter" class="counter">(0 / 500)</span>
		</div>
		
		<div id="drop_btn_wrap">
			<input type="submit" class="notice_btn" value="계정정지" />
			<input type="button" class="notice_btn" value="취소" onclick="location='admin_member_info?no=${no}&page=${page}'" />
		</div>
	</div>

</form>
</div>
<%@include file="../include/admin_footer.jsp" %>
</html>