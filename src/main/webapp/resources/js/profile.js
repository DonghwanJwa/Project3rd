// tab 변경 
$(document).ready(function() {
	$("#profile_edit_img").on("change",profileImgSelect);

	$("#info_tab").click(function() {
		$("#profile_info").show();
		$("#Magazine").hide();
		$("#article").hide();
		$("#info_tab").addClass("active");
		$("#Magazine_tab").removeClass("active");
		$("#article_tab").removeClass("active");
	});

	$("#article_tab").click(function() {
		$("#article").show();
		$("#Magazine").hide();
		$("#profile_info").hide();
		$("#article_tab").addClass("active");
		$("#info_tab").removeClass("active");
		$("#Magazine_tab").removeClass("active");
	});

	$("#Magazine_tab").click(function() {
		$("#Magazine").show();
		$("#profile_info").hide();
		$("#article").hide();
		$("#Magazine_tab").addClass("active");
		$("#article_tab").removeClass("active");
		$("#info_tab").removeClass("active");
	});

})
// 작가 구독 텍스트 변경되게
$(document).ready(function() {
	$(".profile_button_type2").click(function() {
		// togglClass : 해당요소 여부를판단해 제거 및 부여함
		$(".profile_button_type2").toggleClass("p_follow")
		$(".profile_button_type2").each(function() {
			var text = $(this).text();
			$(this).html()
			$(this).text(function(i, text) {
				return text === "구독하기" ? "구독중" : "구독하기";
			})
		});
	});
});
// edit 글자제한 

