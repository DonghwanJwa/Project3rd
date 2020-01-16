package com.jamong.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.AccuseVO;
import com.jamong.domain.MemberVO;
import com.jamong.service.AccuseService;
import com.jamong.service.MemberService;

import mailHandler.MailService;

@Controller
public class AccuseController {

	@Autowired
	private AccuseService accuseService;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("accuse")
	public ModelAndView accuse() {
		return null;
	}

	@RequestMapping("accuse_ok")
	@ResponseBody
	public int accuse_ok(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session)throws Exception {
		session=request.getSession();
		MemberVO user=(MemberVO) session.getAttribute("m");
		int re=-1;
		if(user!=null) {
			re=1;
		}
		return re;
	}
	
	@RequestMapping("accuse_report_ok")
	public ModelAndView accuse_report_ok(AccuseVO a,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session)
	throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter();
		
		session=request.getSession();
		
		MemberVO user=(MemberVO) session.getAttribute("m");
		
		ModelAndView m=new ModelAndView();
		
		String ac_cont=request.getParameter("ac_cont");
		String ac_reason=request.getParameter("ac_reason");
		String ac_href=request.getParameter("ac_href");
		int ac_item= Integer.parseInt(request.getParameter("ac_item"));
		//하늘아.. Integer.parseInt에 바로 ac_item을 넣는게 아니라 parameter를 가지고 와서 넣어야지...
		
		String ref = request.getHeader("referer");
		
		String[] sid=ref.split("/");	//sid 라는 배열에 ref에 넣은 신고한페이지주소값을 /단위로 쪼개넣음
		String ac_member=sid[4].substring(1,sid[4].length());
		MemberVO mem=this.memberService.get(ac_member);
		int mem_no=mem.getMem_no();
		
		a.setAc_href(ref);
		a.setAc_member(mem_no);
		a.setAc_cont(ac_cont);			//신고내용
		a.setAc_reason(ac_reason);		//신고사유(버튼)
		a.setAc_item(ac_item);			//신고페이지(1-프로필,2-글읽기,3-댓글)
		a.setMem_no(user.getMem_no());	//신고자 NO값 
		
		m.addObject("ac_href",ac_href);
		
		this.accuseService.insertAccuse(a);
	
