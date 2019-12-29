/*
 * index.jsp
 */

//js페이지가 로딩되면 메뉴에 요소들을 불러옴(중단에 메서드 있음)
var slideIndex = 0;
var timerID;
getCategory();
getBestList();
getHeaderNotice();

$(document).ready(function(){
	timerID = showSlides();
});

function scrollmove(whereScroll,howMove){
	/*스크롤움직임 버튼 ( 어느div인지,	어느쪽으로 움직이는지)*/
	scrollAmount = 0; /*움직인 스크롤 길이를 저장할 변수*/
	var container = document.getElementById(whereScroll);
	/*스크롤이 작용하는 div를 변수로 저장*/

	var scrollMove = container.scrollWidth/10;	
	/**/
	var slideTimer = setInterval(function(){		/*setInterval(함수,시간) : 쓰레드 기능과 같음 */
		if(howMove=='slideleft'){					/* 						해당함수를 기입한 시간간격으로 반복*/
			container.scrollLeft -= scrollMove/30;	/*버튼한번클릭하여 움직이는 길이/10*/
			/*div.scrollLeft : 해당 div의 왼쪽기준으로 화면에서 넘어간 너비를 알려줌(초기값 0)*/
		}else{
			container.scrollLeft += scrollMove/30;
		}
		scrollAmount += scrollMove/30;			/*움직이는 거리를 측정*/
		if(scrollAmount >= scrollMove){			/*움직인 거리가 지시한 거리만큼 움직이면 참*/
			if(container.scrollLeft==0){
				document.getElementById(whereScroll+'-'+howMove).style.visibility="hidden";
				/*좌측 버튼 id를 "div클래스명 - 방향"으로 지정하여 재활용*/
				/*좌측 버튼을 눌렀을때 scroll 위치가 0이라면 숨김*/
			}else if(Math.round(container.scrollLeft)==container.scrollWidth-container.clientWidth){
				/* 스크롤이 맨 오른쪽까지 갔을때를 표현한 것
				 * 안보이는부분왼편의 길이 == div전체의 길이 - 사용자가 볼수있는 div가로길이
				 */
				document.getElementById(whereScroll+'-'+howMove).style.visibility="hidden";
			}else{
				document.getElementById(whereScroll+'-slideleft').style.visibility="visible";
				document.getElementById(whereScroll+'-slideright').style.visibility="visible";
			}
			window.clearInterval(slideTimer);	/*지정된 Interval을 중지(쓰래드 중지)*/
		}
	}, 0.6);
}

/*메뉴바 Best,Hot 페이징버튼*/
function hotscroll(where,number){
	if($('.best-scroll').attr("data-disabled")=='true'){
		return false;
	}
	scrollAmount = 0; 
	var hotContainer = document.getElementById("head-page-"+where+"-list-frame");
	var hotScrollMove = $("#head-page-"+where+"-list-frame").width();/* 사진 1장의 가로길이 */
	var hotSlideTimer = setInterval(function(){
		if(hotScrollMove*(number-1)>hotContainer.scrollLeft){/*누른버튼의 숫자가 현재 보여지는 페이지 숫자보다 작으면*/
			hotContainer.scrollLeft += hotScrollMove/20;
		}else if(hotScrollMove*(number-1)<hotContainer.scrollLeft){/*누른버튼의 숫자가 현재 보여지는 페이지 숫자보다 크면*/
			hotContainer.scrollLeft -= hotScrollMove/20;
		}else{/*같은버튼을 눌렀을 때*/
			window.clearInterval(hotSlideTimer);
		}
		
		if(hotContainer.scrollLeft==hotScrollMove*(number-1)){//원하는 페이지까지 이동이되면 쓰레드 중지
			window.clearInterval(hotSlideTimer);			
		}
	},1);
	$('.best-scroll').children().removeClass();
	$('.head-item-scroll-link'+number).children('span').addClass("head-checked");
	$('.best-scroll').attr("data-disabled",'true');
	setTimeout(function(){
		$('.best-scroll').attr("data-disabled",'false');
	},1000);
	
}

