/**
 * new_posts.js
 */
$(document).ready(function(){
	$("html").scrollTop(0);
});

var lastScrollTop=0;
var easeEffect='easeInQuint';

//스크롤 이벤트 발생
$(window).scroll(function(){
	var currentScrollTop = $(window).scrollTop();
	
	/* 스크롤 다운 중 */
	if(currentScrollTop-lastScrollTop > 0){
		//down-scroll:현재 게시글 다음의 글을 불러온다.
		//현재 스크롤의 top 좌표가 > (게시글을 불러온 화면 높이 - 윈도우창의 높이) 되는 순간
		if(currentScrollTop>=($(document).height()-$(window).height())){//현재 스크롤의 위치가 화면의 보이는 위치보다 크다면
			//현재 로딩이된 게시글의 마지막 bo_no값을 읽어옴
			var lastbo_no=$(".scrolling:last").attr("data-no");
			//ajax를 이용하여 현재 로딩 된 게시글의 마지막 bo_no를 서버로 보내어 그 다음 10개의 게시물 데이터를 받아온다.
			$.ajax({
				type:"post",
				url:"infinitiScrollDown",
				dataType:'json',
				data:{//서버로 보낼 데이터
					"bo_no":lastbo_no
				},
				success:function(data){//ajax가 성공했을시에 수행 될 function
					var str="";
					
					//받아온 데이터가 "" 이거나 null이 아닌경우 DOM handling을 해준다.
					if(data!=""){
						//서버로부터 받아온 data가 list이므로 each문을 사용하여 접근
						$(data).each(
							//새로운 데이터를 html 코드 형태의 문자열로 만듦.
							function(){
								str += "<li class='scrolling' data-no='" + this.bo_no + "'>" + "<a href='./read'>"
									+	"<div id='new_post_loading_cont'>"
									+	 "<img id='new_post_loading_cont_img' src='" + this.bo_thumbnail + "'>"
									+	 "<div id='new_post_loading_cont_text'>"
									+	  "<div id='new_post_loading_cont_text_title'>" + this.bo_title + "</div>"
									+	  "<div id='new_post_loading_cont_text_cont'>" + this.bo_cont + "</div>"
									+	  "<div id='new_post_loading_cont_text_writer'>"
									+	   "<i>by</i>" + this.memberVO.mem_nickname
									+	  "</div>"
									+	  "<div id='new_post_loading_cont_text_tag'>"
									+	   "<span>" + this.memberVO.mem_keyword + "</span>"
									+	  "<div id='new_post_loading_cont_text_ago'>" + this.bo_date + "</div>"
									+	 "</div>"
									+	"</div>"
									+  "</a></li>"
							
						});//each
						//이전까지 로딩된 데이터를 비워주고 바로 밑에 str을 불러온다
						$(".scrolling:last").after(str);
					}//if:data!=null;
				}//success
//				,
//				beforeSend:function(){
//			        //(이미지 보여주기 처리)
//			        $('.wrap-loading').show();
//				},
//				complete:function(){
//				    //(이미지 감추기 처리)
//				    $('.wrap-loading').hide();
//				}
			});//ajax
			
//			var position = $("#new_post_list:first").offset();
			
			lastScrollTop=currentScrollTop;
		}//if: 현재 스크롤의 top 좌표가 > (게시글을 불러온 화면 높이 - 윈도우창의 높이) 되는 순간
		
	}//if: 스크롤 다운 중 
}); //스크롤 이벤트
