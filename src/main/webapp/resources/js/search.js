/**
 * 검색 결과 페이지 js 파일
 */
// 새로고침 시 스크롤 맨 위로 이동
$(window).on("beforeunload",function(){
	$("html").scrollTop(0);
});

//스크롤 이벤트 발생
$(window).scroll(function(){
	
	/* 스크롤 다운 중 */
		//현재 스크롤의 top 좌표가 > (게시글을 불러온 화면 높이 - 윈도우창의 높이) 되는 순간
		if($(window).scrollTop()>=($(document).height()-$(window).height())){//현재 스크롤의 위치가 화면의 보이는 위치보다 크다면
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
								var titlesub=this.bo_title.substring(0,20);
								var contsub=this.bo_cont.substring(0,100);
								var title=titlesub+"...";
								var cont=contsub+"...";
								if(this.memberVO.memkeyword != null){
								if(this.bo_thumbnail != null & this.bo_title.length > 20 & this.bo_cont.length > 100){
									//썸네일이 있고 제목이 20글자 이상에 본문이 100글자 이상일 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + title + "</div>"
										+	  "<div id='post_cont'>" + cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	   "<span>" + this.memberVO.mem_keyword + "</span>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	 "<img id='post_img' src='" + this.bo_thumbnail + "'>"
										+	"</div>"
										+  "</a></li>"
								}else if(this.bo_thumbnail != null & this.bo_title.length > 20){
									//썸네일이 있고 제목이 20글자 이상일 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + title + "</div>"
										+	  "<div id='post_cont'>" + this.bo_cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	   "<span>" + this.memberVO.mem_keyword + "</span>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	 "<img id='post_img' src='" + this.bo_thumbnail + "'>"
										+	"</div>"
										+  "</a></li>"
								}else if(this.bo_thumbnail != null & this.bo_cont.length > 100){
									//썸네일이 있고 본문이 100글자 이상일 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + this.bo_title + "</div>"
										+	  "<div id='post_cont'>" + cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	   "<span>" + this.memberVO.mem_keyword + "</span>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	 "<img id='post_img' src='" + this.bo_thumbnail + "'>"
										+	"</div>"
										+  "</a></li>"
								}else if(this.bo_thumbnail == null & this.bo_title.length > 20 & this.bo_cont.length > 100){
									//썸네일이 없고 제목이 20글자 이상에 본문이 100글자 이상일 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + title + "</div>"
										+	  "<div id='post_cont'>" + cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	   "<span>" + this.memberVO.mem_keyword + "</span>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	 "<div id='post_img'></div>"
										+	"</div>"
										+  "</a></li>"
								}else if(this.bo_thumbnail == null & this.bo_title.length > 20){
									//썸네일이 없고 제목이 20글자 이상일 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + title + "</div>"
										+	  "<div id='post_cont'>" + this.bo_cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	   "<span>" + this.memberVO.mem_keyword + "</span>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	 "<div id='post_img'></div>"
										+	"</div>"
										+  "</a></li>"
								}else if(this.bo_thumbnail == null & this.bo_cont.length > 100){
									//썸네일이 없고 본문이 100글자 이상일 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + this.bo_title + "</div>"
										+	  "<div id='post_cont'>" + cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	   "<span>" + this.memberVO.mem_keyword + "</span>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	 "<div id='post_img'></div>"
										+	"</div>"
										+  "</a></li>"
								}else if(this.bo_thumbnail != null){
									//썸네일이 있을 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + this.bo_title + "</div>"
										+	  "<div id='post_cont'>" + this.bo_cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	   "<span>" + this.memberVO.mem_keyword + "</span>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	  "<img id='post_img' src='" + this.bo_thumbnail + "'>"
										+	"</div>"
										+  "</a></li>"
								}else{
									//썸네일이 없을 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + this.bo_title + "</div>"
										+	  "<div id='post_cont'>" + this.bo_cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	   "<span>" + this.memberVO.mem_keyword + "</span>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	 "<div id='post_img'></div>"
										+	"</div>"
										+  "</a></li>"
								}
							}//키워드가 있을 때
							else{
								if(this.bo_thumbnail != null & this.bo_title.length > 20 & this.bo_cont.length > 100){
									//썸네일이 있고 제목이 20글자 이상에 본문이 100글자 이상일 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + title + "</div>"
										+	  "<div id='post_cont'>" + cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	 "<img id='post_img' src='" + this.bo_thumbnail + "'>"
										+	"</div>"
										+  "</a></li>"
								}else if(this.bo_thumbnail != null & this.bo_title.length > 20){
									//썸네일이 있고 제목이 20글자 이상일 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + title + "</div>"
										+	  "<div id='post_cont'>" + this.bo_cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	 "<img id='post_img' src='" + this.bo_thumbnail + "'>"
										+	"</div>"
										+  "</a></li>"
								}else if(this.bo_thumbnail != null & this.bo_cont.length > 100){
									//썸네일이 있고 본문이 100글자 이상일 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + this.bo_title + "</div>"
										+	  "<div id='post_cont'>" + cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	 "<img id='post_img' src='" + this.bo_thumbnail + "'>"
										+	"</div>"
										+  "</a></li>"
								}else if(this.bo_thumbnail == null & this.bo_title.length > 20 & this.bo_cont.length > 100){
									//썸네일이 없고 제목이 20글자 이상에 본문이 100글자 이상일 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + title + "</div>"
										+	  "<div id='post_cont'>" + cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	 "<div id='post_img'></div>"
										+	"</div>"
										+  "</a></li>"
								}else if(this.bo_thumbnail == null & this.bo_title.length > 20){
									//썸네일이 없고 제목이 20글자 이상일 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + title + "</div>"
										+	  "<div id='post_cont'>" + this.bo_cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	 "<div id='post_img'></div>"
										+	"</div>"
										+  "</a></li>"
								}else if(this.bo_thumbnail == null & this.bo_cont.length > 100){
									//썸네일이 없고 본문이 100글자 이상일 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + this.bo_title + "</div>"
										+	  "<div id='post_cont'>" + cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	 "<div id='post_img'></div>"
										+	"</div>"
										+  "</a></li>"
								}else if(this.bo_thumbnail != null){
									//썸네일이 있을 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + this.bo_title + "</div>"
										+	  "<div id='post_cont'>" + this.bo_cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	  "<img id='post_img' src='" + this.bo_thumbnail + "'>"
										+	"</div>"
										+  "</a></li>"
								}else{
									//썸네일이 없을 때
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
										+	"<div class='post_cont'>"
										+	 "<div id='post_text'>"
										+	  "<div id='post_title'>" + this.bo_title + "</div>"
										+	  "<div id='post_cont'>" + this.bo_cont + "</div>"
										+	  "<div id='post_writer'>"
										+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	  "</div>"
										+	  "<div id='post_tag'>"
										+	  "</div>"
										+	  "<div id='post_ago'>" + this.bo_date + "</div>"
										+	"</div>"
										+	 "<div id='post_img'></div>"
										+	"</div>"
										+  "</a></li>"
								}
							}//키워드가 없을 때
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
			
		}//if: 현재 스크롤의 top 좌표가 > (게시글을 불러온 화면 높이 - 윈도우창의 높이) 되는 순간
		
}); //스크롤 이벤트

