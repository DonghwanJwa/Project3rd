/**
 * 
 */
$(document).ready(function(){
	getRecommendState();
	var para = document.location.href.split("/");
	$('#book_info_intro_like_img').click(function(event){
		if($(event.target).css('background-color')=='rgb(255, 255, 255)'){
			$(event.target).css('background-color','RGB(245,124,104)');
			/* 추천 테이블에 저장 및 책 테이블에 book_recommend 증가 */
			$.ajax({
				type:"POST",
				url:"/jamong.com/book/recommend_up/" + para[6],
				success:function(data){
					if(data!=-1){
						$(event.target).prop("disabled",true);
						setTimeout(function(){
							$(event.target).prop("disabled",false);
						},2000);
					}else{
						alert('로그인 유지시간이 만료되었습니다 \n 다시 로그인 하시기 바랍니다');
						window.location.replace("/jamong.com/login/1");
					}
				},//success
				error:function(){
					alert("data error");
				}//error
			});//ajax
			
		}else{
			$(event.target).css('background-color','rgb(255, 255, 255)');
			$.ajax({
				type:"POST",
				url:"/jamong.com/book/recommend_down/" + para[6],
				success:function(data){
					if(data!=-1){
						$(event.target).prop("disabled",true);
						setTimeout(function(){
							$(event.target).prop("disabled",false);
						},2000);
					}else{
						alert("로그인 유지시간이 말료되었습니다 \n 다시 로그인 하시기 바랍니다");
						window.location.replace("/jamong.com/login/1");
					}
				},//success
				error:function(){
					alert("data error");
				}
			});//ajax
		}
	});
});

$(window).on('load',function(){
	$('#book_info_cover_title').wordBreakKeepAll();
});

function getRecommendState(){
	var para = document.location.href.split("/");
	$.ajax({
		type:"POST",
		url:"/jamong.com/book/recommend_state/" + para[6],
		success:function(data){
			if(data==1){
				$("#book_info_intro_like_img").css('background-color','rgb(245,124,104)');
			}
		},
		error:function(){
			alert("data error");
		}
	});
}