		out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
				"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
				"<body>\r\n" + 
				"<script>\r\n" + 
				"Swal.fire({\r\n" + 
				"		title : 'Success',\r\n" + 
				"		text : '신고가 성공적으로 접수되었습니다',\r\n" + 
				"		allowOutsideClick: false,\r\n"+
				"		icon: 'success',\r\n" + 
				"		}).then((result) => {\r\n" + 
				"			if(result.value){\r\n" + 
				"				location='"+ref+"';\r\n" + 
				"			}\r\n" + 
				"		});\r\n" + 
				"</script>\r\n" + 
				"</body>");
		
		return null;		
	}
	/* 관리자 신고목록 페이지 */
	@RequestMapping("admin_accuse")
	public ModelAndView admin_accuse(AccuseVO a,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session)
	throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter();
		session=request.getSession();
	
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		if(adm_m == null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '세션이 만료되었습니다!',\r\n" + 
					"		allowOutsideClick: false,\r\n"+
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
			if(adm_m.getMem_state() != 9) {
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Error!',\r\n" + 
						"		text : '잘못된 접근입니다!',\r\n" + 
						"		allowOutsideClick: false,\r\n"+
						"		icon: 'error',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				history.back();\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
			}else {
				
				int page=1;
				int limit=10;
				if(request.getParameter("page") != null) {
					page=Integer.parseInt(request.getParameter("page"));
				}
				String search_field=request.getParameter("search_field");
				String search_field_item=request.getParameter("search_field_item");
				String search_field_handling=request.getParameter("search_field_handling");
				String search_field_info=request.getParameter("search_field_info");
				String search_name=request.getParameter("search_name");
				
				a.setSearch_name("%"+search_name+"%");
				a.setSearch_field(search_field);
				a.setSearch_field_item(search_field_item);
				a.setSearch_field_handling(search_field_handling);
				a.setSearch_field_info(search_field_info);
				
				
				int listcount=this.accuseService.getListCount(a);
				
				a.setStartrow((page-1)*10+1);
				a.setEndrow(a.getStartrow()+limit-1);
				
				List<AccuseVO> alist=this.accuseService.getAccuseList(a);
				
				int maxpage=(int)((double)listcount/limit+0.95);
				int startpage=(((int)((double)page/10+0.9))-1)*10+1;
				int endpage=maxpage;
				if(endpage>startpage+10-1) endpage=startpage+10-1;
				
				ModelAndView m=new ModelAndView();
				
				
				
				m.addObject("alist",alist);
				m.addObject("page",page);
				m.addObject("startpage",startpage);
				m.addObject("endpage",endpage);
				m.addObject("maxpage",maxpage);
				m.addObject("listcount",listcount);
				m.addObject("search_field",search_field);		
				m.addObject("search_field_item",search_field_item);
				m.addObject("search_field_handling",search_field_handling);
				m.addObject("search_field_info",search_field_info);
				m.addObject("search_name",search_name);
				
				m.setViewName("jsp/admin_accuse");
				
				return m;
			}
		}	
			return null;
	}
	
	/* 관리자 신고하기페이지 세부내용 */
	@RequestMapping("admin_accuse_info")
	public ModelAndView admin_accuse_info(AccuseVO a,int no,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session)
	throws Exception {
		
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter();
		session=request.getSession();
	
		MemberVO adm_m=(MemberVO)session.getAttribute("m");	
		
		if(adm_m == null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '세션이 만료되었습니다!',\r\n" + 
					"		allowOutsideClick: false,\r\n"+
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
			if(adm_m.getMem_state() != 9) {
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Error!',\r\n" + 
						"		text : '잘못된 접근입니다!',\r\n" + 
						"		allowOutsideClick: false,\r\n"+
						"		icon: 'error',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				history.back();\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
			}else {
				int page=1;
				if(request.getParameter("page") != null) page=Integer.parseInt(request.getParameter("page"));
				
				
				a=this.accuseService.getAccuseMem(no);
				
				int ac_member = a.getAc_member();
				
				String ac_cont=a.getAc_cont().replace("\n", "<br/>");
				
				ModelAndView m=new ModelAndView();
				
				
				MemberVO mem=this.memberService.getAccusee(ac_member);
				
				m.setViewName("jsp/admin_accuse_info");
				
				m.addObject("ac_cont",ac_cont);
				m.addObject("page",page);
				m.addObject("a",a);
				m.addObject("mem",mem);
				
				return m;
			}
	}
		return null;
	}
	/* 신고문의 메일 답변하기 */
	@RequestMapping("admin_accuse_info_ok")
	public String admin_accuse_info_ok(int ac_no,AccuseVO a,Model m,String ac_reply,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session)
	throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter();
		session=request.getSession();
		
		int page = Integer.parseInt(request.getParameter("page"));
		
		MemberVO adm_m = (MemberVO)session.getAttribute("m");
		
		a=this.accuseService.getAccuseMem(ac_no);
		
		String userEmail = a.getMemberVO().getEmail_id()+"@"+a.getMemberVO().getEmail_domain();
		
		if(adm_m == null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"$('.wrap-loading').hide();" +
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '세션이 만료되었습니다!',\r\n" + 
					"		allowOutsideClick: false,\r\n"+
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
			if(adm_m.getMem_state() != 9) {
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Error!',\r\n" + 
						"		text : '잘못된 접근입니다!',\r\n" + 
						"		allowOutsideClick: false,\r\n"+
						"		icon: 'error',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				history.back();\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
			}else {
				/*신고 update문*/
				AccuseVO ac = new AccuseVO();
				ac.setAc_no(ac_no);
				ac.setAc_reply(ac_reply);
				ac.setAc_sender(adm_m.getMem_name());
				
				this.accuseService.updateAccuse(ac);
				
				/*신고 메일 보내기*/		
				String subject = "안녕하세요.자몽입니다. 신고하신 사항에 대한 답변을 드립니다.";
				StringBuilder sb = new StringBuilder();
				sb.append("<h3 style=\"font-weight:normal\">");
				sb.append(ac_reply);
				sb.append("</h3>");
				
				boolean reply_ok = mailService.send(subject, sb.toString(), "projectJamong@gmail.com", userEmail, null, request);
				
				if(reply_ok) {
					out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
							"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
							"<body>\r\n" + 
							"<script>\r\n" + 
							"Swal.fire({\r\n" + 
							"		title : 'Success!',\r\n" + 
							"		text : '신고 답변처리가 되었습니다!',\r\n" + 
							"		allowOutsideClick: false,\r\n"+
							"		icon: 'success',\r\n" + 
							"		}).then((result) => {\r\n" + 
							"			if(result.value){\r\n" + 
							"				location='admin_accuse_info?no="+ac_no+"&page="+page+"';\r\n" + 
							"			}\r\n" + 
							"		});\r\n" + 
							"</script>\r\n" + 
							"</body>");
				}else {				
					out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
							"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
							"<body>\r\n" + 
							"<script>\r\n" + 
							"Swal.fire({\r\n" + 
							"		title : 'Error!',\r\n" + 
							"		text : '처리중 에러가 발생했습니다!',\r\n" + 
							"		allowOutsideClick: false,\r\n" +
							"		icon: 'error',\r\n" + 
							"		}).then((result) => {\r\n" + 
							"			if(result.value){\r\n" + 
							"				history.back();\r\n" + 
							"			}\r\n" + 
							"		});\r\n" + 
							"</script>\r\n" + 
							"</body>");
				}
			}
		}
		return null;
	}
	/* 신고사항 삭제 */
	@RequestMapping("admin_accuse_del") 
	public ModelAndView admin_accuse_del(HttpSession session, HttpServletRequest request, 
			HttpServletResponse response, int ac_no) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		ac_no=Integer.parseInt(request.getParameter("ac_no"));
		if(adm_m == null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"$('.wrap-loading').hide();" +
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '세션이 만료되었습니다!',\r\n" + 
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
			if(adm_m.getMem_state() != 9) {
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Warning!',\r\n" + 
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
			}else {
				this.accuseService.accuseDel(ac_no);
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Success',\r\n" + 
						"		text : '삭제되었습니다!',\r\n" + 
						"		allowOutsideClick: false,\r\n" +
						"		icon: 'success',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				location='admin_accuse';\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
				out.println("location='admin_accuse';");
			}
		}
		return null;
	}


}
