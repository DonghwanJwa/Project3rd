/**
 * 
 */
/* 댓글 목록 숨김/나타내기 전환 */

getSympathyState();

function replyAdd(){
	var para = document.location.href.split("/");
	var reply_cont = $(".textarea").text();
	$.ajax({
		type:"POST",
		data:{"reply_cont":reply_cont},
		url:"/jamong.com/reply/"+para[5],
		success:function(data){
			
		}
	});
}

function showHide() {
		if($('.hide_comment').css("display") == "none") {
			$('.hide_comment').show();
		}else{
			$('.hide_comment').hide();
		}
		if($('reply_wrap').css("display") != "none") {
			$('.reply_wrap').hide();
		}
}

function replyHide() {
	if($('.reply_wrap').css("display") == "none") {
		$('.reply_wrap').show();
	}else {
		$('.reply_wrap').hide();
	}
}

function getSympathyState(){
	var para = document.location.href.split("/");
	$.ajax({
		type:"POST",
		url:"/jamong.com/sympathy_state/"+para[5], 
		success: function (data) {
			if(data==1){
				$('.head-menu-heart-img').css('background-color','rgb(245,124,104)');		
			}
		},
		error:function(){
			alert("data error");
		}
	});
}

$(document).ready(function(){
	
	var para = document.location.href.split("/");
	
	/*공감 버튼*/
	$('.head-menu-heart-img').click(function(event){
		
		if($(event.target).css('background-color')=='rgb(255, 255, 255)'){
			$(event.target).css('background-color','rgb(245,124,104)');
			
			/*공감 테이블에 저장 및 게시글 테이블에 bo_like 증가*/
			$.ajax({
				type:"POST",
				url:"/jamong.com/sympathy_up/"+para[5], 
				success: function (data) {		
					if(data!=-1){
						$('.head-menu-heart-rate').text(data);
					}else{
						alert('로그인 유지시간이 만료되었습니다. \n'
								+'다시 로그인 하시기 바립니다.')
						window.location.replace("/jamong.com/login");
					}
				},
				error:function(){
					alert("data error");
				}
			});
			
		}else{
			$(event.target).css('background-color','rgb(255, 255, 255)');			
			$.ajax({
				type:"POST",
				url:"/jamong.com/sympathy_down/"+para[5], 
				success: function (data) {
					if(data!=-1){
						$('.head-menu-heart-rate').text(data);
					}else{
						alert('로그인 유지시간이 만료되었습니다. \n'
								+'다시 로그인 하시기 바립니다.')
						window.location.replace("/jamong.com/login");
					}
				},
				error:function(){//비동기식 아작스로 서버디비 데이터를 못가져와서 에러가 발생했을 때 호출되는 함수이다.
					alert("data error");
				}
			});
		}
	});	
});
