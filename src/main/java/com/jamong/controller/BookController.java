package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.service.BookService;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;
	
	@RequestMapping("book_info")
	public ModelAndView user_book_info() { // 책 정보
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/book_info");
		
		return mv;
	}
	
	@RequestMapping("new_book")
	public ModelAndView user_new_book() { // 최신 책
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/new_book");
		
		return mv;
	}
}
