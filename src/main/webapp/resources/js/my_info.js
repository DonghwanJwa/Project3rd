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

$(document).on("click","#my_info_leave",function(){
	$("#my_info_layerLeave").css("display","block");

});
$(document).on("click",".link_close",function(){
	$("#my_info_layerLeave").css("display","none");
	
});

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
