package com.jamong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.BoardVO;
import com.jamong.domain.CategoryVO;
import com.jamong.domain.MemberVO;
import com.jamong.service.BoardService;
import com.jamong.service.CategoryService;
import com.jamong.service.MemberService;


@Controller
public class CategoryController {

	@Autowired
	private CategoryService catService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("category/{cat_name}")
	public ModelAndView user_category(@PathVariable String cat_name) {
		ModelAndView mv=new ModelAndView();
		
		List<MemberVO> mlist=this.memberService.categoryMember();
		List<BoardVO> blist=this.boardService.categoryArticle(cat_name);
		
		for (int i = 0; i < blist.size(); i++) {
			String htmlTitle = blist.get(i).getBo_title();
			String normarTitle = htmlTitle.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
			String titleSpace = normarTitle.replaceAll("&nbsp;"," ");
			blist.get(i).setBo_title(titleSpace);
			
			String htmlText = blist.get(i).getBo_cont();
			String normalText = htmlText.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
			blist.get(i).setBo_cont(normalText);
		}
		
		mv.addObject("mlist",mlist);
		mv.addObject("blist",blist);
		
		mv.addObject("cat_name",cat_name);
		
		mv.setViewName("jsp/category");
		
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
