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
					<td><a href="/jamong.com/pass_modify"><button id="my_info_btn">수정하기</button></a></td>
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
					<button id="my_info_next_btn">돌아가기</button>
			   </div>
			</div>  
			   </div>
			   
			   <p class="my_info_p">-아이디, 닉네임은 수정이 불가능합니다.</p>
			   <p class="my_info_p">-이메일, 변경 시 반드시 인증을 거쳐야 합니다.</p>
			   </div>
		</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>