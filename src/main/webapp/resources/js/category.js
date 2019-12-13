/**
 * category.js
 */

$(document).ready(function(){
	
	$(".cat_write_btn").click(function(){
		console.log("버튼클릭된다 씹새야");
		$(".cat_writing_block").css("display","block");
		$(".cat_book_block").css("display","none");
	});
	
	$(".cat_book_btn").click(function(){
		console.log("버튼클릭된다 씹새야");
		$(".cat_writing_block").css("display","none");
		$(".cat_book_block").css("display","block");
	});
	
});