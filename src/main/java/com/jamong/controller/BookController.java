package com.jamong.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;
import com.jamong.domain.MemberVO;
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
	public ModelAndView user_book_create(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception { // 책 생성
		response.setContentType("text/html;charset=UTF-8");
		session = request.getSession();
		
		MemberVO m=(MemberVO)session.getAttribute("m");
		String mem_id=m.getMem_id();
		
		List<BoardVO> bList = this.bookService.getBList(mem_id);
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

	@RequestMapping("book_create_ok")
	@ResponseBody
	public String book_create_ok(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			BookVO b) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();
		
		String book_name= request.getParameter("book_name");
		System.out.println(book_name);
		this.bookService.insertBook(b);
		b.setBook_name(book_name);
		
		String[] bo_no=request.getParameterValues("book_create");
		for(String val :(bo_no)) {
			this.bookService.book_noUP(val);
			System.out.println(val);
		}
		
		
		return null;
	}

	@RequestMapping("book_edit")
	public ModelAndView user_book_edit() { // 책 수정
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/book_edit");
		
		return mv;
	}
}
