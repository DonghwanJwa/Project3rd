<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/my_info.css" />
<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/font.css"/>
<script src="/jamong.com/resources/js/jquery.js"></script>
<script src="/jamong.com/resources/js/my_info.js"></script>
</head>
<body>									
	<div id="my_info_main_wrap"><!-- 메인박스 -->
	<div id="my_info_main_wrap-2">
				<div id="my_info_main_div"><!-- 회원정보박스 -->
				<!-- tr이 열이고 th가 이름이고 td가 안쪽에 값들 -->
				<div id="my_info_h1_div"><h1 id="my_info_h1">기본 회원정보</h1></div>
				
				<div id="my_info_table">
				<table class="my_info_table n-table-row">
				<tbody id="my_info_tbody">
					<colgroup>
						<col style="width:150px">
						<col style="width:200px">
						
					</colgroup>
					<tr>
					<th scope="row" class="my_info_th">아이디</th>
					<td><p class="my_info_text" id="my_info_id">${vo.mem_id }</p></td>
					</tr>
					
					<tr>
					<th scope="row" class="my_info_th">이름</th>
					<td><p class="my_info_text" id="my_info_name" >${vo.mem_name }</p></td>
					</tr>
					
					<tr>
					<th scope="row" class="my_info_th">성별</th>
					<td><p class="my_info_text" id="my_info_gender">${vo.mem_gender }</p></td>
					</tr>
					
					<tr>
					<th scope="row" class="my_info_th">생년월일</th>
					<td><p class="my_info_text" id="my_info_birth">${vo.mem_birth1 }년 ${vo.mem_birth2 }월 ${vo.mem_birth3 }일</p></td> 
					</tr>
					
					<tr>
					<th scope="row" class="my_info_th">이메일</th>
					<td><p class="my_info_text" id="my_info_email">${vo.email_id }@${vo.email_domain }</p></td>
					</tr>
					
					<tr>
					<th scope="row" class="my_info_th">핸드폰번호</th>
					<td><p class="my_info_text" id="my_info_tel">${vo.mem_phone01 }-${vo.mem_phone02 }-${vo.mem_phone03 }</p></td>
					</tr>
					
					<tr>
					<th></th>
					<td><a href="/jamong.com/pass_modify"><button id="my_info_btn">회원정보수정</button></a></td>
					</tr>
					</tbody>
				</table>
				</div>

			<!-- 카테고리 -->
			<div id="my_info_category_container"><!-- 카테고리박스 -->
				<div id="my_info_category-wrap">
					<div id="my_info_category-frame">
						<b class="my_info_category-anoun">관심있는 카테고리를 선택해주세요.(최대 3개)</b>
						<ul id="my_info_category-list">
							<%-- 카테고리 입력되는란 --%>
						</ul>	
					</div>
				</div>
				<div class="my_info_button_container"><!-- 버튼박스 -->
					<button id="my_info_before_btn">수정하기</button>
			   </div>
			</div>  
			   </div>
		<!-- 링크를 눌렀을 때 메인 랩이  -->	   
		<div id="my_info_p_div">
			   <p class="my_info_p">- 아이디, 닉네임은 수정이 불가능합니다.</p>
			   <p class="my_info_p">- 이메일, 변경 시 반드시 인증을 거쳐야 합니다.</p>
			   <button id="my_info_leave">- 회원탈퇴</button>
		</div>
	</div>
</div>
		
		
		
		
		<!-- 회원탈퇴페이지 -->
<div id="my_info_layerLeave">
	<button class="img_ico link_close text_hide">닫기</button>
	<div id="my_info_pop">
		<h2 id="my_info_leave_h2">자몽 탈퇴하기</h2>
			<div id="my_info_desc">
			탈퇴하시면 이용 중인 자몽 내 서비스가 중지되며,<b>모든 데이터는 복구가 불가능합니다.</b><br>
			아래 사항을 확인하신 후에 신중하게 결정해주세요.
			</div>
			<ul>
			<li>
			<span class="my_info_dot"></span>
			작성한 글, 책, 첨부파일 등 모든 정보가 삭제됩니다.</li>
			<li>
			<span class="my_info_dot"></span>
			자몽 프로필 및 연결된 SNS 정보 등이 모두 삭제됩니다.</li>
			<li>
			<span class="my_info_dot"></span>
			현재 아이디로 자몽 주소를 다시 사용할 수 없습니다.</li>
			<li>
			<span class="my_info_dot"></span>
			작성한 댓글은 삭제되지 않고 남게 되오니 탈퇴 전 미리 확인하시기 바랍니다.</li>
			</ul>
			<textarea name="mem_Withdrawal_reason" id="my_info_leave_text_id" class="my_info_leave_text" rows="10" cols="60" placeholder="탈퇴사유를 적어주세요"></textarea>
			<div class="check_label_div">
			<input class="my_info_check" type="checkbox" name="agree" id="leaveagree">
			<label class="my_info_label_com">안내 사항을 모두 확인하였으며,이에 동의합니다.</label><br>
			<label class="my_info_label_com">*체크해주셔야 버튼이 활성화 됩니다</label>
			<div id="my_info_check_error"></div>
			</div>
			<button type="button" class="my_info_confirm_btn" id="leave_member" >탈퇴하기</button>
	</div>
</div>
		
		
		
		
		
		
		
</body>
</html>
<%@ include file="../include/footer.jsp"%>