function showSlides() {
	if($('#recom_book-cont').length>0){
		slideIndex++;
		if (slideIndex > 3) {slideIndex = 1}    
		$(".recom_book-item-wrap").children().css("opacity","0");
		setTimeout(function(){
			$(".recom_book-item-wrap").css("display","none");		
			$("li[data-book='"+slideIndex+"']").css("display","list-item");
			setTimeout(function(){
				$("li[data-book='"+slideIndex+"']").children().css("opacity","1");		
			},200);
		},500);
		$(".recom-book-page").removeClass("recom_book-open");
		$(".recom-book-page").addClass("recom_book-close");
		$("span[data-bookpage='"+slideIndex+"']").removeClass("recom_book-close");
		$("span[data-bookpage='"+slideIndex+"']").addClass("recom_book-open");
		
		timerID = setTimeout(showSlides, 5000);
	}
}

function slideButton(a){
	if($('.recom-book-page').attr("data-disabled")=='true'){
		return false;
	}
	$('.recom-book-page').attr("data-disabled",'true');
	clearTimeout(timerID);
	slideIndex = a;
	timerID = setTimeout(showSlides, 1000);
	setTimeout(function(){
		$('.recom-book-page').attr("data-disabled",'false');
	},2000);
}


function getHeaderNotice(){
	
	  $.getJSON("/jamong.com/header_notice/",function(data){
		  var str="";
		  var popupX = (window.screen.width / 2) - (720 / 2);
		  var popupY= (window.screen.height / 2) - (550 / 2);
		  $(data).each(function(){//each는 jQuery에서 반복함수
			  str+='<li class="head-page-notice-item">'
			  +'<a href="/jamong.com/notice_cont?no='+this.noti_no+'&state=pop" onclick="window.open(this.href,\'_blank\',\'location=no, resizable=no, status=no, toolbar=no, width=720, height=550 left='+popupX+', top='+popupY+' \');return false">'
			  +'<span class="head-page-notice-title">'+this.noti_title+'</span>'
			  +'<span class="head-page-notice-date">'+this.noti_date+'</span>'
			  +'</a>'
			  +'</li>'
		  });
		  if ($('#head-page-notice-list').length > 0 ) {	//header가 존재하면
			  $('#head-page-notice-list').html(str);	//ul내부에 each내용을 넣어준다
		  }
	  });
}

function getCategory(){
	  $.getJSON("/jamong.com/category_load/",function(data){
		  var str="";
		  $(data).each(function(){//each는 jQuery에서 반복함수
			  str+='<li class="head-page-category-item">'
			  +'<a href="/jamong.com/category/'+this.cat_name+'">'+this.cat_name+'</a>'
			  +'<input type="hidden" value="'+this.cat_no+'"/>'
			  +'</li>'
		  });
		  if ($("#head-page-category-list").length > 0 ) {	//header가 존재하면
			  $('#head-page-category-list').html(str);	//ul내부에 each내용을 넣어준다
		  }
	  });
}

function getBestList(){
	//header가 존재하면
	
	  $.getJSON("/jamong.com/best_load/",function(data){
		  var str="";
		  $(data).each(function(){//each는 jQuery에서 반복함수
			  str+='<li class="head-page-best-item">'
			  +'<a href="/jamong.com/@'+this.memberVO.mem_id+'/'+this.bo_no+'" class="head-page-link">'
			  if(this.bo_thumbnail==null){
				  str+='<img style="background-color:#000000;"/>'
			  }else{
				  str+='<img src="'+this.bo_thumbnail+'"/>'				  
			  }
			  str+='<div class="head-page-cont">'
			  +'<div class="head-page-main-title-wrap">'
			  +'<strong class="head-page-main-title">'+this.bo_title+'</strong></div>'
			  if(this.bo_subtitle==null){
				  str+='<span class="head-page-sub-title"></span>'   	    				  				  
			  }else{
				  str+='<span class="head-page-sub-title">'+this.bo_subtitle+'</span>'   	    				  
			  }
		      str+='<span class="head-page-author">by '+this.memberVO.mem_nickname+'</span>'
		      +'</div></a></li>'
		  });
		  if ($("#head-page-best-list").length > 0 ) {
			  $('#head-page-best-list').html(str);	//ul내부에 each내용을 넣어준다 
		  }
	  });
}

