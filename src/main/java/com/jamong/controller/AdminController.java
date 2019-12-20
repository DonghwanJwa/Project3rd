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
import com.jamong.domain.NoticeVO;
import com.jamong.service.AdminService;
import com.jamong.service.MemberService;

import pwdconv.PwdChange;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("admin_main")
	public ModelAndView admin_main(HttpSession session, HttpServletRequest request, HttpServletResponse response, NoticeVO n) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		/* 세션 유효성 검증 */
		if(adm_m == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='login/1';");
			out.println("</script>");
		}else {
			if(adm_m.getMem_state() != 9) {
				out.println("<script>");
				out.println("alert('허용되지 않은 접근입니다.');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				// 최신공지 띄우기
				List<NoticeVO> newNotice=this.adminService.newNotice(n);
				
				ModelAndView m=new ModelAndView();
				
				m.addObject("newNotice",newNotice);
				m.addObject("n",n);
				
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
		
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다.');");
		out.println("location='/jamong.com/';");
		out.println("</script>");
		
		return null;
	}
}
