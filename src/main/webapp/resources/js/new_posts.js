/**
 * new_posts.js
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
									str += "<li class='scrolling' data-no='" + this.bo_no + "'>"
										+	"<div id='new_post_loading_cont'>"
										+	 "<div id='new_post_loading_cont_text'>"
										+	  "<div class='new_post_cont_catbook'>"
										+	   "<a href='/jamong.com/category/"+this.cat_name+"' class='new_post_cont_cat'>"+this.cat_name+"</a>"
										if(this.book_no != null){
											str += "<span class='new_post_cont_book'>Book</span>"
												+  "</div>"
										}
									str	+=	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"  
										if(this.bo_title.length > 20){
											str += "<div id='new_post_loading_cont_text_title'>" + title + "</div>"
										}else{
											str += "<div id='new_post_loading_cont_text_title'>" + this.bo_title + "</div>"
										}
										if(this.bo_thumbnail != null){
											if(this.bo_cont.length > 100){
												str	+= "<div id='new_post_loading_cont_text_cont'>" + cont + "</div>"
											}else{
												str += "<div id='new_post_loading_cont_text_cont'>" + this.bo_cont + "</div>"
											}
										}else{
											if(this.bo_cont.length > 100){
												str	+= "<div id='new_post_loading_cont_text_cont' class='new_post_no_img_cont'>" + cont + "</div>"
											}else{
												str += "<div id='new_post_loading_cont_text_cont' class='new_post_no_img_cont'>" + this.bo_cont + "</div>"
											}
										}
									str	+= 	"</a>"
										+	"<a href='/jamong.com/@"+ this.memberVO.mem_id + "'>"
										+	 "<div id='new_post_loading_cont_text_writer'>"
										+	  "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
										+	 "</div>"
										+	"</a>&nbsp;&nbsp;"
										+	 "<div id='new_post_loading_cont_text_ago'>" + this.bo_date + "</div>"
										+  "</div>"
										if(this.bo_thumbnail != null){
											str +=  "<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>" 
												+	"<img id='new_post_loading_cont_img' src='" + this.bo_thumbnail + "'>"
												+ 	"</a>"
										}
									str	+=	"</div>"
										+  "</li>"
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
