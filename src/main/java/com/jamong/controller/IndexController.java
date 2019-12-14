package com.jamong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jamong.domain.BoardVO;
import com.jamong.domain.MemberVO;
import com.jamong.service.BoardService;
import com.jamong.service.MemberService;

@Controller
public class IndexController {
		
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(BoardVO bvo,Model m) {
		
		/*1.공감글*/
		List<BoardVO> blist = this.boardService.recomArticle();
		for(int i=0;i<blist.size();i++) {		//cont값을 html에서 text로 변환
			String htmlText = blist.get(i).getBo_cont();
			String strippedText = htmlText.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " "); 
			blist.get(i).setBo_cont(strippedText);
		}
		
		/*2.추천 작가*/
		List<MemberVO> mlist = this.memberService.recomAuthor();
		
		m.addAttribute("blist",blist);
		m.addAttribute("mlist",mlist);
		
		
		return "index";
	}
	
	@RequestMapping("policy_terms")
	public String policy_terms() {
		return "jsp/policy_terms";
	}
	
	@RequestMapping("policy_privacy")
	public String policy_privacy() {
		return "jsp/policy_privacy";
	}
	
}