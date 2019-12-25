/**
 *  book_create.js
 */
$(document).ready(function() {
	
	/* 책 커버 이미지 선택 */
	$("#book_create_cover_text").click(function(e){
		if(!$(e.target).hasClass("title")){
			$("input[type=file]").click();
		}
	});	
	
	/* 책 커버 이미지 미리보기 */
	$("#book_create_cover_imgFile").on("change",handleImgFileSelect);
	
	/* post_list의 li 전체 선택 / 전체 해제 */
	$("#post_list_checkAll").click(function(){
		$("#post_list [type=checkbox]").prop("checked",true);
	});
	$("#post_list_releaseAll").click(function() {
		$("#post_list [type=checkbox]").prop("checked",false);
	});
	
	/* create_list의 li 전체 선택 / 전체 해제 */
	$("#create_list_checkAll").click(function(){
		$("#create_list [type=checkbox]").prop("checked",true);
	});
	$("#create_list_releaseAll").click(function() {
		$("#create_list [type=checkbox]").prop("checked",false);
	});
	
	/* 추가 / 삭제 */
	$("#add").click(function(){
		if($("input").is(":checked")){
			$(":checked").closest('li').remove().appendTo("#create_list");
			$("input").prop("checked",false).next().removeClass("selected");
		};
	});
	
	$("#del").click(function(){
		if($("input").is(":checked")){
			$(":checked").closest('li').remove().appendTo("#post_list");
			$("input").prop("checked",false).next().removeClass("selected");
		};
	});
	
	/* div 순서 변경 */
	$("#post_list").sortable();
	$("#post_list").disableSelection();
	$("#create_list").sortable();
	$("#create_list").disableSelection();
	
	$(".create_name_close").click(function(){
		$(".create_book_name").css("display","none");
	});
	$(".create_book_name").click(function(i){
		if($(".create_book_name").is(i.target)){//영역 밖 클릭 시
			$(".create_book_name").css("display","none");
		}
	});
	
	//책 제목 글자 수 제한
	$("#book_create_cover_title").on("keydown",function(){
		if($(this).text().length > 30){
			$(this).text($(this).text().substring(0,30));
		}
	});
	//책 소개 글자 수 제한
	$("#book_create_intro_cont").on("keydown",function(){
		if($(this).text().length > 245){
			$(this).text($(this).text().substring(0,245));
		}
	});
});

function createCheck(){
	if($.trim($("#book_create_cover_title").text())==""){
		alert("책 제목을 입력하세요.");
		$("#book_create_cover_title").text("").focus();
		return false;
	}
	if($.trim($("#book_create_intro_cont").text())==""){
		alert("책 소개를 입력하세요.");
		$("#book_create_intro_cont").text("").focus();
		return false;
	}
	if($("#create_list").children().length == ""){
		alert("책으로 만들 글을 선택해 주세요.");
		return false;
	}//ul 리스트가 비어있으면 
	$("#create_list [type=checkbox]").prop("checked",true);
	var book_name = $("#book_create_cover_title").html();
	var book_preface = $("#book_create_intro_cont").html();
	$("#book_title").val(book_name);
	$("#book_intro_cont").val(book_preface);
}

function create_bookCheck(){
	var checkArr = []; //배열 초기화
	$(":checked").each(function(){
		checkArr.push($(this).val());
		console.log(checkArr);
	});
	
	jQuery.ajaxSettings.tranditional = true;
	
	$.ajax({
		url: "book_create_ok",
		type: "get",
		dataType: "text",
		data: {
			"create_list" : checkArr
		}
	});
}

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
			$("#book_create_cover_img").css('background','');
			$("#book_create_cover_img").css('background-image','url(\"'+e.target.result+'\")');
		}
		reader.readAsDataURL(f);
	});
}
