/**
 * 
 */
/* 댓글 목록 숨김/나타내기 전환 */
var replyIndex = 0;

getSympathyState();

function addComment(){
	var para = document.location.href.split("/");
	var com_cont = $(".textarea").html();
	
	$.ajax({
		type:"POST",
		data:{"com_cont":com_cont},
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
	var rep_cont = $(".reply_textarea").html();
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
function replyEditOK(e){
	var editCont = $("#comment_editarea").text();
	console.log(editCont);
	var rep_no = $(e.target).data("no");
	
	$.ajax({
		type : "POST",
		data : {"editCont" : editCont,
			"rep_no" : rep_no
		},
		url : "/jamong.com/replyedit",
		success : function(data){
			if(data == 1){
				alert('댓글 수정에 성공했습니다!');
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
function replyEdit(e) {
	var replymenu = $(e.target).parent();
	var replyli = $(e.target).parent().parent().parent();
	var replyCont = replymenu.next().text();
	
//	$(replyli).attr('onmouseenter','').unbind("mouseenter");
	
	
	replymenu.css("display","none");
	replymenu.prev().css("display","block");
	replymenu.next().css("display","none");
	replymenu.next().next().css("display","block");
}
function replyEditCancle(e){
	var cancleBtn = $(e.target);
	var replyli = $(e.target).parent().parent();
	
	$(replyli).attr('onmouseenter','replyBtnShow(event);').bind("mouseenter");
	
	cancleBtn.prev().css("display","block");
	cancleBtn.next().remove();
	cancleBtn.next().css("display","block");
	cancleBtn.remove();
}
function replyHide(e) {
	var replyarea = "<div class='reply_wrap'>" +
	"<div class='reply_textarea' contenteditable='true'>" +
	"</div>" +
	"<div class='reply_btn_wrap'>" +
	"<a class='reply_btn' onclick='addReply(event);'>답글 작성</a>" +
	"</div>" +
	"</div>"
	var replyli = $(e.target).parent().parent().parent("li");

	if(replyIndex == 0){
		replyli.after(replyarea);
		$(".reply_wrap").focus();
		replyIndex=1;
	}else if(replyIndex == 1){
		$(".reply_wrap").remove();
		replyIndex=0;
	}

	$(".reply_btn").attr("data-ref",e.target.getAttribute("data-ref"));
	$(".reply_btn").attr("data-step",e.target.getAttribute('data-step'));
	$(".reply_btn").attr("data-level",e.target.getAttribute('data-level'));
}

function replyBtnHide(e){
	var target = $(e.target);
	target.children().children(".comment_menu").css("display","none");
	target.css("background-color","#FFF");
}
function replyBtnShow(e){
	var target = $(e.target);
	target.children().children(".comment_menu").css("display","block");
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
