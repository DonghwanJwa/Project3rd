/**
 * my_info_
 */
getCategorySelect();//카테고리선택란에 카테고리 넣기(하단에 메서드 존재)

/*카테고리선택창의 카테고리 불러오기*/
function getCategorySelect(){
	  $.getJSON("/jamong.com/category_load/",function(data){
		  var str="";
		  $(data).each(function(){//each는 jQuery에서 반복함수
			  str+='<li class="my_info_category-item">'
			  +'<span class="my_info_category-span">'+this.cat_name+'</span>'
			  +'<input type="hidden" value="'+this.cat_name+'"/>'
			  +'</li>'
		  });
		  if ($("#my_info_category-list").length > 0 ) {//해당 구역이 존재하면
			  $('#my_info_category-list').html(str);	//ul내부에 each내용을 넣어준다
		  }
	  });
}
$(document).on("click","#my_info_leave",function(){
	$("#my_info_layerLeave").css("display","block");

});
$(document).on("click",".link_close",function(){
	$("#my_info_layerLeave").css("display","none");
	
});

//카테고리 선택시 class,name 추가(form에 post전달하기 위해서 name값에 숫자 추가)
//중요!! $(document).ready()안에 사용하지 않은 이유
//		jQuery의 get이나 ajax방식으로 사용하는 경우 click 메서드가 요소를 인식하지 못한다.
//		click의 조상격인 on을 사용하면 인식가능하므로 on을 사용하도록하자
//		http://blog.freezner.com/archives/411
$(document).on("click",".my_info_category-span",function(){
	var b = this.mem_fav1;
	alert(b);
	if($(this).parent().hasClass("member_category_check")){
		$(this).parent().removeClass("member_category_check");
		$(this).next().removeClass()
		$(this).next().removeAttr("name");
	}else{
		for(var i=1;i<=3;i++){
			if(!$('.my_info_category-span').next().hasClass("member_fav"+i)){
				$(this).parent().addClass("member_category_check");
				$(this).next().addClass("member_fav"+i)
				$(this).next().attr("name","mem_fav"+i);
				return false
			}
		}
	}
});
