package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping("login")
	public String user_login() { // 로그인 페이지
		
		return "jsp/login";
	}
	
	@RequestMapping("find_id")
	public String user_find_id() { // 아이디 찾기
		
		return "jsp/find_id";
	}
	
	@RequestMapping("find_pass")
	public String user_find_pass() { // 비밀번호 찾기
		
		return "jsp/find_pass";
	}
	
	@RequestMapping("join_membership")
	public String user_membership() { // 회원가입
		
		return "jsp/join_membership";
	}
	
	@RequestMapping("pass_modify")
	public ModelAndView user_pass_modify() { // 내설정
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/pass_modify");
		
		return mv;
	}
	
	@RequestMapping("profile")
	public ModelAndView user_profile() {
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/profile");
		
		return mv;
	}
	
	@RequestMapping("profile_edit")
	public ModelAndView profile_edit() { // 프로필 편집 
		ModelAndView mv=new ModelAndView(); 
		
		mv.setViewName("jsp/profile_edit");
		
		return mv;
	}
	
	@RequestMapping("feed")
	public ModelAndView user_feed() {
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/feed");
		
		return mv;
	}
}
