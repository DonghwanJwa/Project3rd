/**
 *  book_create.js
 */
$(document).ready(function() {
	
	$("#add").click(function(){
		if($("input").is(":checked")){
			$(":checked").parent().remove().appendTo("#book_create_make");
		};
	});
	
	$("#del").click(function(){
		if($("input").is(":checked")){
		$(":checked").parent().remove().appendTo("#post_list");
		};
	});
	
});