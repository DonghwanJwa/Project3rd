/**
 * profile.js
 */
// tab 변경 
$(document).ready(function() {
	$("#profile_edit_img").on("change",profileImgSelect);

	$("#info_tab").click(function() {
		$("#profile_info").show();
		$("#Magazine").hide();
		$("#article").hide();
		$("#info_tab").addClass("active");
		$("#profile_menu_check").val("info");
		$("#Magazine_tab").removeClass("active");
		$("#article_tab").removeClass("active");
	});

	$("#article_tab").click(function() {
		$("#article").show();
		$("#Magazine").hide();
		$("#profile_info").hide();
		$("#article_tab").addClass("active");
		$("#profile_menu_check").val("article");
		$("#info_tab").removeClass("active");
		$("#Magazine_tab").removeClass("active");
	});

	$("#Magazine_tab").click(function() {
		$("#Magazine").show();
		$("#profile_info").hide();
		$("#article").hide();
		$("#Magazine_tab").addClass("active");
		$("#profile_menu_check").val("magazine");
		$("#article_tab").removeClass("active");
		$("#info_tab").removeClass("active");
	});
	
// 작가 구독 텍스트 변경되게
	$(".profile_button_type2").click(function(event) {
		if(event.target.getAttribute("data-disabled")=='true'){
			return false;
		}
		//p.follow 클래스가 없을때
		var para = document.location.href.split("/");
		var follower = $(".profile_line_num").text();
		if($(".profile_button_type2").hasClass("p_follow") === false){
			
			var text = $(this).text();
		// togglClass : 해당요소 여부를판단해 제거 및 부여함
		$(".profile_button_type2").each(function() {
			$(".p_follow").html();
			// 클릭했을때 구독자 항목 저장
			$.ajax({
			type : "POST",
			url : "follow/"+para[4].substring(1),
			dataType : 'json',
			success : function(data){
				if(data == 1){
					$(".profile_button_type2").addClass("p_follow");
					$(".profile_button_type2").text("구독중");
					 var  plus = parseFloat(follower) + 1;
	                $(".profile_line_num").text(plus); 
					$(event.target).attr("data-disabled",'true');
					setTimeout(function(){
						$(event.target).attr("data-disabled",'false');
					},2000);
				}else if(data == 2){   
					Swal.fire({
						icon : 'info',
						title : 'Oops!',
						text : '로그인이 필요합니다. 로그인 하시겠습니까?',
						showCancelButton : true,
						confirmButtonText : '예',
						cancelButtonText : '아니오'
					}).then((result) => {
						if(result.value){
							location.href='/jamong.com/login';
						}
					});
				}
			},
			error:function(){
				alert('data error');
			}
			})
		});
		} else {
			$(".profile_button_type2").removeClass("p_follow");
			$(".profile_button_type2").text("구독하기");
			
			var  minus = parseFloat(follower) - 1;
            if (minus<=0){
            	$(".profile_line_num").text(0); 
            }else{
            	$(".profile_line_num").text(minus); 
            } 
			$.ajax({
				type : "POST",
				url : "unfollow/"+para[4].substring(1),
				dataType : 'json',
				success : function(data){
					if(data == 1){
						$(event.target).attr("data-disabled",'true');
						setTimeout(function(){
							$(event.target).attr("data-disabled",'false');
						},2000);
					}else if(data == 2){
						Swal.fire({
							icon : 'info',
							title : 'Oops!',
							text : '로그인이 필요합니다. 로그인 하시겠습니까?',
							showCancelButton : true,
							confirmButtonText : '예',
							cancelButtonText : '아니오'
						}).then((result) => {
							if(result.value){
								location.href='/jamong.com/login';
							}
						});
					}
				},
				error:function(){
					alert("data error");
				}
			})
		}
	});
	// 구독중인 상태에서 hover시 작동
	$('.p_follow').hover(function() {
		  $(".p_follow").text("구독해제");
		}, function(){
		  $(".p_follow").text("구독중");
		});
	// 자신의 글목록 공개 비공개 여부 선택
	$(document).on('click','.private',function(event) {
			var num = $(this).attr("data-no");
			if(event.target.getAttribute("data-disabled")=='true'){
				return false;
			}
			console.log(num);
			var lockImg = "/jamong.com/resources/img/lock.png";
			var unlockImg = "/jamong.com/resources/img/unlock.png";
			if($(event.target).hasClass('unlock')){
				// 공개 -> 비공개
				$.ajax({
					type : "POST",
					url : "/jamong.com/boardLock/"+num+"/0",
					success : function(data){
						if(data!=-1){
							$(event.target).removeClass("unlock");
							$(event.target).addClass("lock");
							$(event.target).attr("src",lockImg);
							$(event.target).attr("data-disabled",'true');
							setTimeout(function(){
								$(event.target).attr("data-disabled",'false');
							},2000);
						}else{
							Swal.fire({
								icon : 'info',
								title : 'Oops!',
								text : '세션이 만료되었습니다. 로그인 하시겠습니까?',
								showCancelButton : true,
								confirmButtonText : '예',
								cancelButtonText : '아니오'
							}).then((result) => {
								if(result.value){
									location.href='/jamong.com/login';
								}else if(result.dismiss === Swal.DismissReason.cancel){
									window.location.reload();								
								}
							});
						}
					},
					error:function(){
						alert("data error");
					}
				});
				// 비공개 -> 공개
			}else {
				$.ajax({
					type : "POST",
					url : "/jamong.com/boardLock/"+num+"/1",
					success : function(data){
						if(data!=-1){
							$(event.target).removeClass("lock");
							$(event.target).addClass("unlock");
							$(event.target).attr("src",unlockImg);
							$(event.target).attr("data-disabled",'true');
							setTimeout(function(){
								$(event.target).attr("data-disabled",'false');
							},2000);
						}else {
							Swal.fire({
								icon : 'info',
								title : 'Oops!',
								text : '세션이 만료되었습니다. 로그인 하시겠습니까?',
								showCancelButton : true,
								confirmButtonText : '예',
								cancelButtonText : '아니오'
							}).then((result) => {
								if(result.value){
									location.href='/jamong.com/login';
								}else if(result.dismiss === Swal.DismissReason.cancel){
									window.location.reload();								
								}
							});
						}
					},
					error:function(){
						alert('data error');
					}
				})
			}
		});
		$('.tit_cover').children().wordBreakKeepAll();
});
//새로고침 시 스크롤 맨 위로 이동
$(window).on("beforeunload",function(){
	$("html").scrollTop(0);
});
// 글목록 스크롤 이벤트 발생
$(window).scroll(function(){
	/* 스크롤 다운 중 */
	//현재 스크롤의 top 좌표가 > (게시글을 불러온 화면 높이 - 윈도우 창의 높이) 되는 순간
	//현재 스크롤의 위치가 보이는 위치보다 클때
	if($(window).scrollTop() >= ($(document).height() - $(window).height())){
		var article = $(".scrolling:last").attr("data-no");
		var para = article.split('/');
		var pb = $('#profile_menu_check').val();
		//ajax를 이용하여 현재 로딩 된 게시글의 마지막 bo_no를 서버로 보내어 그 다음 10개의 게시물 데이터를 받아온다.
		if(pb == 'article'){
		$.ajax({
			type : "post",
			url : "profile_scroll",
			dataType : 'json',
			data : {//서버로 보낼 데이터
				"mem_no" : para[0],
				"bo_no" : para[1],
				"num" : para[2],
				"pb" : pb
			},
			success : function(data){// ajax가 성공했을 시 수행될 function
				var str=""; 
				// 받아온 데이터가 "" 이거나 null이 아닌경우 DOM handling?을 해준다
				if(data != ""){
				// 서버로 부터 받아온 data가 list이므로 each문을 사용하여 접근	
					$(data).each(
							function(){
						para[2]++;
						str += '<li class="profile_articles scrolling" data-no="'+ para[0] + '/' + this.bo_no + '/' + para[2] +'"> <div>' 
						
							+  '<div class="profile_article_main">' 
							if(this.bo_lock == 0 && this.book_no == 0){
								str += '<img class="private lock" src="/jamong.com/resources/img/lock.png" data-no="' + this.bo_no + '" data-disabled="false" />'
							}else if(this.bo_lock == 1 && this.book_no == 0){
								str += '<img class="private lock" src="/jamong.com/resources/img/unlock.png" data-no="' + this.bo_no + '" data-disabled="false" />'
							}
							str +=  '<a href="/jamong.com/category/' + this.cat_name + '" class = "profile_cat_color">' + this.cat_name +"</a>"
							if(this.book_no != 0){
								str +=	'<span class="profile_book_color">Book</span>'
							}
							str +=  '</div>'
								+	'<a href="/jamong.com/@' + this.memberVO.mem_id + '/' + this.bo_no + '">'
								+	'<strong class="pf_bo_title">' + this.bo_title + '</strong>'
								+  	'<div class="article_cont">' +	this.bo_cont + '</div> <div>' 
						if(this.bo_thumnail != null){
							str += ' <img class="profile_post_img" alt="이미지 정보"	src="' + this.bo_thumnail + '"/>'
						}
						str += '</div> </a> </div></div> <span class="pf_post_date">' + this.bo_date + '</span></li>'
					}); // each
					$(".scrolling:last").after(str);
				} // if data
			} // success
		}); // ajax
	}
		if(pb == 'magazine'){
		var article = $(".bookList:last").attr("data-no");
		var checking = $(".lock_checking").val();
		var para = article.split('/');
		//ajax를 이용하여 현재 로딩 된 게시글의 마지막 bo_no를 서버로 보내어 그 다음 10개의 게시물 데이터를 받아온다.
		$.ajax({
			type : "post",
			url : "profile_scroll",
			dataType : 'json',
			data : {//서버로 보낼 데이터
				"mem_no" : para[0],
				"book_no" : para[1],
				"num" : para[2],
				"pb" : pb
			},
			success : function(data){// ajax가 성공했을 시 수행될 function
				var str=""; 
					// 받아온 데이터가 "" 이거나 null이 아닌경우 DOM handling?을 해준다
					if(data != ""){
					// 서버로 부터 받아온 data가 list이므로 each문을 사용하여 접근	
						$(data).each(function(){
							para[2]++;
							str += '<div class="box_contents bookList" data-no="'+ this.memberVO.mem_no +'/'+ this.book_no +'">' 
								+  '<div class="cover_book">'
								+  '<a href="/jamong.com/book/@'+ this.memberVO.mem_id + '/' + this.bookVO.book_no +'">'
								if(this.bookVO.book_cover){
									'<img class="cover_img" src="'+ this.bookVO.book_cover +'">'
								}else{
									'<img class="cover_img" style="background-color:#f2f2f2">'
								}
							str +=	'<div class="info_cover">'
								+	'<strong class="tit_cover">' + this.bookVO.book_name + '</strong>'
								+	'<span>by ' + this.memberVO.mem_nickname + '</span> </div>'
								+	'<span class="book_line"></span> </a> </div>'
								+	'<strong>' + this.bookVO.cat_name +'</strong>' 
								+	'<strong class="pf_date">' + this.bookVO.book_date + '</strong>'
								+ 	'<a class="profile_jm" href="/jamong.com/book/@' + this.memberVO.mem_id + '/'+ this.bookVO.book_no + '">'+ this.bookVO.book_name + '</a>'
								+	'<div>'
								+	'<dl class="j_list_info">'
								+	'<dt>' 
								+	'<span class="article_icon">'+' '+'</span>' 
								+	'</dt>'
								+	'<dd class="box_contents_num">'
								+	'<b></b>'
								+    '</dd><dt> <img class="relate" src="/jamong.com/resources/img/heart.png"/>'
								+	'</dt>'
								+	'<dd class="box_contents_num"></dd>	</dl>	</div>	</div>'
		                     }); // each
						$(".bookList:last").after(str);
					} // if data
				} // success
			}); // ajax
		} // bookList
	} // if(scrollTop()
}); // scroll
			



	


