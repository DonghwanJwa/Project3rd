package com.jamong.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.CategoryVO;
import com.jamong.domain.MemberVO;
import com.jamong.service.CategoryService;
import com.jamong.service.MemberService;

import mailHandler.MailService;
import pwdconv.PwdChange;

@Controller
public class MemberModifyController {

	
	
	// my_info페이지 접속 안되면 프로젝트에서 클린 한번하고 다시 접속하기
	// jsp에서 name값이 있어야 값을 가져올수 있다. 없다면 값을 가져올수 없다.
	
	@Autowired
	private MailService MailService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("my_info")
	public ModelAndView myinfo(@ModelAttribute MemberVO vo,HttpSession session,
			HttpServletResponse response,HttpServletRequest request) throws Exception { // 로그인 페이지
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		ModelAndView view = new ModelAndView();
		session = request.getSession();
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		if(adm_m == null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '로그인이 필요합니다!',\r\n" + 
					"		allowOutsideClick: false,\r\n" +
					"		icon: 'error',\r\n" + 
					"		showCancelButton : true,\r\n" + 
					"		confirmButtonText : '로그인',\r\n" + 
					"		cancelButtonText : '메인으로'\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/login';\r\n" + 
					"			}else if(result.dismiss === Swal.DismissReason.cancel) {\r\n" + 
					"				location='/jamong.com/';\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
		}else {
			MemberVO vov = this.memberService.get(adm_m.getMem_id());
			view.addObject("vo", vov);
			view.setViewName("jsp/my_info");
			return view;
			
		}
		return null;
	}
	
	/* 내정보 페이지에서 카테고리 선택되어진것을 토글처리되어진 상태로 보여주기 위한 메서드
	 *  원래 AJAX를 사용하여 javascript로 가져온 데이터만으로 처리하려고 하였으나, text로만들어진 span,input 태그들을
	 *  html형식으로 jsp페이지에 붙이면(append) javascript가 class,name등을 완전히 페이지가 로딩될때까지
	 *  인식하지 못함. 따라서 선택되어진 상태의 html을 controller에서 작성하여 처리(물론 분기분을 나눠서 선택된것까지 표현)
	 *  
	 *   # 주의 : Mapping에 produces에 text 및 charset을 지정하지 않으면 한글이 모두 물음표 표시가됨
	 *   그냥 기술적으로 안되는걸 물리적으로 찍어 눌러버렸다..
	 */ 
	@RequestMapping(value = "/member_fav", produces = "application/text; charset=utf8")
	@ResponseBody
	public String member_fav(HttpServletResponse response,HttpServletRequest request,
		HttpSession session)throws Exception {
		session=request.getSession();
		MemberVO m = (MemberVO)session.getAttribute("m");
		int mem_no = m.getMem_no();
		
		MemberVO v = this.memberService.getMemberFav(mem_no);
		List<CategoryVO> clist = this.categoryService.listCategory();
		StringBuilder st = new StringBuilder();
		for(int i=0;i<clist.size();i++) {
			if(v!=null) {
				if(clist.get(i).getCat_name().equals(v.getMem_fav1())) {
					st.append("<li class=\"my_info_category-item member_category_check\">");
					st.append("<span class=\"my_info_category-span\">");
					st.append(clist.get(i).getCat_name());
					st.append("</span>");
					st.append("<input type=\"hidden\" class=\"member_fav1\" name=\"mem_fav1\" value=\"");
					st.append(clist.get(i).getCat_name()+"\"/>");
					st.append("</li>");
				}else if(clist.get(i).getCat_name().equals(v.getMem_fav2())) {
					st.append("<li class=\"my_info_category-item member_category_check\">");
					st.append("<span class=\"my_info_category-span\">");
					st.append(clist.get(i).getCat_name());
					st.append("</span>");
					st.append("<input type=\"hidden\" class=\"member_fav2\" name=\"mem_fav2\" value=\"");
					st.append(clist.get(i).getCat_name()+"\"/>");
					st.append("</li>");
				}else if(clist.get(i).getCat_name().equals(v.getMem_fav3())) {
					st.append("<li class=\"my_info_category-item member_category_check\">");
					st.append("<span class=\"my_info_category-span\">");
					st.append(clist.get(i).getCat_name());
					st.append("</span>");
					st.append("<input type=\"hidden\" class=\"member_fav3\" name=\"mem_fav3\" value=\"");
					st.append(clist.get(i).getCat_name()+"\"/>");
					st.append("</li>");
				}else {
					st.append("<li class=\"my_info_category-item\">");
					st.append("<span class=\"my_info_category-span\">");
					st.append(clist.get(i).getCat_name());
					st.append("</span>");
					st.append("<input type=\"hidden\" value=\""+clist.get(i).getCat_name()+"\"/>");
					st.append("</li>");
				}
			}else {
			st.append("<li class=\"my_info_category-item\">");
			st.append("<span class=\"my_info_category-span\">");
			st.append(clist.get(i).getCat_name());
			st.append("</span>");
			st.append("<input type=\"hidden\" value=\""+clist.get(i).getCat_name()+"\"/>");
			st.append("</li>");
			}
		}
		return st.toString();
	}
	
