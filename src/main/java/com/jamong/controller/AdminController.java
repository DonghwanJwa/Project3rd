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

import com.jamong.domain.AccuseVO;
import com.jamong.domain.InquireVO;
import com.jamong.domain.MemberVO;
import com.jamong.domain.NoticeVO;
import com.jamong.service.AccuseService;
import com.jamong.service.AdminService;
import com.jamong.service.InquireService;
import com.jamong.service.MemberService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AccuseService accuseService;

	@Autowired
	private InquireService inquireService;
	
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("admin_main")
	public ModelAndView admin_main(HttpSession session, HttpServletRequest request, HttpServletResponse response, NoticeVO n,AccuseVO a,InquireVO i) throws Exception {
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
					"$('.wrap-loading').hide();" +
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '세션이 만료되었습니다!',\r\n" + 
					"		icon: 'error',\r\n" + 
					"		showCancelButton : true,\r\n" + 
					"		confirmButtonText : '로그인',\r\n" + 
					"		cancelButtonText : '메인으로'\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/login/1';\r\n" + 
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
				// 최신공지 띄우기
				List<NoticeVO> newNotice=this.adminService.newNotice(n);
				List<AccuseVO> newAccuse=this.accuseService.newAccuse(a);
				List<InquireVO> newInquire=this.inquireService.newInquire(i);

					
				ModelAndView m=new ModelAndView();
				
				m.addObject("newNotice",newNotice);
				m.addObject("newAccuse",newAccuse);
				m.addObject("newInquire",newInquire);
				m.addObject("n",n);
				m.addObject("a",a);
				m.addObject("i",i);
				
				m.setViewName("jsp/admin_main");
				
				return m;
			}
		}
		return null;
	} // admin_main()
	
	/* 로그아웃 */
	@RequestMapping("admin_logout")
	public ModelAndView admin_logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		session.invalidate();
		
		out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
				"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
				"<body>\r\n" + 
				"<script>\r\n" + 
				"Swal.fire({\r\n" + 
				"		title : 'Success!',\r\n" + 
				"		text : '로그아웃 되었습니다!',\r\n" + 
				"		icon: 'success',\r\n" + 
				"		}).then((result) => {\r\n" + 
				"			if(result.value){\r\n" + 
				"				location='/jamong.com/';\r\n" + 
				"			}\r\n" + 
				"		});\r\n" + 
				"</script>\r\n" + 
				"</body>");
		
		return null;
	}
}
