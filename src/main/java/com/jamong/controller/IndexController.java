package com.jamong.controller;

import java.util.ArrayList;
import java.util.Collections;
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
			String strippedText = htmlText.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");//태그 모두 없앰
			String oneSpace = strippedText.replaceAll("&nbsp; "," ");					//&nbsp;를 모두 자바의 띄어쓰기로 바꿈(단어단위로 끊어주는 기능때문에 &nbsp;없애야됨)
			if(oneSpace.length()>100) {
				String hundredText = oneSpace.substring(0,100);								//100글자만 홈페이지에 노출되도록 변경
				blist.get(i).setBo_cont(hundredText);
			}else {
				blist.get(i).setBo_cont(oneSpace);
			}
		}
		
		//공감글의 Masking Tape random하게 붙이기
		List<Integer> tlist = new ArrayList<>();
		for(int i=0;i<20;i++) {
			tlist.add(i,i+1);	//1~20숫자넣기
		}
		Collections.shuffle(tlist);//Random하게 섞는다.
		
		/*3.추천 작가*/
		List<MemberVO> mlist = this.memberService.recomAuthor();
		
		m.addAttribute("blist",blist);
		m.addAttribute("tlist",tlist);
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