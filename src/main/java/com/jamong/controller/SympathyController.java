package com.jamong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jamong.domain.MemberVO;
import com.jamong.domain.SympathyVO;
import com.jamong.service.SympathyService;

@Controller
public class SympathyController {

	@Autowired
	private SympathyService sympathyService;
	
	@PostMapping("sympathy_state/{bo_no}")
	@ResponseBody
	public int sympathy_up(@PathVariable int bo_no, HttpServletRequest request,HttpSession session) {
		session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("m");
		int re = 0;		//공감하지 않음
		if(m!=null) {	//로그인이 되어있지않으면 실행되지 않음
			SympathyVO svo = new SympathyVO();
			svo.setBo_no(bo_no); svo.setMem_no(m.getMem_no());
		
			SympathyVO result = this.sympathyService.getSympathyState(svo);
			if(result!=null) {
				re=1;		//공감중임
			}
		}
		return re;
	}
}
