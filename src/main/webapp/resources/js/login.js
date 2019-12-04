/**
 * login.jsp, join_membership.jsp,find_id,find_pass의 자바스크립트 기능들이 있습니다
 */
var sel_file; // 이미지 미리보기 변수
var category_count = 0;	//카테고리 선택갯수 제한변수

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
$(document).ready(function(){
	$("#join_membership_next_btn").click(function() {
		/*$('.join_membership_error').text('');//에러택스트
	
		var regExpPw = RegExp(/^(?=.*\d{1,50})(?=.*[0-9]{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/);
		var getCheck= RegExp(/^[a-zA-Z0-9]{6,12}$/); 
		var getyear= RegExp(/^[0-9]{4}$/); 
		var getmonth_date= RegExp(/^[0-9]{1,2}$/); 
		var getName= RegExp(/^[가-힣]+$/);
		var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]{5,14}$/);

		if ($.trim($('#join_membership_id').val()) == "") {//기본 텍스트
			$('#join_membership_error_id').text('아이디를 입력해주세요!');//에러택스트
			$("#join_membership_id").val("").focus();		
			return false;
		}
	
		if($.trim($("#join_membership_id").val()).length<6 || $.trim($("#join_membership_id").val()).length>12){ //아이디 정규식
			$('#join_membership_error_id').text('6자 이상,12자 이하로 설정해주세요!');
			$("#join_membership_id").focus(); 
			return false; 
		}
		
		if(!getCheck.test($("#join_membership_id").val())){ //아이디 정규식
			$('#join_membership_error_id').text('영문와 숫자만 사용 가능합니다.');
			$("#join_membership_id").focus(); 
			return false; 
		}
	
		if ($.trim($('#join_membership_pass').val())=="") {
			$('#join_membership_error_pass').text('비밀번호를 입력해주세요!');
			$("#join_membership_pass").val("").focus();
			return false;
		}
		
		if($.trim($('#join_membership_pass').val()).length<8 || $.trim($('#join_membership_pass').val()).length>50){
			$('#join_membership_error_pass').text('8자이상으로 설정해주세요!');
			$("#join_membership_pass_check").val("")
			$("#join_membership_pass").val("").focus();
			return false;
		}
	
		if ($.trim($('#join_membership_pass_check').val())=="") {
			$('#join_membership_error_pass_check').text('비밀번호를 입력해주세요!');
			$("#join_membership_pass_check").val("").focus();
			return false;
		}
	
		
		//비밀번호 정규식 = 영문,숫자,특수문자의 조합
		if(!regExpPw.test($("#join_membership_pass").val())){ 
			$('#join_membership_error_pass').text('영문,숫자,특수문자의 조합으로 입력해주세요!');
			$("#join_membership_pass_check").val("")
			$("#join_membership_pass").val("").focus();
			return false; 
		}
	
		//비번 비번확인이 같은지 확인
		if($("#join_membership_pass_check").val() != $('#join_membership_pass').val()){
			$('#join_membership_error_pass_check').text('비밀번호가 같지 않습니다!');
			$("#join_membership_pass_check").val("");
			$("#join_membership_pass").val("").focus();
			return false;
		}
	
		//아이디와 비밀번호가 같을때 
		if($("#join_membership_id").val() == $("#join_membership_pass").val()){ 
			$('#join_membership_error_pass').text('아이디와 비밀번호가 같습니다');
			$("#join_membership_pass_check").val("");
			$("#join_membership_pass").val("").focus(); 
			return false; 
		}
	

		if ($.trim($('#join_membership_name').val())=="") {
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
		if ($.trim($('#join_membership_birth_year').val())=="") {
			$('#join_membership_error_birth').text('생년월일을 입력해 주세요!');
			$("#join_membership_birth_year").focus();
			return false;
		}
		
		//년 정규식
		if(!getyear.test($('#join_membership_birth_year').val())){
			$('#join_membership_error_birth').text('년을 입력해주세요!');
			$("#join_membership_birth_year").val("").focus();
			return false;
		}
		
		//년 1900 ~ 2020사이 체크
		if ($.trim($('#join_membership_birth_year').val())>2020 || $.trim($('#join_membership_birth_year').val())<1900) {
			$('#join_membership_error_birth').text('유효한 년도를 입력해 주세요!');
			$("#join_membership_birth_year").val("").focus();
			return false;
		}
		
		
		//월 공백
		if ($.trim($('#join_membership_birth_month').val())=="") {
			$('#join_membership_error_birth').text('생년월일을 입력해 주세요!');
			$("#join_membership_birth_month").focus();
			return false;
		}
		
		//월 정규식
		if(!getmonth_date.test($('#join_membership_birth_month').val())){
			$('#join_membership_error_birth').text('월을 입력해주세요!');
			$("#join_membership_birth_month").val("").focus();
			return false;
		}
		
		//월 1 ~ 12사이 체크
		if ($.trim($('#join_membership_birth_month').val())>12 || $.trim($('#join_membership_birth_month').val())<1) {
			$('#join_membership_error_birth').text('유효한 월을 입력해 주세요!');
			$("#join_membership_birth_month").val("").focus();
			return false;
		}
		
		//일 정규식
		if ($.trim($('#join_membership_birth_date').val())=="") {
			$('#join_membership_error_birth').text('생년월일을 입력해 주세요!');
			$("#join_membership_birth_date").focus();
			return false;
		}
		
		//일 정규식
		if(!getmonth_date.test($('#join_membership_birth_date').val())){
			$('#join_membership_error_birth').text('일을 입력해주세요!');
			$("#join_membership_birth_date").val("").focus();
			return false;
		}
		
		//일 1 ~ 30사이 체크
		if ($.trim($('#join_membership_birth_date').val())>31 || $.trim($('#join_membership_birth_date').val())<1) {
			$('#join_membership_error_birth').text('유효한 일을 입력해 주세요!');
			$("#join_membership_birth_date").val("").focus();
			return false;
		}
		
		if ($.trim($('#join_membership_select_gender option:selected').val())=='성별') {
			$('#join_membership_error_birth').text('성별을 선택해 주세요!');
			$("#join_membership_select_gender").focus();
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
		
		//이메일 도메인 정규식
		if (!emailCheck.test($('#join_membership_email').val())) {
			$('#join_membership_error_email_domain').text('이메일을 입력해주세요!');
			$("#join_membership_email").val("").focus();
			return false;
		}
	
		if ($.trim($('#join_membership_tel1').val())=="") {
			$('#join_membership_error_tel').text('핸드폰번호를 입력해주세요!');
			$("#join_membership_tel1").focus();
			return false;
		}
		if ($.trim($('#join_membership_tel2').val())=="") {
			$('#join_membership_error_tel').text('핸드폰번호를 입력해주세요!');
			$("#join_membership_tel2").focus();
			return false;
		}
		if ($.trim($('#join_membership_tel3').val())=="") {
			$('#join_membership_error_tel').text('핸드폰번호를 입력해주세요!');
			$("#join_membership_tel3").focus();
			return false;
		}*/
		
		//기본정보 -> 프로필
		if($("#join_membership_page2").css("display") == "none"){
			$("#join_membership_page1").hide();
			$("#join_membership_sequence_list1").removeClass('membership_step');
			$("#join_membership_page2").show();
			$("#join_membership_sequence_list2").addClass('membership_step');
		}
	});
	
	//생년월일,전화번호 숫자만 받도록
	$(".numberOnly").on("focus", function() {//포커스되었을때
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
	
	/*page2 버튼*/
	//프로필 -> 기본정보 : 이전으로
	$("#join_membership_before_btn2").click(function() {
		if($("#join_membership_page1").css ("display") == "none"){
			$("#join_membership_page2").hide();
			$("#join_membership_sequence_list2").removeClass('membership_step');
			$("#join_membership_page1").show();
			$("#join_membership_sequence_list1").addClass('membership_step');
		}
	});
	
	//프로필 -> 카테고리 : 다음으로
	$("#join_membership_next_btn2").click(function() {
		if($("#join_membership_page3").css ("display") == "none"){
			$("#join_membership_page2").hide();
			$("#join_membership_sequence_list2").removeClass('membership_step');
			$("#join_membership_page3").show();
			$("#join_membership_sequence_list3").addClass('membership_step');
		}
	});
	
	/*page3 버튼*/
	//카테고리 -> 프로필 : 이전으로
	$("#join_membership_before_btn3").click(function() {
		if($("#join_membership_page2").css ("display") == "none"){
			$("#join_membership_page3").hide();
			$("#join_membership_sequence_list3").removeClass('membership_step');
			$("#join_membership_page2").show();
			$("#join_membership_sequence_list2").addClass('membership_step');
		}
	});
	
	//카테고리 선택시 class,name 추가(form에 post전달하기 위해서 name값에 숫자 추가)
	$(".join_membership_category-span").click(function(){
		
		if($(this).parent().hasClass("member_category_check")){
			$(this).parent().removeClass("member_category_check");
			$(this).parent().removeAttr("name");
			category_count-=1;
		}else{
			if(category_count<3){
				category_count+=1;
				$(this).parent().addClass("member_category_check");
				$(this).parent().attr("name","mem_fav"+category_count);
			}
		}
	});
	
	/*프로필 미리보기 이미지 변경 - 등록메서드 실행*/
	$("#join_membership_profile_input_hide").on("change", handleImgFileSelect);
});

/*프로필 미리보기 이미지 등록 메서드 */
function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert('확장자는 이미지 확장자만 가능합니다!');
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#join_membership_profile_img").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
}



