/**
 * my_info_
 */
//getCategorySelect();
setCategorySelect();//카테고리선택란에 카테고리 넣기(하단에 메서드 존재)

/*카테고리선택창의 카테고리 불러오기*/
function setCategorySelect(){
	$.ajax({
		type:"POST",
		url:"member_fav",
		datatype:"text",
		success: function(data) {		
			$("#my_info_category-list").length > 0
			$('#my_info_category-list').html(data);
		},
		error:function(){
			alert("data error");
		}
	}); 
}
$(document).ready(function(){
	$(document).on("click",".my_info_category-span",function(){
		if($(this).parent().hasClass("member_category_check")){
			$(this).parent().removeClass("member_category_check");
			$(this).next().removeClass()
			$(this).next().removeAttr("name");
		}else{
			for(var i=1;i<=3;i++){
				if(!$('.my_info_category-span').next().hasClass("member_fav"+i)){
					$(this).parent().addClass("member_category_check");
					$(this).next().addClass("member_fav"+i);
					$(this).next().attr("name","mem_fav"+i);
					return false
				}
			}
		}
	});
	$(document).on("click","#my_info_leave",function(){
		$("#my_info_layerLeave").css("display","block");
	});
	$(document).on("click",".link_close",function(){
		$("#my_info_layerLeave").css("display","none");
	});
//	체크박스가 선택되어야 탈퇴가 가능하게 만들고 state가 2로 바뀌면서 탈퇴 사유를 저장해야 한다
//	버튼을 누르면 사유 저장에 스테이트 2면 인서틑	와 업데이트가 한번에 가능해야함
//	탈퇴 사유를 안적을수도 있음
	$("#leave_member").click(function(){

		var my_info_leave_text_id = $("#my_info_leave_text_id").val();

		if($('#leaveagree').is(":checked") == false){
			$('#my_info_check_error').text('안내사항에 동의해 주세요');
			$('#leaveagree').focus();
			return false;
		}

		var removeOK = confirm('정말로 탈퇴하시겠습니까?');

		if(removeOK == true){
			$.ajax({
				type:"POST",
				url:"Withdrawal_ok",
				data: {"my_info_leave_text_id":my_info_leave_text_id},
				datatype:"int",
				success: function (data){
					if(data==1){
						alert("탈퇴가 완료되었습니다. 이용해 주셔서 감사합니다.")
						window.location.replace("/jamong.com/");					
					}else{
						alert("로그인 시간이 만료되었습니다. 다시 로그인 해주세요")
						window.location.replace("/jamong.com/login");
					}
				},
				error:function(){
					alert("data error");
				}
			});
		}
	});

	$("#my_info_before_btn").click(function(){
		var mem_fav1 =	$("input[name=mem_fav1]").val();
		var mem_fav2 =	$("input[name=mem_fav2]").val();
		var mem_fav3 =	$("input[name=mem_fav3]").val();

		$.ajax({
			type:"post",
			url:"cat_modify_ok",
			data: {"mem_fav1":mem_fav1,"mem_fav2":mem_fav2,"mem_fav3":mem_fav3},
			datatype:"int",
			success: function (data){
				if(data==1){
					alert("카테고리가 수정되었습니다");
				}else{
					alert("로그인 시간이 만료되었습니다. 다시 로그인 해주세요")
					window.location.replace("/jamong.com/login");
				}
			},
			error:function(){
				alert("data error");
			}
		});
	});

});
