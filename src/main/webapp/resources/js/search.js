/**
 * 검색 결과 페이지 js 파일
 */
$(document).ready(function() {
	//post 버튼 클릭
	$("#search_type_btn_post").click(function(){
		location="../jsp/search_result(Post).jsp";
	});
	//work 버튼 클릭
	$("#search_type_btn_work").click(function(){
		location="../jsp/search_result(Work).jsp";
	});
	//author 버튼 클릭
	$("#search_type_btn_author").click(function(){
		location="../jsp/search_result(Author).jsp";
	});
	//정확도 정렬
	$("#btn_accuracy").click(function() {
		$("#btn_new").addClass("non-select")
		$("#btn_accuracy").removeClass("non-select");
		$("#btn_accuracy").attr("disabled",true);
		$("#btn_new").attr("disabled",false);
	});
	//최신 정렬
	$("#btn_new").click(function() {
		$("#btn_accuracy").addClass("non-select");
		$("#btn_new").removeClass("non-select");
		$("#btn_new").attr("disabled",true);
		$("#btn_accuracy").attr("disabled",false);
	})
});