$(document).ready(function(){
	
	/*검색버튼*/
	$('#head-menu_search-button').click(function(){
		if($('#head-menu_search-text').css('opacity')=='0'){//검색창 숨겨져있을 때
			$('#head-menu_search-text').css('width','140px');
			$('#head-menu_search-text').css('opacity','1');
			setTimeout(function(){$('#head-menu_search-text').focus();},400);
		}else{//검색창이 드러나있을 때
			if(!$.trim($('#head-menu_search-text').val())==""){	
				var otext = $('#head-menu_search-text').val();
				for(var i=0;otext.search(/(\s){2,}/)!=-1;i){ //공백 2개가 있으면 
					otext = otext.replace(/(\s){2,}/gi," "); //공백 하나로 바꿔줌 - 1개만 있을때까지
				}
				otext=otext.replace(/\s/gi,"+");			 //공백을 +로 표기 =>주소창에는 +표시지만 controller에서는 띄어쓰기로 인식된다.
				location.href = "/jamong.com/search?w=post&s=accuracy&q="+otext;
	    	}       
		}
	});

	/*검색필드 포커스아웃*/
	$('#head-menu_search-text').blur(function(){
		$('#head-menu_search-text').css('width','0');
		$('#head-menu_search-text').css('opacity','0');
		setTimeout(function(){$('#head-menu_search-text').val('');},400);
	});
	
	/*검색input에서 검색어입력후 앤터눌렀을 때*/
	$('#head-menu_search-text').keyup(function(e) {
		if(!$.trim($('#head-menu_search-text').val())==""){
			if (e.keyCode == 13){			
				var otext = $('#head-menu_search-text').val();
				for(var i=0;otext.search(/(\s){2,}/)!=-1;i){ //공백 2개가 있으면 
					otext = otext.replace(/(\s){2,}/gi," "); //공백 하나로 바꿔줌 - 1개만 있을때까지
				}
				otext=otext.replace(/\s/gi,"+");			 //공백을 +로 표기 =>주소창에는 +표시지만 controller에서는 띄어쓰기로 인식된다.
				location.href = "/jamong.com/search?w=post&s=accuracy&q="+otext;
			}
		}       
	});
	
	/*메뉴버튼*/
	$('#head-menu-button').click(function(){		
		if($('#head-menu_page').css('left')==$('html').css('width')){
			$('#head-menu_page').css('left','0');
		}else{
			$('#head-menu_page').css('left','100%');
		}
	});	
	
	/*메뉴 닫기버튼 -오른쪽*/
	$('#head-menu-close-right-button').click(function(){
		$('#head-menu_page').css('left','100%');
	});
	
	/*한글 단어단위로 끊어주는 메서드*/
	if($('#main_cont').length>0){
		$('.writting-item-head-inner-cont-head').children().wordBreakKeepAll();
		$('.writting-item-head-inner-cont-sub').children().wordBreakKeepAll();
		$('.book-item-head-inner-cont-top').children('strong').wordBreakKeepAll();
	}
	
});

$(window).on('load',function(){
	$('.head-page-sub-title').wordBreakKeepAll();
	$('.head-page-main-title').wordBreakKeepAll();
});

/*메뉴오픈 후 바깥 클릭시 닫힘*/
$(document).mouseup(function(e){	
	if($('#head-menu_page').has(e.target).length==0){
		$('#head-menu_page').css('left','100%');
	}
	/*바깥을 클릭하면 $('#menu_page).has(e.target)length가 0이됨*/
});



























