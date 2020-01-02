package com.jamong.controller;


import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.BoardVO;
import com.jamong.domain.MemberVO;
import com.jamong.domain.SubscribeVO;
import com.jamong.service.BoardService;
import com.jamong.service.BookService;
import com.jamong.service.MemberService;
import com.jamong.service.SubscribeService;
import com.oreilly.servlet.MultipartRequest;

import mailHandler.MailService;
import pwdconv.PwdChange;
import timeChanger.TIME_MAXIMUM;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private BookService bookService;
	@Autowired
	private MailService mailService;
	@Autowired
	private SubscribeService subService;
	
	@RequestMapping("login")
	public String user_login(Model mo,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session)throws Exception { // 로그인 페이지
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session=request.getSession();
		MemberVO m = (MemberVO)session.getAttribute("m");
		String pv = (String)session.getAttribute("loginmain");
		String prev = (String)session.getAttribute("ref");
		String fail = (String)session.getAttribute("login_fail");
		String fail_id = (String)session.getAttribute("fail_id");
		if(fail!=null) {
			mo.addAttribute("login_fail",fail);
			session.removeAttribute("login_fail");
		}
		if(fail_id!=null) {
			mo.addAttribute("fail_id",fail_id);
			session.removeAttribute("fail_id");
		}

		if(m != null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '이미 로그인이 되어있습니다!',\r\n" + 
					"		icon: 'warning',\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/';\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
		}else {		
			if(pv==null) {//이전단계가 회원가입이 아니였을 경우
				String ref = request.getHeader("Referer");
				if(ref==null) {//이전페이지가 없을경우
					session.setAttribute("ref","/jamong.com/");
				}else {//이전페이지가 있을경우
					if(prev==null) {	//이전페이지가 저장되어있지 않은 경우
						session.setAttribute("ref", ref);
					}else {
						session.setAttribute("ref", prev);
					}
				}
			}else {//이전단계가 회원가입이였을 경우
				session.setAttribute("ref","/jamong.com/");
				session.removeAttribute("loginmain");
			}
			return "jsp/login";
		}
		return null;
	}
	
	@RequestMapping("login_ok")
	public String member_login_ok(String login_id, String login_pwd,MemberVO m,Model mv,
			HttpServletResponse response,HttpServletRequest request,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		session.setMaxInactiveInterval(120*60);		//세션 유지시간 2시간
		MemberVO mem_m = (MemberVO)session.getAttribute("m");
		String redirectUrl = (String)session.getAttribute("ref");
		
		String result = null;
		if(mem_m != null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '이미 로그인이 되어있습니다!',\r\n" + 
					"		icon: 'warning',\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/';\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
			return null;
		}else {			
			MemberVO dm=this.memberService.loginCheck(login_id);//로그인 인증
			if(dm==null) {		//일치하는 회원정보가 없을 때
				session.setAttribute("login_fail","fail");
				session.setAttribute("fail_id",login_id);
				result = "redirect:/login";
			}else {		//일치하는 회원정보가 있을 때
				if(dm.getMem_state()==1) {	//정지 회원일 때
					session.removeAttribute("ref");
					out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
							"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
							"<body>\r\n" + 
							"<script>\r\n" + 
							"Swal.fire({\r\n" + 
							"		icon : 'warning',\r\n" +
							"		title : 'Block!',\r\n" + 
							"		text : '자몽 정책에 위배되는 활동으로 인해 정지된 계정입니다. \\n자세한 사항은 문의를 통해 확인하여 주시기 바랍니다.',\r\n" +
							"		showCancelButton : true,\r\n" +
							"		cancelButtonText : '문의하기',\r\n" +
							"		confirmButtonText : '메인으로',\r\n" +
							"		}).then((result) => {\r\n" +
							"		if(result.value){\r\n" +
							"			window.location.replace('/jamong.com/');\r\n" +						
							"		}else if(result.dismiss === Swal.DismissReason.cancel){\r\n" +
							"			window.location.replace('/jamong.com/inquire');\r\n" +
							"		}\r\n" +
							"		});\r\n" + 
							"</script>\r\n" + 
							"</body>");
				}else if(dm.getMem_state()==2){ //탈퇴 회원일 때
					session.setAttribute("login_fail","fail");
					session.setAttribute("fail_id",login_id);
					result = "redirect:/login";
				}else {
					if(dm.getMem_pwd().equals(PwdChange.getPassWordToXEMD5String(login_pwd))){
						m.setMem_no(dm.getMem_no());
						m.setMem_id(dm.getMem_id());
						m.setMem_nickname(dm.getMem_nickname());
						m.setMem_author(dm.getMem_author());
						m.setMem_state(dm.getMem_state());
						m.setProfile_photo(dm.getProfile_photo());
						m.setMem_fav1(dm.getMem_fav1());
						m.setMem_fav2(dm.getMem_fav2());
						m.setMem_fav3(dm.getMem_fav3());
						m.setMem_phone01(dm.getMem_phone01());
						m.setMem_phone02(dm.getMem_phone02());
						m.setMem_phone03(dm.getMem_phone03());
						m.setEmail_id(dm.getEmail_id());
						m.setEmail_domain(dm.getEmail_domain());
						
						if(dm.getMem_state()==9) {	//관리자일경우 이름값을 저장 ->관리자페이지에서 필요하여 넣었습니다.
							m.setMem_name(dm.getMem_name());
						}
						session.setAttribute("m", m);
						session.removeAttribute("ref");
						result = "redirect:"+redirectUrl;
					}else { //비밀번호가 틀렸을때
						session.setAttribute("login_fail","fail");
						session.setAttribute("fail_id",login_id);
						result = "redirect:/login";
					}
				}
			}
		}
		return result;
	}//member_login_ok()
	
	@RequestMapping("logout")
	public String member_logout(HttpSession session)throws Exception {
		session.invalidate();//세션만료
		return "redirect:/";
	}
	@RequestMapping("join_membership")
	public String user_membership(MemberVO vo,HttpSession session,
			HttpServletRequest request,HttpServletResponse response)throws Exception { // 회원가입
		session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		MemberVO m = (MemberVO)session.getAttribute("m");
		
		if(m != null) {//세션이 있으면 뒤로
			out.println("<script>");
			out.println("history.back();");
			out.println("</script>");
		}else {
			return "jsp/join_membership";
		}
		
		return null;
	}
	
	@RequestMapping("join_membership_idcheck")
	@ResponseBody
	public int member_idcheck(String id, HttpServletResponse response)throws Exception{
		
		MemberVO check_id=this.memberService.idCheck(id);	//아이디 중복검색
		int re=-1;//중복아이디가 없을때 반환값
		if(check_id != null) {//중복아이디가 있을때
			re=1;
		}else {
			re=2;
		}
		return re;
	}//member_idcheck() 
	
	@RequestMapping("join_membership_emailcheck")
	@ResponseBody
	public int member_emailcheck(String email, String domain, MemberVO m, HttpServletResponse response)throws Exception{
		
		m.setEmail_id(email);
		m.setEmail_domain(domain);
		MemberVO check_id=this.memberService.emailCheck(m);	//이메일 중복검색
		int re=-1;				//중복이메일이 없을 때
		if(check_id != null) {	//중복이메일이 있을 때
			re=1;
		}
		return re;
	}//member_idcheck()
	
	@RequestMapping("join_emailCert")
	@ResponseBody
	public boolean createEmailCheck(String email,String domain, HttpServletRequest request){
		
		
		String userEmail = email + "@" + domain;
		
		//이메일 인증
		int ran = new Random().nextInt(900000) + 100000;	//100000~999999
		HttpSession session = request.getSession(true);		
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);			//세션에 인증번호값 저장
		
		String subject = "회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("<h3 style=\"font-weight:normal\">안녕하세요. 자몽입니다.<br/>");
		sb.append("귀하의 인증 코드는 </h3><h2>" + authCode + "</h2><h3 style=\"font-weight:normal\">입니다.<br/>");
		sb.append("해당 코드를 인증란에 입력해주시기 바랍니다.<br/>");
		sb.append("감사합니다.</h3>");
		
		return mailService.send(subject, sb.toString(), "projectJamong@gmail.com", userEmail, null, request);
	}

	@RequestMapping("join_emailCert_ok")
	@ResponseBody
	public ResponseEntity<String> emailAuth(String authCode, HttpSession session){
		String originalRandom = (String)session.getAttribute("authCode");
		if( originalRandom.equals(authCode)) {
			return new ResponseEntity<String>("complete", HttpStatus.OK);			
		}else {
			return new ResponseEntity<String>("false", HttpStatus.OK);
		}
	}
	
	@RequestMapping("join_membership_ok")
	public String user_membership_ok(MemberVO m,HttpServletRequest request, 
			HttpServletResponse response,HttpSession session) throws Exception {//회원가입에서 가입하기 버튼 클릭 시
		session=request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String saveFolder = request.getRealPath("/resources/upload");//프로필 이미지 저장 경로
		/*c:\spring_work\.metadata\.plugins\org.eclipse.wst.server.core\
		 * 	tmp0\wtbwebapps\project\resources\ upload\profile
		 */ 
		
		int fileSize = 100*1024*1024;			//첨부파일 최대크기 (100M)
		MultipartRequest multi=null;			//첨부파일을 가져오는 api
		multi = new MultipartRequest(request,saveFolder,fileSize,"UTF-8");//post 요청을 multi에 저장
		//입력값들을 multi로부터 가져옴
		String mem_id = multi.getParameter("mem_id");
		String mem_pwd = multi.getParameter("mem_pwd");
		String mem_name = multi.getParameter("mem_name");
		String mem_birth1 = multi.getParameter("mem_birth1");
		String mem_birth2 = multi.getParameter("mem_birth2");
		String mem_birth3 = multi.getParameter("mem_birth3");
		String email_id = multi.getParameter("email_id");
		String email_domain = multi.getParameter("email_domain");
		String mem_phone01 = multi.getParameter("mem_phone01");
		String mem_phone02 = multi.getParameter("mem_phone02");
		String mem_phone03 = multi.getParameter("mem_phone03");
		String mem_gender = multi.getParameter("mem_gender");
		String profile_cont = multi.getParameter("profile_cont");
		String mem_nickname = multi.getParameter("mem_nickname");
		String mem_fav1 = multi.getParameter("mem_fav1");
		String mem_fav2 = multi.getParameter("mem_fav2");
		String mem_fav3 = multi.getParameter("mem_fav3");
				
		File UpFile = multi.getFile("profile_photo");		//첨부파일을 가져옴.
		if(UpFile!=null) {//첨부파일이 있는 경우
			String fileName = UpFile.getName();//첨부한 파일명
			Calendar c = Calendar.getInstance();
			int year=c.get(Calendar.YEAR);
			int month=c.get(Calendar.MONTH)+1;
			int date=c.get(Calendar.DATE);
			
			String homedir = saveFolder+"/profile";
			
			Random r = new Random();
			int random=r.nextInt(100000000);					//random숫자
			int index=fileName.lastIndexOf(".");				//확장자에 붙어있는 .의 index값을 가져옴
			String fileExtendsion=fileName.substring(index+1);	//index값을 이용해서 확장자를 구함
			
			String refilename=mem_id+year+month+date+random;//새로운 파일명을 저장
			//id+년월일+난수+.확장자 (ex midnight90402019120419284856.jpg)
			
			String encryptionName=PwdChange.getPassWordToXEMD5String(refilename);//파일명을 암호화시킴
			String fileDBName="/jamong.com/resources/upload/profile/"+encryptionName+"."+fileExtendsion;	//DB에 저장될 레코드값(경로/파일명)
			
			UpFile.renameTo(new File(homedir+"/"+encryptionName+"."+fileExtendsion));//바뀌어진 첨부파일명으로 업로드
			
			m.setProfile_photo(fileDBName);
		}else {
			m.setProfile_photo("/jamong.com/resources/img/profile_logout.png");//프로필사진 등록 안했을때 로고로 대체
		}
		
		//입력된 값들을 MemberVO객체 m에 저장
		m.setMem_id(mem_id);			m.setMem_pwd(mem_pwd);
		m.setMem_name(mem_name);		m.setMem_birth1(mem_birth1);
		m.setMem_birth2(mem_birth2);	m.setMem_birth3(mem_birth3);
		m.setEmail_id(email_id);		m.setEmail_domain(email_domain);
		m.setMem_phone01(mem_phone01);	m.setMem_phone02(mem_phone02);
		m.setMem_phone03(mem_phone03);	m.setMem_gender(mem_gender);
		m.setProfile_cont(profile_cont);
		m.setMem_fav1(mem_fav1);		m.setMem_fav2(mem_fav2);
		m.setMem_fav3(mem_fav3);
		
		m.setMem_pwd(PwdChange.getPassWordToXEMD5String(m.getMem_pwd()));//비밀번호 암호화
				
		if(mem_nickname.trim().length()<=0) {//닉네임 등록 안했을때 아이디로 대체
			m.setMem_nickname(mem_id);
		}else {
			m.setMem_nickname(mem_nickname);
		}
		
		this.memberService.insertMember(m);	//쿼리문 실행을 위한 메서드
		session.setAttribute("loginmain","/jamong.com/");
		out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
				"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
				"<body>\r\n" + 
				"<script>\r\n" + 
				"Swal.fire({\r\n" + 
				"		title : 'Success!',\r\n" + 
				"		text : '회원가입이 되셨습니다!',\r\n" + 
				"		icon: 'success',\r\n" + 
				"		}).then((result) => {\r\n" + 
				"			if(result.value){\r\n" + 
				"				location='login';\r\n" + 
				"			}\r\n" + 
				"		});\r\n" + 
				"</script>\r\n" + 
				"</body>");
		
		return null;
	}
	
	@RequestMapping("@{mem_id}")
	public ModelAndView user_profile( 
			@PathVariable("mem_id") String mem_id, MemberVO mp,
			HttpServletResponse response,
			HttpServletRequest request,
			HttpSession session )throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter();
		session = request.getSession();
		
		MemberVO m = (MemberVO)session.getAttribute("m");
		
		ModelAndView mv=new ModelAndView("jsp/profile");
			mp = this.memberService.profileCheck(mem_id);
			// 구독자 
			SubscribeVO sub = null;
			
			HashMap<String,Object>  submap= new HashMap<>();
			if(m != null) {
			submap.put("sub_member", m.getMem_no());
			submap.put("mem_no", mp.getMem_no());

			sub=this.subService.subCheck(submap);
			}
			int subCount = this.subService.subCount(mp.getMem_no());
		
			int state = mp.getMem_state();
			
			// 포트폴리오 항목 띄어쓰기 적용되게
			String portfolio = null;
            
			if(mp.getMem_portfolio() != null){
            portfolio=mp.getMem_portfolio().replace("\n", "<br/>");
            mp.setMem_portfolio(portfolio);
            }
			HashMap<String, Object> profileMap =new HashMap<>();
			if(m != null) {
				profileMap.put("mp_no", mp.getMem_no());
				profileMap.put("m_no", m.getMem_no());
				profileMap.put("state",m.getMem_state());
				}else {
				profileMap.put("mp_no", mp.getMem_no());
				profileMap.put("m_no", 0); //session값
				profileMap.put("state", 0); //session 등급 값
				}
			
 			List<BoardVO> mplist = this.boardService.getProfile(profileMap);
			
			SimpleDateFormat b_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat date_format = new SimpleDateFormat("MMM d, yyyy",new Locale("en","US"));		

			for(int i=0; i < mplist.size(); i++) {
					// 시간 계산 해서 방금, 몇분전 띄우기
				Date mpListFormat_date = b_format.parse(mplist.get(i).getBo_date());
				String mpListTitle_date = TIME_MAXIMUM.formatTimeString(mpListFormat_date);
				mplist.get(i).setBo_date(mpListTitle_date);
				
				// 미리보여주는 글 태그 없앰 (제목)
				String titleText = mplist.get(i).getBo_title();
				String titleNomarText = titleText.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
				mplist.get(i).setBo_title(titleNomarText);

				//미리보여주는 글 태그 없앰 (내용)
				String htmlText = mplist.get(i).getBo_cont();
				String nomalText = htmlText.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
				String oneSpace = nomalText.replaceAll("&nbsp; "," ");
				mplist.get(i).setBo_cont(oneSpace);

			}
			
			List<BoardVO> myBookList = this.bookService.myBookList(mp.getMem_no());
			for(int i=0;i<myBookList.size();i++) {
				Date mbListFormat_date = b_format.parse(myBookList.get(i).getBookVO().getBook_date());
				String mbListTitle_date = date_format.format(mbListFormat_date);
				myBookList.get(i).getBookVO().setBook_date(mbListTitle_date);
				
				String bookHtmlText = myBookList.get(i).getBookVO().getBook_name();
				String bookStrippedText = bookHtmlText.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
				String bookOneSpace = bookStrippedText.replaceAll("&nbsp;","");	
				myBookList.get(i).getBookVO().setBook_name(bookOneSpace);
			}
			
			if(state == 1 || state == 2 || mp == null) {
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Block!',\r\n" + 
						"		text : '탈퇴했거나 정지된 회원입니다!',\r\n" + 
						"		icon: 'error',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				history.back();\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
			}else {
				mv.addObject("mp",mp);
				mv.addObject("sub",sub);
				mv.addObject("subCount",subCount);
				mv.addObject("mybook",myBookList);
				mv.addObject("mplist",mplist);
			}
			return mv;
	}//user_profile() => 유저 프로필 창

	
	@RequestMapping("profile_edit")
	public ModelAndView profile_edit(MemberVO mp,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) throws Exception { // 프로필 편집 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		ModelAndView mv =new ModelAndView("jsp/profile_edit");
	
		MemberVO m = (MemberVO)session.getAttribute("m");
		if(m==null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '로그인이 필요합니다!',\r\n" + 
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
			mp = this.memberService.profileCheck(m.getMem_id());
			mv.addObject("mp",mp);
			return mv;
		}
		return null;
	}// profile_edit => 유저 프로필 수정 창 
	
	@RequestMapping("/profile_edit_ok")
	public String profile_edit_ok( MemberVO mp,
			HttpServletRequest request,
			HttpSession session,
			HttpServletResponse response
			) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();
		MemberVO m = (MemberVO)session.getAttribute("m");
		if(m==null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '로그인이 필요합니다!',\r\n" + 
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
			
			// 프로필 이미지 저장경로 추가
			String saveFolder = request.getRealPath("/resources/upload");
			int fileSize= 100 * 1024 * 1024;	// 첨부파일 최대크기 지정
			MultipartRequest multi = null;		// 첨부파일을 가져오는 api
			// post요청을 multi에 저장
			
			//값 전달여부 확인
		
			//전달 잘
			multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8");
	
			// 입력한 값들을 multi로 부터 가져옴
			
			String mem_nickname = multi.getParameter("mem_nickname");
			String profile_cont = multi.getParameter("profile_cont");
			String mem_keyword = multi.getParameter("mem_keyword");
			String mem_portfolio = multi.getParameter("mem_portfolio");
			
			int mem_no = m.getMem_no();
	//		mp = this.memberService.profileCheck(m.getMem_id());
	
			File UpFile = multi.getFile("profile_photo");
			if(UpFile != null) {
				String fileName=UpFile.getName();
				Calendar c = Calendar.getInstance();
				int year = c.get(Calendar.YEAR);
				int month = c.get(Calendar.MONTH)+1; 
				int date = c.get(Calendar.DATE);
			
			String homedir = saveFolder+"/profile";
			
			Random r = new Random();
			int random=r.nextInt(10000000);
			int index=fileName.lastIndexOf("."); 				// 확장자에 붙어있는 .의 index값을 가져옴
			String fileExtendsion=fileName.substring(index + 1);  // index값을 이용해 확장자를 구함
			
			String refilename = m.getMem_id()+ year + month + date + random;//새로운 파일명을 저장
			
			String encryptionName=PwdChange.getPassWordToXEMD5String(refilename); //파일명 암호화
			// DB에 저장되는 레코드 값
			String fileDBName="/jamong.com/resources/upload/profile/"+encryptionName+"."+fileExtendsion;
			
			UpFile.renameTo(new File(homedir+"/"+encryptionName+"."+fileExtendsion));//바뀌어진 첨부파일 명으로 업로드
			
			mp.setProfile_photo(fileDBName);
			m.setProfile_photo(fileDBName);
			}else {
				mp.setProfile_photo(m.getProfile_photo());//프로필사진 등록 안했을때 기존파일로 대체
			}
			// 입력된 데이터 업데이트
			mp.setMem_id(m.getMem_id());
			if(mem_nickname.trim().length()<=0) {//닉네임 등록 안했을때 아이디로 대체
				mp.setMem_nickname(m.getMem_id());
			}else {
				mp.setMem_nickname(mem_nickname);
			}
				mp.setProfile_cont(profile_cont);
			// 키워드 항목 나누어서 
			mp.setMem_keyword(mem_keyword); 		mp.setMem_portfolio(mem_portfolio);
			
			m.setMem_nickname(mem_nickname);
			
			session.setAttribute("m", m);
			this.memberService.updateProfile(mp);
			
			
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Success!',\r\n" + 
					"		text : '성공적으로 수정되었습니다!',\r\n" + 
					"		icon: 'success',\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/@"+m.getMem_id()+"';\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
			out.print("location='/jamong.com/@"+m.getMem_id()+"';");
		
		}
		return null;
		
	}//profile_edit_ok() => 유저 프로필 수정
}
