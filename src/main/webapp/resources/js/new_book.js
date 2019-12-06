/**
 * 
 */
$(document).ready(function() {

	$(".page_no").click(function(event) {
		
		//배너 변경동안 버튼 비 활성화
		$(".page_no").attr("disabled",true);
		setTimeout(function() {
			$(".page_no").attr("disabled",false);
		},1300);
		
		//page1 버튼 눌렀을 때
		if ($(event.target).hasClass("page1")) {
			//2번째 배너가 보여져 있는 경우
			if($("#new_book_banner_item2").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page1").addClass("showing");
				$(".page2").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item1").addClass("showing");
				$("#new_book_banner_item2").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item1").animate({top:"0px"},500);
				$("#new_book_banner_item2").animate({top:"400px"},500);
			};
			//3번째 배너가 보여져 있는 경우
			if($("#new_book_banner_item3").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page1").addClass("showing");
				$(".page3").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item1").addClass("showing");
				$("#new_book_banner_item3").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item1").animate({top:"0px"},500);
				$("#new_book_banner_item2").css("top","400px");
				$("#new_book_banner_item3").animate({top:"400px"},500);
			};
			//4번째 배너가 보여져 있는 경우
			if($("#new_book_banner_item4").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page1").addClass("showing");
				$(".page4").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item1").addClass("showing");
				$("#new_book_banner_item4").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item1").animate({top:"0px"},500);
				$("#new_book_banner_item2").css("top","400px");
				$("#new_book_banner_item3").css("top","400px");
				$("#new_book_banner_item4").animate({top:"400px"},500);
			};
			//5번째 배너가 보여져 있는 경우
			if($("#new_book_banner_item5").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page1").addClass("showing");
				$(".page5").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item1").addClass("showing");
				$("#new_book_banner_item5").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item1").animate({top:"0px"},500);
				$("#new_book_banner_item2").css("top","400px");
				$("#new_book_banner_item3").css("top","400px");
				$("#new_book_banner_item4").css("top","400px");
				$("#new_book_banner_item5").animate({top:"400px"},500);
			};
		};
		
		//page2 버튼 눌렀을 때
		if ($(event.target).hasClass("page2")) {
			//1번째 배너가 보이는 경우
			if($("#new_book_banner_item1").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page2").addClass("showing");
				$(".page1").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item2").addClass("showing");
				$("#new_book_banner_item1").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item1").animate({top:"-400px"},500);
				$("#new_book_banner_item2").animate({top:"0px"},500);
			};
			//3번째 배너가 보이는 경우
			if($("#new_book_banner_item3").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page2").addClass("showing");
				$(".page3").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item2").addClass("showing");
				$("#new_book_banner_item3").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item1").css("top","-400px");
				$("#new_book_banner_item2").animate({top:"0px"},500);
				$("#new_book_banner_item3").animate({top:"400px"},500);
			};
			//4번째 배너가 보이는 경우
			if($("#new_book_banner_item4").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page2").addClass("showing");
				$(".page4").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item2").addClass("showing");
				$("#new_book_banner_item4").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item1").css("top","-400px");
				$("#new_book_banner_item2").animate({top:"0px"},500);
				$("#new_book_banner_item3").css("top","400px");
				$("#new_book_banner_item4").animate({top:"400px"},500);
			};
			//5번째 배너가 보이는 경우
			if($("#new_book_banner_item5").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page2").addClass("showing");
				$(".page5").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item2").addClass("showing");
				$("#new_book_banner_item5").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item1").css("top","-400px");
				$("#new_book_banner_item2").animate({top:"0px"},500);
				$("#new_book_banner_item3").css("top","400px");
				$("#new_book_banner_item4").css("top","400px");
				$("#new_book_banner_item5").animate({top:"400px"},500);
			};
		};
		
		//page3 버튼 눌렀을 때
		if ($(event.target).hasClass("page3")) {
			//1번째 배너가 보이는 경우
			if($("#new_book_banner_item1").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page3").addClass("showing");
				$(".page1").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item3").addClass("showing");
				$("#new_book_banner_item1").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item1").animate({top:"-400px"},500);
				$("#new_book_banner_item2").css("top","-400px");
				$("#new_book_banner_item3").animate({top:"0px"},500);
			};
			//2번째 배너가 보이는 경우
			if($("#new_book_banner_item2").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page3").addClass("showing");
				$(".page2").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item3").addClass("showing");
				$("#new_book_banner_item2").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item2").animate({top:"-400px"},500);
				$("#new_book_banner_item3").animate({top:"0px"},500);
			};
			//4번째 배너가 보이는 경우
			if($("#new_book_banner_item4").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page3").addClass("showing");
				$(".page4").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item3").addClass("showing");
				$("#new_book_banner_item4").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item3").animate({top:"0px"},500);
				$("#new_book_banner_item4").animate({top:"400px"},500);
			};
			//5번째 배너가 보이는 경우
			if($("#new_book_banner_item5").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page3").addClass("showing");
				$(".page5").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item3").addClass("showing");
				$("#new_book_banner_item5").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item3").animate({top:"0px"},500);
				$("#new_book_banner_item4").css("top","400px");
				$("#new_book_banner_item5").animate({top:"400px"},500);
			};
		};
		
		//page4 버튼 눌렀을 때
		if ($(event.target).hasClass("page4")) {
			//1번째 배너가 보이는 경우
			if($("#new_book_banner_item1").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page4").addClass("showing");
				$(".page1").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item4").addClass("showing");
				$("#new_book_banner_item1").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item1").animate({top:"-400px"},500);
				$("#new_book_banner_item2").css("top","-400px");
				$("#new_book_banner_item3").css("top","-400px");
				$("#new_book_banner_item4").animate({top:"0px"},500);
			};
			//2번째 배너가 보이는 경우
			if($("#new_book_banner_item2").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page4").addClass("showing");
				$(".page2").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item4").addClass("showing");
				$("#new_book_banner_item2").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item2").animate({top:"-400px"},500);
				$("#new_book_banner_item3").css("top","-400px");
				$("#new_book_banner_item4").animate({top:"0px"},500);
			};
			//3번째 배너가 보이는 경우
			if($("#new_book_banner_item3").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page4").addClass("showing");
				$(".page3").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item4").addClass("showing");
				$("#new_book_banner_item3").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item3").animate({top:"-400px"},500);
				$("#new_book_banner_item4").animate({top:"0px"},500);
			};
			//5번째 배너가 보이는 경우
			if($("#new_book_banner_item5").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page4").addClass("showing");
				$(".page5").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item4").addClass("showing");
				$("#new_book_banner_item5").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item4").animate({top:"0px"},500);
				$("#new_book_banner_item5").animate({top:"400px"},500);
			};
		};
		
		//page5 버튼 눌렀을 때
		if ($(event.target).hasClass("page5")) {
			//1번째 배너가 보이는 경우
			if($("#new_book_banner_item1").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page5").addClass("showing");
				$(".page1").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item5").addClass("showing");
				$("#new_book_banner_item1").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item1").animate({top:"-400px"},500);
				$("#new_book_banner_item2").css("top","-400px");
				$("#new_book_banner_item3").css("top","-400px");
				$("#new_book_banner_item4").css("top","-400px");
				$("#new_book_banner_item5").animate({top:"0px"},500);
			};
			//2번째 배너가 보이는 경우
			if($("#new_book_banner_item2").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page5").addClass("showing");
				$(".page2").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item5").addClass("showing");
				$("#new_book_banner_item2").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item2").animate({top:"-400px"},500);
				$("#new_book_banner_item3").css("top","-400px");
				$("#new_book_banner_item4").css("top","-400px");
				$("#new_book_banner_item5").animate({top:"0px"},500);
			};
			//3번째 배너가 보이는 경우
			if($("#new_book_banner_item3").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page5").addClass("showing");
				$(".page3").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item5").addClass("showing");
				$("#new_book_banner_item3").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item3").animate({top:"-400px"},500);
				$("#new_book_banner_item4").css("top","-400px");
				$("#new_book_banner_item5").animate({top:"0px"},500);
			};
			//4번째 배너가 보이는 경우
			if($("#new_book_banner_item4").css("top")=="0px"){
				/* 버튼 효과 */
				$(".page5").addClass("showing");
				$(".page4").removeClass("showing");
				
				/* 배너 보임 */
				$("#new_book_banner_item5").addClass("showing");
				$("#new_book_banner_item4").removeClass("showing");
				
				/* 배너 넘기는 효과 */
				$("#new_book_banner_item4").animate({top:"-400px"},500);
				$("#new_book_banner_item5").animate({top:"0px"},500);
			};
		};
	});

	/* 최신 책 정렬 */
	
	//전체 선택
	$("#all").click(function() {
		$("#all").addClass("visible");
		$("#column").removeClass("visible");
		$("#essay").removeClass("visible");
	});
	//컬럼 선택
	$("#column").click(function() {
		$("#column").addClass("visible");
		$("#all").removeClass("visible");
		$("#essay").removeClass("visible");
	});
	//에세이 선택
	$("#essay").click(function() {
		$("#essay").addClass("visible");
		$("#all").removeClass("visible");
		$("#column").removeClass("visible");
	});


	/* 책 상세 띄우기 */
	$(".item_work").click(function(){
		$(".item_work").removeClass("open");
		$(this).addClass("open");
		$(".new_book_info").addClass("open");
		var offset=$(".open_marker").offset();
		$("html, body").animate({scrollTop : offset.top},500);
	});
	
	/* 책 리스트 슬라이드 */
	$(".next").click(function(){
		$(".next").attr("disabled",true);
		setTimeout(function() {
			$(".next").attr("disabled",false);
		},500);
		var now = parseInt($(".slide_work_list").css("margin-left").replace("px",""));
		var sum = now-500;
		$(".slide_work_list").css("margin-left",sum+"px");
	});
	$(".prev").click(function(){
		$(".prev").attr("disabled",true);
		setTimeout(function() {
			$(".prev").attr("disabled",false);
		},500);
		var now = parseInt($(".slide_work_list").css("margin-left").replace("px",""));
		var sum = now+500;
		$(".slide_work_list").css("margin-left",sum+"px");
	});
});