/**
 * 
 */
/* 댓글 목록 숨김/나타내기 전환 */

getSympathyState();

function addComment(){
	var para = document.location.href.split("/");
	var com_cont = $(".textarea").text();

	$.ajax({
		type:"POST",
		data:{"com_cont":com_cont
		},
		url:"/jamong.com/comment/"+para[5],
		success:function(data){
			if(data == 1){
				alert('댓글 작성에 성공했습니다!');
				window.location.reload();
			}else if(data == 2){
				alert('로그인이 필요합니다!');
			}
		}
	});
}
function addReply(e){
	var para = document.location.href.split("/");
	var rep_cont = $(".reply_textarea").text();
	var rep_ref = e.target.getAttribute("data-ref");
	var rep_step = e.target.getAttribute('data-step');
	var rep_level = e.target.getAttribute('data-level');
	$.ajax({
		type:"POST",
		data:{"rep_cont":rep_cont,
			"rep_ref":rep_ref,
			"rep_step":rep_step,
			"rep_level":rep_level,	
		},
		url:"/jamong.com/reply/"+para[5],
		success:function(data){
			if(data == 1){
				alert('답글 작성에 성공했습니다!');
				window.location.reload();
			}else if(data == 2){
				alert('로그인이 필요합니다!');
			}
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

function replyHide(e) {
	if($('.reply_wrap').css("display") == "none") {
		$('.reply_wrap').show();
		$(".reply_btn").attr("data-ref",e.target.getAttribute("data-ref"));
		$(".reply_btn").attr("data-step",e.target.getAttribute('data-step'));
		$(".reply_btn").attr("data-level",e.target.getAttribute('data-level'));
	}else {
		$('.reply_wrap').hide();
	}
}

function replyBtnHide(e){
	var target = $(e.target);
	target.children().children(".comment_reply").css("display","none");
	target.css("background-color","#FFF");
}
function replyBtnShow(e){
	var target = $(e.target);
	target.children().children(".comment_reply").css("display","block");
	target.css("background-color","#FAFAFA");
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
