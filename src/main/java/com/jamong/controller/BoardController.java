package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("read")
	public ModelAndView user_readCont() {
		ModelAndView mv=new ModelAndView();
		
		
		mv.setViewName("jsp/read");
		
		return mv;
	}
	
	@RequestMapping("write")
	public ModelAndView user_write() {
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/jamong_write");
		
		return mv;
	}
	
	@RequestMapping("new_posts")
	public ModelAndView user_new_posts() {
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/new_posts");
		
		return mv;
	}
	
	@RequestMapping("search")
	public ModelAndView user_search(String result) {
		ModelAndView mv=new ModelAndView();
		
		if(result.equals("post")) {
			mv.setViewName("jsp/search_result(Post)");
		}else if(result.equals("author")) {
			mv.setViewName("jsp/search_result(Author)");
		}else if(result.equals("work")) {
			mv.setViewName("jsp/search_result(Work)");
		}// if else
		
		return mv;		
	}
}
