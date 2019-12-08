package com.jamong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.CategoryVO;
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
	
	@RequestMapping("category_load")
	public ResponseEntity<List<CategoryVO>> category_load(){
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(this.catService.listCategory(),HttpStatus.OK);
					
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
