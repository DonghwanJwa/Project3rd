/**
 *  book_create.js
 */
$(document).ready(function() {
	
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
});

function createCheck(){
	if($("#create_list").children().length == ""){
		alert("책으로 만들 글을 선택해 주세요");
		return false;
	}
	var screenWidth = $(document).width();
	var screenHeight = $(document).height();
	$(".create_book_name").css({'width':screenWidth,'height':screenHeight});
	$(".create_book_name").css("display","inline-block");
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