<%@ page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/accuse.css"/>
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/font.css"/>
<script src="/jamong.com/resources/js/accuse.js"></script>
   <div id=acc_wrap>
	<div id=acc_base>
	  <div id=acc_report_base oncontextmenu="return false" ondragstart="return false" 
	  onselectstart="return false">
	  	<h3>신고하기
	  	<a class="acc_close" id="acc_close" onclick="accuseHide()">
	  	  <img src="/jamong.com/resources/img/close_x.png">
	  	</a>
	  	</h3>
	  	<br/>
	  	<div id=acc_report_body>
	    	<div id=acc_box_accuse>
	    		<form id=acc_form_accuse method="post" action="/jamong.com/accuse_report_ok" onsubmit="return accuseVali();">
	    		 	<span class=acc_accuse_list onkeydown="return captureReturnKey(event)">
	    		  	
	    		  	<input type="hidden" id="ac_item" name="ac_item" value="">
	    		  	
	    		  	<input type="radio" class="acc_radio_button" 
	    		  	name="ac_reason"  value="영리목적" style=cursor:pointer; />
	    		 	<label class=acc_accuse_label>영리목적/홍보성</label>
	    		 	</span>
	    		 <span class=acc_accuse_list>
	    		  <input type="radio" class="acc_radio_button" 
	    		  name="ac_reason" value="불법정보" style=cursor:pointer; />
	    		  <label class=acc_accuse_label>불법정보</label>
	    		 </span>
	    		 <span class=acc_accuse_list>
	    		  <input type="radio" class="acc_radio_button" 
	    		  name="ac_reason" value="욕설/인신공격" style=cursor:pointer;  />
	    		 <label class=acc_accuse_label>욕설/인신공격</label>
	    		 </span>
	    		 <span class=acc_accuse_list>
	    		  <input type="radio" class="acc_radio_button" 
	    		  name="ac_reason" value="음란/선정성" style=cursor:pointer; />
	    		 <label class=acc_accuse_label>음란/선정성</label>
	    		 </span>
	    		 <span class=acc_accuse_list>
	    		  <input type="radio" class="acc_radio_button" 
	    		  name="ac_reason" value="개인정보노출" style=cursor:pointer; />
	    			<label class=acc_accuse_label>개인정보노출</label>
	    		 </span>
	    		 <span class=acc_accuse_list>
	    		  <input type="radio" class="acc_radio_button" 
	    		  name="ac_reason" value="같은내용도배" style=cursor:pointer; />
	    		  <label class=acc_accuse_label>같은내용도배</label>
	    		 </span>
	    		 <span class=acc_accuse_list>
	    		  <input type="radio" class="acc_radio_button" 
	    		  name="ac_reason" value="권리침해신고" style=cursor:pointer; />
	    		  <label class=acc_accuse_label>권리침해신고</label>
	    		 </span>
	    		 <span class=acc_accuse_list>
	    		  <input type="radio" class="acc_radio_button" 
	    		  id="acc_vali_radio" name="list" value="H"  />
	    		  <label class=acc_accuse_label>기타</label>
	    		 </span>
	    		 <div class="acc_vali_date" id="acc_vali_list"></div>
	    		 <!-- 라디오버튼 끝 -->
	    		 
	    		 <!-- 기타사유 텍스트필드 시작 -->
	    		 <div id=acc_reason_text>
	    		 	  <textarea id="acc_write_reason" name="ac_cont" class="acc_lab_reason" placeholder="신고 사유를 입력해 주세요(최대 200자)" 
	    		 	  style="resize:none;" cols="50" rows="6" name="reasonMention" maxlength="200"></textarea>	 
	    		 </div>
	    		 <div class="acc_vali_date" id="acc_vali_field"></div>
	    		 <!-- 기타사유 텍스트필드 끝 -->
	    		 
	    		 
	    		 <p class="acc_write">권리침해 신고는 먼저 침해한 게시물을 신고 후 '자몽홈페이지 권리침해 신고 사이트'에서 침해증빙
	    		  서류를 다운 받아 내용을 작성하여 <a class="acc_link_more" href="/jamong.com/policy_privacy"
  	    target="_blank">자몽 고객센터</a>로 온라인 접수하면 처리됩니다.
	    		 </p>
	    		 <button type="submit" class="acc_report_btn">신고하기</button>
	    		</form>
	    	</div>
	  	</div>
	  </div>	
	</div>
  </div>