package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.service.CategoryService;


@Controller
public class CategoryController {

	@Autowired
	private CategoryService catService;
	
	@RequestMapping("category")
	public ModelAndView user_category(String directory) {
		ModelAndView mv=new ModelAndView();
		
		if(directory.equals("articles")) {
		mv.setViewName("jsp/category");
		}else if(directory.equals("books")) {
			mv.setViewName("jsp/category(book)");
		}// if else if
			
		return mv;
	}
}
