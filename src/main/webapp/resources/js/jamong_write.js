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
var sel_file; // 이미지 미리보기 변수
var category_count = 0;

getCategorySelect();//카테고리선택란에 카테고리 넣기(하단에 메서드 존재)


$(document).ready(function(){
	$(".write_cont_area").summernote({
		toolbar:[
			['style', ['style']],
			['style', ['bold', 'italic', 'underline',]],
			['font', ['strikethrough',]],
			['fontname',['fontname']],
			['fontsize', ['fontsize']],
			['color', ['color']],
			['height', ['height']],
			['insert', ['link', 'picture', 'video', 'hr']],
			['para', ['ul', 'ol', 'paragraph']],
			],
			height:650,
			lang: 'ko-KR',
			disableResizeEditor:true,
			focus:true,
			fontNames:['NanumGothic','NanumMyeongjo','NanumSquareRound','NanumBarunGothic','NanumPen'],
			fontNamesIgnoreCheck:[
				'Arial'
				],
				callbacks: {
				onImageUpload: function(files, editor, welEditable){
					for(var i=files.length-1; i>=0; i--){
						sendFile(files[i], this);
					}
				}
			}
	});
	$("#write_title_align").click(function(){ // 타이틀정렬 버튼 클릭 시
		if($("#write_title_parent_center").is(":visible")){ // 타이틀이 중앙에 있을 때
			$("#write_title_parent_center").attr('id','write_title_parent_bottom');
			$("#write_title_center_icon").attr('id','write_title_bottom_icon');
			$("#write_title_center_bg").attr('id','write_title_bottom_bg');
			$("#bo_titlespace").val("1");
		}else{ // 타이틀이 아래에 있을 때
			$("#write_title_parent_bottom").attr('id','write_title_parent_center');
			$("#write_title_bottom_icon").attr('id','write_title_center_icon');
			$("#write_title_bottom_bg").attr('id','write_title_center_bg');
			$("#bo_titlespace").val("0");
		}
	});
	$("#write_title_background_icon").click(function(){ // 배경색 지정 버튼 클릭 시
		if($(".write_bg_title_option").is(":visible")){ // 배경색이 지정되어있지 않을 때
			$(".write_main_title").removeClass('write_bg_title_option');
			$(".write_sub_title").removeClass('write_bg_title_option');
			$("#write_title_area_bg").css('background-color','#FFF');
			$("#write_title_area_bg").css('height','250px');

			$("#bo_color").val("");
			$("#write_background_change_btn").css('display','none');

			$("#write_title_coverimage_bg").attr('id','write_cover_file');
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
			
			$("#bo_color").val("#FBB9BA");
			$("#write_background_change_btn").css('display','block');

			$("#write_cover_file").attr('id','write_title_coverimage_bg');
			$("#write_title_background_icon").attr('id','write_title_background_bg');
			$("#write_title_center_icon").attr('id','write_title_center_bg');
			$("#write_title_bottom_icon").attr('id','write_title_bottom_bg');
			colorIndex=2;
		}
	});
	$("#write_title_background_bg").click(function(){ // 배경색 지정 버튼 클릭 시
		if($(".write_bg_title_option").is(":visible")){ // 배경색이 지정되어있지 않을 때
			$(".write_main_title").removeClass('write_bg_title_option');
			$(".write_sub_title").removeClass('write_bg_title_option');
			$("#write_title_area_bg").css('background-color','#FFF');
			$("#write_title_area_bg").css('height','250px');
			
			$("#bo_color").val("");
			$("#write_background_change_btn").css('display','none');
			
			$("#write_title_coverimage_bg").attr('id','write_cover_file');
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
			
			$("#bo_color").val("#FBB9BA");
			$("#write_background_change_btn").css('display','block');
			
			$("#write_cover_file").attr('id','write_title_coverimage_bg');
			$("#write_title_background_icon").attr('id','write_title_background_bg');
			$("#write_title_center_icon").attr('id','write_title_center_bg');
			$("#write_title_bottom_icon").attr('id','write_title_bottom_bg');
			colorIndex=2;
		}
	});
	$(".write_title_next_btn").click(function(){ // 배경색 지정 다음버튼 클릭 시
		if(colorIndex==1){
			$("#write_title_area_bg").css('background-color','#fbb9ba');
			$("#bo_color").val("#FBB9BA");
		}else if(colorIndex==2){
			$("#write_title_area_bg").css('background-color','#fdd3ba');
			$("#bo_color").val("#FDD3BA");
		}else if(colorIndex==3){
			$("#write_title_area_bg").css('background-color','#fcecb9');
			$("#bo_color").val("#FCECB9");
		}else if(colorIndex==4){
			$("#write_title_area_bg").css('background-color','#c2fdb9');
			$("#bo_color").val("#C2FDB9");
		}else if(colorIndex==5){
			$("#write_title_area_bg").css('background-color','#b9e8fc');
			$("#bo_color").val("#B9E8FC");
		}else if(colorIndex==6){
			$("#write_title_area_bg").css('background-color','#c1bafd');
			$("#bo_color").val("#C1BAFD");
		}else if(colorIndex==7){
			$("#write_title_area_bg").css('background-color','#eebbfe');
			$("#bo_color").val("#EEBBFE");
		}else if(colorIndex==8){
			$("#write_title_area_bg").css('background-color','#cccccc');
			$("#bo_color").val("#CCCCCC");
		}else if(colorIndex==9){
			$("#write_title_area_bg").css('background-color','#bf9b74');
			$("#bo_color").val("#BF9B74");
		}else if(colorIndex==10){
			$("#write_title_area_bg").css('background-color','#89b589');
			$("#bo_color").val("#89B589");
			colorIndex=1;
		}
		colorIndex++;
	});
	$(".write_title_prev_btn").click(function(){ // 배경색 지정 이전버튼 클릭 시		
		if(colorIndex==1){ 
			$("#write_title_area_bg").css('background-color','#fbb9ba');
			$("#bo_color").val("#FBB9BA");
			colorIndex=10;
		}else if(colorIndex==2){
			$("#write_title_area_bg").css('background-color','#fdd3ba');
			$("#bo_color").val("#FDD3BA");
		}else if(colorIndex==3){
			$("#write_title_area_bg").css('background-color','#fcecb9');
			$("#bo_color").val("#FCECB9");
		}else if(colorIndex==4){
			$("#write_title_area_bg").css('background-color','#c2fdb9');
			$("#bo_color").val("#C2FDB9");
		}else if(colorIndex==5){
			$("#write_title_area_bg").css('background-color','#b9e8fc');
			$("#bo_color").val("#B9E8FC");
		}else if(colorIndex==6){
			$("#write_title_area_bg").css('background-color','#c1bafd');
			$("#bo_color").val("#C1BAFD");
		}else if(colorIndex==7){
			$("#write_title_area_bg").css('background-color','#eebbfe');
			$("#bo_color").val("#EEBBFE");
		}else if(colorIndex==8){
			$("#write_title_area_bg").css('background-color','#cccccc');
			$("#bo_color").val("#CCCCCC");
		}else if(colorIndex==9){
			$("#write_title_area_bg").css('background-color','#bf9b74');
			$("#bo_color").val("#BF9B74");
		}else if(colorIndex==10){
			$("#write_title_area_bg").css('background-color','#89b589');
			$("#bo_color").val("#89B589");
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
	$(".write_main_title").keydown(function(e){
		if(e.keyCode != '8'){ // 백스페이스 이외 키를 눌렀을 때
			if($(".write_main_title").text().length > 30){
				$(".write_title_error").addClass('write_top_error');
				$(".write_error_message").text("제목은 30자 이상 입력할 수 없습니다!");
				$(".write_cont_save").attr("disabled",true);
				setTimeout(function(){
					$(".write_title_error").removeClass('write_top_error');
					$(".write_cont_save").attr("disabled",false);
				},3000);
				var titleText = $(".write_main_title").text().substr(0,30);
				$(".write_main_title").text(titleText);
				$(".write_main_title").focus();
			}
		}// if
		if(e.keyCode == '13'){ // 엔터키를 눌렀을 때
			if($(".write_main_title br").length > 1){
				$(".write_main_title br").remove();
			}
		}
	});
	$(".write_sub_title").keydown(function(e){
		if(e.keyCode != '8'){ // 백스페이스 이외 키를 눌렀을 때
			if($(".write_sub_title").text().length > 40){
				$(".write_title_error").addClass('write_top_error');
				$(".write_error_message").text("소제목은 40자 이상 입력할 수 없습니다!");
				$(".write_cont_save").attr("disabled",true);
				setTimeout(function(){
					$(".write_title_error").removeClass('write_top_error');
					$(".write_cont_save").attr("disabled",false);
				},3000);
				var titleText = $(".write_sub_title").text().substr(0,40);
				$(".write_sub_title").text(titleText);
			}
		}// if
		if(e.keyCode == '13'){ // 엔터키를 눌렀을 때
				return false;
		}
	});
	
	// 이미지 미리보기 구현
	$("#write_cover_file").on("change", handleImgFileSelect);
	$("#write_title_coverimage_bg").on("change", handleImgFileSelect);
	// 미리보기 이미지 삭제 / 취소
	$(".write_cover_delete").click(function(){
		$(".write_main_title").removeClass('write_bg_title_option');
		$(".write_sub_title").removeClass('write_bg_title_option');

		$("#write_title_cover_img").css("height","250px");
		$("#write_title_cover_img").css("background-image","none");			
		$("#write_title_center_bg").attr('id','write_title_center_icon');
		$("#write_title_bottom_bg").attr('id','write_title_bottom_icon');
		$("#write_title_coverimage_bg").attr('id','write_cover_file');
		
		$(".write_background_icon").css("display","block");
		$(".write_cover_delete").css("display","none");

		$("#bo_color").val("");
		$("#write_cover_file").val("");
	});
});

//카테고리 선택 토글
$(document).on("click",".join_membership_category-span",function(){
	if($(this).parent().hasClass("member_category_check")){ // 있을때 누른거
		$(this).parent().removeClass("member_category_check");
		$(this).next().removeAttr("name");
		category_count-=1;
	}else{ // 없을때 누른거
		if(category_count<1){				
			category_count+=1;
			$(this).parent().addClass("member_category_check");
			$(this).next().attr("name","cat_name");
		}else if(category_count == 1){
			if($(".join_membership_category-item").hasClass("member_category_check")){ // 선택된게 있으면
				$("#join_membership_category-list").children("li.member_category_check").children().next().removeAttr("name");
				$("#join_membership_category-list").children("li.member_category_check").removeClass("member_category_check");

				$(this).parent().addClass("member_category_check");
				$(this).next().attr("name","cat_name");
			}// if...
		}
	}
});
$(document).on("load",function(){
	
});

function sendFile(file, editor){
	var form_data=new FormData();
	form_data.append('file',file);
	$.ajax({
		data: form_data,
		type: "POST",
		url: '/jamong.com/imageUpload',
		cache: false,
		contentType: false,
		enctype: "multipart/form-data",
		processData: false,
		success: function(url){
			$(editor).summernote('editor.insertImage', url);
		}
	});
}
function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	// 커버이미지 선택시
	$("#bo_color").val("");
	
	$(".write_main_title").addClass('write_bg_title_option');
	$(".write_sub_title").addClass('write_bg_title_option');

	$(".write_background_icon").css("display","none");
	$(".write_cover_delete").css("display","block");
	$("#write_cover_file").attr('id','write_title_coverimage_bg');
	$("#write_title_center_icon").attr('id','write_title_center_bg');
	$("#write_title_bottom_icon").attr('id','write_title_bottom_bg');

	$("#write_title_area_bg").css('background-color','#FFF');
	$("#write_title_area_bg").css('height','250px');

	$("#write_background_change_btn").css('display','none');

	$("#write_title_background_bg").attr('id','write_title_background_icon');

	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert('확장자는 이미지 확장자만 가능합니다!');
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#write_title_cover_img").css('background-image','url(\"'+e.target.result+'\")');
			$("#write_title_cover_img").css("height","450px");
		}
		reader.readAsDataURL(f);
	});
}
function writeCheck(){ // 저장버튼 클릭시 작성체크	
	if($.trim($(".write_main_title").text())==""){
		$(".write_title_error").addClass('write_top_error');
		$(".write_error_message").text("제목을 입력하세요!");
		$(".write_cont_save").attr("disabled",true);
		setTimeout(function(){
			$(".write_title_error").removeClass('write_top_error');
			$(".write_cont_save").attr("disabled",false);
		},3000);
		$(".write_main_title").text("").focus();
		return false;
	}// if
	if($.trim($(".note-editable").text())==""){
		$(".write_title_error").addClass('write_top_error');
		$(".write_error_message").text("내용을 입력하세요!");
		$(".write_cont_save").attr("disabled",true);
		setTimeout(function(){
			$(".write_title_error").removeClass('write_top_error');
			$(".write_cont_save").attr("disabled",false);
		},3000);
		$(".note-editable").text("").focus();
		return false;
	}// if
	var screenWidth = $(document).width();
	var screenHeight = $(document).height();

	$(".write_choice_wrap").css({'width':screenWidth,'height':screenHeight});
	$(".write_choice_wrap").css("display","inline-block");
}
function saveCheck(){
	var main_title = $(".write_main_title").html();
	var sub_title = $(".write_sub_title").html();
	$("#bo_title").val(main_title);
	$("#bo_subtitle").val(sub_title);
	if(category_count == 0){
		$(".write_title_error").addClass("write_top_error");
		$(".write_error_message").text("카테고리를 선택해주세요!");
		$(".write_choice_save_btn").attr("disabled",true);
		setTimeout(function(){
			$(".write_title_error").removeClass("write_top_error");
			$(".write_choice_save_btn").attr("disabled",false);
		},3000);
		return false;
	}
	window.location.replace("./write_ok");
}

/*카테고리선택창의 카테고리 불러오기*/
function getCategorySelect(){
	  $.getJSON("/jamong.com/category_load/",function(data){
		  var str="";
		  $(data).each(function(){//each는 jQuery에서 반복함수
			  str+='<li class="join_membership_category-item">'
			  +'<span class="join_membership_category-span">'+this.cat_name+'</span>'
			  +'<input type="hidden" value="'+this.cat_name+'"/>'
			  +'</li>'
		  });
		  if ($("#join_membership_category-list").length > 0 ) {//해당 구역이 존재하면
			  $('#join_membership_category-list').html(str);	//ul내부에 each내용을 넣어준다
		  }
	  });
}
