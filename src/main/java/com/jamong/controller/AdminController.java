package com.jamong.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.AdminVO;
import com.jamong.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	/* 로그인 */
	@RequestMapping("admin_login")
	public ModelAndView admin_login() {
		return new ModelAndView("/jsp/admin_login");
	}
	
	@RequestMapping("admin_login_ok")
	public ModelAndView admin_login (AdminVO a, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		String adm_id=request.getParameter("adm_id");
		String adm_pwd=request.getParameter("adm_pwd");
		
		AdminVO db_adm=this.adminService.adminLogin(adm_id);
		
		if(db_adm == null) {
			out.println("<script>");
			out.println("alert('허용 된 관리자 정보가 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if(!adm_pwd.equals(db_adm.getAdm_pwd())) {
				out.println("<script>");
				out.println("alert('관리자 비밀번호가 일치하지 않습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
			} else {
				session.setAttribute("adm_id", db_adm.getAdm_id());
				session.setAttribute("adm_name", db_adm.getAdm_name());
				
				ModelAndView m=new ModelAndView();
	
				m.setViewName("redirect:/admin_main");
				
				return m;
			}
		}
		return null;
	} // admin_login_ok()
	
	@RequestMapping("admin_main")
	public ModelAndView admin_main(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		String adm_id=(String)session.getAttribute("adm_id");
		
		/* 세션 유효성 검증 */
		if(adm_id == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='admin_login';");
			out.println("</script>");
		}else {
			return new ModelAndView("/jsp/admin_main");
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