// 키워드 	
$(document).ready(function() {
	var keyword_tag = {};
	var counter = 0;

	// 특수문자 정규식 변수(공백 미포함)
	var s_word = /[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi;
	var k_word = /[ㄱ-ㅎㅏ-ㅣ]/gi;
	// 완성형 아닌 한글 정규식
	var n_word = /[0-9]/gi;

	// 태그를 추가한다.
	function addTag(value) {
		keyword_tag[counter] = value; // 태그를 Object 안에 추가
		counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
	}
	//공백이 아니게
	function marginTag() {
		return Object.values(keyword_tag).filter(function(word) {
			return word !== "";
		});
	}
	
	$('#profile_editor').on("focusout",function(e){
		var p_edit =$(this).val();
		if(p_edit.length >0){
			if(p_edit.match(s_word)){
				p_edit = p_edit.replace(s_word,"");
				$('#profile_editor_error').text('특수문자는 입력할 수 없습니다.');
				p_edit;
			}else{
				$('#profile_editor_error').text('');
			}
			$(this).val(p_edit);
		}
	});
	
	
	// keypress : 글자가 입력되었을때 이벤트 실행, keyup : 키 입력 후 발생되는 이벤트
	$("#keyword_tag").on("keypress", function(e) {
		var self = $(this);

		if (e.keyCode == 32) {// 스페이스 바 입력 안되도록
			alert('띄어쓰기는 사용할 수 없습니다');
			return false;
		}
		// input 에 focus 되있을 때 엔터 입력 ( )
		if (e.key === "Enter") {
			var tagValue = self.val(); // 값 가져오기
			if (tagValue !== "" ) { // 값이 없으면 동작 안하게
				if (tagValue.match(s_word) || tagValue.match(k_word) || tagValue.match(n_word)){
					alert('특수문자,미완성된 한글,숫자는 입력할 수 없습니다.') 
					return self.val("");
				}

				// 같은 태그가 있는지 검사한다. 있다면 해당값이 array로 return한다.
				var result = Object.values(keyword_tag).filter(function(word) {// filter : 찾은 요소에서 특정 요소 걸러내기
					return word === tagValue;
				})

				if (result.length == 0) { // 태그 중복 검사

					if ($(".tag_item").siblings().length <= 7) {// 태그 생성 제한
						$("#edit_tag_list").append("<li class='tag_item'>" + tagValue + "<span class='del_btn' idx='" + counter + "'></span></li>").hide().fadeIn('2000');
						addTag(tagValue);
						self.val("");
					} else {
						alert("키워드는 8개를 넘어갈 수 없습니다!");
						self.val("");
					}
				} else {
					alert("중복되는 키워드 입니다.");
					self.val("");
				}
				e.preventDefault;
			}
		}
		// 키워드 버튼 클릭
		if($(".keyword_button").on("click",function(e){

			var tagValue = self.val(); // 값 가져오기
			if (tagValue !== "") { // 값이 없으면 동작 안하게

				if (tagValue.match(s_word) || tagValue.match(k_word) || tagValue.match(n_word)){
					$('#profile_error_keyword').text('특수문자,미완성된 한글,숫자는 입력할 수 없습니다.');
					return self.val("");
				}
				// 같은 태그가 있는지 검사한다. 있다면 해당값이 array로 return한다.
				var result1 = Object.values(keyword_tag).filter(function(word) {// filter : 찾은 요소에서 특정 요소 걸러내기
					return word === tagValue;
				})
				if (result1.length == 0) { // 태그 중복 검사
					if ($(".tag_item").siblings().length <= 7) {//태그 생성 제한
						$("#edit_tag_list").append("<li class='tag_item'>" + tagValue + "<span class='del_btn' idx='" + counter + "'></span></li>").hide().fadeIn('2000');
						addTag(tagValue);
						self.val("");
					} else {
						$('#profile_error_keyword').text("키워드는 8개를 넘어갈 수 없습니다!");
						self.val("");
					}
				} else {
					$('#profile_error_keyword').text("중복되는 키워드 입니다.");
					self.val("");
				}
			}
		}));
		// 삭제 버튼 
		// 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.?
	});
	$(document).on("click", ".del_btn", function(e) {
		var index = $(this).attr("idx");
		keyword_tag[index] = "";
		$(this).parent().remove();
	});
	$("#flio_b").click(function() {	
		$("#pf_folio").toggle();
			});

	$('.profile_edit_btn1').click(function() {
		var result = confirm('편집 중인 내용을 저장하지 않고 나가시겠습니까?');
		if (result) {
			location.replace('./profile');
		} else {}
	});
});

function profileImgSelect(e){
	var files = e.target.files;
	var filesArr =  Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
		alert('이미지 확장자만 가능합니다!');
		return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#profile_edit_img").css("background-image",'url(\"'+e.target.result+'\")');
		$("#profile_edit_img").css("height","100px");
		}
		reader.readAsDataURL(f);
	});
}
function profileCheck(){
	
	if($.trim($('#profile_editor').val())==""){
		$('#profile_editor_error').text('작가명을 작성해주세요!');
		$("#profile_editor").val("").focus();
		return false;
	}else{
		$('#profile_editor_error').text('');
		
	}
	
	if ($.trim($('#pf_info').val()) == "") {//기본 텍스트
		$('#profile_info_error').text('자기소개를 작성해주세요!');//에러택스트
		$('#pf_info').val("").focus();
		
		return false;
	}else{
		$('#profile_editor_error').text('');
		
	}

}	
$(document).ready(function(){
	$("#profile_editor").on("keypress", function(e) {
	if($.trim($('#profile_editor').val()).length > 30){
		$('#profile_editor_error').text('작가명은 30자 이하까지만 작성가능합니다!');
		$("#profile_editor").val("").focus();
		
		return false;
		
	}else{
		$('#profile_editor_error').text('');
	}	
	});
	if ($.trim($('#pf_info').val()).length > 90) {//기본 텍스트
		$('#profile_info_error').text('자기소개는 90자 이하까지만 작성가능합니다!');
		$("#profile_info").val("").focus();
		
		return false;
		
	}else{
		$('#pf_info').text('');
	}
	// 작가명 엔터 키 제한
	$('#profile_editor').on("keypress",function(e){
		var p_edit =$(this).val();
		if(e.keyCode == 13){
			alert('작가이름은 줄바꿈을 사용할 수 없습니다!');
			return false;
		}
	});
	
	// 자기소개 엔터키 제한
	$('.e').on("keypress",function(e){
		var p_edit =$(this).val();
		if(e.keyCode == 13){
			alert('자기소개는 줄바꿈을 사용할 수 없습니다!');
			return false;
		}
	});
})

		



