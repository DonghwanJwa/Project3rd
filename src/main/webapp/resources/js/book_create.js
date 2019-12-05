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
});