	//index페이지에서 내 설정을 누르면 하이퍼링크로 my_info로 넘어간다 넘어갈 때 my_info의 매핑을 타고 그 컨트롤러 안에 있는
	//메서드를 수행하고 리턴하는 값으로 넘어간다
	
	//자기 페이지의 매핑경로가 아닌 다른 페이지의 매핑경로에 정보를 보내면?
	
	//pass_modify에서 비밀번호 확인을 하면 pass_modify_ok를 거쳐서 member_modify로 가야한다
	//근데 지금은 pass_modify에서 확인을 하면 member_modify의 페이지에서 pass_modify_ok주소를 보여준다
	
	//pass_modify에서 submit을 하면 pass_modify의 정보를 pass_modify_ok에 보낸다  pass_modify_ok controller를
	//수행하고 리턴 값으로 맞으면 member_modify 틀리면 pass_modify로 와야 한다
	@RequestMapping("pass_modify_ok")
	public String pass_login_ok(MemberVO m, 
			String pass_modify_id, String pass_modify_pass,
			HttpServletResponse response, HttpSession session, 
			HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session = request.getSession();
		MemberVO session_m = (MemberVO) session.getAttribute("m");
		if(session_m == null) {	//로그인이 되어있지 않으면
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		icon : 'info',\r\n" +
					"		title : 'Oops!',\r\n" + 
					"		text : '로그인이 필요합니다. 로그인 하시겠습니까?',\r\n" + 
					"		allowOutsideClick: false,\r\n" +
					"		icon: 'error',\r\n" + 
					"		showCancelButton : true,\r\n" + 
					"		confirmButtonText : '예',\r\n" + 
					"		cancelButtonText : '아니오'\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/login';\r\n" + 
					"			}else if(result.dismiss === Swal.DismissReason.cancel) {\r\n" + 
					"				location='/jamong.com/';\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
			return null;
		}else {
			MemberVO ck = this.memberService.pwdcheck(pass_modify_id);
			//아이디를 기준으로 sql문에서 아이디를 조회해서 맞으면 그 아이디에 맞는 회원정보를 가져온 것을 담은 것이 ck
			if (ck == null) {	//검색이 되지 않으면
				//회원정보 변경하러 들어가는데 아이디가 맞지 않는다는것은
				//1. 회원정보를 불러올때 이상이 생긴것
				//2. 회원이 직접적으로 html을 수정하여 아이디를 바꾼것
				//으로 볼 수 있다.
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Error!',\r\n" + 
						"		text : '잘못된 접근입니다!',\r\n" + 
						"		allowOutsideClick: false,\r\n" +
						"		icon: 'error',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				history.back();\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
			}else {	//검색되고
				if (ck.getMem_pwd().equals(PwdChange.getPassWordToXEMD5String(pass_modify_pass))) {
					return "redirect:/member_modify";
				}else {	//비번이 틀리면
					session.setAttribute("modify_fail", "fail");
					return "redirect:/pass_modify";
				}
			}
		}
		return null;
	}// pass_login_ok
			
			
	// 회원가입 페이지에서 폼으로 회원가입ok로 보낸다 맞으면 로그인을 보내고 아니면 
	
