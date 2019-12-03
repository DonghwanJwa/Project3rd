/**
 *  book_create.js
 */
$(document).ready(function() {
	
	/* 선택 된 div css 변경 */
	
	$("input:checkbox").on("click",function(event){
		if($(this).prop("checked")){
			$(this).parent().addClass("selected");
		}else{
			$(this).parent().removeClass("selected");
		}
	});
	
	/* 추가/삭제 */
	$("#add").click(function(){
		if($("input").is(":checked")){
			$(":checked").closest('li').remove().appendTo("#book_create_make");
		};
	});
	
	$("#del").click(function(){
		if($("input").is(":checked")){
		$(":checked").closest('li').remove().appendTo("#post_list");
		};
	});
	
	/* div 순서 변경 */
	$("#post_list").sortable();
	$("#post_list").disableSelection();
	$("#book_create_make").sortable();
	$("#book_create_make").disableSelection();
});