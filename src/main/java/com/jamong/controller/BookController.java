package com.jamong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.BoardVO;
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
	
	@RequestMapping("book_create")
	public ModelAndView user_book_create(BoardVO b) { // 책 생성 (노시현이 만짐)
		List<BoardVO> bList=this.bookService.getBList(b);
		/* 수정사항 */
		//메서드 전달인자가 세션에 있는 아이디 값이나, 맴버 번호 값을 가져와서 리스트 검색
		for(int i=0;i<bList.size();i++) {
			String bl=bList.get(i).getBo_cont();
			String bookList=bl.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
			bList.get(i).setBo_cont(bookList);
		}
		ModelAndView mv=new ModelAndView();
		mv.addObject("bookList",bList);
		mv.setViewName("jsp/book_create");
		
		return mv;
	}
	
	@RequestMapping("book_edit")
	public ModelAndView user_book_edit() { // 책 수정 (노시현이 함)
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/book_edit");
		
		return mv;
	}
}
