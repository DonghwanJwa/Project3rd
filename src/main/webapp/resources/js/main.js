/*
 * index.jsp
 */
getCategory();//js페이지가 로딩되면 메뉴에 카테고리를 불러옴(중단에 메서드 있음)

function scrollmove(whereScroll,howMove){
	/*스크롤움직임 버튼 ( 어느div인지,	어느쪽으로 움직이는지)*/
	scrollAmount = 0; /*움직인 스크롤 길이를 저장할 변수*/
	var container = document.getElementById(whereScroll);
	/*스크롤이 작용하는 div를 변수로 저장*/

	var scrollMove = container.scrollWidth/10;	
	/**/
	var slideTimer = setInterval(function(){		/*setInterval(함수,시간) : 쓰레드 기능과 같음 */
		if(howMove=='slideleft'){					/* 						해당함수를 기입한 시간간격으로 반복*/
			container.scrollLeft -= scrollMove/100;	/*버튼한번클릭하여 움직이는 길이/10*/
			/*div.scrollLeft : 해당 div의 왼쪽기준으로 화면에서 넘어간 너비를 알려줌(초기값 0)*/
		}else{
			container.scrollLeft += scrollMove/100;
		}
		scrollAmount += scrollMove/100;			/*움직이는 거리를 측정*/
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
	}, 1);
}

/*메뉴바 Best,Hot 페이징버튼*/
function hotscroll(where,number){
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
}

function getCategory(){
	  $.getJSON("/jamong.com/category_load/",function(data){
		  var str="";
		  $(data).each(function(){//each는 jQuery에서 반복함수
			  str+='<li class="head-page-category-item">'
			  +'<a href="./category?directory=articles">'+this.cat_name+'</a>'
			  +'<input type="hidden" value="'+this.cat_no+'"/>'
			  +'</li>'
		  });
		  if ($("#head-page-category-list").length > 0 ) {	//header가 존재하면
			  $('#head-page-category-list').html(str);	//ul내부에 each내용을 넣어준다
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
				location.href = "./search?result=post"
				$('#head-menu_search-text').val('');
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
				location.href = "./search"
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
	
});

/*메뉴오픈 후 바깥 클릭시 닫힘*/
$(document).mouseup(function(e){	
	if($('#head-menu_page').has(e.target).length==0){
		$('#head-menu_page').css('left','100%');
	}
	/*바깥을 클릭하면 $('#menu_page).has(e.target)length가 0이됨*/
});



























