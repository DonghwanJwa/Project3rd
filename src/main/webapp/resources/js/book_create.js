/**
 *  book_create.js
 */
$(document).ready(function() {
	/* 선택 된 div css 변경 */
	$("input:checkbox").on("click",function(){
		if($(this).prop("checked")){
			$(this).next().addClass("selected");
		}else{
			$(this).next().removeClass("selected");
		}
	});
	
	/* 추가/삭제 */
	$("#add").click(function(){
		if($("input").is(":checked")){
			$(":checked").closest('li').remove().appendTo("#create_list");
			$("input").prop("checked",false).next().removeClass("selected");
			
			/* 선택 된 div css 변경 */
			$("input:checkbox").on("click",function(){
				if($(this).prop("checked")){
					$(this).next().addClass("selected");
				}else{
					$(this).next().removeClass("selected");
				}
			});
		};
	});
	
	$("#del").click(function(){
		if($("input").is(":checked")){
			$(":checked").closest('li').remove().appendTo("#post_list");
			$("input").prop("checked",false).next().removeClass("selected");
			
			/* 선택 된 div css 변경 */
			$("input:checkbox").on("click",function(){
				if($(this).prop("checked")){
					$(this).next().addClass("selected");
				}else{
					$(this).next().removeClass("selected");
				}
			});
		};
	});
	
	/* div 순서 변경 */
	$("#post_list").sortable();
	$("#post_list").disableSelection();
	$("#create_list").sortable();
	$("#create_list").disableSelection();
});