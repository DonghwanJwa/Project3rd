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
	$(".item_work").on("click",function(e){
		var book_no=$(e.target).closest("li").attr("data-no");
		$.ajax({
			type:"post",
			url:"book_inner_info",
			dataType:"json",
			data:{//서버로 보낼 데이터
				"book_no":book_no
			},
			success:function(data){//ajax 성공 시 실행
				var str="";
				if(data!=""){
					$(data).each(function(){
						str += 	"<div class='new_book_inner_info'>"
							+  	"<div class='new_book'>"
							+	"<div class='new_book'>"
							+	"<div class='new_book_title'>"
							+	"<h3 class='title_book'>안 느끼한 산문집</h3>"
							+	"</div>"
							+	"<div class='new_book_desc'>"
							+	"<div class='new_book_desc_buy'>"
							+	"<p class='new_book_description'>"
							+	"그림을 그려보고 싶은데 어디서부터 어떻게 시작해야 할지 막막한 초보자를 위한 가이드북입니다."
							+	"힘 들이지 않고, 못 그려도 즐겁게, '야매스케치' 마음가짐으로 오늘부터 그림! 같이 시작해봐요."
							+	"</p>"
							+	"<a href='#' target='_blank' class='#buybook'>"
							+	"<button class='btn_buy_book'>책 구경하기</button>"
							+	"</a>"
							+	"</div>"
							+	"<a href='#' target='_blank' class='#buybook'>"
							+	"<div class='new_book_image' style='background-image:url(/jamong.com/resources/img/book_img.jpg)'>"
							+	"<div class='border_left'></div>"
							+	"</div>"
							+	"</a>"
							+	"<div class='new_book_share_sentence'>"
							+	"<div class='new_book_share'></div>"
							+	"<div class='new_book_sentence' style='background-image:url(/jamong.com/resources/img/background_img/adm_back.jpg)'>"
							+	"<p class='layer_dimmed'></p>"
							+	"<img src='/jamong.com/resources/img/quotation.png' class='quotation'>"
							+	"<p class='new_book_text_sentence'>뭐, 어차피 취미일 뿐인데 좀 못 그리면 어때?</p>"
							+	"<p class='ment_sentence'>작가가 사랑한 한 문장</p>"
							+	"</div>"
							+	"</div>"
							+	"</div>"
							+	"</div>"
							+	"<a href='./profile' target='_blank'>"
							+	"<div class='new_book_author'>"
							+	"<div class='new_book_user_image' style='background-image: url(/jamong.com/resources/img/cat_writer_face2.jpg)'></div>"
							+	"<div class='new_book_user_name'>콧수염 아저씨</div>"
							+	"<span class='publisher_book'>먼진 아재들</span>"
							+	"<div class='new_book_user_description'>"
							+	"콧수염이 매력적인 작가, 콧수염 아저씨입니다. IT업계에서 UX디자이너로 일합니다. 취미로 사부작 사부작 그림을 그리고 글을 씁니다. 초보 헬창으로 매일 운동하며 삽니다."
							+	"</div>"
							+	"<div class='new_book_user_follow'>작가 구독하기</div>"
							+	"</div>"
							+	"</a>"
							+	"</div>"
					});//each
					$(".new_book_info").after(str);
				}//data가 null이 아닐 때
			}//success
		});//ajax
		
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
		if($(".slide_work_list").css("margin-left") == "0px"){
			$(".prev").removeClass("on");
		}else{
			$(".prev").addClass("on");
		}
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