	//회원번호값은 session에 담겨있다.
	//vo로 파라미터값과 디비값을 비교하고 m에 있는 no값을 where절로 비교한다
	//세션에 있는 m을 객체 m을 생성
	//update sql은 리턴값이 없다  중요함!!
	//me.setMem_no(mem.getMem_no());
	//테이블 컬럼명 + vo변수명 + jsp name값 일치해야
	//세션 유효성 검증 
	//회원정보가 쿼리문을 수행해서 업데이트가 되어서  up에 담기면 수정된 회원정보를 다시 세션에 담아줘야 한다?
	//업데이트문을 쓰면 수정한 정보값으로 바뀌고 그걸 다시 셀렉트해서 가져오면 바뀐 값으로 사용이 가능하다
	//그런데 이렇게 업데이트된 새션으로 바꿔버리면 새로운 새션을 얻게되는데
	//기존에 있던 새션은 사라지나? 위에 입력한 것만으로 가능한건가? 질문하기
	//회원정보가 업데이트가 되면 새션을 바꿔주라고 했는데 맞는건지
	//세션에 있는 m값이 존재하는지, 웹이 켜지면 세션은 항상 존재함 세션 안에 m이 있는지 없는지 확인을 해야함

	
	@RequestMapping("member_modify")
	public ModelAndView user_member_modify(MemberVO vo,HttpSession session,
			HttpServletResponse response,HttpServletRequest request) throws Exception { // 로그인 페이지
		ModelAndView view = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		session = request.getSession();
		PrintWriter out = response.getWriter();
		MemberVO session_m = (MemberVO)session.getAttribute("m");

		if(session_m == null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '로그인이 필요합니다!',\r\n" + 
					"		allowOutsideClick: false,\r\n" +
					"		icon: 'error',\r\n" + 
					"		showCancelButton : true,\r\n" + 
					"		confirmButtonText : '로그인',\r\n" + 
					"		cancelButtonText : '메인으로'\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/login';\r\n" + 
					"			}else if(result.dismiss === Swal.DismissReason.cancel) {\r\n" + 
					"				location='/jamong.com/';\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
		}else {
			MemberVO vov = this.memberService.get(session_m.getMem_id());
			view.addObject("vo", vov);
			view.setViewName("jsp/member_modify");
			return view;
		}
		return null;
	}


