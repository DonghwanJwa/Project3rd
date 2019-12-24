package com.jamong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jamong.domain.MemberVO;
import com.jamong.domain.SubscribeVO;
import com.jamong.service.MemberService;
import com.jamong.service.SubscribeService;

@Controller
public class SubscribeController {

	@Autowired
	private SubscribeService subService;
	@Autowired
	private MemberService MemberService;
	
	
	@PostMapping("follow/{mem_id}")
	@ResponseBody
	public int follow(
			@PathVariable("mem_id") String mem_id,
			MemberVO mv, SubscribeVO subvo,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session
			) throws Exception {
		session = request.getSession();
		int follow = 0;
		
		mv = this.MemberService.profileCheck(mem_id);
		MemberVO mem = (MemberVO)session.getAttribute("m");
		
		if(mem != null) {
			subvo.setSub_member(mem.getMem_no());
			subvo.setMem_no(mv.getMem_no());
			
			this.subService.insertSub(subvo);
			follow = 1;
		}else {
			follow=2;
		}
		return follow;
	}
	
	@PostMapping("unfollow/{mem_id}")
	@ResponseBody
	public int unFollow(
			@PathVariable("mem_id") String mem_id,
			MemberVO mv, SubscribeVO subvo,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session
			)throws Exception {
		session = request.getSession();

		MemberVO mem = (MemberVO)session.getAttribute("m");
		mv = this.MemberService.profileCheck(mem_id);

		int follow = 0;
		if(mem != null) {
			subvo.setSub_member(mem.getMem_no());
			subvo.setMem_no(mv.getMem_no());
			this.subService.removeFollow(subvo);
			follow = 1;
		}else {
			follow = 2;
		}
		return follow;
	}
}