$(document).ready(function() {
	// post 버튼 클릭
	$("#search_type_btn_post").click(function() {
		$("#search_result_post").show();
		$("#search_result_work").hide();
		$("#search_result_author").hide();
		$("#search_type_btn_post").addClass('view');
		$("#search_type_btn_work").removeClass('view');
		$("#search_type_btn_author").removeClass("view");
	});
	// work 버튼 클릭
	$("#search_type_btn_work").click(function() {
		$("#search_result_post").hide();
		$("#search_result_work").show();
		$("#search_result_author").hide();
		$("#search_type_btn_post").removeClass('view');
		$("#search_type_btn_work").addClass('view');
		$("#search_type_btn_author").removeClass("view");
	});
	// author 버튼 클릭
	$("#search_type_btn_author").click(function() {
		$("#search_result_post").hide();
		$("#search_result_work").hide();
		$("#search_result_author").show();
		$("#search_type_btn_post").removeClass('view');
		$("#search_type_btn_work").removeClass('view');
		$("#search_type_btn_author").addClass("view");
	});

	// 정확도 정렬
	$("#btn_accuracy").click(function() {
		$("#btn_new").addClass("non-select")
		$("#btn_accuracy").removeClass("non-select");
		$("#btn_accuracy").attr("disabled", true);
		$("#btn_new").attr("disabled", false);
	});
	// 최신 정렬
	$("#btn_new").click(function() {
		$("#btn_accuracy").addClass("non-select");
		$("#btn_new").removeClass("non-select");
		$("#btn_new").attr("disabled", true);
		$("#btn_accuracy").attr("disabled", false);
	})
});