	@RequestMapping("pass_modify")
	public ModelAndView user_pass_modify(MemberVO vo,HttpSession session,
			HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		MemberVO session_m = (MemberVO)session.getAttribute("m");
		String fail = (String)session.getAttribute("modify_fail");
		if(fail!=null) {
			view.addObject("modify_fail",fail);
			session.removeAttribute("login_fail");
		}
		
		if(session_m == null	) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '로그인이 필요합니다!',\r\n" + 
					"		allowOutsideClick: false,\r\n" +
					"		icon: 'error',\r\n" + 
					"		showCancelButton : true,\r\n" + 
					"		confirmButtonText : '로그인',\r\n" + 
					"		cancelButtonText : '메인으로'\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/login';\r\n" + 
					"			}else if(result.dismiss === Swal.DismissReason.cancel) {\r\n" + 
					"				location='/jamong.com/';\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
		}else {
			MemberVO vov = this.memberService.get(session_m.getMem_id());
			view.addObject("vo", vov);
			view.setViewName("jsp/pass_modify");
			return view;
		}
			return null;
	}
	
	
	
	//되면 이제 인풋들 검증하고 마지막에 비번 수정하고 버튼 클릭할때 문구 내주고 로그인으로
	@RequestMapping("find_id")
	public String user_find_id(MemberVO vo,HttpSession session,
			HttpServletRequest request,HttpServletResponse response)throws Exception { // 아이디 찾기 페이지
		session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		MemberVO m = (MemberVO)session.getAttribute("m");
		
		if(m != null) {//세션이 있으면 뒤로
			out.println("<script>");
			out.println("history.back();");
			out.println("</script>");
		}else {
			return "jsp/find_id";
		}
		return null;
	}
	
	@RequestMapping("member_modify_ok") //회원정보수정
	public String member_modify_ok(MemberVO me,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception  {
		response.setContentType("text/html;charset=UTF-8");
		session = request.getSession();
		PrintWriter out = response.getWriter();
		MemberVO m = (MemberVO)session.getAttribute("m");//세션으로 엠키값을 객체로 가져온다
		if(m==null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '로그인이 필요합니다!',\r\n" + 
					"		allowOutsideClick: false,\r\n" +
					"		icon: 'error',\r\n" + 
					"		showCancelButton : true,\r\n" + 
					"		confirmButtonText : '로그인',\r\n" + 
					"		cancelButtonText : '메인으로'\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/login';\r\n" + 
					"			}else if(result.dismiss === Swal.DismissReason.cancel) {\r\n" + 
					"				location='/jamong.com/';\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
		}else{
			HashMap<String,Object> bm = new HashMap<>();
			if(me.getMem_pwd()==null) {
				
			}else {
				me.setMem_pwd(PwdChange.getPassWordToXEMD5String(me.getMem_pwd()));
			}
			bm.put("me",me);
			me.setMem_no(m.getMem_no());//세션에서 넘버값을 가져와서 엠이값에 넘버값을 넘긴다
			int re = this.memberService.memberUpdate(bm);//엠이에 디비값을 담는다
			if(re >0) {
				MemberVO dm=this.memberService.loginCheck(m.getMem_id());
				m.setMem_phone01(dm.getMem_phone01());
				m.setMem_phone02(dm.getMem_phone02());
				m.setMem_phone03(dm.getMem_phone03());
				m.setEmail_id(dm.getEmail_id());
				m.setEmail_domain(dm.getEmail_domain());
				
				if(dm.getMem_state()==9) {	//관리자일경우 이름값을 저장 ->관리자페이지에서 필요하여 넣었습니다.
					m.setMem_name(dm.getMem_name());
				}
				session.setAttribute("m", m);
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Success!',\r\n" + 
						"		text : '회원정보가 성공적으로 수정되었습니다!',\r\n" + 
						"		allowOutsideClick: false,\r\n" +
						"		icon: 'success',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				location='my_info';\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
			}else{
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Error!',\r\n" + 
						"		text : '처리중 오류가 발생했습니다!',\r\n" + 
						"		allowOutsideClick: false,\r\n" +
						"		icon: 'error',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				location='my_info';\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
			}
		}
		return null;
	}//member_modify_ok()
	
	@RequestMapping("modify_emailcheck")//이메일 중복체크
	@ResponseBody
	public int member_emailcheck(String email, String domain, MemberVO m, HttpServletResponse response)throws Exception{
		
		m.setEmail_id(email);
		m.setEmail_domain(domain);
		MemberVO modify_email=this.memberService.mem_emailCheck(m);	//이메일 중복검색
		int re=1;				//중복이메일이 없을 때
		if(modify_email != null) {	//중복이메일이 있을 때
			re=-1;
		}
		return re;
	}//member_idcheck()
	
	
	//지금 한건 입력한 메일 주소로 메일을 발송하는건데
	//문제는 회원정보를 담아서 보내야 한다 그럴러면 회원정보를 먼저 가져와야한다
	@RequestMapping("modify_emailCert")//이메일 인증번호 체크
	@ResponseBody
	public boolean createEmailCheck(String email,String domain, HttpServletRequest request){
		
		String userEmail = email + "@" + domain; //받는 사람 이메일 주소
		
		//이메일 인증
		int ran = new Random().nextInt(900000) + 100000;	//100000~999999 인증번호 랜덤 생성
		HttpSession session = request.getSession(true);		
		String authCode = String.valueOf(ran);				//생성한 값을 어스코드에 담고
		session.setAttribute("authCode", authCode);			//세션에 인증번호값 저장
		
		String subject = "회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("<h3 style=\"font-weight:normal\">안녕하세요. 자몽입니다.<br/>");
		sb.append("귀하의 인증 코드는 </h3><h2>" + authCode + "</h2><h3 style=\"font-weight:normal\">입니다.<br/>");
		sb.append("해당 코드를 인증란에 입력해주시기 바랍니다.<br/>");
		sb.append("감사합니다.</h3>");
		
		return MailService.send(subject, sb.toString(), "root-context에 입력된 구글 이메일을 입력하세요", userEmail,null, request);
	}

	@RequestMapping("modify_emailCert_ok")
	@ResponseBody
	public ResponseEntity<String> emailAuth(String authCode, HttpSession session){
		String originalRandom = (String)session.getAttribute("authCode");
		if( originalRandom.equals(authCode)) {
			return new ResponseEntity<String>("complete", HttpStatus.OK);			
		}else {
			return new ResponseEntity<String>("false", HttpStatus.OK);
		}
	}
	
	//비번을 바꾸려면 아이디나 이메일이 필요함
	@RequestMapping("find_pass_ok")
	public String user_pass_update(MemberVO vo,HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception { // 비밀번호 수정
		response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			session=request.getSession();
			vo.setMem_pwd(PwdChange.getPassWordToXEMD5String(vo.getMem_pwd()));
			this.memberService.pass_update(vo);
			session.setAttribute("authCode", "");	
			session.setAttribute("loginmain","/jamong.com/");
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Success!',\r\n" + 
					"		text : '비밀번호 수정이 완료되었습니다',\r\n" + 
					"		allowOutsideClick: false,\r\n" +
					"		icon: 'success',\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/login';\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
		return null;
	}
	
	@RequestMapping("find_id_emailCert")//이메일 인증번호 체크
	@ResponseBody
	public int find_id_createEmailCheck(MemberVO vo,String name,String email,String domain, HttpServletRequest request){
		String userEmail = email + "@" + domain; //받는 사람 이메일 주소
		vo.setEmail_id(email);
		vo.setEmail_domain(domain);
		vo.setMem_name(name);
		int re = -1;	//아이디찾기 성공유무 판단 flag
		MemberVO member = this.memberService.memberSelect_id(vo);
		if(member==null) {
			//입력한 아이디와 이메일로 검색이 되지 않을때 해당 정보가 없음을 알려주는 -1값 유지
		}else {
			String subject = "JAMONG 아이디 찾기";
			StringBuilder sb = new StringBuilder();
			sb.append("<h3 style=\"font-weight:normal\">안녕하세요. 자몽입니다.<br/>");
			sb.append("귀하의 아이디는 </h3><h2>" + member.getMem_id() + "</h2><h3 style=\"font-weight:normal\">입니다.<br/>");
			sb.append("해당 아이디로 로그인해주세요.<br/>");
			sb.append("감사합니다.</h3>");
			if(MailService.send(subject, sb.toString(), "root-context에 입력된 구글 이메일을 입력하세요", userEmail,null, request)) {
				//메일전송이 잘 되었으면
				re = 1;
			}else {
				//이메일 전송이 실패하면
				re =-2;
			}
		}
		return re;
	}

	@RequestMapping("find_pass_emailCert")//이메일 인증번호 체크
	@ResponseBody
	public int find_pass_createEmailCheck(MemberVO vo,String id,String name,String email,String domain, HttpServletRequest request){
		String userEmail = email + "@" + domain; //받는 사람 이메일 주소
		vo.setEmail_id(email);
		vo.setEmail_domain(domain);
		vo.setMem_name(name);
		vo.setMem_id(id);
		
		MemberVO pwd = this.memberService.memberSelect_pwd(vo);
		int re = -1; //이메일 인증 성공여부 flag
		if(pwd == null) {
			//입력한 아이디와 이름, 이메일로 검색이 되지 않을때 해당 정보가 없음을 알려주는 -1값 유지
		}else {
			int ran = new Random().nextInt(900000) + 100000;	//100000~999999
			HttpSession session = request.getSession(true);		
			String authCode = String.valueOf(ran);				//생성한 값을 어스코드에 담고
			session.setAttribute("authCode", authCode);			//세션에 인증번호값 저장
			
			String subject = "JAMONG 비밀번호 찾기";
			StringBuilder sb = new StringBuilder();
			sb.append("<h3 style=\"font-weight:normal\">안녕하세요. 자몽입니다.<br/>");
			sb.append("귀하의 비밀번호는 </h3><h2>" + authCode + "</h2><h3 style=\"font-weight:normal\">입니다.<br/>");
			sb.append("해당 코드를 인증란에 입력해주시기 바랍니다.<br/>");
			sb.append("감사합니다.</h3>");
			
			if(MailService.send(subject, sb.toString(), "root-context에 입력된 구글 이메일을 입력하세요", userEmail,null, request)) {
				re=1;
			}else {
				re=-2;
			}
		}
		return re;
	}
	
	@RequestMapping("find_pass_emailCert_ok")
	@ResponseBody
	public ResponseEntity<String> pass_emailAuth(String authCode, HttpSession session){
		
		String originalRandom = (String)session.getAttribute("authCode");
		if( originalRandom.equals(authCode)) {
			return new ResponseEntity<String>("complete", HttpStatus.OK);			
		}else {
			return new ResponseEntity<String>("false", HttpStatus.OK);
		}
	}
	
	@RequestMapping("Withdrawal_ok") //회원탈퇴
	@ResponseBody
	public int member_update(MemberVO vo,String my_info_leave_text_id,
			HttpSession session,HttpServletResponse response,
			HttpServletRequest request) throws Exception  {
		
		MemberVO m = (MemberVO)session.getAttribute("m");//세션으로 엠키값을 객체로 가져온다
		MemberVO vov=this.memberService.get(m.getMem_id());
		
		int re = 0;
		if(vov == null) {
			 re = 2;
			 
		}else { 
			vo.setDrop_cont(my_info_leave_text_id);
			vo.setMem_no(m.getMem_no());//엠객체에서 넘버값을 가져와서 엠이값에 넘버값을 넘긴다
			this.memberService.mem_update_del(vo);//엠이에 디비값을 담는다
			re = 1;
			session.invalidate();
		}
		return re;
	}//member_update()
	
	@RequestMapping("cat_modify_ok")
	@ResponseBody
	public int cat_update(MemberVO vo,HttpSession session,String mem_fav1,String mem_fav2,String mem_fav3,HttpServletRequest request) throws Exception {
		session = request.getSession();
		MemberVO me = (MemberVO)session.getAttribute("m");//세션으로 엠키값을 객체로 가져온다
		int re = 0;
		
		if(me != null) {
			re = 1;
			vo.setMem_no(me.getMem_no());
			vo.setMem_fav1(mem_fav1);
			vo.setMem_fav2(mem_fav2);
			vo.setMem_fav3(mem_fav3);
			this.memberService.cat_update(vo);
			me.setMem_fav1(mem_fav1);
			me.setMem_fav2(mem_fav2);
			me.setMem_fav3(mem_fav3);
			
			session.setAttribute("m", me);
		}else {
			re= 2;
		}
		return re;
	}
	
}//MemberModifyController


















