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

$(document).ready(function(){
	$('#search_result_author_select').change(function(){
		search('author',$(this).val());
	});	
})


function searchEnter(){
	if(!$.trim($('#search_keyword').val())==""){
		if (event.keyCode == 13){
			$('#search_submit').trigger("click");
		}
	}
}
	

function search(w,s){
	if(!$.trim($('#search_keyword').val())==""){	
		var qtext = $('#search_keyword').val();
		for(var i=0;qtext.search(/(\s){2,}/)!=-1;i){ //공백 2개가 있으면 
			qtext = qtext.replace(/(\s){2,}/gi," "); //공백 하나로 바꿔줌 - 1개만 있을때까지
		}
		q=qtext.replace(/\s/gi,"+");			 //공백을 +로 표기 =>주소창에는 +표시지만 controller에서는 띄어쓰기로 인식된다.
		location.href = "/jamong.com/search?w="+w+"&s="+s+"&q="+q;
	}
}
