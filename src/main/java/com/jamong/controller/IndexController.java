package com.jamong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jamong.domain.BoardVO;
import com.jamong.service.BoardService;

@Controller
public class IndexController {
		
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		List<BoardVO> bm = this.boardService.recomAuthor();
		
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