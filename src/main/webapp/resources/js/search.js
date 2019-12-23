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
	
		if($(window).scrollTop()>=($(document).height()-$(window).height())){
			var num=$(".scrolling:last").attr("data-no");
			var w = $('#search_where').val();
			var s = $('#search_step').val();
			var qtext = $('#search_keyword').val();

			if(w=='post'){
				for(var i=0;qtext.search(/(\s){2,}/)!=-1;i){ //공백 2개가 있으면 
					qtext = qtext.replace(/(\s){2,}/gi," "); //공백 하나로 바꿔줌 - 1개만 있을때까지
				}
				text=qtext.replace(/\s/gi,"+");		
				
				$.ajax({
					type:"post",
					url:"search_scroll",
					dataType:'json',
					data:{
						"num":num,"w":w,"s":s,"text":text
					},
					success:function(data){
						var str="";
						if(data!=""){
							$(data).each(function(){
								num++;
								if(this.memberVO.mem_keyword !=null){
									var keyword = this.memberVO.mem_keyword.split('/');
								}
							str += "<li class='scrolling' data-no='" + num + "'>"
								+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
								+	"<div class='post_cont'>"
								if(this.bo_thumbnail!=null){
									str += "<div id='post_text'>"								
								}else{
									str += "<div id='post_text' class='post_no_img_text'>"																
								}
							str +=  "<div id='post_title'>" + this.bo_title + "</div>"
								if(this.bo_thumbnail!=null){
									str += "<div id='post_cont'>" + this.bo_cont + "</div>"								
								}else{
									str += "<div id='post_cont' class='post_no_img_cont'>" + this.bo_cont + "</div>"																
								}
							str +=	  "<div class='post_writer'>"
								+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
								+	  "</div>"
								+	  "<div class='post_ago'>" + this.bo_date + "</div>"
								+	  "<div class='post_tag'>"
								if(this.memberVO.mem_keyword !=null){
									for(var i=0;i<keyword.length;i++){
										str +=  "<a href='/jamong.com/search?w=post&s=accuracy&q="+keyword[i]+"'>" + keyword[i] + "</a>"
									}
								}
							str +=	  "</div>"
								+	"</div>"
								if(this.bo_thumbnail!=null){
									str += "<div class='post_img_wrap'>"
										+	"<img class='post_img' src='" + this.bo_thumbnail + "'>"								
										+  "<div>"
								}
							str +=	"</div>"
								+  "</a></li>"
							});//each
							//이전까지 로딩된 데이터를 비워주고 바로 밑에 str을 불러온다
							$(".scrolling:last").after(str);
						}//if:data!=null;
					}//success
				});//ajax
			}//if: 현재 스크롤의 top 좌표가 > (게시글을 불러온 화면 높이 - 윈도우창의 높이) 되는 순간
		}//where == post
		
		
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
