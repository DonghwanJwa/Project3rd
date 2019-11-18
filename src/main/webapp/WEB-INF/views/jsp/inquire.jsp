<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/inquire.css"/>
<article class=inq_main_art>
  <h3 class=inq_title>문의하기</h3>
  <span class=inq_required>*필수입력 사항</span>
  
  <br/>
  <div class=inq_question_cont>
  	<form id="inq_request" action="#" method="post"  
  	novalidate="novalidate">
  	 <input type="hidden" id="serviceId" name="serviceId" value="54">
  	 <input type="hidden" id="serviceId" name="categoryId" value="30">
  	 <input type="hidden" id="locale" name="locale" value="ko">
  	<fieldset class="inq_field_set">
  	  <legend class="inq_form">문의하기 폼</legend>
  	   <dl class="inq_info_question">
  	   
  	    <dt>
  	    						문의 분류 *
  	    </dt>
  	     <dd>
  	      <div class="inq_wrap_select">
  	       <select class="inq_list_select">
  	          <option value="">
  	          	개선/제안
  	          </option>
  	          <option value="">
  	          	일반문의
  	          </option>
  	          <option value="">
  	          	제휴/협업 문의
  	          </option>
  	       
  	       </select>
  	      </div>
  	       
  	       <div class="inq_wrap_select" style="margin:0px 0px 0px 11px;">
  	       <select class="inq_list_select">
  	          <option value="">
  	          	web
  	          </option>
  	          <option value="">
  	          	안드로이드
  	          </option>
  	          <option value="">
  	          	아이폰
  	          </option>
  	       
  	       </select>
  	      </div>
  	     </dd>
  	     
  	   </dl>
  	   <dl class=inq_info_question>
  	    <dt>
  	     <label class=inq_lab_info for="email">이메일 주소 *</label>
  	    </dt>
  	   <dd>
  	     <div class="inq_wrap_item">
  	    <input autocomplete="off" class="inq_email_info"
  	    id="email" name="email" required="required"
  	    type="email" aria-required="true" placeholder="example@jamong.com">
  	     </div>
  	    </dd>
  	   </dl>
  	   <dl class=inq_info_question>
  	    <dt>
  	     <label class="inq_lab_info" for="phone">휴대폰 번호 *</label>
  	    </dt>
  	    <dd>
  	     <div class="inq_wrap_phone">
  	       +82
  	     </div>
  	     <input autocomplete="off" class="inq_nation" id="inpnationinfo"
  	      type="text" placeholder="01012345678" style="resize:none;">
  	    </dd>
  	   </dl>
  	   <dl class="inq_info_question">
  	    <dt>
  	     <label class="inq_lab_info" for="contents">
  	    	문의내용 *
  	     </label>
  	    </dt>
  	    <dd>
  	     <div class="inq_wrap_item2">
  	     	<textarea class="inq_inp_info2" cols="24" rows="6" id="contents"
  	     	name="contents" required="required" style="line-height: normal"
  	     	aria-required="true"></textarea>
  	     </div>
  	    </dd>
  	   </dl>
  	   <dl class="inq_info_question">
  	    <dt>
  	     <label class="inq_lab_info" for="infoFile" id="fileInputLabel">
  	     	파일첨부
  	     </label>
  	    </dt>
  	    <dd id="inq_file_list">
  	     <div class="inq_wrap_upload" id="fileinput">
  	      <span class="inq_text_placeholder">첨부파일 추가
  	      </span>
  	      <span class="inq_iso_cs"></span>
  	      <input class="inq_inp_file" id="infoFile" name="ieFile[]"
  	      type="file">
  	     </div>
  	     <div class="inq_wrap_upload">
  	      <strong class="inq_screen_out">업로드된 용량</strong>
  	      <span class="inq_info_range">
  	        <span class="inq_range_on" style="width:0%"></span>
  	      </span>
  	      <span class="inq_txt_upload">0MB</span>
  	     </div>
  	     <p class="inq_desc_info">
  	     첨부파일은 최대 5개, 10MB까지 등록 가능하며
  	     <br>
  	     파일 형식은 jpg, gif, psd, png, tif, zip, ms office, 아래한글(hwp), pdf 만 가능합니다.
  	     </p>
  	    </dd>
  	   </dl>
  	   <div class="inq_info_agree">
  	    <strong class="inq_tit_agree">개인정보 수집·이용에 대한 안내</strong>
  	    <p class="inq_desc_agree">
  	    필수 수집·이용 항목 (문의접수와 처리,회신을 위한 최소한의 개인정보입니다. 동의가 필요합니다 :)
  	    </p>
  	    <table class="inq_tbl_privacy">
  	     <colgroup>
  	      <col>
  	      <col>
  	      <col>  	     
  	     </colgroup>
  	     <thead>
  	      <tr>
  	       <th scope="col" style="width:254px">수집항목</th>
  	       <th scope="col" style="width:352px">목적</th>
  	       <th scope="col" style="width:251px">보유기간</th>
  	      </tr>
  	     </thead>
  	     <tbody>
  	      <tr>
  	       <td>이메일 주소, 휴대폰 번호</td>
  	       <td>
  	        고객문의 및 상담요청에 대한 회신,
  	        <br>
  	        상담을 위한 서비스 이용기록 조회
  	       </td>
  	       <td>문의 접수 후 3년간 보관</td>
  	      </tr>
  	     </tbody>
  	    </table>
  	    <p class="inq_desc_more">
  	    더 자세한 내용에 대해서는
  	    <a class="inq_link_more" href="../index.jsp"
  	    target="_blank">자몽 개인정보처리방침</a>
  	    을 참고하시기 바랍니다.
  	    </p>
  	    <div class="inq_wrap_check">
  	      <input class="inq_check_agreement" id="agree"
  	     name="agree" required="required" type="checkbox" aria-required="true">
  	      <label class="inq_lab_check" for="agree">
  	             위 내용에 동의합니다.
  	      </label> 
  	    </div>
  	   </div>
  	   <div class="inq_wrap_btn">
  	    <button class="inq_btn_cs" type="submit">문의접수
  	    </button>
  	   </div>
  	</fieldset>
  	</form>
  </div>
</article>





<%@ include file="../include/footer.jsp" %>