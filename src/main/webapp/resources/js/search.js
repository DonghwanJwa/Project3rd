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
							
							+	"<div class='post_cont_wrap'>"
							if(this.bo_thumbnail!=null){
								str += "<div id='post_text'>"								
							}else{
								str += "<div id='post_text' class='post_no_img_text'>"																
							}
						str +=	 '<div class="post_cont_catbook">'
							+	  '<a href="/jamong.com/category/'+this.cat_name+'" class="post_cont_cat">'+this.cat_name+'</a>'
							if(this.book_no != 0){
								str += '<span class="post_cont_book">Book</span>'
							}
						str += '</div>'  
							+	"<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"'>"
							+  "<div id='post_title'>" + this.bo_title + "</div>"
							if(this.bo_thumbnail!=null){
								str += "<div id='post_cont'>" + this.bo_cont + "</div>"								
							}else{
								str += "<div id='post_cont' class='post_no_img_cont'>" + this.bo_cont + "</div>"																
							}
						str +=	  "</a><a  href='/jamong.com/@"+this.memberVO.mem_id+"' class='post_writer'>"
							+	   "<i>by&nbsp;&nbsp;</i>" + this.memberVO.mem_nickname
							+	  "</a>"
							+	  "<div class='post_ago'>" + this.bo_date + "</div>"
							+	  "</div>"
								if(this.bo_thumbnail!=null){
									str += "<a href='/jamong.com/@"+this.memberVO.mem_id+"/"+this.bo_no+"' class='post_img_wrap'>"
										+	"<img class='post_img' src='" + this.bo_thumbnail + "'>"								
										+  "</a>"
								}
						str +=	"</div>"
							+  "</li>"
						});//each
						//이전까지 로딩된 데이터를 비워주고 바로 밑에 str을 불러온다
						$(".scrolling:last").after(str);
					}//if:data!=null;
				}//success
			});//ajax
		}//if: 현재 스크롤의 top 좌표가 > (게시글을 불러온 화면 높이 - 윈도우창의 높이) 되는 순간
		//where == post

		if(w=='book'){
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
						str += '<a href="/jamong.com/book_info" class="scrolling" data-no="'+ num +'">'
							+ '<div class="work_cont">'
							if(this.bookVO.book_cover==null){
								str+= '<img id="work_img" style="background-color:#f2f2f2">'
							}else{
								str+= '<img id="work_img" src="'+this.bookVO.book_cover+'" alt="표지">'
							}
						str += '<div class="work_cont_view">'
							+ '<div class="work_cont_view_top">'
							+ '<strong>'+this.bookVO.book_name+'</strong>' 
							+ '<span>by '+this.memberVO.mem_nickname+'</span>'
							+ '</div>'
							+ '<div class="work_cont_view_bottom">'
							+ '<span>Jamong Book</span>'
							+ '</div></div></div></a>'
						});//each
						$(".scrolling:last").after(str);
					}
				}
			});
		}
		
		if(w=='author'){
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
							if(this.mem_keyword !=null){
								var keyword = this.mem_keyword.split('/');
							}
							str += '<li class="scrolling" data-no="'+ num +'">'
								+ '<a href="/jamong.com/@'+this.mem_id+'">'
						        + '<div class="search_result_author_profile">'
						        + '<img class="search_result_author_profile_img" src="'+this.profile_photo+'" alt="프로필 사진">'
						        + '<div class="search_result_author_profile_info">'
						        + '<div class="search_result_author_name">'+this.mem_nickname+'</div>'
						        + '<div class="search_result_author_introduce">'+this.profile_cont+'</div>'
						        + '<div class="search_result_author_tag">'
						        if(this.mem_keyword !=null){
									for(var i=0;i<keyword.length;i++){
										if(keyword[i]!=''){
											str += '<span>#'+keyword[i]+'</span>'
										}
									}
								}
						    str += '</div></div></div>'
						        + '</a>'
						        + '</li>'
						});//each
						$(".scrolling:last").after(str);
					}
				}
			});
		}
	}
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
