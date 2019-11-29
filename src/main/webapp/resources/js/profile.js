/**
 * 
 */

/* tab 변경 */
$(document).ready(function() {

	$("#info_tab").click(function() {
		$("#profile_info").show();
		$("#Magazine").hide();
		$("#article").hide();
		$("#info_tab").addClass("active");
		$("#Magazine_tab").removeClass("active");
		$("#article_tab").removeClass("active");
	});

	$("#article_tab").click(function() {
		$("#article").show();
		$("#Magazine").hide();
		$("#profile_info").hide();
		$("#article_tab").addClass("active");
		$("#info_tab").removeClass("active");
		$("#Magazine_tab").removeClass("active");
	});

	$("#Magazine_tab").click(function() {
		$("#Magazine").show();
		$("#profile_info").hide();
		$("#article").hide();
		$("#Magazine_tab").addClass("active");
		$("#article_tab").removeClass("active");
		$("#info_tab").removeClass("active");
	});
})
/**/
$(document).ready(function() {
	$(".profile_button_type2").click(function() {
		// togglClass : 해당요소 여부를판단해 제거 및 부여함
		$(".profile_button_type2").toggleClass("p_follow")
		$(".profile_button_type2").each(function() {
			var text = $(this).text();
			$(this).html()
			$(this).text(function(i, text) {
				return text === "구독하기" ? "구독중" : "구독하기";
			})
		});
	});
});
/* */


/*	 키워드 	*/

$(document).ready(function() {
	var keyword_tag = {};
	var counter = 0;

	// 태그를 추가한다.
	function addTag(value) {
		keyword_tag[counter] = value; // 태그를 Object 안에 추가
		counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
	}

	// tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
	function marginTag() {
		return Object.values(keyword_tag).filter(function(word) {
			return word !== "";
		});
	}

	//keypress : 글자가 입력되었을때 이벤트 실행, keyup : 키 입력 후 발생되는 이벤트
	$("#keyword_tag").on("keypress", function(e) {
		var self = $(this);
 
		if (e.keyCode == 32) {/*스페이스 바 입력 안되도록*/
			alert('띄여쓰기는 사용할 수 없습니다');
			return false;
		}
		// input 에 focus 되있을 때 엔터 입력 ( 버튼 클릭시  구동-미구현)
		if (e.key === "Enter") {
			var tagValue = self.val(); // 값 가져오기
			if (tagValue !== "") { // 값이 없으면 동작 안하게
				// 같은 태그가 있는지 검사한다. 있다면 해당값이 array로 return한다.
				var result = Object.values(keyword_tag).filter(function(word) {// filter : 찾은 요소에서 특정 요소 걸러내기
					return word === tagValue;
				})
				if (result.length == 0) { // 태그 중복 검사
					if ($(".tag_item").siblings().length <= 7) {//태그 생성 제한
						$("#edit_tag_list").append("<li class='tag_item'>" + tagValue + "<span class='del_btn' idx='" + counter + "'></span></li>").hide().fadeIn('2000');
						addTag(tagValue);
						self.val("");
					} else {
						alert("키워드는 8개를 넘어갈 수 없습니다!");
						self.val("");
					}
				} else {
					alert("중복되는 키워드 입니다.");
					self.val("");
				}
				e.preventDefault();
			}
		}
		if($(".keyword_button").on("click",function(e){
			
				var tagValue = self.val(); // 값 가져오기
				if (tagValue !== "") { // 값이 없으면 동작 안하게
				
				// 같은 태그가 있는지 검사한다. 있다면 해당값이 array로 return한다.
				var result1 = Object.values(keyword_tag).filter(function(word) {// filter : 찾은 요소에서 특정 요소 걸러내기
					return word === tagValue;
				})
				if (result1.length == 0) { // 태그 중복 검사
					if ($(".tag_item").siblings().length <= 7) {//태그 생성 제한
						$("#edit_tag_list").append("<li class='tag_item'>" + tagValue + "<span class='del_btn' idx='" + counter + "'></span></li>").hide().fadeIn('2000');
						addTag(tagValue);
						self.val("");
					} else {
						alert("키워드는 8개를 넘어갈 수 없습니다!");
					self.val("");
					}
				} else {
					alert("중복되는 키워드 입니다.");
					self.val("");
				}
				e.preventDefault();
			}
		}));
			

	// 삭제 버튼 
	// 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.?
	$(document).on("click", ".del_btn", function(e) {
		var index = $(this).attr("idx");
		keyword_tag[index] = "";
		$(this).parent().remove();
	});
});
/*[출처] Jquery : 태그기능 클라이언트 부분 작업|작성자 Demnodey*/
});

$(document).ready(function() {
	$('.profile_edit_btn1').click(function() {
		var result = confirm('편집 중인 내용을 저장하지 않고 나가시겠습니까?');
		if (result) {
			location.replace('profile');
		} else {}
	});
})
