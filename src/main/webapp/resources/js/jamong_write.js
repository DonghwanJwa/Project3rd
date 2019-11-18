/**
 *  jamong_write.js
 */
var colorIndex = 0; // 상단부 배경색 인덱스
var shifted = false; // 쉬프트 누른지 여부
var selection = ""; // 드래그 텍스트 선택 저장용 변수 
var range = ""; // 드래그텍스트 레인지화

var arrowIndex1 = "true"; // 에디터 화살표 인덱스
var arrowIndex2 = "true"; // 에디터 화살표 인덱스
var toggleIndex3 = "true"; // 에디터 토글 인덱스
var toggleIndex4 = "true"; // 에디터 토글 인덱스

$(document).ready(function(){
	$(".write_cont_area").focus(); // 페이지 로딩시 본문으로 포커스이동
	$("#write_cont").on('mousedown mouseup keydown keyup',function(e){
		if(e.type === 'keydown'){
			shifted = e.shiftKey;
			return;
		}
		if(e.type === 'mousedown'){ // 마우스 클릭시 셀렉션 변수 비움
			$("#write_editor_wrap").css("display","none");
			selection.empty();
		}
		if(e.type === 'mouseup' || (e.keycode == 37 | 38 | 39 | 40)){ // 마우스가 올라가있거나 화살표 누를시
			selection = window.getSelection();
			viewSelect = selection.toString();
			if(viewSelect.replace(/(\s*)/g, "").length > 0){ // 선택된 텍스트가 있을때
				scrollSize = window.outerWidth-($('body').width())
				editorLeft = ($("#write_cont").width()/2)-350;				
				scrollTopLength = window.pageYOffset;
				range = selection.getRangeAt(0);
				rangeBottom = range.getBoundingClientRect().bottom;
				rangeTop = range.getBoundingClientRect().top;
				rangeRight = range.getBoundingClientRect().right;
				if($(document).height()  < (rangeBottom+scrollTopLength+260)){
					$("#write_editor_wrap").css("top",(rangeTop+scrollTopLength-50)+"px");
					$("#write_editor_wrap").css("left",editorLeft+"px");
					$("#write_editor_wrap").css("display","block");
					
					$(".write_font_dropdown_menu").css("bottom","44px");
					$(".write_fgcolor_dropdown_menu").css("bottom","44px");
					$(".write_bgcolor_dropdown_menu").css("bottom","44px");	
				}else{
					$("#write_editor_wrap").css("top",(rangeBottom+scrollTopLength+10)+"px");
					$("#write_editor_wrap").css("bottom","");
					$("#write_editor_wrap").css("left",editorLeft+"px");			
					$("#write_editor_wrap").css("display","block");
					
					$(".write_font_dropdown_menu").css("bottom","");
					$(".write_fgcolor_dropdown_menu").css("bottom","");
					$(".write_bgcolor_dropdown_menu").css("bottom","");
				}
			}else{ // 선택된 텍스트가 없을때
				$("#write_editor_wrap").css("display","none");
				if(!($("#write_editor_wrap").is(":visible"))){ // 에디터가 보이지않을때
					/* 에디터 변경값 초기화 */
					$("#write_font_choice_dropdown").css("display","none");
					$("#write_type_choice_dropdown").css("display","none");
					$("#write_fgcolor_change_cover").css("display","none");
					$("#write_bgcolor_change_cover").css("display","none");
					$(".write_title_type").removeClass("write_arrow_active");
					$(".write_font_type").removeClass("write_arrow_active");
					$("#write_editor_first").css("background-color","#FFFFFF");
					$("#write_editor_second").css("background-color","#FFFFFF");
					$("#write_editor_fgcolor").css("background-color","#FFFFFF");
					$("#write_editor_bgcolor").css("background-color","#FFFFFF");

					toggleIndex4 = "true";
					toggleIndex3 = "true";
					arrowIndex2 = "true";
					arrowIndex1 = "true";
				}// if				
			}// if else
		}
	})
	$("#write_title_align").click(function(){ // 타이틀정렬 버튼 클릭 시
		if($("#write_title_parent_center").is(":visible")){ // 타이틀이 중앙에 있을 때
			$("#write_title_parent_center").attr('id','write_title_parent_bottom');
			$("#write_title_center_icon").attr('id','write_title_bottom_icon');
			$("#write_title_center_bg").attr('id','write_title_bottom_bg');
		}else{ // 타이틀이 아래에 있을 때
			$("#write_title_parent_bottom").attr('id','write_title_parent_center');
			$("#write_title_bottom_icon").attr('id','write_title_center_icon');
			$("#write_title_bottom_bg").attr('id','write_title_center_bg');
		}
	});
	$("#write_title_background_icon").click(function(){ // 배경색 지정 버튼 클릭 시
		if($(".write_bg_title_option").is(":visible")){ // 배경색이 지정되어있지 않을 때
			$(".write_main_title").removeClass('write_bg_title_option');
			$(".write_sub_title").removeClass('write_bg_title_option');
			$("#write_title_area_bg").css('background-color','#FFF');
			$("#write_title_area_bg").css('height','250px');

			$("#write_background_change_btn").css('display','none');

			$("#write_title_coverimage_bg").attr('id','write_title_coverimage_icon');
			$("#write_title_background_bg").attr('id','write_title_background_icon');
			$("#write_title_center_bg").attr('id','write_title_center_icon');
			$("#write_title_bottom_bg").attr('id','write_title_bottom_icon');
			colorIndex=0;

		}else{ // 배경색이 지정되었을 때
			$(".write_main_title").addClass('write_bg_title_option');
			$(".write_sub_title").addClass('write_bg_title_option');
			$("#write_title_area_bg").css('background-color','#fbb9ba');
			$("#write_title_area_bg").css('height','450px');
			$("#write_title_area_bg").css('opaticy','1');

			$("#write_background_change_btn").css('display','block');

			$("#write_title_coverimage_icon").attr('id','write_title_coverimage_bg');
			$("#write_title_background_icon").attr('id','write_title_background_bg');
			$("#write_title_center_icon").attr('id','write_title_center_bg');
			$("#write_title_bottom_icon").attr('id','write_title_bottom_bg');
			colorIndex=1;
		}
	});
	$(".write_cont_align_icon").click(function(){ // 본문 정렬버튼 누를 시
		if($(".write_cont_align_icon_left").is(":visible")){ // 왼쪽정렬 아이콘이 보일 때
			$(".write_cont_align_icon").addClass('write_cont_align_icon_center');
			$(".write_cont_align_icon").removeClass('write_cont_align_icon_left');
			$(".write_cont_area").addClass('write_cont_align_center');
			$(".write_cont_area").removeClass('write_cont_align_left');
		}else if($(".write_cont_align_icon_center").is(":visible")){ // 중앙정렬 아이콘이 보일 때
			$(".write_cont_align_icon").addClass('write_cont_align_icon_justify');
			$(".write_cont_align_icon").removeClass('write_cont_align_icon_center');
			$(".write_cont_area").addClass('write_cont_align_justify');
			$(".write_cont_area").removeClass('write_cont_align_center');
		}else if($(".write_cont_align_icon_justify").is(":visible")){ // 양쪽정렬 아이콘이 보일 때
			$(".write_cont_align_icon").addClass('write_cont_align_icon_left');
			$(".write_cont_align_icon").removeClass('write_cont_align_icon_justify');
			$(".write_cont_area").addClass('write_cont_align_left');
			$(".write_cont_area").removeClass('write_cont_align_justify');
		}// if else if
	});
	$(".write_title_next_btn").click(function(){ // 배경색 지정 다음버튼 클릭 시
		if(colorIndex==0){
			$("#write_title_area_bg").css('background-color','#fbb9ba');
		}else if(colorIndex==1){
			$("#write_title_area_bg").css('background-color','#fdd3ba');
		}else if(colorIndex==2){
			$("#write_title_area_bg").css('background-color','#fcecb9');
		}else if(colorIndex==3){
			$("#write_title_area_bg").css('background-color','#c2fdb9');
		}else if(colorIndex==4){
			$("#write_title_area_bg").css('background-color','#b9e8fc');
		}else if(colorIndex==5){
			$("#write_title_area_bg").css('background-color','#c1bafd');
		}else if(colorIndex==6){
			$("#write_title_area_bg").css('background-color','#eebbfe');
		}else if(colorIndex==7){
			$("#write_title_area_bg").css('background-color','#cccccc');
		}else if(colorIndex==8){
			$("#write_title_area_bg").css('background-color','#bf9b74');
		}else if(colorIndex==9){
			$("#write_title_area_bg").css('background-color','#89b589');
			colorIndex=0;
		}
		colorIndex++;
	});
	$(".write_title_prev_btn").click(function(){ // 배경색 지정 이전버튼 클릭 시		
		if(colorIndex==0){ 
			$("#write_title_area_bg").css('background-color','#fbb9ba');
			colorIndex=9;
		}else if(colorIndex==1){
			$("#write_title_area_bg").css('background-color','#fdd3ba');
		}else if(colorIndex==2){
			$("#write_title_area_bg").css('background-color','#fcecb9');
		}else if(colorIndex==3){
			$("#write_title_area_bg").css('background-color','#c2fdb9');
		}else if(colorIndex==4){
			$("#write_title_area_bg").css('background-color','#b9e8fc');
		}else if(colorIndex==5){
			$("#write_title_area_bg").css('background-color','#c1bafd');
		}else if(colorIndex==6){
			$("#write_title_area_bg").css('background-color','#eebbfe');
		}else if(colorIndex==7){
			$("#write_title_area_bg").css('background-color','#cccccc');
		}else if(colorIndex==8){
			$("#write_title_area_bg").css('background-color','#bf9b74');
		}else if(colorIndex==9){
			$("#write_title_area_bg").css('background-color','#89b589');
		}
		colorIndex--;
	});
	$(".write_choice_close_btn").click(function(){
		$(".write_choice_wrap").css("display","none");
	});
	$(".write_choice_wrap").click(function(e){ // 영역 클릭시
		if($(".write_choice_wrap").is(e.target)){ // 영역 밖 클릭시
			$(".write_choice_wrap").css("display","none");	
		}
	});
	$("#write_editor_first").click(function(){ // 서체 지정 드롭다운 메뉴 클릭시
		if(arrowIndex1 == "false"){ // 활성화가 되어있는 상태 ( 눌려져있는 상태 )
			$(".write_font_type").removeClass("write_arrow_active");
			$("#write_font_choice_dropdown").css("display","none");
			$("#write_editor_first").css("background-color","#FFFFFF");
			arrowIndex1 = "true";
		}else if(arrowIndex1 == "true"){ // 활성화가 되어있지 않은 상태 ( 눌려져있지 않은 상태 )
			$(".write_font_type").addClass("write_arrow_active");
			$("#write_editor_first").css("background-color","#FFF8F8");
			// 드롭다운 메뉴 활성 / 비활성화
			$("#write_font_choice_dropdown").css("display","block");
			$("#write_type_choice_dropdown").css("display","none");
			$("#write_fgcolor_change_cover").css("display","none");
			$("#write_bgcolor_change_cover").css("display","none");
			// 토글구현
			$(".write_title_type").removeClass("write_arrow_active");
			$("#write_editor_second").css("background-color","#FFFFFF");
			$("#write_editor_fgcolor").css("background-color","#FFFFFF");
			$("#write_editor_bgcolor").css("background-color","#FFFFFF");

			arrowIndex1 = "false";
			arrowIndex2 = "true";
			toggleIndex3 = "true";
			togglendex4 = "true";
		}// 클릭 선택용 인덱스
	});
	$("#write_editor_second").click(function(){ // 글타입 지정 드롭다운 메뉴 클릭시
		if(arrowIndex2 == "false"){ // 활성화가 되어있는 상태 ( 눌려져있는 상태 )
			$(".write_title_type").removeClass("write_arrow_active");
			$("#write_type_choice_dropdown").css("display","none");
			$("#write_editor_second").css("background-color","#FFFFFF");
			arrowIndex2 = "true";
		}else if(arrowIndex2 == "true"){ // 활성화가 되어있지 않은 상태 ( 눌려져있지 않은 상태 )		
			$(".write_title_type").addClass("write_arrow_active");
			$("#write_editor_second").css("background-color","#FFF8F8");
			// 드롭다운 메뉴 활성 / 비활성화
			$("#write_font_choice_dropdown").css("display","none");
			$("#write_type_choice_dropdown").css("display","block");
			$("#write_fgcolor_change_cover").css("display","none");
			$("#write_bgcolor_change_cover").css("display","none");
			// 토글구현
			$(".write_font_type").removeClass("write_arrow_active");
			$("#write_editor_first").css("background-color","#FFFFFF");
			$("#write_editor_fgcolor").css("background-color","#FFFFFF");
			$("#write_editor_bgcolor").css("background-color","#FFFFFF");

			arrowIndex2 = "false";
			arrowIndex1 = "true";
			toggleIndex3 = "true";
			togglendex4 = "true";

		}// 클릭 선택용 인덱스
	});
	$("#write_editor_fgcolor").click(function(){ // 
		if(toggleIndex3 == "false"){ // 활성화가 되어있는 상태 ( 눌려져있는 상태 )
			$("#write_editor_fgcolor").css("background-color","#FFFFFF");			
			$("#write_fgcolor_change_cover").css("display","none");
			$(".write_fgcolor_dropdown_menu").css("display","none");
			toggleIndex3 = "true";
		}else if(toggleIndex3 == "true"){ // 활성화가 되어있찌 않은 상태 ( 눌려있지 않은 상태 )
			$("#write_editor_fgcolor").css("background-color","#FFF8F8");
			// 드롭다운 메뉴 활성 / 비활성화
			$("#write_font_choice_dropdown").css("display","none");
			$("#write_type_choice_dropdown").css("display","none");
			$("#write_fgcolor_change_cover").css("display","block");
			$(".write_fgcolor_dropdown_menu").css("display","block");
			$("#write_bgcolor_change_cover").css("display","none");
			// 토글구현
			$(".write_title_type").removeClass("write_arrow_active");
			$(".write_font_type").removeClass("write_arrow_active");
			$("#write_editor_first").css("background-color","#FFFFFF");
			$("#write_editor_second").css("background-color","#FFFFFF");
			$("#write_editor_bgcolor").css("background-color","#FFFFFF");

			toggleIndex3 = "false";
			arrowIndex2 = "true";
			arrowIndex1 = "true";
			togglendex4 = "true";
		}// 클릭 선택용 인덱스
	});
	$("#write_editor_bgcolor").click(function(){
		if(toggleIndex4 == "false"){ // 활성화가 되어있는 상태 ( 눌려져있는 상태 )
			$("#write_editor_bgcolor").css("background-color","#FFFFFF");
			$("#write_bgcolor_change_cover").css("display","none");
			$(".write_bgcolor_dropdown_menu").css("display","none");
			toggleIndex4 = "true";
		}else if(toggleIndex4 == "true"){ // 활성화가 되어있지 않은 상태 ( 눌려져있지 않은 상태 )
			$("#write_editor_bgcolor").css("background-color","#FFF8F8");
			// 드롭다운 메뉴 활성 / 비활성화
			$("#write_font_choice_dropdown").css("display","none");
			$("#write_type_choice_dropdown").css("display","none");
			$("#write_fgcolor_change_cover").css("display","none");
			$(".write_fgcolor_dropdown_menu").css("display","none");
			$("#write_bgcolor_change_cover").css("display","block");
			$(".write_bgcolor_dropdown_menu").css("display","block");
			// 토글구현
			$(".write_title_type").removeClass("write_arrow_active");
			$(".write_font_type").removeClass("write_arrow_active");
			$("#write_editor_first").css("background-color","#FFFFFF");
			$("#write_editor_second").css("background-color","#FFFFFF");
			$("#write_editor_fgcolor").css("background-color","#FFFFFF");

			toggleIndex4 = "false";
			toggleIndex3 = "true";
			arrowIndex2 = "true";
			arrowIndex1 = "true";
		}// 클릭 선택용 인덱스
	});
	// 서체변경 클릭 이벤트
	$(".write_Nanum_Gothic").click(function(){ // 나눔고딕체
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_NanumGothic_span";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_NanumGothic_span").css("font-family","NanumGothic");
		
		$(".write_before_text").addClass('write_Nanum_Gothic');
		$(".write_before_text").removeClass('write_Nanum_Myengjo');
		$(".write_before_text").removeClass('write_Nanum_BaruenGothic');
		$(".write_before_text").removeClass('write_Nanum_Handfont');
		$(".write_before_text").removeClass('write_Nanum_SquareRound');
		$(".write_before_text").removeClass('write_Georgia');

		$(".write_font_type").removeClass("write_arrow_active");
		$("#write_font_choice_dropdown").css("display","none");
		$("#write_editor_first").css("background-color","#FFFFFF");
		arrowIndex1 = "true";
	});
	$(".write_Nanum_Myengjo").click(function(){ // 나눔 명조체
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_NanumMyengjo_span";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_NanumMyengjo_span").css("font-family","NanumMyengjo");
		
		$(".write_before_text").addClass('write_Nanum_Myengjo');
		$(".write_before_text").removeClass('write_Nanum_Gothic');
		$(".write_before_text").removeClass('write_Nanum_BaruenGothic');
		$(".write_before_text").removeClass('write_Nanum_Handfont');
		$(".write_before_text").removeClass('write_Nanum_SquareRound');
		$(".write_before_text").removeClass('write_Georgia');

		$(".write_font_type").removeClass("write_arrow_active");
		$("#write_font_choice_dropdown").css("display","none");
		$("#write_editor_first").css("background-color","#FFFFFF");
		arrowIndex1 = "true";
	});
	$(".write_Nanum_BarunGothic").click(function(){ // 나눔 바른고딕체
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_NanumBarunGothic_span";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_NanumBarunGothic_span").css("font-family","NanumBarunGothic")
		
		$(".write_before_text").addClass('write_Nanum_BaruenGothic');
		$(".write_before_text").removeClass('write_Nanum_Myengjo');
		$(".write_before_text").removeClass('write_Nanum_Gothic');
		$(".write_before_text").removeClass('write_Nanum_Handfont');
		$(".write_before_text").removeClass('write_Nanum_SquareRound');
		$(".write_before_text").removeClass('write_Georgia');

		$(".write_font_type").removeClass("write_arrow_active");
		$("#write_font_choice_dropdown").css("display","none");
		$("#write_editor_first").css("background-color","#FFFFFF");
		arrowIndex1 = "true";
	});
	$(".write_Nanum_Handfont").click(function(){ // 나눔 손글씨 펜체		
		var spanNode = document.createElement('span');
		spanNode.className = "write_NanumHandfont_span";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_NanumHandfont_span").css("font-family","NanumPen")
		
		$(".write_before_text").addClass('write_Nanum_Handfont');
		$(".write_before_text").removeClass('write_Nanum_Myengjo');
		$(".write_before_text").removeClass('write_Nanum_BaruenGothic');
		$(".write_before_text").removeClass('write_Nanum_Gothic');
		$(".write_before_text").removeClass('write_Nanum_SquareRound');
		$(".write_before_text").removeClass('write_Georgia');

		$(".write_font_type").removeClass("write_arrow_active");
		$("#write_font_choice_dropdown").css("display","none");
		$("#write_editor_first").css("background-color","#FFFFFF");
		arrowIndex1 = "true";
	});
	$(".write_Nanum_SquareRound").click(function(){ // 스퀘어라운드 폰트
		var spanNode = document.createElement('span');
		spanNode.className = "write_NanumSquareRound_span";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_NanumSquareRound_span").css("font-family","NanumSquareRound")
		
		$(".write_before_text").addClass('write_Nanum_SquareRound');
		$(".write_before_text").removeClass('write_Nanum_Myengjo');
		$(".write_before_text").removeClass('write_Nanum_BaruenGothic');
		$(".write_before_text").removeClass('write_Nanum_Handfont');
		$(".write_before_text").removeClass('write_Nanum_Gothic');
		$(".write_before_text").removeClass('write_Georgia');

		$(".write_font_type").removeClass("write_arrow_active");
		$("#write_font_choice_dropdown").css("display","none");
		$("#write_editor_first").css("background-color","#FFFFFF");
		arrowIndex1 = "true";
	});
	$(".write_Georgia").click(function(){ // 조지아 폰트
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_Georgia_span";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_Georgia_span").css("font-family","Georgia");
		
		$(".write_before_text").addClass('write_Georgia');
		$(".write_before_text").removeClass('write_Nanum_Myengjo');
		$(".write_before_text").removeClass('write_Nanum_BaruenGothic');
		$(".write_before_text").removeClass('write_Nanum_Handfont');
		$(".write_before_text").removeClass('write_Nanum_Gothic');
		$(".write_before_text").removeClass('write_Nanum_SquareRound');

		$(".write_font_type").removeClass("write_arrow_active");
		$("#write_font_choice_dropdown").css("display","none");
		$("#write_editor_first").css("background-color","#FFFFFF");
		arrowIndex1 = "true";
	});
	/* 글자색 변경 클릭이벤트부 */
	$(".write_fgchip_1").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_foreground_white";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_foreground_white").css("color","#FFFFFF");
		$(".write_edit_fgcolor_btn").css("background-color","#FFFFFF");
	});
	$(".write_fgchip_2").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_foreground_gray";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_foreground_gray").css("color","#959595");
		$(".write_edit_fgcolor_btn").css("background-color","#959595");
	});
	$(".write_fgchip_3").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_foreground_black";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_foreground_black").css("color","#333333");
		$(".write_edit_fgcolor_btn").css("background-color","#333333");
	});
	$(".write_fgchip_4").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_foreground_yellow";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_foreground_yellow").css("color","#F4C216");
		$(".write_edit_fgcolor_btn").css("background-color","#F4C216");
	});
	$(".write_fgchip_5").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_foreground_green";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_foreground_green").css("color","#16B06D");
		$(".write_edit_fgcolor_btn").css("background-color","#16B06D");
	});
	$(".write_fgchip_6").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_foreground_orange";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_foreground_orange").css("color","#F6665B");
		$(".write_edit_fgcolor_btn").css("background-color","#F6665B");
	});
	$(".write_fgchip_7").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_foreground_skyblue";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_foreground_skyblue").css("color","#00C3BD");
		$(".write_edit_fgcolor_btn").css("background-color","#00C3BD");
	});
	$(".write_fgchip_8").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_foreground_red";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_foreground_red").css("color","#EC4C6A");
		$(".write_edit_fgcolor_btn").css("background-color","#EC4C6A");
	});
	$(".write_fgchip_9").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_foreground_blue";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_foreground_blue").css("color","#2E84B6");
		$(".write_edit_fgcolor_btn").css("background-color","#2E8486");
	});
	$(".write_fgchip_10").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_foreground_puple";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_foreground_puple").css("color","#5C5CB2");
		$(".write_edit_fgcolor_btn").css("background-color","#5C5CB2");
	});
	// 배경색 변경부
	$(".write_bgchip_1").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_background_white";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_background_white").css("background-color","#FFFFFF");
		$(".write_edit_bgcolor_btn").css("background-color","#FFFFFF");
	});
	$(".write_bgchip_2").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_background_gray";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_background_gray").css("background-color","#959595");
		$(".write_edit_bgcolor_btn").css("background-color","#959595");
	});
	$(".write_bgchip_3").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_background_black";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_background_black").css("background-color","#333333");
		$(".write_edit_bgcolor_btn").css("background-color","#333333");
	});
	$(".write_bgchip_4").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_background_yellow";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_background_yellow").css("background-color","#F4C216");
		$(".write_edit_bgcolor_btn").css("background-color","#F4C216");
	});
	$(".write_bgchip_5").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_background_green";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_background_green").css("background-color","#16B06D");
		$(".write_edit_bgcolor_btn").css("background-color","#16B06D");
	});
	$(".write_bgchip_6").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_background_orange";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_background_orange").css("background-color","#F6665B");
		$(".write_edit_bgcolor_btn").css("background-color","#F6665B");
	});
	$(".write_bgchip_7").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_background_skyblue";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_background_skyblue").css("background-color","#00C3BD");
		$(".write_edit_bgcolor_btn").css("background-color","#00C3BD");
	});
	$(".write_bgchip_8").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_background_red";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_background_red").css("background-color","#EC4C6A");
		$(".write_edit_bgcolor_btn").css("background-color","#EC4C6A");
	});
	$(".write_bgchip_9").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_background_blue";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_background_blue").css("background-color","#2E84B6");
		$(".write_edit_bgcolor_btn").css("background-color","#2E84B6");
	});
	$(".write_bgchip_10").click(function(){
		var spanNode = document.createElement('span'); // span 태그를 가진 노드 생성
		spanNode.className = "write_background_puple";
		spanNode.innerText = range;
		
		range.deleteContents();
		range.insertNode(spanNode);
		
		$(".write_background_puple").css("background-color","#5C5CB2");
		$(".write_edit_bgcolor_btn").css("background-color","#5C5CB2");
	});
	
	$(".write_main_title").keyup(function(e){ // 메인타이틀에 키 이벤트 입력
		if(e.keyCode == '8'){ // 백스페이스 버튼 뗄 때
			if($.trim($(".write_main_title").val())==""){
				$(".write_main_title br").remove();
			}// if
		}// if
	});
	$(".write_main_title").keyup(function(e){ // 메인타이틀에 키 이벤트 입력
		if(e.keyCode == '8'){ // 백스페이스 버튼 뗄 때
			if($.trim($(".write_main_title").val())==""){
				$(".write_main_title br").remove();
			}// if
		}// if
	});
	$(".write_cont_area").keydown(function(e){ // 키를 눌렀을 때 이벤트
		if(e.keyCode == '13'){ // 엔터버튼을 눌렀을 때
			$(document).scrollTop($(document).height());
		}else if(e.keyCode == '8'){
			if(($(".write_cont_area p:first-child").text() == "" && $(".write_cont_area p").length == 1)){
				return false;
			}// if
		}
	});
	$(window).scroll(function(){ // 스크롤 이벤트 입력
		if($(document).scrollTop() > 350){ // 스크롤위치가 350보다 클 때
			$(".write_cont_icon").addClass('fixed');
		}else {
			$(".write_cont_icon").removeClass('fixed');
		}
	});
});
function writeCheck(){ // 저장버튼 클릭시 작성체크
	if($.trim($(".write_main_title").text())==""){
		$(".write_title_error").addClass('write_top_error');
		$(".write_cont_save").attr("disabled",true);
		setTimeout(function(){
			$(".write_title_error").removeClass('write_top_error');
			$(".write_cont_save").attr("disabled",false);
		},3000);
		$(".write_main_title").text("").focus();
		return false;
	}// if
	if($.trim($(".write_cont_area").text())==""){
		$(".write_cont_error").addClass('write_top_error');
		$(".write_cont_save").attr("disabled",true);
		setTimeout(function(){
			$(".write_cont_error").removeClass('write_top_error');
			$(".write_cont_save").attr("disabled",false);
		},3000);
		$(".write_cont_area").text("").focus();
		return false;
	}// if
	var screenWidth = $(document).width();
	var screenHeight = $(document).height();

	$(".write_choice_wrap").css({'width':screenWidth,'height':screenHeight});
	$(".write_choice_wrap").css("display","inline-block");
}
