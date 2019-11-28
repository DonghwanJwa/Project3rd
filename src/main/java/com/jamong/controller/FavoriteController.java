package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.service.FavoriteService;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteService favService;
	
	@RequestMapping("category")
	public ModelAndView user_category() {
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/category");
		
		return mv;
	}
}
