package com.jamong.controller;

import java.io.PrintWriter;
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
			HttpServletRequest response,HttpServletRequest request) { // 로그인 페이지
		ModelAndView view = new ModelAndView();
		session = request.getSession();
		MemberVO m = (MemberVO)session.getAttribute("m");
		MemberVO vov = this.memberService.get(m.getMem_id());
		
		view.addObject("vo", vov);
		view.setViewName("jsp/my_info");
		return view;
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
		}
		return st.toString();
	}
	
	@RequestMapping("pass_modify")
	public ModelAndView user_pass_modify(MemberVO vo,HttpSession session,
			HttpServletRequest response,HttpServletRequest request) { // 로그인 페이지
		ModelAndView view = new ModelAndView();
		session = request.getSession();
		MemberVO m = (MemberVO)session.getAttribute("m");
		MemberVO vov = this.memberService.get(m.getMem_id());
		
		view.addObject("vo", vov);
		view.setViewName("jsp/pass_modify");
		return view;
	}
	//index페이지에서 내 설정을 누르면 하이퍼링크로 my_info로 넘어간다 넘어갈 때 my_info의 매핑을 타고 그 컨트롤러 안에 있는
	//메서드를 수행하고 리턴하는 값으로 넘어간다
	
	//자기 페이지의 매핑경로가 아닌 다른 페이지의 매핑경로에 정보를 보내면?
	
	//pass_modify에서 비밀번호 확인을 하면 pass_modify_ok를 거쳐서 member_modify로 가야한다
	//근데 지금은 pass_modify에서 확인을 하면 member_modify의 페이지에서 pass_modify_ok주소를 보여준다
	
	//pass_modify에서 submit을 하면 pass_modify의 정보를 pass_modify_ok에 보낸다  pass_modify_ok controller를
	//수행하고 리턴 값으로 맞으면 member_modify 틀리면 pass_modify로 와야 한다
	@RequestMapping("pass_modify_ok")
	public ModelAndView pass_login_ok(@ModelAttribute MemberVO m, 
			String pass_modify_id, String pass_modify_pass,
			HttpServletResponse response, HttpSession session, 
			HttpServletRequest request) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		session = request.getSession();
		PrintWriter out = response.getWriter();
		ModelAndView view = new ModelAndView();
		MemberVO session_m = (MemberVO) session.getAttribute("m");


			MemberVO ck = this.memberService.pwdcheck(pass_modify_id);
			//아이디를 기준으로 sql문에서 아이디를 조회해서 맞으면 그 아이디에 맞는 회원정보를 가져온 것을 담은 것이 ck
			if (ck != null) {// 비어 있지 않을때
				if (ck.getMem_pwd().equals(PwdChange.getPassWordToXEMD5String(pass_modify_pass))) {

					m.setMem_name(ck.getMem_name());
					//회원정보를 getMem_name으로 빼서 m 객체에 담는다
					m.setMem_birth1(ck.getMem_birth1());
					m.setMem_birth2(ck.getMem_birth2());
					m.setMem_birth3(ck.getMem_birth3());
					m.setMem_gender(ck.getMem_gender());
					m.setEmail_id(ck.getEmail_id());
					m.setEmail_domain(ck.getEmail_domain());
					m.setMem_phone01(ck.getMem_phone01());
					m.setMem_phone02(ck.getMem_phone02());
					m.setMem_phone03(ck.getMem_phone03());
					m.setMem_fav1(ck.getMem_fav1());
					m.setMem_fav2(ck.getMem_fav2());
					m.setMem_fav3(ck.getMem_fav3());
					
					System.out.println(m.getMem_name());
					view.addObject("mv", m);
					//m객체를 mv에 담고 view에 담는다
					//view를 리턴하면 jsp에서 view에 담긴 값들을 사용할수 있다
					view.setViewName("redirect:/member_modify");
					System.out.println(view);
					System.out.println(m);
					return view;
				}else {
					view.setViewName("redirect:/pass_modify");
					return view;
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
			HttpServletRequest response,HttpServletRequest request) { // 로그인 페이지
		ModelAndView view = new ModelAndView();
		session = request.getSession();
		
		MemberVO m = (MemberVO)session.getAttribute("m");
		MemberVO vov = this.memberService.get(m.getMem_id());
		
		view.addObject("vo", vov);
		view.setViewName("jsp/member_modify");
		return view;
	}

	@RequestMapping("member_modify_ok") //회원정보수정
	public ModelAndView member_modify_ok(MemberVO me,
			HttpSession session,HttpServletResponse response,
			HttpServletRequest request) throws Exception  {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MemberVO m = (MemberVO)session.getAttribute("m");//세션으로 엠키값을 객체로 가져온다
		me.setMem_no(m.getMem_no());//엠객체에서 넘버값을 가져와서 엠이값에 넘버값을 넘긴다
		me.setMem_pwd(PwdChange.getPassWordToXEMD5String(me.getMem_pwd()));//비밀번호를 암호화해서 넣는다
		this.memberService.memberUpdate(me);//엠이에 디비값을 담는다
		
		ModelAndView view = new ModelAndView();
		session.invalidate();//세션만료
	    view.setViewName("redirect:/login");
		return view;
	}//member_modify_ok()
	
	@RequestMapping("modify_emailcheck")//이메일 중복체크
	@ResponseBody
	public int member_emailcheck(String email, String domain, MemberVO m, HttpServletResponse response)throws Exception{
		
		m.setEmail_id(email);
		m.setEmail_domain(domain);
		MemberVO modify_email=this.memberService.mem_emailCheck(m);	//이메일 중복검색
		int re=-1;				//중복이메일이 없을 때
		if(modify_email != null) {	//중복이메일이 있을 때
			re=1;
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
		
		return MailService.send(subject, sb.toString(), "projectJamong@gmail.com", userEmail,null, request);
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
	
	//되면 이제 인풋들 검증하고 마지막에 비번 수정하고 버튼 클릭할때 문구 내주고 로그인으로
	@RequestMapping("find_id")
	public String user_find_id() { // 아이디 찾기 페이지
		
		return "jsp/find_id";
	}
	
	//비번을 바꾸려면 아이디나 이메일이 필요함
	@RequestMapping("find_pass_ok")
	public String user_pass_update(MemberVO vo) { // 비밀번호 수정

		vo.setMem_pwd(PwdChange.getPassWordToXEMD5String(vo.getMem_pwd()));
		System.out.println(vo.getMem_id());
		System.out.println(vo.getMem_pwd());
		this.memberService.pass_update(vo);
		return "jsp/login";
	}
	
	@RequestMapping("find_id_emailCert")//이메일 인증번호 체크
	@ResponseBody
	public boolean find_id_createEmailCheck(MemberVO vo,String name,String email,String domain, HttpServletRequest request){
		
		String userEmail = email + "@" + domain; //받는 사람 이메일 주소
		String Email = email;
		String Domain = domain;
		String Name = name;
		vo.setEmail_id(Email);
		vo.setEmail_domain(Domain);
		vo.setMem_name(Name);
		System.out.println(vo.getEmail_id());
		System.out.println(vo.getEmail_domain());
		System.out.println(vo.getMem_name());
		MemberVO member = this.memberService.memberSelect_id(vo);
		vo.setMem_id(member.getMem_id());
		//회원정보를 가져와야 한다
		HttpSession session = request.getSession(true);		
		String authCode = String.valueOf(vo.getMem_id());				//생성한 값을 어스코드에 담고
		session.setAttribute("authCode", authCode);			//세션에 인증번호값 저장
		
		String subject = "JAMONG 아이디 찾기";
		StringBuilder sb = new StringBuilder();
		sb.append("<h3 style=\"font-weight:normal\">안녕하세요. 자몽입니다.<br/>");
		sb.append("귀하의 아이디는 </h3><h2>" + authCode + "</h2><h3 style=\"font-weight:normal\">입니다.<br/>");
		sb.append("해당 아이디로 로그인해주세요.<br/>");
		sb.append("감사합니다.</h3>");
		
		return MailService.send(subject, sb.toString(), "projectJamong@gmail.com", userEmail,null, request);
	}

	@RequestMapping("find_pass_emailCert")//이메일 인증번호 체크
	@ResponseBody
	public boolean find_pass_createEmailCheck(MemberVO vo,String id,String name,String email,String domain, HttpServletRequest request){
		
		String userEmail = email + "@" + domain; //받는 사람 이메일 주소
		String Email = email;
		String Domain = domain;
		String Name = name;
		String Id = id;
		vo.setEmail_id(Email);
		vo.setEmail_domain(Domain);
		vo.setMem_name(Name);
		vo.setMem_id(Id);
		System.out.println(vo.getEmail_id());
		System.out.println(vo.getEmail_domain());
		System.out.println(vo.getMem_name());
		MemberVO member = this.memberService.memberSelect_pwd(vo);
		//가지고 나온 비번이 암호화 되어 있다. 그럼 암호화를 풀고 원래 비번으로 바꿔서 담아야 한
		//회원정보를 가져와야 한다
		int ran = new Random().nextInt(900000) + 100000;	//100000~999999
		HttpSession session = request.getSession(true);		
		String authCode = String.valueOf(ran);				//생성한 값을 어스코드에 담고
		session.setAttribute("authCode", authCode);			//세션에 인증번호값 저장
		
		String subject = "JAMONG 비밀번호 찾기";
		StringBuilder sb = new StringBuilder();
		sb.append("<h3 style=\"font-weight:normal\">안녕하세요. 자몽입니다.<br/>");
		sb.append("귀하의 비밀번호는 </h3><h2>" + authCode + "</h2><h3 style=\"font-weight:normal\">입니다.<br/>");
		sb.append("해당 비밀번호로 로그인해주세요.<br/>");
		sb.append("감사합니다.</h3>");
		
		return MailService.send(subject, sb.toString(), "projectJamong@gmail.com", userEmail,null, request);
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
	
}//MemberModifyController


















