package com.jamong.controller;

import java.util.HashMap;

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
	public int addComment(@PathVariable int bo_no, ReplyVO rvo, String com_cont,int mem_no, String mem_id,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		int flag = 0;
		session = request.getSession();
		
		MemberVO comM = (MemberVO)session.getAttribute("m");
		if(comM != null) { // 세션이 있을때
			HashMap<String,Object> rm = new HashMap<>();
						
			rvo.setBo_no(bo_no);
			rvo.setMem_no(comM.getMem_no());
			rvo.setRep_cont(com_cont);
			
			rm.put("rvo",rvo);
			rm.put("mem_no",mem_no);
			rm.put("mem_id",mem_id.substring(1));
			
			this.replyService.addComment(rm,mem_no,comM.getMem_no());
			flag = 1;
		}else { // 세션이 없을 때
			flag = 2;
		}
		
		return flag;
	}
	
	@PostMapping("reply/{bo_no}")
	@ResponseBody
	public int addReply(@PathVariable int bo_no, ReplyVO rvo, String rep_cont, int rep_ref,
			int rep_step, int rep_level, String mem_id, int mem_no,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		int flag = 0;
		session = request.getSession();
		
		MemberVO repM = (MemberVO)session.getAttribute("m");
		
		if(repM != null) { // 세션이 있을 때
			HashMap<String,Object> rm = new HashMap<>();
			
			rvo.setBo_no(bo_no);
			rvo.setMem_no(repM.getMem_no());
			rvo.setRep_cont(rep_cont);
			rvo.setRep_ref(rep_ref);
			rvo.setRep_step(rep_step);
			rvo.setRep_level(rep_level);
			
			rm.put("rvo",rvo);
			rm.put("mem_id",mem_id);
			rm.put("mem_no",mem_no);
			
			
			this.replyService.addReply(rm,mem_no,repM.getMem_no());
			
			flag = 1;
		}else { // 세션이 없을 때
			flag = 2;
		}// if else 
		return flag;
	}
	
	@PostMapping("replyedit")
	@ResponseBody
	public int editReply(int rep_no, String editCont, ReplyVO rvo,
			HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		int flag = 0;
		session = request.getSession();
		
		MemberVO repM = (MemberVO)session.getAttribute("m");
		if(repM != null) {
			rvo.setRep_no(rep_no);
			rvo.setRep_cont(editCont);
			
			this.replyService.editReply(rvo);
			
			flag = 1;
		}else {
			flag = 2;
		}		
		return flag;
	}
	
	@PostMapping("commentremove")
	@ResponseBody
	public int removeReply(int rep_no,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		int flag = 0;
		session = request.getSession();
		
		MemberVO repM = (MemberVO)session.getAttribute("m");
		if(repM != null) {
			this.replyService.removeReply(rep_no);
			flag = 1;
		}else {
			flag = 2;
		}
		
		return flag;
	}
}
