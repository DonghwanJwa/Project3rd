/**
 * book_create.js
 */
var category_count = 0;
getCategorySelect();
$(document).ready(function() {

	/* 책 커버 이미지 선택 */
	$("#book_create_cover_text").click(function(e) {
		if (!$(e.target).hasClass("title")) {
			$("input[type=file]").click();
		}
	});

	/* 책 커버 이미지 미리보기 */
	$("#book_create_cover_imgFile").on("change", handleImgFileSelect);

	/* post_list의 li 전체 선택 / 전체 해제 */
	$("#post_list_checkAll").click(function() {
		$("#post_list [type=checkbox]").prop("checked", true);
	});
	$("#post_list_releaseAll").click(function() {
		$("#post_list [type=checkbox]").prop("checked", false);
	});

	/* create_list의 li 전체 선택 / 전체 해제 */
	$("#create_list_checkAll").click(function() {
		$("#create_list [type=checkbox]").prop("checked", true);
	});
	$("#create_list_releaseAll").click(function() {
		$("#create_list [type=checkbox]").prop("checked", false);
	});

	/* 추가 / 삭제 */
	$("#add").click(function() {
		if ($("input").is(":checked")) {
			$(":checked").closest('li').remove().appendTo("#create_list");
			$("input").prop("checked", false).next().removeClass("selected");
		}
		;
	});

	$("#del").click(function() {
		if ($("input").is(":checked")) {
			$(":checked").closest('li').remove().appendTo("#post_list");
			$("input").prop("checked", false).next().removeClass("selected");
		}
		;
	});

	/* div 순서 변경 */
	$("#post_list").sortable();
	$("#post_list").disableSelection();
	$("#create_list").sortable();
	$("#create_list").disableSelection();

	$(".create_name_close").click(function() {
		$(".create_book_name").css("display", "none");
	});
	$(".create_book_name").click(function(i) {
		if ($(".create_book_name").is(i.target)) {// 영역 밖 클릭 시
			$(".create_book_name").css("display", "none");
		}
	});

	// 책 제목 글자 수 제한
	$("#book_create_cover_title").on("keydown", function() {
		if ($(this).text().length > 30) {
			$(this).text($(this).text().substring(0, 30));
		}
	});
	// 책 소개 글자 수 제한
	$("#book_create_intro_cont").on("keydown", function() {
		if ($(this).text().length > 245) {
			$(this).text($(this).text().substring(0, 245));
		}
	});
	$(".write_choice_close_btn").click(function() {
		$(".create_choice_wrap").css("display", "none");
	});
	$(".create_choice_wrap").click(function(e) { // 영역 클릭시
		if ($(".create_choice_wrap").is(e.target)) { // 영역 밖 클릭시
			$(".create_choice_wrap").css("display", "none");
		}
	});
});

// 카테고리 선택 토글
$(document).on(
		"click",
		".join_membership_category-span",
		function() {
			if ($(this).parent().hasClass("member_category_check")) { // 있을때
																		// 누른거
				$(this).parent().removeClass("member_category_check");
				$(this).next().removeAttr("name");
				category_count -= 1;
			} else { // 없을때 누른거
				if (category_count < 1) {
					category_count += 1;
					$(this).parent().addClass("member_category_check");
					$(this).next().attr("name", "cat_name");
				} else if (category_count == 1) {
					if ($(".join_membership_category-item").hasClass(
							"member_category_check")) { // 선택된게 있으면
						$("#join_membership_category-list").children(
								"li.member_category_check").children().next()
								.removeAttr("name");
						$("#join_membership_category-list").children(
								"li.member_category_check").removeClass(
								"member_category_check");

						$(this).parent().addClass("member_category_check");
						$(this).next().attr("name", "cat_name");
					}// if...
				}
			}
		});

function createCheck() {
	if ($.trim($("#book_create_cover_title").text()) == "") {
		Swal.fire({
			text : '책 제목을 입력해주세요.',
			icon : 'info'
			});
		$("#book_create_cover_title").text("").focus();
		return false;
	}
	if ($.trim($("#book_create_intro_cont").text()) == "") {
		Swal.fire({
			text : '책 소개를 입력해주세요.',
			icon : 'info'
			});
		$("#book_create_intro_cont").text("").focus();
		return false;
	}
	if ($("#create_list").children().length == "") {
		Swal.fire({
			text : '글을 선택해 주세요.',
			icon : 'info'
			});
		return false;
	}// ul 리스트가 비어있으면
	if ($("#create_list").children().length < 5) {
		Swal.fire({
			text : '책 집필엔 최소 5개의 글이 선택되어야 합니다!',
			icon : 'warning'
			});
		return false
	}// ul 리스트 글 5개 미만
	var screenWidth = $(document).width();
	var screenHeight = $(document).height();

	$(".create_choice_wrap").css({
		'width' : screenWidth,
		'height' : screenHeight
	});
	$(".create_choice_wrap").css("display", "inline-block");
}

function createBookCheck() {
	if (category_count == 0) {
		Swal.fire({
			text : '카테고리를 선택하세요!',
			icon : 'warning'
			});
		return false;
	}
	$("#create_list [type=checkbox]").prop("checked", true);
	var book_name = $("#book_create_cover_title").html();
	var book_preface = $("#book_create_intro_cont").html();
	$("#book_title").val(book_name);
	$("#book_intro_cont").val(book_preface);
}

function handleImgFileSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			Swal.fire({
				text : '확장자는 이미지 확장자만 선택 가능합니다!',
				icon : 'warning'
				});
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#book_create_cover_img").css('background', '');
			$("#book_create_cover_img").css('background-image',
					'url(\"' + e.target.result + '\")');
		}
		reader.readAsDataURL(f);
	});
}

function getCategorySelect() {
	$.getJSON("/jamong.com/category_load/", function(data) {
		var str = "";
		$(data).each(
				function() {// each는 jQuery에서 반복함수
					str += '<li class="join_membership_category-item">'
							+ '<span class="join_membership_category-span">'
							+ this.cat_name + '</span>'
							+ '<input type="hidden" value="' + this.cat_name
							+ '"/>' + '</li>'
				});
		if ($("#join_membership_category-list").length > 0) {// 해당 구역이 존재하면
			$('#join_membership_category-list').html(str); // ul내부에 each내용을
															// 넣어준다
		}
	});
}
