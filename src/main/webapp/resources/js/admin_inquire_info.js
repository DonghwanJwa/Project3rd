/**
 *  admin_inquire_info jsp
 */
$(document).ready(function(){
	$("#inq_re_btn").click(function(){
		if($(".inq_adm_request").css("display")=="none"){
			$(".inq_adm_request").show();			
		}else{
			$(".inq_adm_request").hide();						
		}
	});
	
	$('#inq_request_btn').click(function(){		
		$('.wrap-loading').show();
	});
	
});
