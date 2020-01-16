/**
 *  admin_accuse_info.jsp
 */

$(document).ready(function(){
	$("#ac_re_btn").click(function(){
		if($(".ac_adm_request").css("display")=="none"){
			$(".ac_adm_request").show();			
		}else{
			$(".ac_adm_request").hide();						
		}
	});
	
	$('#ac_request_btn').click(function(){		
		$('.wrap-loading').show();
	});
});
