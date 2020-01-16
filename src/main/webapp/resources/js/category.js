/**
 * category.js
 */

$(document).ready(function(){
	
	$(".cat_write_btn").click(function(){
		$(".cat_write_btn").css("color","black");
		$(".cat_book_btn").css("color","#ddd");
		
		$(".cat_write_btn").css("border","2px solid black");
		$(".cat_book_btn").css("border","2px solid #bbb");
		
		$(".cat_writing_block").css("display","block");
		$(".cat_book_block").css("display","none");
	});
	
	$(".cat_book_btn").click(function(){
		$(".cat_book_btn").css("color","black");
		$(".cat_write_btn").css("color","#ddd");
		
		$(".cat_book_btn").css("border","2px solid black");
		$(".cat_write_btn").css("border","2px solid #bbb");
		
		$(".cat_writing_block").css("display","none");
		$(".cat_book_block").css("display","flex");
	});
	
});