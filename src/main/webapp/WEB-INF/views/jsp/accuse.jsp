<%@ page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="../resources/css/accuse.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/font.css"/>
<script src="../resources/js/accuse.js"></script>
   <div id=acc_wrap>
	<div id=acc_base>
	  <div id=acc_report_base>
	  	<h3>신고하기
	  	<a class="acc_close" onclick="accuseHide()">
	  	  <img src="../resources/img/close_x.png">
	  	</a>
	  	</h3>
	  	<br/>
	  	<div id=acc_report_body>
	    	<div id=acc_box_accuse>
	    		<form id=acc_form_accuse>
	    		 	<span class=acc_accuse_list>
	    		  	<input type="radio" class="acc_radio_button" 
	    		  	name="list"  value="A"  />
	    		 	<label class=acc_accuse_label>영리목적/홍보성</label>
	    		 	</span>
	    		 <span class=acc_accuse_list>
	    		  <input type="radio" class="acc_radio_button" 
	    		  name="list" value="B"  />
	    		  <label class=acc_accuse_label>불법정보</label>
	    		 </span>
	    		 <span class=acc_accuse_list>
	    		  <input type="radio" class="acc_radio_button" 
	    		  name="list" value="C"  />
	    		 <label class=acc_accuse_label>욕설/인신공격</label>
	    		 </span>
	    		 <span class=acc_accuse_list>
	    		  <input type="radio" class="acc_radio_button" 
	    		  name="list" value="D"  />
	    		 <label class=acc_accuse_label>음란/선정성</label>
	    		 </span>
	    		 <span class=acc_accuse_list>
	    		  <input type="radio" class="acc_radio_button" 
	    		  name="list" value="E"  />
	    			<label class=acc_accuse_label>개인정보노출</label>
	    		 </span>
	    		 <span class=acc_accuse_list>
	    		  <input type="radio" class="acc_radio_button" 
	    		  name="list" value="F"  />
	    		  <label class=acc_accuse_label>같은내용도배</label>
	    		 </span>
	    		 <span class=acc_accuse_list>
	    		  <input type="radio" class="acc_radio_button" 
	    		  name="list" value="G"  />
	    		  <label class=acc_accuse_label>권리침해신고</label>
	    		 </span>
	    		 <span class=acc_accuse_list>
	    		  <input type="radio" class="acc_radio_button" 
	    		  name="list" value="H"  />
	    		  <label class=acc_accuse_label>기타</label>
	    		 </span>
	    		 
	    		 <div id=acc_reason_text>
	    		 	  <textarea id="acc_write_reason" class="acc_lab_reason" placeholder="기타 사유를 입력해 주세요(최대 500자)" 
	    		 	  style="resize:none;" cols="50" rows="6" name="reasonMention"></textarea>	 
	    		 </div>
	    		 
	    		 <p class="acc_write">권리침해 신고는 먼저 침해한 게시물을 신고 후 '자몽홈페이지 권리침해 신고 사이트'에서 침해증빙
	    		  서류를 다운 받아 내용을 작성하여 고객센터로 온라인 접수하면 처리됩니다.
	    		 </p>
	    		 <button type="button" class="acc_report_btn">신고하기</button>
	    		</form>
	    	</div>
	  	</div>
	  </div>	
	</div>
  </div>