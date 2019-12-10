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

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	/* admin 로그인 */
	@RequestMapping("admin_login")
	public ModelAndView admin_login() {
		return new ModelAndView("/jsp/admin_login");
	}
	
	@RequestMapping("admin_login_ok")
	public ModelAndView admin_login (MemberVO m, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		String adm_id=request.getParameter("adm_id");
		String adm_pwd=request.getParameter("adm_pwd");
		
		MemberVO db_adm=this.memberService.adminLogin(adm_id);
		
		if(db_adm == null) {
			out.println("<script>");
			out.println("alert('허용 된 관리자 정보가 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if(!adm_pwd.equals(db_adm.getMem_pwd())) {
				out.println("<script>");
				out.println("alert('관리자 비밀번호가 일치하지 않습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
			} else {
				m.setMem_no(db_adm.getMem_no());
				m.setMem_id(db_adm.getMem_id());
				m.setMem_nickname(db_adm.getMem_nickname());
				m.setMem_author(db_adm.getMem_author());
				m.setMem_state(db_adm.getMem_state());
				m.setProfile_photo(db_adm.getProfile_photo());
				m.setMem_fav1(db_adm.getMem_fav1());
				m.setMem_fav2(db_adm.getMem_fav2());
				m.setMem_fav3(db_adm.getMem_fav3());
				session.setAttribute("m", m);				
				
				ModelAndView mv=new ModelAndView();
	
				mv.setViewName("redirect:/admin_main");
				
				return mv;
			}
		}
		return null;
	} // admin_login_ok()
	
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
			out.println("location='admin_login';");
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
		out.println("location='admin_login';");
		out.println("</script>");
		
		return null;
	}
}