// 키워드 	
// edit 글자제한 
var keyword_tag = {};
$(document).ready(function() {
	var counter = 0;

	// 특수문자 정규식 변수(공백 미포함)
	var s_word = /[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi;
	var k_word = /[ㄱ-ㅎㅏ-ㅣ]/gi;
	// 완성형 아닌 한글 정규식
	var n_word = /[0-9]/gi;
	
	// 태그를 추가한다.
	function addTag(value) {
		keyword_tag[counter] = value; // 태그를 Object 안에 추가
		counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
	}
	//공백이 아니게 
	function marginTag() {
		return Object.values(keyword_tag).filter(function(word) {
			return word !== "";
		});
	}
	
	var tag = document.getElementsByClassName('tag_item'); 
	for(var i=0;i<tag.length;i++){	
		addTag(tag[i].childNodes[0].textContent);
	}
	$('#profile_editor').on("focusout keydown",function(e){
		var p_edit =$(this).val();
		 if(e.type === 'focusout'){
		if(p_edit.length >0){
			if(p_edit.match(s_word)){
				p_edit = p_edit.replace(s_word,"");
				$('#profile_editor_error').text('특수문자는 입력할 수 없습니다.');
				p_edit ;
			}else{
				$('#profile_editor_error').text('');
			}
			$(this).val(p_edit);
		}
		 }
	      if(e.type === 'keydown'){
	          if(e.keyCode == 32) {
	             return false;
	          }
	      }
	});
	
	// keypress : 글자가 입력되었을때 이벤트 실행, keyup : 키 입력 후 발생되는 이벤트
	$("#keyword_tag").on("keypress", function(e) {
		var self = $(this);

		if (e.keyCode == 32) {// 스페이스 바 입력 안되도록
			Swal.fire({
				icon : 'error',
				text : '띄어쓰기는 사용할 수 없습니다'
			});
			return false;
		}
		// input 에 focus 되있을 때 엔터 입력 ( )
		if (e.key === "Enter") {
			e.preventDefault();
			var tagValue = self.val(); // 값 가져오기
			if (tagValue !== "" ) { // 값이 없으면 동작 안하게
				if (tagValue.test(s_word) || tagValue.test(k_word) || tagValue.test(n_word)){
					$('#profile_error_keyword').text('특수문자,미완성된 한글,숫자는 입력할 수 없습니다.');
				}else{
					$('#profile_error_keyword').text(''); 
				}

				// 같은 태그가 있는지 검사한다. 있다면 해당값이 array로 return한다.
				var result = Object.values(keyword_tag).filter(function(word) {// filter : 찾은 요소에서 특정 요소 걸러내기
					return word === tagValue; 
				})
				var keyword = $("#keyword_value").val();
				if (result.length == 0) { // 태그 중복 검사
					// siblings() 자신을 제외한 형제요소를 찾는 함수							
					if ($(".tag_item").siblings().length <= 5) {// 태그 생성 제한
						$("#edit_tag_list").append("<li class='tag_item'>" + tagValue + "<span class='del_btn' idx='" + counter + "'></span></li>").hide().fadeIn('2000');
						$("#keyword_value").val(keyword+tagValue+"/");
						addTag(tagValue);
						self.val("");
						$('#profile_error_keyword').text('');
					} else {
						$('#profile_error_keyword').text("키워드는 6개를 넘어갈 수 없습니다!");
					}
				} else {
					$('#profile_error_keyword').text("중복되는 키워드 입니다.");
				}
				return false;
			}
			e.preventDefault();
		}
		// 키워드 버튼 클릭
		$(".keyword_button").on("click",function(e){

			var tagValue = self.val(); // 값 가져오기
			if (tagValue !== "") { // 값이 없으면 동작 안하게

				if (tagValue.match(s_word) || tagValue.match(k_word) || tagValue.match(n_word)){
					$('#profile_error_keyword').text('특수문자,미완성된 한글,숫자는 입력할 수 없습니다.');
					return self.val("");
				}
				// 같은 태그가 있는지 검사한다. 있다면 해당값이 array로 return한다.
				var result1 = Object.values(keyword_tag).filter(function(word) {// filter : 찾은 요소에서 특정 요소 걸러내기
					return word === tagValue;
				})
				var keyword = $("#keyword_value").val();
				if (result1.length == 0) { // 태그 중복 검사
					if ($(".tag_item").siblings().length <= 5) {//태그 생성 제한
						$("#edit_tag_list").append("<li class='tag_item'>" + tagValue + "<span class='del_btn' idx='" + counter + "'></span></li>").hide().fadeIn('2000');
						$("#keyword_value").val(keyword+tagValue+"/");
						addTag(tagValue);
						self.val("");
						$('#profile_error_keyword').text('');
					} else {
						$('#profile_error_keyword').text("키워드는 6개를 넘어갈 수 없습니다!");
					}
				} else {
					$('#profile_error_keyword').text("중복되는 키워드 입니다.");
				}
				e.preventDefault();
			}
		});
		// 삭제 버튼 
		// 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.?
	});
});
$(document).on("click",".del_btn", function(e) {
	var index = $(this).attr("idx");
	var keyword = $("#keyword_value").val();
	var error = $(this).parent().text();
	keyword_tag[index] = "";
	$(this).parent().remove();
	$("#keyword_value").val(keyword.replace($(this).parent().text()+"/",""));
});
$(document).on("click","#flio_b",function() {	
	$("#pf_folio").toggle(); 
	//포트폴리오 자동으로 늘어나게
	$("#profile_portflio").on('keydown keyup focus', function () {
		  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
	});
});
$(document).on("click",'.profile_edit_btn1',function() {
	var result = confirm('편집 중인 내용을 저장하지 않고 나가시겠습니까?');
	if (result) {
		history.back();
	} else {}
});


function profileImgSelect(e){
	var files = e.target.files;
	var filesArr =  Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
		alert('이미지 확장자만 가능합니다!');
		return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#profile_edit_img").css("background-image",'url(\"'+e.target.result+'\")');
		$("#profile_edit_img").css("height","100px");
		}
		reader.readAsDataURL(f);
	});
}
function profileCheck(){
	
	if(($.trim($('#pf_info').val()) !== "") && ($.trim($('#profile_editor').val()) !== "")){
		var result = confirm('저장하시겠습니까? (닉네임은 작성하지 않을경우 아이디로 자동 저장됩니다.)');
		if (result) {
			history.back();
		} else {
			return false;
			}
	} 
		
	if($.trim($('#profile_editor').val())==""){
		$('#profile_editor_error').text('닉네임을 작성해주세요!');
		$("#profile_editor").val().focus();
		
	}else{
		$('#profile_editor_error').text('');
	}
	
	if ($.trim($('#pf_info').val()) == "") {//기본 텍스트
		$('#profile_info_error').text('자기소개를 작성해주세요!');//에러택스트
		$('#pf_info').val("").focus();
		
		return false;
	}else{
		$('#profile_info_error').text('');
		
	}
	var folio_txt = $('#profile_portflio').html();
	
}	
$(document).ready(function(){
	
	var k_word = /[ㄱ-ㅎㅏ-ㅣ]/gi;
	
	$("#profile_editor").on("keyup", function(e) {
	if($.trim($('#profile_editor').val()).length > $(this).attr('maxlength')){
		$('#profile_editor_error').text('닉네임은 10자 이하까지만 작성가능합니다!');
		
		$("#profile_info").val("").focus();
		return false;
	}else{
		$('#profile_editor_error').text('');
	}	
	});
		$("#pf_info").on("keyup",function(e){
			
	if ($.trim($('#pf_info').val()).length > $(this).attr('maxlength')) {//기본 텍스트
		$('#profile_info_error').text('자기소개는 90자 이하까지만 작성가능합니다!');
		$("#profile_info").val("").focus();
		return false;
	}else{
		$('#profile_info_error').text('');
	}
		})
	// 작가명 엔터 키 제한
	$('#profile_editor').on("keypress",function(e){
		var p_edit =$(this).val();
		if(e.keyCode == 13){
			Swal.fire({
				icon : 'error',
				text : '닉네임엔 엔터키를 사용할 수 없습니다!'
			});
			return false;
		}
		e.preventDefault;
	});
	
	// 자기소개 엔터키 제한
	$('.e').on("keypress",function(e){
		var p_edit =$(this).val();
		if(e.keyCode == 13){
			Swal.fire({
				icon : 'error',
				text : '자기소개에는 엔터키를 사용할 수 없습니다!'
			});
			return false;
		}
		e.preventDefault;
	});
	
	
})




