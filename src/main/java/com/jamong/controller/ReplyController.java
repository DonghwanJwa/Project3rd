package com.jamong.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jamong.domain.MemberVO;
import com.jamong.domain.ReplyVO;
import com.jamong.service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	@PostMapping("comment/{bo_no}")
	@ResponseBody
	public int addComment(@PathVariable int bo_no, ReplyVO rvo, String com_cont,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		int flag = 0;
		session = request.getSession();
		
		MemberVO comM = (MemberVO)session.getAttribute("m");
		if(comM != null) { // 세션이 있을때
			
			rvo.setBo_no(bo_no);
			rvo.setMem_no(comM.getMem_no());
			rvo.setRep_cont(com_cont);
			
			this.replyService.addComment(rvo);
			flag = 1;
		}else { // 세션이 없을 때
			flag = 2;
		}
		
		return flag;
	}
	
	@PostMapping("reply/{bo_no}")
	@ResponseBody
	public int addReply(@PathVariable int bo_no, ReplyVO rvo, String rep_cont, int rep_ref, int rep_step, int rep_level,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		int flag = 0;
		session = request.getSession();
		
		MemberVO repM = (MemberVO)session.getAttribute("m");
		if(repM != null) { // 세션이 있을 때
			rvo.setBo_no(bo_no);
			rvo.setMem_no(repM.getMem_no());
			rvo.setRep_cont(rep_cont);
			rvo.setRep_ref(rep_ref);
			rvo.setRep_step(rep_step);
			rvo.setRep_level(rep_level);
			
			this.replyService.addReply(rvo);
			
			flag = 1;
		}else { // 세션이 없을 때
			flag = 2;
		}// if else 
		return flag;
	}
}
