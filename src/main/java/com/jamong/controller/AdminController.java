package com.jamong.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.AdminVO;
import com.jamong.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping("admin_login")
	public ModelAndView admin_login() {
		return new ModelAndView("/jsp/admin_login");
	}
	
	@RequestMapping("admin_login_ok")
	public ModelAndView admin_login (AdminVO a, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		
		
		
		return null;
	} // admin_login_ok()
}
