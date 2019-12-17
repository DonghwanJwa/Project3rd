/**
 * category.js
 */

$(document).ready(function(){
	
	$(".cat_write_btn").click(function(){
		$(".cat_write_btn").css("background-color","#FBFBFB");
		$(".cat_book_btn").css("background-color","#FFDFBF");
		
		$(".cat_writing_block").css("display","block");
		$(".cat_book_block").css("display","none");
	});
	
	$(".cat_book_btn").click(function(){
		$(".cat_book_btn").css("background-color","#FBFBFB");
		$(".cat_write_btn").css("background-color","#FFDFBF");
	
		$(".cat_writing_block").css("display","none");
		$(".cat_book_block").css("display","flex");
	});
	
});