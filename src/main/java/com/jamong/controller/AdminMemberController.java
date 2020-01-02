package com.jamong.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.MemberVO;
import com.jamong.service.AdminMemService;

@Controller
public class AdminMemberController {
	@Autowired
	private AdminMemService admMemService;
	
	 /* 회원관리 페이지 회원 목록 */
	@RequestMapping("admin_member")
	public ModelAndView admin_member(HttpSession session, HttpServletRequest request, HttpServletResponse response, MemberVO me) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		/* 세션 유효성 검증 */
		if(adm_m == null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '세션이 만료되었습니다!',\r\n" + 
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
				int limit=10; // 한 페이지에 보여지는 목록 개수
				if(request.getParameter("page") != null) { // get 방식으로 전달된 쪽번호가 있는 경우
					page=Integer.parseInt(request.getParameter("page")); // 전달된 쪽번호를 정수 숫자로 바꾼다.
				}
				
				String search_name=request.getParameter("search_name");
				String search_field_state=request.getParameter("search_field_state");
				String search_field_author=request.getParameter("search_field_author");
				String search_field_key=request.getParameter("search_field_key");
				
				me.setSearch_name("%"+search_name+"%");
				me.setSearch_field_state(search_field_state);
				me.setSearch_field_author(search_field_author);
				me.setSearch_field_key(search_field_key);
				
				int mcount=this.admMemService.memCount(me); // 회원 수
				
				me.setStartrow((page-1)*10+1); // 시작 행 번호
				me.setEndrow(me.getStartrow()+limit-1); // 끝 행 번호
				
				List<MemberVO> mlist=this.admMemService.memList(me);
				
				// 총 페이지
				int maxpage=(int)((double)mcount/limit+0.95);
				// 시작페이지
				int startpage=(((int)((double)page/10+0.9))-1)*10+1;
				// 마지막 페이지
				int endpage=maxpage;
				if(endpage > startpage+10-1) endpage=startpage+10-1;
				
				ModelAndView m=new ModelAndView();
				
				m.addObject("me",me);
				m.addObject("mlist",mlist);
				m.addObject("mcount",mcount);
				m.addObject("page",page);
				m.addObject("startpage",startpage);
				m.addObject("maxpage",maxpage);
				m.addObject("endpage",endpage);
				m.addObject("search_name",search_name);
				m.addObject("search_field_state",search_field_state);
				m.addObject("search_field_author",search_field_author);
				m.addObject("search_field_key",search_field_key);
				
				m.setViewName("jsp/admin_member");
				
				return m;
			}
		}
		return null;
	} // adm_mem_list()
	
	@RequestMapping("admin_member_info")
	public ModelAndView admin_member_info (HttpSession session, HttpServletRequest request, HttpServletResponse response, int no) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out=response.getWriter();
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
				
				MemberVO me=this.admMemService.memberInfo(no);
				
				String profile_cont=me.getProfile_cont();
				String mem_portfolio=me.getMem_portfolio();
				String drop_cont=me.getDrop_cont();
				
				if(me.getMem_portfolio() != null) {
					mem_portfolio=me.getMem_portfolio().replace("\n", "<br/>");
				}
				if(me.getProfile_cont() != null) {
					profile_cont=me.getProfile_cont().replace("\n", "<br/>");
				}
				if(me.getDrop_cont() != null) {
					drop_cont=me.getDrop_cont().replace("\n", "<br/>");
				}
				
				ModelAndView m = new ModelAndView();
				
				
				m.setViewName("jsp/admin_member_info");
				
				m.addObject("me",me);
				m.addObject("profile_cont",profile_cont);
				m.addObject("mem_portfolio",mem_portfolio);
				m.addObject("drop_cont",drop_cont);
				m.addObject("page",page);
				
				return m;
			}
		}
		return null;
	}
	
	/* 회원 정지 폼 */
	@RequestMapping("admin_member_drop")
	public ModelAndView admin_member_drop (HttpServletRequest request, HttpServletResponse response, HttpSession session, int no) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		MemberVO adm_m=(MemberVO) session.getAttribute("m");
		
		if(adm_m == null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '세션이 만료되었습니다!',\r\n" + 
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
				
				ModelAndView mv=new ModelAndView("jsp/admin_member_drop");
				
				mv.addObject("no",no);
				mv.addObject("page",page);
				
				return mv;
			}
		}
		
		return null;
	}
	
	// 회원 정지, 복구
	@RequestMapping("admin_member_drop_ok")
	public ModelAndView admin_member_drop_ok (HttpServletRequest request, HttpServletResponse response, HttpSession session, int no, MemberVO me) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
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
				if(request.getParameter("page") != null) {
					page=Integer.parseInt(request.getParameter("page"));
				}
				
				String drop_reason=request.getParameter("drop_reason");
				String drop_cont=request.getParameter("drop_cont");
				
				me.setMem_no(no);
				me.setDrop_reason(drop_reason);
				me.setDrop_cont(drop_cont);
				
				this.admMemService.memDrop(me);
				
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Block!',\r\n" + 
						"		text : '해당 계정이 정지되었습니다!',\r\n" + 
						"		icon: 'info',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				location='admin_member_info?no="+no+"&page="+page+"';\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
			}
		}
		
		return null;
	}
	
	@RequestMapping("admin_member_restore")
	public ModelAndView admin_member_restore (HttpServletRequest request, HttpServletResponse response, HttpSession session, int no, MemberVO me) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
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
				if(request.getParameter("page") != null) {
					page=Integer.parseInt(request.getParameter("page"));
				}
				me.setMem_no(no);
				
				this.admMemService.memRestore(me);
				
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Success!',\r\n" + 
						"		text : '해당 계정이 성공적으로 복구되었습니다!',\r\n" + 
						"		icon: 'success',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				location='admin_member_info?no="+no+"&page="+page+"';\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
			}
		}
		return null;
	}
}