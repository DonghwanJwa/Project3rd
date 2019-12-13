/**
 * category.js
 */

$(document).ready(function(){
	
	$(".cat_write_btn").click(function(){
		$(".cat_writing_block").css("display","block");
		$(".cat_book_block").css("display","none");
	});
	
	$(".cat_book_btn").click(function(){
		$(".cat_writing_block").css("display","none");
		$(".cat_book_block").css("display","flex");
	});
	
});